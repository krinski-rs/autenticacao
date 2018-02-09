<?php
namespace App\Service\Comercial\Chance;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Comercial\Chance as EntityChance;
use Doctrine\ORM\EntityManager;
use App\Service\Comercial\LostChance\Create as LostChanceCreate;
use App\Service\Comercial\ChanceInactive\Create as ChanceInactiveCreate;

class Update
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
    
    public function inactive(int $id, Request $objRequest)
    {
        try {
            $this->validateInactive($id, $objRequest);
            
            $objChanceInactiveCreate = new ChanceInactiveCreate($this->objEntityManager);
            $objChanceInactiveCreate->setChance($this->objChance);
            $objChanceInactiveCreate->create($objRequest);
            $this->objChance->addChanceInactive($objChanceInactiveCreate->getChanceInactive());
            $this->objChance->setActive(FALSE);
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    private function validateInactive(int $id, Request $objRequest)
    {
        
        if(!($this->objChance instanceof EntityChance)){
            $this->objChance = $this->objEntityManager->getRepository('App\Entity\Comercial\Chance')->find($id);
            if(!($this->objChance instanceof EntityChance)){
                throw new \RuntimeException('Chance não localizado.');
            }
        }
        
        if($this->objChance->getChanceInactive()->count()){
            throw new \RuntimeException('Chance já foi inativada.');
        }
        
        if($this->objChance->getLostChance()->count()){
            throw new \RuntimeException('Chance já foi dada como perdida.');
        }
    }
    
    public function lost(int $id, Request $objRequest)
    {
        try {
            $this->validateLost($id, $objRequest);
            
            $objLostChanceCreate = new LostChanceCreate($this->objEntityManager);
            $objLostChanceCreate->setChance($this->objChance);
            
            $arrayActions = $objRequest->get('actions');
            reset($arrayActions);
            while($actions = current($arrayActions)){
                $objRequestActions = new Request();
                $objRequestActions->attributes->add($actions);
                $objLostChanceCreate->create($objRequestActions);
                $objLostChance = $objLostChanceCreate->getLostChance();
                $this->objChance->addLostChance($objLostChance);
                next($arrayActions);
            }
            $this->objChance->setActive(FALSE);
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    private function validateLost(int $id, Request $objRequest)
    {
        $objNotNull = new Assert\NotNull();
        $objNotNull->message = "Esse valor não deve ser nulo.";
        $objNotBlank = new Assert\NotBlank();
        $objNotBlank->message = "Esse valor não deve estar em branco.";
        
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
                    'actions' => new Assert\Required( [
                            $objCount,
                            $objNotNull,
                            $objNotBlank
                        ]
                    )
                ]
            ]
        );

        $data = [
            'actions' => $objRequest->get('actions', NULL)
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

        if(!($this->objChance instanceof EntityChance)){
            $this->objChance = $this->objEntityManager->getRepository('App\Entity\Comercial\Chance')->find($id);
            if(!($this->objChance instanceof EntityChance)){
                throw new \RuntimeException('Chance não localizado.');
            }
        }
        
        if($this->objChance->getChanceInactive()->count()){
            throw new \RuntimeException('Chance já foi inativada.');
        }
        
        if($this->objChance->getLostChance()->count()){
            throw new \RuntimeException('Chance já foi dada como perdida.');
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objChance);
        $this->objEntityManager->flush();
        return $this->objChance;
    }
}

