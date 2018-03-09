<?php

namespace App\Entity\Redes;

/**
 * Porta
 */
class Porta
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $porta;

    /**
     * @var string
     */
    private $adminStatus = 'down(2)';

    /**
     * @var string
     */
    private $operStatus;

    /**
     * @var string
     */
    private $autoNeg;

    /**
     * @var string
     */
    private $speed;

    /**
     * @var string
     */
    private $duplex;

    /**
     * @var string
     */
    private $modo;

    /**
     * @var string
     */
    private $vlanBase;

    /**
     * @var string
     */
    private $flowCtrl;

    /**
     * @var \App\Entity\Redes\Switches
     */
    private $switches;


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set porta.
     *
     * @param string $porta
     *
     * @return Porta
     */
    public function setPorta($porta)
    {
        $this->porta = $porta;

        return $this;
    }

    /**
     * Get porta.
     *
     * @return string
     */
    public function getPorta()
    {
        return $this->porta;
    }

    /**
     * Set adminStatus.
     *
     * @param string $adminStatus
     *
     * @return Porta
     */
    public function setAdminStatus($adminStatus)
    {
        $this->adminStatus = $adminStatus;

        return $this;
    }

    /**
     * Get adminStatus.
     *
     * @return string
     */
    public function getAdminStatus()
    {
        return $this->adminStatus;
    }

    /**
     * Set operStatus.
     *
     * @param string $operStatus
     *
     * @return Porta
     */
    public function setOperStatus($operStatus)
    {
        $this->operStatus = $operStatus;

        return $this;
    }

    /**
     * Get operStatus.
     *
     * @return string
     */
    public function getOperStatus()
    {
        return $this->operStatus;
    }

    /**
     * Set autoNeg.
     *
     * @param string $autoNeg
     *
     * @return Porta
     */
    public function setAutoNeg($autoNeg)
    {
        $this->autoNeg = $autoNeg;

        return $this;
    }

    /**
     * Get autoNeg.
     *
     * @return string
     */
    public function getAutoNeg()
    {
        return $this->autoNeg;
    }

    /**
     * Set speed.
     *
     * @param string $speed
     *
     * @return Porta
     */
    public function setSpeed($speed)
    {
        $this->speed = $speed;

        return $this;
    }

    /**
     * Get speed.
     *
     * @return string
     */
    public function getSpeed()
    {
        return $this->speed;
    }

    /**
     * Set duplex.
     *
     * @param string $duplex
     *
     * @return Porta
     */
    public function setDuplex($duplex)
    {
        $this->duplex = $duplex;

        return $this;
    }

    /**
     * Get duplex.
     *
     * @return string
     */
    public function getDuplex()
    {
        return $this->duplex;
    }

    /**
     * Set modo.
     *
     * @param string $modo
     *
     * @return Porta
     */
    public function setModo($modo)
    {
        $this->modo = $modo;

        return $this;
    }

    /**
     * Get modo.
     *
     * @return string
     */
    public function getModo()
    {
        return $this->modo;
    }

    /**
     * Set vlanBase.
     *
     * @param string $vlanBase
     *
     * @return Porta
     */
    public function setVlanBase($vlanBase)
    {
        $this->vlanBase = $vlanBase;

        return $this;
    }

    /**
     * Get vlanBase.
     *
     * @return string
     */
    public function getVlanBase()
    {
        return $this->vlanBase;
    }

    /**
     * Set flowCtrl.
     *
     * @param string $flowCtrl
     *
     * @return Porta
     */
    public function setFlowCtrl($flowCtrl)
    {
        $this->flowCtrl = $flowCtrl;

        return $this;
    }

    /**
     * Get flowCtrl.
     *
     * @return string
     */
    public function getFlowCtrl()
    {
        return $this->flowCtrl;
    }

    /**
     * Set switch.
     *
     * @param \App\Entity\Redes\Switches|null $switch
     *
     * @return Porta
     */
    public function setSwitch(\App\Entity\Redes\Switches $switches = null)
    {
        $this->switches = $switches;

        return $this;
    }

    /**
     * Get switch.
     *
     * @return \App\Entity\Redes\Switches|null
     */
    public function getSwitch()
    {
        return $this->switches;
    }
}
