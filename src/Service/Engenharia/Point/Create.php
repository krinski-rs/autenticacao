<?php
namespace App\Service\Engenharia\Point;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Engenharia\Point as EntityPoint;
use App\Entity\Engenharia\Type;
use App\Entity\Engenharia\Location;
use App\Service\Engenharia\Location\Create as LocationCreate;

class Create
{
    private $objEntityManager   = NULL;
    private $objPoint           = NULL;
    private $objType            = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objPoint = new EntityPoint();
            $this->objPoint->setActivationDeadline($objRequest->get('activationDeadline', NULL));
            $this->objPoint->setActive($objRequest->get('active', NULL));
            $this->objPoint->setAuthor(trim($objRequest->get('author', NULL)));
            $this->objPoint->setCircCodigoid($objRequest->get('circCodigoid', NULL));
            $this->objPoint->setColor(trim($objRequest->get('color', NULL)));
            $this->objPoint->setDateRecord(new \DateTime());
            $this->objPoint->setDateValid(( $objRequest->get('dateValid', NULL) ? \DateTime::createFromFormat('d/m/Y', $objRequest->get('dateValid', NULL)) : NULL));
            $this->objPoint->setInterface(implode("", $objRequest->get('interface', NULL)));
            $this->objPoint->setLocationType($objRequest->get('locationType', NULL));
            $this->objPoint->setMaxSpeed($objRequest->get('maxSpeed', NULL));
            $this->objPoint->setName($objRequest->get('name', NULL));
            $this->objPoint->setState(trim($objRequest->get('state', NULL)));
            $this->objPoint->setType($this->objType);
            
            $objLocationCreate = new LocationCreate($this->objEntityManager);
            switch ($objRequest->get('locationType', NULL)){
                case 1: //PONTO
                    $objRequestLocation = new Request();
                    $objRequestLocation->attributes->add($objRequest->get('location', NULL));
                    $objLocationCreate->setPoint($this->objPoint);
                    $objLocationCreate->create($objRequestLocation);
                    $this->objPoint->addLocation($objLocationCreate->getLocation());
                    break;
                case 2: //POLIGONO
                    $arrayLocation = $objRequest->get('location', []);
                    if(!count($arrayLocation)){
                        throw new \RuntimeException("Nenhum ponto encontrado.");
                    }
                    reset($arrayLocation);
                    while ($location = current($arrayLocation)){
                        $objRequestLocation = new Request();
                        $objRequestLocation->attributes->add($location);
                        $objLocationCreate->setPoint($this->objPoint);
                        $objLocationCreate->create($objRequestLocation);
                        $objLocationPrev = $objLocationCreate->getLocation();
                        $this->objPoint->addLocation($objLocationPrev);
                        $objLocationCreate->setLocationPrev($objLocationPrev);
                        next($arrayLocation);
                    }
                    break;
            }
            
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
        
        $objLengthColor = new Assert\Length(
            [
                "min" => 7,
                "max" => 7,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres.",
                "exactMessage" => "Esse valor deve ter exatamente {{ limit }} caracteres."
            ]
        );
        
        $objLengthState = new Assert\Length(
            [
                "min" => 2,
                "max" => 2,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres.",
                "exactMessage" => "Esse valor deve ter exatamente {{ limit }} caracteres."
            ]
        );
        
        $objRange = new Assert\Range(
            [
                "min" => 0,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 120,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeAuthor = new Assert\Range(
            [
                "min" => 0,
                "minMessage" => "Esse valor deve ser '{{ value }}' ou mais.",
                "max" => 999999,
                "maxMessage" => "Esse valor deve ser '{{ value }}' ou menor."
            ]
        );
        
        $objRangeType = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ value }}' ou mais.",
                "max" => 8,
                "maxMessage" => "Esse valor deve ser '{{ value }}' ou menor."
            ]
        );
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objDateTime = new Assert\DateTime(
            [
                "format" => 'd/m/Y',
                "message" => "Este valor '{{ value }}' não é um data válid."
            ]
        );
        
        $arrayInterface = \App\Service\Engenharia\Point::getArrayInterface();
        
        $objChoice = new Assert\Choice(
            [
                "choices" => array_keys($arrayInterface),
                "min" => 1,
                "max" => count($arrayInterface),
                "multiple" => true,
                "message" => "O valor selecionado '{{ value }}' não é uma escolha válida.",
                "minMessage" => "Você deve selecionar pelo menos {{ limit }} opções.",
                "maxMessage" => "Você deve selecionar no máximo {{ limit }} opções."
            ]
        );
        
        $arrayTipoPonto = \App\Service\Engenharia\Point::getArrayTipoPonto();
        
        $objChoiceTipoPonto = new Assert\Choice(
            [
                "choices" => array_keys($arrayTipoPonto),
                "min" => 1,
                "message" => "O valor selecionado '{{ value }}' não é uma escolha válida.",
                "minMessage" => "Você deve selecionar pelo menos {{ limit }} opções.",
            ]
        );
        
        $objTypeInteger = new Assert\Type(
            [
                "type" => 'numeric',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'activationDeadline' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'active' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    ),
                    'author' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeAuthor
                        ]
                    ),
                    'circCodigoid' => new Assert\Optional( [
                            $objRangeAuthor
                        ]
                    ),
                    'color' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthColor
                        ]
                    ),
                    'dateValid' => new Assert\Optional( [
                            $objDateTime
                        ]
                    ),
                    'interface' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objChoice
                        ]
                    ),
                    'locationType' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objChoiceTipoPonto
                        ]
                    ),
                    'maxSpeed' => new Assert\Optional( [
                            $objRangeAuthor
                        ]
                    ),
                    'name' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    ),
                    'state' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLengthState
                        ]
                    ),
                    'type' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objTypeInteger,
                            $objRangeType
                        ]
                    )
                ]
            ]
        );

        $data = [
            'activationDeadline'  => $objRequest->get('activationDeadline', NULL),
            'active'  => $objRequest->get('active', NULL),
            'author'  => trim($objRequest->get('author', NULL)),
            'circCodigoid'  => $objRequest->get('circCodigoid', NULL),
            'color'  => trim($objRequest->get('color', NULL)),
            'dateValid'  => trim($objRequest->get('dateValid', NULL)),
            'interface'  => $objRequest->get('interface', NULL),
            'locationType'  => $objRequest->get('locationType', NULL),
            'maxSpeed'  => $objRequest->get('maxSpeed', NULL),
            'name'  => $objRequest->get('name', NULL),
            'state'  => $objRequest->get('state', NULL),
            'type'  => $objRequest->get('type', NULL)
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
        
        $this->objType = $this->objEntityManager->getRepository("App\Entity\Engenharia\Type")->find($objRequest->get('type', NULL));
        if(!($this->objType instanceof Type)){
            throw new \RuntimeException("Tipo de ponto não encontrado.");
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objPoint);
        $this->objEntityManager->flush();
        return $this->objPoint;
    }
}

