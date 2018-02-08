<?php

namespace App\Entity\Comercial;

/**
 * Wallet
 */
class Wallet
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $idEv;

    /**
     * @var bool|null
     */
    private $active = true;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';
    
    /**
     * @var \DateTime|null
     */
    private $dateUpdate;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $prospect;
    
    public function __construct()
    {
        $this->prospect = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set idEv.
     *
     * @param int|null $idEv
     *
     * @return Wallet
     */
    public function setIdEv($idEv = null)
    {
        $this->idEv = $idEv;

        return $this;
    }

    /**
     * Get idEv.
     *
     * @return int|null
     */
    public function getIdEv()
    {
        return $this->idEv;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Wallet
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Wallet
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
     * @return Wallet
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
     * Add prospect
     *
     * @param \App\Entity\Comercial\Prospect $prospect
     *
     * @return Wallet
     */
    public function addProspect(\App\Entity\Comercial\Prospect $prospect)
    {
        $this->prospect[] = $prospect;
        
        return $this;
    }
    
    /**
     * Remove prospect
     *
     * @param \App\Entity\Comercial\Prospect $prospect
     */
    public function removeProspect(\App\Entity\Comercial\Prospect $prospect)
    {
        $this->prospect->removeElement($prospect);
    }
    
    /**
     * Get prospect
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getProspect()
    {
        return $this->prospect;
    }
}
