<?php

namespace App\Entity\Comercial;

/**
 * Thirdservice
 */
class Thirdservice
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var \DateTime
     */
    private $dateRecord;

    /**
     * @var string
     */
    private $cost;

    /**
     * @var int
     */
    private $userRegistrant;

    /**
     * @var bool
     */
    private $active;

    /**
     * @var int
     */
    private $type;


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
     * Set name.
     *
     * @param string $name
     *
     * @return Thirdservice
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return Thirdservice
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
     * Set cost.
     *
     * @param string $cost
     *
     * @return Thirdservice
     */
    public function setCost($cost)
    {
        $this->cost = $cost;

        return $this;
    }

    /**
     * Get cost.
     *
     * @return string
     */
    public function getCost()
    {
        return $this->cost;
    }

    /**
     * Set userRegistrant.
     *
     * @param int $userRegistrant
     *
     * @return Thirdservice
     */
    public function setUserRegistrant($userRegistrant)
    {
        $this->userRegistrant = $userRegistrant;

        return $this;
    }

    /**
     * Get userRegistrant.
     *
     * @return int
     */
    public function getUserRegistrant()
    {
        return $this->userRegistrant;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return Thirdservice
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set type.
     *
     * @param int $type
     *
     * @return Thirdservice
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return int
     */
    public function getType()
    {
        return $this->type;
    }
}
