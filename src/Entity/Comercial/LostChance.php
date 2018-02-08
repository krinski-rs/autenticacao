<?php

namespace App\Entity\Comercial;

/**
 * LostChance
 */
class LostChance
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
    private $lostActionId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var int|null
     */
    private $wallet;

    /**
     * @var string|null
     */
    private $description;


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
     * @return LostChance
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
     * Set lostActionId.
     *
     * @param int|null $lostActionId
     *
     * @return LostChance
     */
    public function setLostActionId($lostActionId = null)
    {
        $this->lostActionId = $lostActionId;

        return $this;
    }

    /**
     * Get lostActionId.
     *
     * @return int|null
     */
    public function getLostActionId()
    {
        return $this->lostActionId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return LostChance
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
     * Set wallet.
     *
     * @param int|null $wallet
     *
     * @return LostChance
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
     * Set description.
     *
     * @param string|null $description
     *
     * @return LostChance
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
}
