<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Prospect\Create;

class Prospect
{
    private $objEntityManager   = NULL;    
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objComercialProspectCreate = new Create($this->objEntityManager);
            $objComercialProspectCreate->create($objRequest);
            return $objComercialProspectCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

