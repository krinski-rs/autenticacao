<?php
namespace App\Service\Redes;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Redes\ModeloSwitch\Create;

class ModeloSwitch
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objRedesSwitchCreate = new Create($this->objEntityManager);
            $objRedesSwitchCreate->create($objRequest);
            return $objRedesSwitchCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

