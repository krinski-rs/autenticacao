<?php
namespace App\Service\Comercial\ChanceIndication;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\ChanceIndication as EntityChanceIndication;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Chance;

class Create
{
    private $objEntityManager   = NULL;
    private $objChanceIndication   = NULL;
    private $objChance          = NULL;
    private static $arrayType = [
        'indicacao' => 'Indicação',
        'google' => 'Google',
        'simm' => 'SIMM Neoway',
        'outro' => 'Outro'
    ];
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setChance(Chance $objChance)
    {
        $this->objChance = $objChance;
    }
    
    public function getChanceIndication()
    {
        return $this->objChanceIndication;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objChanceIndication = new EntityChanceIndication();
            $this->objChanceIndication->setChance($this->objChance);
            $this->objChanceIndication->setEmail($objRequest->get('email', NULL));
            $this->objChanceIndication->setType($objRequest->get('type', NULL));
            $this->objChanceIndication->setWarn($objRequest->get('warn', NULL));
            $this->objChanceIndication->setWho($objRequest->get('who', NULL));
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
        
        $objChoice = new Assert\Choice(
            [
                "choices" => array_keys(self::$arrayType),
                "message" => "Selecione um tipo de indicação valido."
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
        
        $objEmail = new Assert\Email(
            [
                "message" => "Esse valor não é um endereço de e-mail válido."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'type' => new Assert\Required( [
                            $objChoice,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'who' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'email' => new Assert\Optional( [
                            $objEmail
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
                    )
                ]
            ]
        );
        
        $data = [
            'type'      => $objRequest->get('type', NULL),
            'who'       => $objRequest->get('who', NULL),
            'email'     => $objRequest->get('email', NULL),
            'chanceId'  => $objRequest->get('chanceId', NULL),
            'warn'      => $objRequest->get('warn', NULL)
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
        $this->objEntityManager->persist($this->objChanceIndication);
        $this->objEntityManager->flush();
        return $this->objChanceIndication;
    }
}

