<?php
namespace App\Service\Engenharia;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Engenharia\Type\Create;

class Type
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objEngenhariaTypeCreate = new Create($this->objEntityManager);
            $objEngenhariaTypeCreate->create($objRequest);
            return $objEngenhariaTypeCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

