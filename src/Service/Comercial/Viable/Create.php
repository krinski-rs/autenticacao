<?php
namespace App\Service\Comercial\Viable;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Viable as EntityViable;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\ViableStatus;

class Create
{
    private $objEntityManager   = NULL;
    private $objViable          = NULL;
    private $objChance          = NULL;
    private $objViableStatus    = NULL;
    
    public static $arrayFiberUnit = ['m', 'km'];
    public static $arrayNetworkType = ['undefined', 'GPON', 'Metro'];
    public static $arrayDeliveryPlace = ['datacenter', 'caixa', 'cliente'];
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            $this->objViable = new EntityViable();
            $this->objViable->setActive($objRequest->get('active', NULL));
            $this->objViable->setAuthor($objRequest->get('author', NULL));
            $this->objViable->setCapilares($objRequest->get('capilares', NULL));
            $this->objViable->setCep($objRequest->get('cep', NULL));
            $this->objViable->setChance($this->objChance);
            $this->objViable->setCity($objRequest->get('city', NULL));
            $this->objViable->setComment($objRequest->get('comment', NULL));
            $this->objViable->setCommentPresale($objRequest->get('commentPresale', NULL));
            $this->objViable->setCommentVoice($objRequest->get('commentVoice', NULL));
            $this->objViable->setComplement($objRequest->get('complement', NULL));
            $this->objViable->setContCodigoid($objRequest->get('contCodigoid', NULL));
            $this->objViable->setCoords($objRequest->get('coords', NULL));
            $this->objViable->setDateRecord(new \DateTime());
            $this->objViable->setDaysDeadline($objRequest->get('daysDeadline', NULL));
            $this->objViable->setDeliveryPlace($objRequest->get('deliveryPlace', NULL));
            $this->objViable->setDistrict($objRequest->get('district', NULL));
            $this->objViable->setEspacoDatacenter($objRequest->get('espacoDatacenter', NULL));
            $this->objViable->setFiberDistance($objRequest->get('fiberDistance', NULL));
            $this->objViable->setFiberUnit($objRequest->get('fiberUnit', NULL));
            $this->objViable->setHash(NULL);
            $this->objViable->setIdDatacenter($objRequest->get('idDatacenter', NULL));
            $this->objViable->setIdGroupSva($objRequest->get('idGroupSva', NULL));
            $this->objViable->setInterface($objRequest->get('interface', NULL));
            $this->objViable->setInterfaceReal($objRequest->get('interfaceReal', NULL));
            $this->objViable->setLat($objRequest->get('latitude', NULL));
            $this->objViable->setLatlonManual($objRequest->get('latlonManual', NULL));
            $this->objViable->setLon($objRequest->get('longitude', NULL));
            $this->objViable->setMinActivation($objRequest->get('minActivation', NULL));
            $this->objViable->setMinMonthly($objRequest->get('minMonthly', NULL));
            $this->objViable->setNetworkType($objRequest->get('networkType', NULL));
            $this->objViable->setNextViableId(NULL);
            $this->objViable->setNumber($objRequest->get('number', NULL));
            $this->objViable->setPair($objRequest->get('pair', NULL));
            $this->objViable->setPriceZone($objRequest->get('priceZone', NULL));
            $this->objViable->setRequestContractDeadline($objRequest->get('requestContractDeadline', NULL));
            $this->objViable->setRequestContractDeadlineUnit($objRequest->get('requestContractDeadlineUnit', NULL));
            $this->objViable->setShadowLpuId($objRequest->get('shadowLpuId', NULL));
            $this->objViable->setSkipEngineer($objRequest->get('skipEngineer', NULL));
            $this->objViable->setSpeed($objRequest->get('speed', NULL));
            $this->objViable->setSpeedType($objRequest->get('speedType', NULL));
            $this->objViable->setSteet($objRequest->get('steet', NULL));
            $this->objViable->setTotalFo($objRequest->get('totalFo', NULL));
            $this->objViable->setTrocaEndereco($objRequest->get('trocaEndereco', NULL));
            $this->objViable->setUf($objRequest->get('uf', NULL));
            $this->objViable->setViable($objRequest->get('viable', NULL));
            $this->objViable->setViableStatus($this->objViableStatus);
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
        
        $objRangeSpeedType = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 3,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeInterface = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 4,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
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
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objLengthCep = new Assert\Length(
            [
                "min"           => 8,
                "max"           => 8,
                "minMessage"    => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage"    => "O campo não pode ser maior do que {{ limit }} caracteres.",
                "exactMessage"  => "Este campo deve ter exatamente {{ limit }} caracteres."
            ]
        );
        
        $objLengthUF = new Assert\Length(
            [
                "min"           => 2,
                "max"           => 2,
                "minMessage"    => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage"    => "O campo não pode ser maior do que {{ limit }} caracteres.",
                "exactMessage"  => "Este campo deve ter exatamente {{ limit }} caracteres."
            ]
        );
        
        $objLengthSteet = new Assert\Length(
            [
                "min"   => 1
            ]
        );
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objChoiceFiberUnit = new Assert\Choice(
            [
                "choices" => array_keys(self::$arrayFiberUnit),
                "message" => "Selecione um tipo de indicação valido."
            ]
        );
        
        $objChoiceDeliveryPlace = new Assert\Choice(
            [
                "choices" => array_keys(self::$arrayDeliveryPlace),
                "message" => "Selecione um tipo de indicação valido."
            ]
        );
        
