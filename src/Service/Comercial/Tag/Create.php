<?php
namespace App\Service\Comercial\Tag;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Tag as EntityTag;
use Doctrine\ORM\EntityManager;

class Create
{
    private $objEntityManager   = NULL;
    private $objTag             = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            $this->objTag = new EntityTag();
            $this->objTag->setColor($objRequest->get('color', NULL));
            $this->objTag->setName($objRequest->get('name', NULL));
            $this->objTag->setStatus($objRequest->get('status', NULL));
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
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objLength = new Assert\Length(
            [
                "min" => 5,
                "max" => 50,
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
                    'name' => new Assert\Required( [
                            $objLength,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'color' => new Assert\Required( [
                            $objLength2,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'status' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                ]
            ]
        );
        
        $data = [
            'name'      => $objRequest->get('name', NULL) ,
            'color'     => $objRequest->get('color', NULL),
            'status'    => $objRequest->get('status', NULL)
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
        $this->objEntityManager->persist($this->objTag);
        $this->objEntityManager->flush();
        return $this->objTag;
    }
}

