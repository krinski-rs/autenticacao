<?php

namespace App\Entity\Redes;

/**
 * Switch
 */
abstract class Switches
{
    /**
     * @var int
     * @access private
     */
    private $id;

    /**
     * @var string
     * @access private
     */
    private $nome;

    /**
     * @var string
     * @access private
     */
    private $ip;

    /**
     * @var int|null
     * @access private
     */
    private $vlan;

    /**
     * @var bool
     * @access private
     */
    private $ativo = true;

    /**
     * @var \DateTime
     * @access private
     */
    private $dataCadastro = NULL;

    /**
     * @var \App\Entity\Redes\ModeloSwitch
     * @access private
     */
    private $modeloSwitch;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @access private
     */
    private $porta;
    
    public function __construct()
    {
        $this->porta = new \Doctrine\Common\Collections\ArrayCollection();
        $this->dataCadastro = new \DateTime();
    }

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
     * Set nome.
     *
     * @param string $nome
     *
     * @return Switches
     */
    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Get nome.
     *
     * @return string
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * Set ip.
     *
     * @param string $ip
     *
     * @return Switches
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip.
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set vlan.
     *
     * @param int|null $vlan
     *
     * @return Switches
     */
    public function setVlan($vlan = null)
    {
        $this->vlan = $vlan;

        return $this;
    }

    /**
     * Get vlan.
     *
     * @return int|null
     */
    public function getVlan()
    {
        return $this->vlan;
    }

    /**
     * Set ativo.
     *
     * @param bool $ativo
     *
     * @return Switches
     */
    public function setAtivo($ativo)
    {
        $this->ativo = $ativo;

        return $this;
    }

    /**
     * Get ativo.
     *
     * @return bool
     */
    public function getAtivo()
    {
        return $this->ativo;
    }

    /**
     * Set dataCadastro.
     *
     * @param \DateTime $dataCadastro
     *
     * @return Switches
     */
    public function setDataCadastro($dataCadastro)
    {
        $this->dataCadastro = $dataCadastro;

        return $this;
    }

    /**
     * Get dataCadastro.
     *
     * @return \DateTime
     */
    public function getDataCadastro()
    {
        return $this->dataCadastro;
    }

    /**
     * Set modeloSwitch.
     *
     * @param \App\Entity\Redes\ModeloSwitch|null $modeloSwitch
     *
     * @return Switches
     */
    public function setModeloSwitch(\App\Entity\Redes\ModeloSwitch $modeloSwitch = null)
    {
        $this->modeloSwitch = $modeloSwitch;

        return $this;
    }

    /**
     * Get modeloSwitch.
     *
     * @return \App\Entity\Redes\ModeloSwitch|null
     */
    public function getModeloSwitch()
    {
        return $this->modeloSwitch;
    }
    
    /**
     * Add porta
     *
     * @param \App\Entity\Redes\Porta $porta
     *
     * @return Switches
     */
    public function addPorta(\App\Entity\Redes\Porta $porta)
    {
        $this->porta[] = $porta;
        
        return $this;
    }
    
    /**
     * Remove porta
     *
     * @param \App\Entity\Redes\Porta $porta
     */
    public function removePorta(\App\Entity\Redes\Porta $porta)
    {
        $this->porta->removeElement($porta);
    }
    
    /**
     * Get porta
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getPorta()
    {
        return $this->porta;
    }
}
