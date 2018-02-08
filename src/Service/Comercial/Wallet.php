<?php
namespace App\Service\Comercial;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Comercial\Wallet\Create;

class Wallet
{
    private $objEntityManager   = NULL;    
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objComercialWalletCreate = new Create($this->objEntityManager);
            $objComercialWalletCreate->create($objRequest);
            return $objComercialWalletCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

