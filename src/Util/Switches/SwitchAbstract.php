<?php
namespace App\Util\Switches;

use App\Entity\Redes\Switches;

abstract class SwitchAbstract implements SwitchInterface
{
    private $objSNMP        = NULL;
    private $objSwitches    = NULL;
    
    public function __construct(Switches $objSwitches)
    {
        $this->objSNMP = new \SNMP(\SNMP::VERSION_1, $objSwitches->getIp(), 'stechtelecom');
        $this->objSwitches = $objSwitches;
    }
    
    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::status()
     */
    public function status(): array
    {
        $arrayRetorno = [];
        array_push($arrayRetorno, ["sysDescr", trim(str_replace('STRING:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.1')))]);
        array_push($arrayRetorno, ["sysObjectID", trim(str_replace('OID:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.2')))]);
        array_push($arrayRetorno, ["sysUpTimeInstance", trim(str_replace('Timeticks:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.3')))]);
        array_push($arrayRetorno, ["sysContact", trim(str_replace('STRING:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.4')))]);
        array_push($arrayRetorno, ["sysName", trim(str_replace('STRING:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.5')))]);
        array_push($arrayRetorno, ["sysLocation", trim(str_replace('STRING:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.6')))]);
        array_push($arrayRetorno, ["sysServices", trim(str_replace('INTEGER:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.7')))]);
        array_push($arrayRetorno, ["sysORLastChange", trim(str_replace('Timeticks:', '', $this->objSNMP->getnext('iso.3.6.1.2.1.1.8')))]);
        return $arrayRetorno;
    }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::backup()
     */
    public function backup(): SwitchInterface
    {
        // TODO Auto-generated method stub
        
    }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::getAdminStatus()
     */
    public function getAdminStatus(): array
    {
        // TODO Auto-generated method stub
        $arrayAlias = $this->objSNMP->walk('ifAdminStatus');
        
        if(!is_array($arrayAlias)){
            $arrayAlias = [];
        }
        
        return $arrayAlias;
    }
    
    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::getAlias()
     */
    public function getAlias(): array
    {
        // TODO Auto-generated method stub
        $arrayAlias = $this->objSNMP->walk('ifAlias');
        
        if(!is_array($arrayAlias)){
            $arrayAlias = [];
        }
        
        return $arrayAlias;
    }
    
    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::getName()
     */
    public function getName(): array
    {
        // TODO Auto-generated method stub
        $arrayAlias = $this->objSNMP->walk('ifName');
        
        if(!is_array($arrayAlias)){
            $arrayAlias = [];
        }
        
        return $arrayAlias;
    }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::getOperStatus()
     */
    public function getOperStatus(): array
    {
        // TODO Auto-generated method stub
        $arrayAlias = $this->objSNMP->walk('ifOperStatus');
        
        if(!is_array($arrayAlias)){
            $arrayAlias = [];
        }
        
        return $arrayAlias;
    }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\SwitchInterface::getStatsDuplexStatus()
     */
    public function getStatsDuplexStatus(): array
    {
        // TODO Auto-generated method stub
        $arrayAlias = $this->objSNMP->walk('dot3StatsDuplexStatus');
        
        if(!is_array($arrayAlias)){
            $arrayAlias = [];
        }
        
        return $arrayAlias;
    }

    public function __destruct()
    {
        if($this->objSNMP instanceof \SNMP){
            $this->objSNMP->close();
            unset($this->objSNMP);
        }
    }
}
