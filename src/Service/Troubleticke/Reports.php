<?php
namespace App\Service\Troubleticke;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Service\Troubleticke\Reports\BoletinAtendimentoService;

class Reports
{
    private $objEntityManager       = NULL;
    const BA_TYPE = 'BA';
    const BI_TYPE = 'BI';
    const BS_TYPE = 'BS';
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager         = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $reportType = $objRequest->get('reportType', NULL);
            $this->validateTypeReport($reportType);
            switch ($reportType) {
                case self::BA_TYPE:
                    echo self::BA_TYPE;
                    $objBoletinAtendimentoService = new BoletinAtendimentoService($this->objEntityManager);
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
    
    private function validateTypeReport($choice)
    {
        $objChoice = new Assert\Choice();
        $objChoice->choices = [ self::BA_TYPE, self::BI_TYPE, self::BS_TYPE ];
        $objChoice->message = "O valor que você selecionou não é uma escolha válida.";
        $objNotNull = new Assert\NotNull();
        $objNotNull->message = "Esse valor não deve ser nulo.";
        $objNotBlank = new Assert\NotBlank();
        $objNotBlank->message = "Esse valor não deve estar em branco.";
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            ['fields' => [
                    'reportType' => new Assert\Required( [
                            $objChoice,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )/*,
                    'chitos' => new Assert\Required( [
                            $objChoice,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )*/
                ]
            ]
        );
        
        $data = ['reportType' => $choice /*, 'chitos' => null*/];
        
        $objConstraintViolationList = $objRecursiveValidator->validate($data, $objCollection);
        
        if($objConstraintViolationList->count()){
            $objArrayIterator = $objConstraintViolationList->getIterator();
            $objArrayIterator->rewind();
            $mensagem = "";
            while($objArrayIterator->valid()){
                \Doctrine\Common\Util\Debug::dump($objArrayIterator->current()->getPropertyPath());
                if($objArrayIterator->key()){
                    $mensagem.= "\n";
                }
                $mensagem.= $objArrayIterator->current()->getPropertyPath().': '.$objArrayIterator->current()->getMessage();
                $objArrayIterator->next();
            }
            throw new \RuntimeException($mensagem);
        }
    }
}

