<?php

namespace App\Entity\Comercial;

/**
 * Chance
 */
class Chance
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $idProspect;

    /**
     * @var int
     */
    private $idProduct;

    /**
     * @var int|null
     */
    private $temperature;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var \DateTime|null
     */
    private $dateUpdate;

    /**
     * @var int|null
     */
    private $idFollowup;

    /**
     * @var int|null
     */
    private $idLastProposal;

    /**
     * @var int
     */
    private $serviceType;

    /**
     * @var int|null
     */
    private $idContract;

    /**
     * @var string|null
     */
    private $closingValue;

    /**
     * @var \DateTime|null
     */
    private $closingDate;

    /**
     * @var \App\Entity\Comercial\Prospect
     */
    private $prospect;

    /**
     * @var \App\Entity\Comercial\Service
     */
    private $service;

    /**
     * @var \App\Entity\Comercial\ChanceType
     */
    private $chanceType;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $chanceContact;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $chanceIndication;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $lostChance;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $chanceInactive;
    
    public function __construct()
    {
        $this->chanceContact = new \Doctrine\Common\Collections\ArrayCollection();
        $this->chanceIndication = new \Doctrine\Common\Collections\ArrayCollection();
        $this->lostChance = new \Doctrine\Common\Collections\ArrayCollection();
        $this->chanceInactive = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set idProspect.
     *
     * @param int|null $idProspect
     *
     * @return Chance
     */
    public function setIdProspect($idProspect = null)
    {
        $this->idProspect = $idProspect;

        return $this;
    }

    /**
     * Get idProspect.
     *
     * @return int|null
     */
    public function getIdProspect()
    {
        return $this->idProspect;
    }

    /**
     * Set idProduct.
     *
     * @param int $idProduct
     *
     * @return Chance
     */
    public function setIdProduct($idProduct)
    {
        $this->idProduct = $idProduct;

        return $this;
    }

    /**
     * Get idProduct.
     *
     * @return int
     */
    public function getIdProduct()
    {
        return $this->idProduct;
    }

    /**
     * Set temperature.
     *
     * @param int|null $temperature
     *
     * @return Chance
     */
    public function setTemperature($temperature = null)
    {
        $this->temperature = $temperature;

        return $this;
    }

    /**
     * Get temperature.
     *
     * @return int|null
     */
    public function getTemperature()
    {
        return $this->temperature;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Chance
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
     * Set description.
     *
     * @param string|null $description
     *
     * @return Chance
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Chance
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
     * @return Chance
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
     * Set idFollowup.
     *
     * @param int|null $idFollowup
     *
     * @return Chance
     */
    public function setIdFollowup($idFollowup = null)
    {
        $this->idFollowup = $idFollowup;

        return $this;
    }

    /**
     * Get idFollowup.
     *
     * @return int|null
     */
    public function getIdFollowup()
    {
        return $this->idFollowup;
    }

    /**
     * Set idLastProposal.
     *
     * @param int|null $idLastProposal
     *
     * @return Chance
     */
    public function setIdLastProposal($idLastProposal = null)
    {
        $this->idLastProposal = $idLastProposal;

        return $this;
    }

    /**
     * Get idLastProposal.
     *
     * @return int|null
     */
    public function getIdLastProposal()
    {
        return $this->idLastProposal;
    }

    /**
     * Set serviceType.
     *
     * @param int $serviceType
     *
     * @return Chance
     */
    public function setServiceType($serviceType)
    {
        $this->serviceType = $serviceType;

        return $this;
    }

    /**
     * Get serviceType.
     *
     * @return int
     */
    public function getServiceType()
    {
        return $this->serviceType;
    }

    /**
     * Set idContract.
     *
     * @param int|null $idContract
     *
     * @return Chance
     */
    public function setIdContract($idContract = null)
    {
        $this->idContract = $idContract;

        return $this;
    }

    /**
     * Get idContract.
     *
     * @return int|null
     */
    public function getIdContract()
    {
        return $this->idContract;
    }

    /**
     * Set closingValue.
     *
     * @param string|null $closingValue
     *
     * @return Chance
     */
    public function setClosingValue($closingValue = null)
    {
        $this->closingValue = $closingValue;

        return $this;
    }

    /**
     * Get closingValue.
     *
     * @return string|null
     */
    public function getClosingValue()
    {
        return $this->closingValue;
    }

    /**
     * Set closingDate.
     *
     * @param \DateTime|null $closingDate
     *
     * @return Chance
     */
    public function setClosingDate($closingDate = null)
    {
        $this->closingDate = $closingDate;

        return $this;
    }

    /**
     * Get closingDate.
     *
     * @return \DateTime|null
     */
    public function getClosingDate()
    {
        return $this->closingDate;
    }

    /**
     * Set prospect.
     *
     * @param \App\Entity\Comercial\Prospect $prospect
     *
     * @return Chance
     */
    public function setProspect(\App\Entity\Comercial\Prospect $prospect)
    {
        $this->prospect = $prospect;

        return $this;
    }

    /**
     * Get $prospect.
     *
     * @return \App\Entity\Comercial\Prospect
     */
    public function getProspect()
    {
        return $this->prospect;
    }

    /**
     * Set service.
     *
     * @param \App\Entity\Comercial\Service $service
     *
     * @return Chance
     */
    public function setService(\App\Entity\Comercial\Service $service)
    {
        $this->service = $service;

        return $this;
    }

    /**
     * Get service.
     *
     * @return \App\Entity\Comercial\Service
     */
    public function getService()
    {
        return $this->service;
    }

    /**
     * Set chanceType.
     *
     * @param \App\Entity\Comercial\ChanceType $chanceType
     *
     * @return Chance
     */
    public function setChanceType(\App\Entity\Comercial\ChanceType $chanceType)
    {
        $this->chanceType = $chanceType;

        return $this;
    }

    /**
     * Get chanceType.
     *
     * @return \App\Entity\Comercial\ChanceType
     */
    public function getChanceType()
    {
        return $this->chanceType;
    }
    
    /**
     * Add chanceContact
     *
     * @param \App\Entity\Comercial\ChanceContact $chanceContact
     *
     * @return Chance
     */
    public function addChanceContact(\App\Entity\Comercial\ChanceContact $chanceContact)
    {
        $this->chanceContact[] = $chanceContact;
        
        return $this;
    }
    
    /**
     * Remove chanceContact
     *
     * @param \App\Entity\Comercial\ChanceContact $chanceContact
     */
    public function removeChanceContact(\App\Entity\Comercial\ChanceContact $chanceContact)
    {
        $this->chanceContact->removeElement($chanceContact);
    }
    
    /**
     * Get chanceContact
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getChanceContact()
    {
        return $this->chanceContact;
    }

    /**
     * Add chanceIndication
     *
     * @param \App\Entity\Comercial\ChanceIndication $chanceIndication
     *
     * @return Chance
     */
    public function addChanceIndication(\App\Entity\Comercial\ChanceIndication $chanceIndication)
    {
        $this->chanceIndication[] = $chanceIndication;
        
        return $this;
    }
    
    /**
     * Remove chanceIndication
     *
     * @param \App\Entity\Comercial\ChanceIndication $chanceIndication
     */
    public function removeChanceIndication(\App\Entity\Comercial\ChanceIndication $chanceIndication)
    {
        $this->chanceIndication->removeElement($chanceIndication);
    }
    
    /**
     * Get chanceIndication
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getChanceIndication()
    {
        return $this->chanceIndication;
    }

    /**
     * Add lostChance
     *
     * @param \App\Entity\Comercial\LostChance $lostChance
     *
     * @return Chance
     */
    public function addLostChance(\App\Entity\Comercial\LostChance $lostChance)
    {
        $this->lostChance[] = $lostChance;
        
        return $this;
    }
    
    /**
     * Remove lostChance
     *
     * @param \App\Entity\Comercial\LostChance $lostChance
     */
    public function removeLostChance(\App\Entity\Comercial\LostChance $lostChance)
    {
        $this->lostChance->removeElement($lostChance);
    }
    
    /**
     * Get lostChance
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getLostChance()
    {
        return $this->lostChance;
    }

    /**
     * Add chanceInactive
     *
     * @param \App\Entity\Comercial\ChanceInactive $chanceInactive
     *
     * @return Chance
     */
    public function addChanceInactive(\App\Entity\Comercial\ChanceInactive $chanceInactive)
    {
        $this->chanceInactive[] = $chanceInactive;
        
        return $this;
    }
    
    /**
     * Remove chanceInactive
     *
     * @param \App\Entity\Comercial\ChanceInactive $chanceInactive
     */
    public function removeChanceInactive(\App\Entity\Comercial\ChanceInactive $chanceInactive)
    {
        $this->chanceInactive->removeElement($chanceInactive);
    }
    
    /**
     * Get chanceInactive
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getChanceInactive()
    {
        return $this->chanceInactive;
    }
}
