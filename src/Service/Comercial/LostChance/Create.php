<?php
namespace App\Service\Comercial\LostChance;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\LostChance as EntityLostChance;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Chance;
use App\Entity\Comercial\Wallet;
use App\Entity\Comercial\LostAction;

class Create
{
    private $objEntityManager   = NULL;
    private $objLostChance      = NULL;
    private $objChance          = NULL;
    private $objWallet          = NULL;
    private $objLostAction      = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setChance(Chance $objChance)
    {
        $this->objChance = $objChance;
    }
    
    public function getLostChance()
    {
        return $this->objLostChance;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objLostChance = new EntityLostChance();
            $this->objLostChance->setChance($this->objChance);
            $this->objLostChance->setDateRecord(new \DateTime);
            $this->objLostChance->setDescription($objRequest->get('description', NULL));
            $this->objLostChance->setLostAction($this->objLostAction);
            $this->objLostChance->setWallet($this->objWallet);
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
                    'description' => new Assert\Required( [
                            $objLength,
                            $objNotBlank
                        ]
                    ),
                    'chanceId' => new Assert\Required( [
                            $objRange
                        ]
                    ),
                    'walletId' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'lostActionId' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'description'   => $objRequest->get('description', NULL),
            'chanceId'      => $objRequest->get('chanceId', NULL),
            'walletId'      => $objRequest->get('walletId', NULL),
            'lostActionId'  => $objRequest->get('lostActionId', NULL)
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

        $this->objWallet = $this->objEntityManager->getRepository('App\Entity\Comercial\Wallet')->find($objRequest->get('walletId', NULL));
        if(!($this->objWallet instanceof Wallet)){
            throw new \RuntimeException('EV não localizado.');
        }

        $this->objLostAction = $this->objEntityManager->getRepository('App\Entity\Comercial\LostAction')->find($objRequest->get('lostActionId', NULL));
        if(!($this->objLostAction instanceof LostAction)){
            throw new \RuntimeException('Ação não localizada.');
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objLostChance);
        $this->objEntityManager->flush();
        return $this->objLostChance;
    }
}

