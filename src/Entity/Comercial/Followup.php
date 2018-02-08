<?php

namespace App\Entity\Comercial;

/**
 * Followup
 */
class Followup
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var int|null
     */
    private $actionId;

    /**
     * @var int|null
     */
    private $nextActionId;

    /**
     * @var int|null
     */
    private $statusId;

    /**
     * @var int|null
     */
    private $temperature;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var \DateTime|null
     */
    private $nextActionDate;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var string|null
     */
    private $file;

    /**
     * @var int|null
     */
    private $person;

    /**
     * @var int|null
     */
    private $wallet;

    /**
     * @var int|null
     */
    private $idContract;


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
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return Followup
     */
    public function setChanceId($chanceId = null)
    {
        $this->chanceId = $chanceId;

        return $this;
    }

    /**
     * Get chanceId.
     *
     * @return int|null
     */
    public function getChanceId()
    {
        return $this->chanceId;
    }

    /**
     * Set actionId.
     *
     * @param int|null $actionId
     *
     * @return Followup
     */
    public function setActionId($actionId = null)
    {
        $this->actionId = $actionId;

        return $this;
    }

    /**
     * Get actionId.
     *
     * @return int|null
     */
    public function getActionId()
    {
        return $this->actionId;
    }

    /**
     * Set nextActionId.
     *
     * @param int|null $nextActionId
     *
     * @return Followup
     */
    public function setNextActionId($nextActionId = null)
    {
        $this->nextActionId = $nextActionId;

        return $this;
    }

    /**
     * Get nextActionId.
     *
     * @return int|null
     */
    public function getNextActionId()
    {
        return $this->nextActionId;
    }

    /**
     * Set statusId.
     *
     * @param int|null $statusId
     *
     * @return Followup
     */
    public function setStatusId($statusId = null)
    {
        $this->statusId = $statusId;

        return $this;
    }

    /**
     * Get statusId.
     *
     * @return int|null
     */
    public function getStatusId()
    {
        return $this->statusId;
    }

    /**
     * Set temperature.
     *
     * @param int|null $temperature
     *
     * @return Followup
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
     * Set description.
     *
     * @param string|null $description
     *
     * @return Followup
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
     * Set nextActionDate.
     *
     * @param \DateTime|null $nextActionDate
     *
     * @return Followup
     */
    public function setNextActionDate($nextActionDate = null)
    {
        $this->nextActionDate = $nextActionDate;

        return $this;
    }

    /**
     * Get nextActionDate.
     *
     * @return \DateTime|null
     */
    public function getNextActionDate()
    {
        return $this->nextActionDate;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Followup
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
     * Set file.
     *
     * @param string|null $file
     *
     * @return Followup
     */
    public function setFile($file = null)
    {
        $this->file = $file;

        return $this;
    }

    /**
     * Get file.
     *
     * @return string|null
     */
    public function getFile()
    {
        return $this->file;
    }

    /**
     * Set person.
     *
     * @param int|null $person
     *
     * @return Followup
     */
    public function setPerson($person = null)
    {
        $this->person = $person;

        return $this;
    }

    /**
     * Get person.
     *
     * @return int|null
     */
    public function getPerson()
    {
        return $this->person;
    }

    /**
     * Set wallet.
     *
     * @param int|null $wallet
     *
     * @return Followup
     */
    public function setWallet($wallet = null)
    {
        $this->wallet = $wallet;

        return $this;
    }

    /**
     * Get wallet.
     *
     * @return int|null
     */
    public function getWallet()
    {
        return $this->wallet;
    }

    /**
     * Set idContract.
     *
     * @param int|null $idContract
     *
     * @return Followup
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
}
