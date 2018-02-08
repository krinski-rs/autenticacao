<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Chance\Create;

class Chance
{
    private $objEntityManager   = NULL;    
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objComercialChanceCreate = new Create($this->objEntityManager);
            $objComercialChanceCreate->create($objRequest);
            return $objComercialChanceCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

