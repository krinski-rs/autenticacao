<?php
namespace App\Service\Redes;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Redes\Switches\Create;
use App\Entity\Redes\Switches as EntitySwitches;
use App\Util\Switches\SwitchStatus;

class Switches
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest):EntitySwitches
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
    
    public function status(int $id):array
    {
//         set_time_limit(0);
//         ini_set('memory_limit', '512M');     // OK - 512MB
        try {
//             $arraySwitches = $this->objEntityManager->getRepository('App\Entity\Redes\Switches')->findAll();
//             echo "\nTotal:: ".count($arraySwitches);
//             if(count($arraySwitches)){
//                 reset($arraySwitches);
                
//                 while($objSwitches = current($arraySwitches)){
//                     Create::createPort($objSwitches);
//                     echo "\n\t".$objSwitches->getId();
// //                     \Doctrine\Common\Util\Debug::dump($objSwitches->getPorta()->count());
//                     $this->objEntityManager->merge($objSwitches);
//                     next($arraySwitches);
//                 }
//             }
//             $this->objEntityManager->flush();
//             exit("\nFim");
            $objSwitches = $this->objEntityManager->getRepository('App\Entity\Redes\Switches')->find($id);
            if(!($objSwitches instanceof EntitySwitches)){
                throw new \RuntimeException("Switch id '$id' não foi localizado.");
            }
            $objSwitchStatus = new SwitchStatus($objSwitches);
            return $objSwitchStatus->status();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    public function updateSwitchPorta(int $id)
    {
        $objSwitches = $this->objEntityManager->getRepository('App\Entity\Redes\Switches')->find($id);
        if(!($objSwitches instanceof EntitySwitches)){
            throw new \RuntimeException("Switch id '$id' não foi localizado.");
        }
        $objSwitchStatus = new SwitchStatus($objSwitches);
        $arrayPorta = $objSwitches->getPorta();
        if($arrayPorta->count()){
            
            $arrayAlias         = $objSwitchStatus->getAlias();
            $arrayAdminStatus   = $objSwitchStatus->getAdminStatus();
            $arrayOperStatus    = $objSwitchStatus->getOperStatus();
            
//             if(count($arrayAlias) != $arrayPorta->count()){
//                 throw new \RuntimeException('Número de portas no switch "'.count($arrayAlias).'" diverge do cadastro "'.$arrayPorta->count().'"');
//             }
            print_r($arrayAlias);;
            exit();
            $arrayPorta->first();
            echo "\nclass: ".get_class($objSwitches);
            echo "\nSwitch: ".$objSwitches->getId();
            echo "\nTotal: ".$arrayPorta->count();
            while($objPorta = $arrayPorta->current()){
                echo "\n\t".$objPorta->getId();
                $arrayPorta->next();
            }
        }
        echo "\n";
        return ['final'=>1];
    }
    
    public function backup(int $id)
    {
        try {
            $objSwitches = $this->objEntityManager->getRepository('App\Entity\Redes\Switches')->find($id);
            if(!($objSwitches instanceof EntitySwitches)){
                throw new \RuntimeException("Switch id '$id' não foi localizado.");
            }
            $objSwitchStatus = new SwitchStatus($objSwitches);
            echo "<pre>";
            //             print_r($objSwitchStatus->getAdminStatus());
            //             print_r($objSwitchStatus->getAlias());
            //             print_r($objSwitchStatus->getName());
            //             print_r($objSwitchStatus->getOperStatus());
            //             print_r($objSwitchStatus->getStatsDuplexStatus());
            
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}
