<?php
namespace App\Service\Engenharia\Location;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Engenharia\Location;
use App\Entity\Engenharia\Point;

class Create
{
    private $objEntityManager   = NULL;
    private $objLocation        = NULL;
    private $objPoint           = NULL;
    private $objLocationPrev    = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setPoint(Point $objPoint)
    {
        $this->objPoint = $objPoint;
    }
    
    public function setLocationPrev(Location $objLocationPrev)
    {
        $this->objLocationPrev = $objLocationPrev;
    }
    
    public function getLocation()
    {
        return $this->objLocation;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objLocation = new Location();
            $this->objLocation->setLatitude($objRequest->get('latitude', NULL));
            $this->objLocation->setLocation($this->objLocationPrev);
            $this->objLocation->setLongitude($objRequest->get('longitude', NULL));
            $this->objLocation->setPoint($this->objPoint);
            $this->objLocation->setRadius($objRequest->get('radius', NULL));
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    private function validate(Request $objRequest)
    {
        $objNotNull = new Assert\NotNull();
        $objNotNull->message = "Esse valor não deve ser nulo.";
        $objNotBlank = new Assert\NotBlank();
        $objNotBlank->message = "Esse valor não deve estar em branco.";
        
        $objRangeLatitude = new Assert\Range(
            [
                "min" => -90,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 90,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeLongitude = new Assert\Range(
            [
                "min" => -180,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 180,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeRaio = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'latitude' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeLatitude
                        ]
                    ),
                    'longitude' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeLongitude
                        ]
                    ),
                    'radius' => new Assert\Optional( [
                            $objRangeRaio
                        ]
                    ),
                    'pointId' => new Assert\Optional( [
                            $objRangeRaio
                        ]
                    )
                ]
            ]
        );

        $data = [
            'latitude'  => $objRequest->get('latitude', NULL),
            'longitude'  => $objRequest->get('longitude', NULL),
            'radius'  => $objRequest->get('radius', NULL),
            'pointId'  => $objRequest->get('pointId', NULL)
        ];
        
        $objConstraintViolationList = $objRecursiveValidator->validate($data, $objCollection);
        
        if($objConstraintViolationList->count()){
            $objArrayIterator = $objConstraintViolationList->getIterator();
            $objArrayIterator->rewind();
            $mensagem = "";
            while($objArrayIterator->valid()){
                if($objArrayIterator->key()){
                    $mensagem.= "\n";
                }
                $mensagem.= $objArrayIterator->current()->getPropertyPath().': '.$objArrayIterator->current()->getMessage();
                $objArrayIterator->next();
            }
            throw new \RuntimeException($mensagem);
        }
        
        if(!($this->objPoint instanceof Point)){
            $this->objPoint = $this->objEntityManager->getRepository("App\Entity\Engenharia\Point")->find($objRequest->get('pointId', 0));
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objLocation);
        $this->objEntityManager->flush();
        return $this->objLocation;
    }
}

