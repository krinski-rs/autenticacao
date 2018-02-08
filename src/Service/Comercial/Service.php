<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Service\Create;

class Service
{
    private $objEntityManager   = NULL;    
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objComercialServiceCreate = new Create($this->objEntityManager);
            $objComercialServiceCreate->create($objRequest);
            return $objComercialServiceCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

