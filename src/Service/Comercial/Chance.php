<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Chance\Create;
use App\Service\Comercial\Chance\Update;

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
    
    public function lost(int $id, Request $objRequest)
    {
        try {
            $objComercialChanceUpdate = new Update($this->objEntityManager);
            $objComercialChanceUpdate->lost($id, $objRequest);
            return $objComercialChanceUpdate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    public function inactive(int $id, Request $objRequest)
    {
        try {
            echo "\ninactive";
            $objComercialChanceUpdate = new Update($this->objEntityManager);
            $objComercialChanceUpdate->inactive($id, $objRequest);
            return $objComercialChanceUpdate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
}

