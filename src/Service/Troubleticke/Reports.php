<?php
namespace App\Service\Troubleticke;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Service\Troubleticke\Reports\BoletinAnormalidadeService;

class Reports
{
    private $objEntityManager       = NULL;
    const BA_TYPE = 'BA';
    const BI_TYPE = 'BI';
    const BS_TYPE = 'BS';
    
    private $objReports = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager         = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validateTypeReport($objRequest);
            switch ($objRequest->get('reportType')) {
                case self::BA_TYPE:
                    $this->objReports = new BoletinAnormalidadeService($this->objEntityManager);
                    $this->objReports->create($objRequest);
                    break;
                case self::BI_TYPE:
                    echo self::BI_TYPE;
                    break;
                case self::BS_TYPE:
                    echo self::BS_TYPE;
                    break;
            }
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    private function validateTypeReport(Request $objRequest)
    {
        $objChoice = new Assert\Choice();
        $objChoice->choices = [ self::BA_TYPE, self::BI_TYPE, self::BS_TYPE ];
        $objChoice->message = "O valor que você selecionou não é uma escolha válida.";
        
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
                "min" => 10,
                "max" => 25,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            ['fields' => [
                    'reportType' => new Assert\Required( [
                            $objChoice,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'circuitId' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'createdByClient' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'designation' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'stack' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'status' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'reportType'        => $objRequest->get('reportType', NULL) ,
            'circuitId'         => $objRequest->get('circuitId', NULL),
            'createdByClient'   => $objRequest->get('createdByClient', NULL),
            'designation'       => $objRequest->get('designation', NULL),
            'stack'             => $objRequest->get('stack', NULL),
            'status'             => $objRequest->get('status', NULL)
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
        return $this->objReports->save();
    }
}

