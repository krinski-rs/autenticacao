<?php
namespace App\Service\Comercial\LostAction;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\LostAction as EntityLostAction;
use Doctrine\ORM\EntityManager;
use App\Entity\Comercial\Chance;

class Create
{
    private $objEntityManager       = NULL;
    private $objLostAction          = NULL;
    private $objLostActionParent    = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setChance(Chance $objChance)
    {
        $this->objChance = $objChance;
    }
    
    public function getLostAction()
    {
        return $this->objLostAction;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objLostAction = new EntityLostAction();
            $this->objLostAction->setName($objRequest->get('name', NULL));
            $this->objLostAction->setParentId($this->objLostActionParent);
            $this->objLostAction->setSelect($objRequest->get('select', NULL));
            $this->objLostAction->setVisible($objRequest->get('visible', NULL));
            $this->objLostAction->setDescription($objRequest->get('description', NULL));
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
                    'parentId' => new Assert\Required( [
                            $objRange
                        ]
                    ),
                    'visible' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    ),
                    'select' => new Assert\Required( [
                            $objType,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'name'      => $objRequest->get('name', NULL),
            'parentId'  => $objRequest->get('parentId', NULL),
            'visible'   => $objRequest->get('visible', NULL),
            'select'    => $objRequest->get('select', NULL)
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
        
        if($objRequest->get('parentId', NULL)){
            $this->objLostActionParent = $this->objEntityManager->getRepository('App\Entity\Comercial\LostAction')->find($objRequest->get('parentId', NULL));
            if(!($this->objLostActionParent instanceof EntityLostAction)){
                throw new \RuntimeException('Chance não localizada.');
            }
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objLostAction);
        $this->objEntityManager->flush();
        return $this->objLostAction;
    }
}

