<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Tag\Create;

class Tag
{
    private $objEntityManager   = NULL;    
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objComercialTagCreate = new Create($this->objEntityManager);
            $objComercialTagCreate->create($objRequest);
            return $objComercialTagCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

