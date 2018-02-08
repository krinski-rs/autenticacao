<?php
namespace App\Service\Comercial\Service;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Service as EntityService;
use Doctrine\ORM\EntityManager;

class Create
{
    private $objEntityManager   = NULL;
    private $objService         = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            $this->objService = new EntityService();
            $this->objService->setActive($objRequest->get('active', NULL));
            $this->objService->setLocationService($objRequest->get('locationService', NULL));
            $this->objService->setMultipleCircuits($objRequest->get('multipleCircuits', NULL));
            $this->objService->setName($objRequest->get('name', NULL));
            $this->objService->setServicoContrato($objRequest->get('servicoContrato', NULL));
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
        
        $objRange = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ value }}' ou mais.",
                "max" => 99999999,
                "maxMessage" => "Esse valor deve ser '{{ value }}' ou menor."
            ]
        );
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objLength = new Assert\Length(
            [
                "min" => 5,
                "max" => 100,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'name' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'servicoContrato' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'multipleCircuits' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'active' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'locationService' => new Assert\Optional( [
                            $objRange
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'name'              => $objRequest->get('name', NULL) ,
            'servicoContrato'   => $objRequest->get('servicoContrato', NULL),
            'multipleCircuits'  => $objRequest->get('multipleCircuits', NULL),
            'locationService'   => $objRequest->get('locationService', NULL),
            'active'            => $objRequest->get('active', NULL)
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
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objService);
        $this->objEntityManager->flush();
        return $this->objService;
    }
}

