<?php
namespace App\Service\Autorizacao;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Autorizacao\Regra\Create;

class Regra
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objAutorizacaoRegraCreate = new Create($this->objEntityManager);
            $objAutorizacaoRegraCreate->create($objRequest);
            return $objAutorizacaoRegraCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