        $objChoiceNetworkType = new Assert\Choice(
            [
                "choices" => array_keys(self::$arrayNetworkType),
                "message" => "Selecione um tipo de indicação valido."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'chanceId' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
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
                    'cep' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthCep
                        ]
                    ),
                    'steet' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthSteet
                        ]
                    ),
                    'number' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'complement' => new Assert\Optional( [
                            $objLengthSteet
                        ]
                    ),
                    'uf' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthUF
                        ]
                    ),
                    'city' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'active' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'viableStatusId' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'author' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'coords' => new Assert\Optional( [
                            $objLengthSteet
                        ]
                    ),
                    'speedType' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeSpeedType
                        ]
                    ),
                    'minActivation' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'minMonthly' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'district' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthSteet
                        ]
                    ),
                    'speed' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'interface' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeInterface
                        ]
                    ),
                    'shadowLpuId' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'priceZone' => new Assert\Optional( [
                            $objRangeSpeedType
                        ]
                    ),
                    'fiberDistance' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'fiberUnit' => new Assert\Optional( [
                            $objChoiceFiberUnit
                        ]
                    ),
                    'contCodigoid' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'nextViableId' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'latlonManual' => new Assert\Required( [
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'daysDeadline' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRange
                        ]
                    ),
                    'skipEngineer' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'requestContractDeadline' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'requestContractDeadlineUnit' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'interfaceReal' => new Assert\Required( [
                            $objRange
                        ]
                    ),
                    'comment' => new Assert\Optional( [
                            $objLengthSteet
                        ]
                    ),
                    'viable' => new Assert\Optional( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'trocaEndereco' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'pair' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'capilares' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'commentPresale' => new Assert\Optional( [
                            $objLengthSteet
                        ]
                    ),
                    'totalFo' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'idGroupSva' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'networkType' => new Assert\Optional( [
                            $objChoiceNetworkType
                        ]
                    ),
                    'idDatacenter' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'espacoDatacenter' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'deliveryPlace' => new Assert\Optional( [
                            $objChoiceDeliveryPlace
                        ]
                    ),
                    'commentVoice' => new Assert\Optional( [
                            $objLengthSteet
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'chanceId'                      => $objRequest->get('chanceId', NULL),
            'latitude'                      => $objRequest->get('latitude', NULL),
            'longitude'                     => $objRequest->get('longitude', NULL),
            'cep'                           => $objRequest->get('cep', NULL),
            'steet'                         => $objRequest->get('steet', NULL),
            'number'                        => $objRequest->get('number', NULL),
            'complement'                    => $objRequest->get('complement', NULL),
            'viable'                        => $objRequest->get('viable', NULL),
            'uf'                            => $objRequest->get('uf', NULL),
            'city'                          => $objRequest->get('city', NULL),
            'active'                        => $objRequest->get('active', NULL),
            'viableStatusId'                => $objRequest->get('viableStatusId', NULL),
            'author'                        => $objRequest->get('author', NULL),
            'coords'                        => $objRequest->get('coords', NULL),
            'speedType'                     => $objRequest->get('speedType', NULL),
            'minActivation'                 => $objRequest->get('minActivation', NULL),
            'minMonthly'                    => $objRequest->get('minMonthly', NULL),
            'district'                      => $objRequest->get('district', NULL),
            'speed'                         => $objRequest->get('speed', NULL),
            'interface'                     => $objRequest->get('interface', NULL),
            'shadowLpuId'                   => $objRequest->get('shadowLpuId', NULL),
            'priceZone'                     => $objRequest->get('priceZone', NULL),
            'fiberDistance'                 => $objRequest->get('fiberDistance', NULL),
            'fiberUnit'                     => $objRequest->get('fiberUnit', NULL),
            'contCodigoid'                  => $objRequest->get('contCodigoid', NULL),
            'nextViableId'                  => $objRequest->get('nextViableId', NULL),
            'latlonManual'                  => $objRequest->get('latlonManual', NULL),
            'daysDeadline'                  => $objRequest->get('daysDeadline', NULL),
            'skipEngineer'                  => $objRequest->get('skipEngineer', NULL),
            'requestContractDeadline'       => $objRequest->get('requestContractDeadline', NULL),
            'requestContractDeadlineUnit'   => $objRequest->get('requestContractDeadlineUnit', NULL),
            'interfaceReal'                 => $objRequest->get('interfaceReal', NULL),
            'comment'                       => $objRequest->get('comment', NULL),
            'trocaEndereco'                 => $objRequest->get('trocaEndereco', NULL),
            'pair'                          => $objRequest->get('pair', NULL),
            'capilares'                     => $objRequest->get('capilares', NULL),
            'commentPresale'                => $objRequest->get('commentPresale', NULL),
            'totalFo'                       => $objRequest->get('totalFo', NULL),
            'idGroupSva'                    => $objRequest->get('idGroupSva', NULL),
            'networkType'                   => $objRequest->get('networkType', NULL),
            'idDatacenter'                  => $objRequest->get('idDatacenter', NULL),
            'espacoDatacenter'              => $objRequest->get('espacoDatacenter', NULL),
            'deliveryPlace'                 => $objRequest->get('deliveryPlace', NULL),
            'commentVoice'                  => $objRequest->get('commentVoice', NULL)
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
        
        $this->objViableStatus = $this->objEntityManager->getRepository('App\Entity\Comercial\ViableStatus')->find($objRequest->get('viableStatusId', NULL));
        if(!($this->objViableStatus instanceof ViableStatus)){
            throw new \RuntimeException('ViableStatus não localizado.');
        }
        
//         if($objRequest->get('idTag', NULL)){
//             $this->objTag = $this->objEntityManager->getRepository('App\Entity\Comercial\Tag')->find($objRequest->get('idTag', NULL));
//             if(!($this->objTag instanceof Tag)){
//                 throw new \RuntimeException('Tag não localizada.');
//             }
//         }
        
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objViable);
        $this->objEntityManager->flush();
        return $this->objViable;
    }
}
