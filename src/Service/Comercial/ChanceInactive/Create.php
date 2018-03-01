<?php
namespace App\Service\Comercial\ChanceInactive;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\ChanceInactive as EntityChanceInactive;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Chance;

class Create
{
    private $objEntityManager   = NULL;
    private $objChanceInactive  = NULL;
    private $objChance          = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setChance(Chance $objChance)
    {
        $this->objChance = $objChance;
    }
    
    public function getChanceInactive()
    {
        return $this->objChanceInactive;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objChanceInactive = new EntityChanceInactive();
            $this->objChanceInactive->setChance($this->objChance);
            $this->objChanceInactive->setActive(new \DateTime);
            $this->objChanceInactive->setDescription($objRequest->get('description', NULL));
            $this->objChanceInactive->setRecordDate(new \DateTime());
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
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 99999999,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objLength = new Assert\Length(
            [
                "min" => 5,
                "max" => 1000,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'description' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'chanceId' => new Assert\Required( [
                            $objRange
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'description'   => $objRequest->get('description', NULL),
            'chanceId'      => $objRequest->get('chanceId', NULL)
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
        
        if(!($this->objChance instanceof Chance)){
            $this->objChance = $this->objEntityManager->getRepository('App\Entity\Comercial\Chance')->find($objRequest->get('chanceId', NULL));
            if(!($this->objChance instanceof Chance)){
                throw new \RuntimeException('Chance não localizada.');
            }
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objChanceInactive);
        $this->objEntityManager->flush();
        return $this->objChanceInactive;
    }
}

