<?php
namespace App\Service\Prevendas;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Prevendas\Lpu\Create;

class Lpu
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objPrevendasLpuCreate = new Create($this->objEntityManager);
            $objPrevendasLpuCreate->create($objRequest);
            return $objPrevendasLpuCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

