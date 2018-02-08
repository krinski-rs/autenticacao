<?php
namespace App\Service\Comercial\Prospect;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Prospect as EntityProspect;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Wallet;
use App\Entity\Comercial\Tag;

class Create
{
    private $objEntityManager   = NULL;
    private $objProspect        = NULL;
    private $objWallet          = NULL;
    private $objTag             = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            
            $this->validate($objRequest);
            
            $this->objProspect = new EntityProspect();
            $this->objProspect->setActive($objRequest->get('active', NULL));
            $this->objProspect->setCid($objRequest->get('cid', NULL));
            $this->objProspect->setClientName($objRequest->get('clientName', NULL));
            $this->objProspect->setDateRecord(new \DateTime());
            $this->objProspect->setDateUpdate(NULL);
            $this->objProspect->setFakeName($objRequest->get('fakeName', NULL));
            $this->objProspect->setIdCliente($objRequest->get('idCliente', NULL));
            $this->objProspect->setTag($this->objTag);
            $this->objProspect->setWallet($this->objWallet);
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
                "min" => 7,
                "max" => 7,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres.",
                "exactMessage" => "O campo deve ter exatamente {{ limit }} caracteres."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'active' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'clientName' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'idCliente' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'idWallet' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'idTag' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'fakeName' => new Assert\Optional( [
                            $objLength
                        ]
                    ),
                    'cid' => new Assert\Optional( [
                            $objRange
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'active'      => $objRequest->get('active', NULL) ,
            'clientName'    => $objRequest->get('clientName', NULL),
            'idCliente'    => $objRequest->get('idCliente', NULL),
            'idWallet'    => $objRequest->get('idWallet', NULL),
            'idTag'    => $objRequest->get('idTag', NULL),
            'fakeName'    => $objRequest->get('fakeName', NULL),
            'cid'     => $objRequest->get('cid', NULL)
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
        
        $this->objWallet = $this->objEntityManager->getRepository('App\Entity\Comercial\Wallet')->find($objRequest->get('idWallet', NULL));
        if(!($this->objWallet instanceof Wallet)){
            throw new \RuntimeException('Carteira não localizada.');
        }
        
        if($objRequest->get('idTag', NULL)){
            $this->objTag = $this->objEntityManager->getRepository('App\Entity\Comercial\Tag')->find($objRequest->get('idTag', NULL));
            if(!($this->objTag instanceof Tag)){
                throw new \RuntimeException('Tag não localizada.');
            }
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objProspect);
        $this->objEntityManager->flush();
        return $this->objProspect;
    }
}

