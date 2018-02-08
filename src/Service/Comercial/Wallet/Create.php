<?php
namespace App\Service\Comercial\Wallet;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Wallet as EntityWallet;
use Doctrine\ORM\EntityManager;

class Create
{
    private $objEntityManager   = NULL;
    private $objWallet             = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            $this->objWallet = new EntityWallet();
            $this->objWallet->setActive($objRequest->get('active', NULL));
            $this->objWallet->setDateRecord(new \DateTime());
            $this->objWallet->setDateUpdate(NULL);
            $this->objWallet->setIdEv($objRequest->get('idEv', NULL));
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
        
        $objRange = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 99999999,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
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
                    'idEv' => new Assert\Required( [
                            $objRange,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );
        
        $data = [
            'active'      => $objRequest->get('active', NULL),
            'idEv'     => $objRequest->get('idEv', NULL)
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
        $this->objEntityManager->persist($this->objWallet);
        $this->objEntityManager->flush();
        return $this->objWallet;
    }
}

