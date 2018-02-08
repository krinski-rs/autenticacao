<?php

namespace App\Entity\Comercial;

/**
 * Prospect
 */
class Prospect
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $idWallet;

    /**
     * @var int|null
     */
    private $idTag;

    /**
     * @var int|null
     */
    private $idCliente;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var \DateTime|null
     */
    private $dateUpdate;

    /**
     * @var bool|null
     */
    private $active = true;

    /**
     * @var string|null
     */
    private $clientName;

    /**
     * @var int|null
     */
    private $cid;
    
    /**
     * @var string|null
     */
    private $fakeName;
    
    /**
     * @var \App\Entity\Comercial\Wallet
     */
    private $wallet;
    
    /**
     * @var \App\Entity\Comercial\Tag
     */
    private $tag;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $chance;
    
    public function __construct()
    {
        $this->chance = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set idWallet.
     *
     * @param int|null $idWallet
     *
     * @return Prospect
     */
    public function setIdWallet($idWallet = null)
    {
        $this->idWallet = $idWallet;

        return $this;
    }

    /**
     * Get idWallet.
     *
     * @return int|null
     */
    public function getIdWallet()
    {
        return $this->idWallet;
    }

    /**
     * Set idTag.
     *
     * @param int|null $idTag
     *
     * @return Prospect
     */
    public function setIdTag($idTag = null)
    {
        $this->idTag = $idTag;

        return $this;
    }

    /**
     * Get idTag.
     *
     * @return int|null
     */
    public function getIdTag()
    {
        return $this->idTag;
    }

    /**
     * Set idCliente.
     *
     * @param int|null $idCliente
     *
     * @return Prospect
     */
    public function setIdCliente($idCliente = null)
    {
        $this->idCliente = $idCliente;

        return $this;
    }

    /**
     * Get idCliente.
     *
     * @return int|null
     */
    public function getIdCliente()
    {
        return $this->idCliente;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Prospect
     */
    public function setDateRecord($dateRecord = null)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime|null
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set dateUpdate.
     *
     * @param \DateTime|null $dateUpdate
     *
     * @return Prospect
     */
    public function setDateUpdate($dateUpdate = null)
    {
        $this->dateUpdate = $dateUpdate;

        return $this;
    }

    /**
     * Get dateUpdate.
     *
     * @return \DateTime|null
     */
    public function getDateUpdate()
    {
        return $this->dateUpdate;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Prospect
     */
    public function setActive($active = null)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool|null
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set clientName.
     *
     * @param string|null $clientName
     *
     * @return Prospect
     */
    public function setClientName($clientName = null)
    {
        $this->clientName = $clientName;

        return $this;
    }

    /**
     * Get clientName.
     *
     * @return string|null
     */
    public function getClientName()
    {
        return $this->clientName;
    }

    /**
     * Set cid.
     *
     * @param int|null $cid
     *
     * @return Prospect
     */
    public function setCid($cid = null)
    {
        $this->cid = $cid;

        return $this;
    }

    /**
     * Get cid.
     *
     * @return int|null
     */
    public function getCid()
    {
        return $this->cid;
    }

    /**
     * Set fakeName.
     *
     * @param string|null $fakeName
     *
     * @return Prospect
     */
    public function setFakeName($fakeName = null)
    {
        $this->fakeName = $fakeName;

        return $this;
    }

    /**
     * Get fakeName.
     *
     * @return string|null
     */
    public function getFakeName()
    {
        return $this->fakeName;
    }

    /**
     * Set wallet.
     *
     * @param \App\Entity\Comercial\Wallet $wallet
     *
     * @return Prospect
     */
    public function setWallet($wallet)
    {
        $this->wallet = $wallet;

        return $this;
    }

    /**
     * Get wallet.
     *
     * @return \App\Entity\Comercial\Wallet
     */
    public function getWallet()
    {
        return $this->wallet;
    }

    /**
     * Set tag.
     *
     * @param \App\Entity\Comercial\Tag $tag
     *
     * @return Prospect
     */
    public function setTag($tag)
    {
        $this->tag = $tag;

        return $this;
    }

    /**
     * Get wallet.
     *
     * @return \App\Entity\Comercial\Tag
     */
    public function getTag()
    {
        return $this->tag;
    }
    
    /**
     * Add chance
     *
     * @param \App\Entity\Comercial\Chance $chance
     *
     * @return Prospect
     */
    public function addChance(\App\Entity\Comercial\Chance $chance)
    {
        $this->chance[] = $chance;
        
        return $this;
    }
    
    /**
     * Remove chance
     *
     * @param \App\Entity\Comercial\Chance $chance
     */
    public function removeChance(\App\Entity\Comercial\Chance $chance)
    {
        $this->chance->removeElement($prospect);
    }
    
    /**
     * Get chance
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getChance()
    {
        return $this->chance;
    }
}
