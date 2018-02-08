<?php
namespace App\Service\Comercial\Chance;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Chance as EntityChance;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Prospect;
use App\Entity\Comercial\Service;
use App\Entity\Comercial\ChanceType;
use App\Service\Comercial\ChanceContact\Create as ChanceContactCreate;
use App\Service\Comercial\ChanceIndication\Create as ChanceIndicationCreate;

class Create
{
    private $objEntityManager   = NULL;
    private $objChance          = NULL;
    private $objProspect        = NULL;
    private $objService         = NULL;
    private $objChanceType      = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objChance = new EntityChance();
            $objChanceContactCreate = new ChanceContactCreate($this->objEntityManager);
            $objChanceIndicationCreate = new ChanceIndicationCreate($this->objEntityManager);
            
            $objChanceContactCreate->setChance($this->objChance);
            $objChanceIndicationCreate->setChance($this->objChance);
            
            $arrayContact = $objRequest->get('contact');
            reset($arrayContact);
            while($contact = current($arrayContact)){
                $objRequestContact = new Request();
                $objRequestContact->attributes->add($contact);
                $objChanceContactCreate->create($objRequestContact);
                $objChanceContact = $objChanceContactCreate->getChanceContact();
                $this->objChance->addChanceContact($objChanceContact);
                next($arrayContact);
            }
            
            $arrayIndication = $objRequest->get('indication');
            reset($arrayIndication);
            while($indication = current($arrayIndication)){
                $objRequestIndication = new Request();
                $objRequestIndication->attributes->add($indication);
                $objChanceIndicationCreate->create($objRequestIndication);
                
                $objChanceIndication = $objChanceIndicationCreate->getChanceIndication();
                $this->objChance->addChanceIndication($objChanceIndication);
                next($arrayIndication);
            }
            
            $this->objChance->setActive($objRequest->get('active', NULL));
            $this->objChance->setClosingDate(NULL);
            $this->objChance->setClosingValue(NULL);
            $this->objChance->setDateRecord(new \DateTime());
            $this->objChance->setDateUpdate(NULL);
            $this->objChance->setDescription($objRequest->get('description', NULL));
            $this->objChance->setIdContract($objRequest->get('idContract', NULL));
            $this->objChance->setIdFollowup($objRequest->get('idFollowup', NULL));
            $this->objChance->setIdLastProposal(NULL);
            $this->objChance->setService($this->objService);
            $this->objChance->setProspect($this->objProspect);
            $this->objChance->setChanceType($this->objChanceType);
            $this->objChance->setTemperature($objRequest->get('temperature', NULL));
            
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
        
        $objRangeTemperatura = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 100,
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
                "max" => 1000,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objDateTime = new Assert\DateTime(
            [
                "format" => 'Y-m-d H:i:s',
                "message" => "Este valor {{ value }} não é um data válida."
            ]
        );
        
        $objCount = new Assert\Count(
            [
                "min" => 1,
                "max" => 10,
                "minMessage" => "Você deve especificar pelo menos um contato.",
                "maxMessage" => "Não é possível especificar mais do que {{ limit }} contato."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'idProspect' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'idProduct' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'temperature' => new Assert\Required( [
                            $objRangeTemperatura,
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
                    'serviceType' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'contact' => new Assert\Required( [
                            $objCount,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'description' => new Assert\Optional( [
                            $objLength
                        ]
                    ),
                    'dateUpdate' => new Assert\Optional( [
                            $objDateTime
                        ]
                    ),
                    'idFollowup' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'idLastProposal' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'idContract' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'closingValue' => new Assert\Optional( [
                            $objRange,
                            $objType
                        ]
                    ),
                    'closingDate' => new Assert\Optional( [
                            $objDateTime
                        ]
                    ),
                    'indication' => new Assert\Optional( [
                            $objRange
                        ]
                    )
                ]
            ]
        );

        $data = [
            'idProspect'        => $objRequest->get('idProspect', NULL),
            'idProduct'         => $objRequest->get('idProduct', NULL),
            'temperature'       => $objRequest->get('temperature', NULL),
            'active'            => $objRequest->get('active', NULL),
            'serviceType'       => $objRequest->get('serviceType', NULL),
            'contact'           => $objRequest->get('contact', NULL),
            'indication'        => (count($objRequest->get('indication', []))?count($objRequest->get('indication', [])):null),
            'description'       => $objRequest->get('description', NULL),
            'dateUpdate'        => $objRequest->get('dateUpdate', NULL),
            'idFollowup'        => $objRequest->get('idFollowup', NULL),
            'idLastProposal'    => $objRequest->get('idLastProposal', NULL),
            'idContract'        => $objRequest->get('idContract', NULL),
            'closingValue'      => $objRequest->get('closingValue', NULL),
            'closingDate'       => $objRequest->get('closingDate', NULL)
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
        
        $this->objProspect = $this->objEntityManager->getRepository('App\Entity\Comercial\Prospect')->find($objRequest->get('idProspect', NULL));
        if(!($this->objProspect instanceof Prospect)){
            throw new \RuntimeException('Prospect não localizado.');
        }
        
        $this->objService = $this->objEntityManager->getRepository('App\Entity\Comercial\Service')->find($objRequest->get('idProduct', NULL));
        if(!($this->objService instanceof Service)){
            throw new \RuntimeException('Serviço não localizado.');
        }
        
        $this->objChanceType = $this->objEntityManager->getRepository('App\Entity\Comercial\ChanceType')->find($objRequest->get('serviceType', NULL));
        if(!($this->objChanceType instanceof ChanceType)){
            throw new \RuntimeException('Tipo da chance não localizado.');
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objChance);
        $this->objEntityManager->flush();
        return $this->objChance;
    }
}

