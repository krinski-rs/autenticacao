<?php
namespace App\Service\Autorizacao\Regra;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Autorizacao\Regra;

class Create
{
    private $objEntityManager   = NULL;
    private $objRegra           = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objRegra = new Regra();
            $this->objRegra->setNome(trim($objRequest->get('nome', NULL)));
            $this->objRegra->setAtivo($objRequest->get('ativo', NULL));
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
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'nome' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    ),
                    'ativo' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                    )
                ]
            ]
        );

        $data = [
            'nome'  => trim($objRequest->get('nome', NULL)),
            'ativo'  => $objRequest->get('ativo', NULL)
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
        $this->objEntityManager->persist($this->objRegra);
        $this->objEntityManager->flush();
        return $this->objRegra;
    }
}

