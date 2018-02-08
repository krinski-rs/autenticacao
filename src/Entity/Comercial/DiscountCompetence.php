<?php

namespace App\Entity\Comercial;

/**
 * DiscountCompetence
 */
class DiscountCompetence
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $idUser;

    /**
     * @var \DateTime
     */
    private $dateRecord;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var float
     */
    private $percentage;

    /**
     * @var int
     */
    private $registrant;


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
     * Set idUser.
     *
     * @param int $idUser
     *
     * @return DiscountCompetence
     */
    public function setIdUser($idUser)
    {
        $this->idUser = $idUser;

        return $this;
    }

    /**
     * Get idUser.
     *
     * @return int
     */
    public function getIdUser()
    {
        return $this->idUser;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return DiscountCompetence
     */
    public function setDateRecord($dateRecord)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return DiscountCompetence
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
     * Set percentage.
     *
     * @param float $percentage
     *
     * @return DiscountCompetence
     */
    public function setPercentage($percentage)
    {
        $this->percentage = $percentage;

        return $this;
    }

    /**
     * Get percentage.
     *
     * @return float
     */
    public function getPercentage()
    {
        return $this->percentage;
    }

    /**
     * Set registrant.
     *
     * @param int $registrant
     *
     * @return DiscountCompetence
     */
    public function setRegistrant($registrant)
    {
        $this->registrant = $registrant;

        return $this;
    }

    /**
     * Get registrant.
     *
     * @return int
     */
    public function getRegistrant()
    {
        return $this->registrant;
    }
}
