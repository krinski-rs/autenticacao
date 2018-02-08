<?php
namespace App\Service\Comercial\ChanceContact;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\ChanceContact as EntityChanceContact;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Chance;

class Create
{
    private $objEntityManager   = NULL;
    private $objChanceContact   = NULL;
    private $objChance          = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setChance(Chance $objChance)
    {
        $this->objChance = $objChance;
    }
    
    public function getChanceContact()
    {
        return $this->objChanceContact;
    }
    
    public function create(Request $objRequest)
    {
        try {
            
            $this->validate($objRequest);
            
            $this->objChanceContact = new EntityChanceContact();
            $this->objChanceContact->setChance($this->objChance);
            $this->objChanceContact->setEmail($objRequest->get('email', NULL));
            $this->objChanceContact->setName($objRequest->get('name', NULL));
            $this->objChanceContact->setTelephone($objRequest->get('telephone', NULL));
            $this->objChanceContact->setWarn($objRequest->get('warn', NULL));
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
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objLength = new Assert\Length(
            [
                "min" => 5,
                "max" => 200,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objLength2 = new Assert\Length(
            [
                "min" => 9,
                "max" => 20,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objEmail = new Assert\Email(
            [
                "message" => "Esse valor não é um endereço de e-mail válido."
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
                    'chanceId' => new Assert\Required( [
                            $objRange
                        ]
                    ),
                    'warn' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'telephone' => new Assert\Required( [
                            $objLength2,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'email' => new Assert\Required( [
                            $objEmail,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'name'      => $objRequest->get('name', NULL),
            'chanceId'  => $objRequest->get('chanceId', NULL),
            'warn'      => $objRequest->get('warn', NULL),
            'telephone' => $objRequest->get('telephone', NULL),
            'email'     => $objRequest->get('email', NULL)
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
        $this->objEntityManager->persist($this->objChanceContact);
        $this->objEntityManager->flush();
        return $this->objChanceContact;
    }
}

