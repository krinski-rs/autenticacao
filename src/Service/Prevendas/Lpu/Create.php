<?php
namespace App\Service\Prevendas\Lpu;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Prevendas\Lpu;

class Create
{
    private $objEntityManager   = NULL;
    private $objLpu             = NULL;
    
    const TYPE_REFERENCIA   = 'R';
    const TYPE_PADRAO       = 'P';

    const TYPE_MIN_CONTRACT_UNIT_MESES  = 'Meses';
    const TYPE_MIN_CONTRACT_UNIT_DIAS   = 'Dias';
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function getType()
    {
        return [ self::TYPE_PADRAO, self::TYPE_REFERENCIA ];
    }
    
    public function getMinContractUnit()
    {
        return [ 1 => self::TYPE_MIN_CONTRACT_UNIT_MESES, 2 => self::TYPE_MIN_CONTRACT_UNIT_DIAS ];
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objLpu = new Lpu();
            $this->objLpu->setActive($objRequest->get('active', NULL));
            $this->objLpu->setAuthor($objRequest->get('author', NULL));
            $this->objLpu->setDateRecord(new \DateTime());
            $this->objLpu->setDateValid(new \DateTime());
            $this->objLpu->setDistance($objRequest->get('distance', NULL));
            $this->objLpu->setMinContractDeadline($objRequest->get('minContractDeadline', NULL));
            $this->objLpu->setMinContractUnit($objRequest->get('minContractUnit', NULL));
            $this->objLpu->setMinimumPrice($objRequest->get('minimumPrice', NULL));
            $this->objLpu->setModeCodigoid($objRequest->get('modeCodigoid', NULL));
            $this->objLpu->setName($objRequest->get('name', NULL));            
            $this->objLpu->setOnlineSales((bool)$objRequest->get('onlineSales', NULL));            
            $this->objLpu->setServiceId($objRequest->get('serviceId', NULL));            
            $this->objLpu->setSla($objRequest->get('sla', NULL));            
            $this->objLpu->setType($objRequest->get('type', NULL));            
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
        
        $objLength = new Assert\Length(
            [
                "min" => 2,
                "max" => 100,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objRange = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 9999999,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeSla = new Assert\Range(
            [
                "min" => 0.1,
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
        
        $arrayTypes = $this->getType();
        $objChoice = new Assert\Choice(
            [
                "choices" => $arrayTypes,
                "min" => 1,
                "max" => count($arrayTypes),
                "message" => "O valor selecionado '{{ value }}' não é uma escolha válida.",
                "minMessage" => "Você deve selecionar pelo menos {{ limit }} opções.",
                "maxMessage" => "Você deve selecionar no máximo {{ limit }} opções."
            ]
        );
        
        $arrayMinContractUnit = $this->getMinContractUnit();
        $objChoiceMinContractUnit = new Assert\Choice(
            [
                "choices" => array_keys($arrayMinContractUnit),
                "min" => 1,
                "max" => count($arrayMinContractUnit),
                "message" => "O valor selecionado '{{ value }}' não é uma escolha válida.",
                "minMessage" => "Você deve selecionar pelo menos {{ limit }} opções.",
                "maxMessage" => "Você deve selecionar no máximo {{ limit }} opções."
            ]
        );
        
        $objDateTime = new Assert\DateTime(
            [
                "format" => 'd/m/Y',
                "message" => "Este valor {{ value }} não é um data válida."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'active' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'author' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'dateValid' => new Assert\Optional( [
                            $objDateTime
                        ]
                    ),
                    'distance' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'minContractDeadline' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'minContractUnit' => new Assert\Optional( [
                            $objChoiceMinContractUnit
                        ]
                    ),
                    'minimumPrice' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'modeCodigoid' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'name' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    ),
                    'onlineSales' => new Assert\Optional( [
                            $objType
                        ]
                    ),
                    'serviceId' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'sla' => new Assert\Optional( [
                            $objRangeSla
                        ]
                    ),
                    'type' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objChoice
                        ]
                    )
                ]
            ]
        );

        $data = [
            'active'  => $objRequest->get('active', NULL),
            'author'  => $objRequest->get('author', NULL),
            'dateValid'  => $objRequest->get('dateValid', NULL),
            'distance'  => $objRequest->get('distance', NULL),
            'minContractDeadline'  => $objRequest->get('minContractDeadline', NULL),
            'minContractUnit'  => $objRequest->get('minContractUnit', NULL),
            'minimumPrice'  => $objRequest->get('minimumPrice', NULL),
            'modeCodigoid'  => $objRequest->get('modeCodigoid', NULL),
            'name'  => trim($objRequest->get('name', NULL)),
            'onlineSales'  => $objRequest->get('onlineSales', NULL),
            'serviceId'  => $objRequest->get('serviceId', NULL),
            'sla'  => $objRequest->get('sla', NULL),
            'type'  => trim($objRequest->get('type', NULL))
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
        $this->objEntityManager->persist($this->objLpu);
        $this->objEntityManager->flush();
        return $this->objLpu;
    }
}

