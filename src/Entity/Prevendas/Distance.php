<?php

namespace App\Entity\Prevendas;

/**
 * Distance
 */
class Distance
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $serviceId;

    /**
     * @var \DateTime
     */
    private $dateRecord = 'now()';

    /**
     * @var string
     */
    private $minDistance;

    /**
     * @var string
     */
    private $maxDistance;

    /**
     * @var string
     */
    private $price;

    /**
     * @var bool
     */
    private $active = true;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var int|null
     */
    private $minSpeed;

    /**
     * @var int|null
     */
    private $maxSpeed;

    /**
     * @var int|null
     */
    private $authorEdit;

    /**
     * @var \DateTime|null
     */
    private $dateEdit;


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
     * Set serviceId.
     *
     * @param int|null $serviceId
     *
     * @return Distance
     */
    public function setServiceId($serviceId = null)
    {
        $this->serviceId = $serviceId;

        return $this;
    }

    /**
     * Get serviceId.
     *
     * @return int|null
     */
    public function getServiceId()
    {
        return $this->serviceId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return Distance
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
     * Set minDistance.
     *
     * @param string $minDistance
     *
     * @return Distance
     */
    public function setMinDistance($minDistance)
    {
        $this->minDistance = $minDistance;

        return $this;
    }

    /**
     * Get minDistance.
     *
     * @return string
     */
    public function getMinDistance()
    {
        return $this->minDistance;
    }

    /**
     * Set maxDistance.
     *
     * @param string $maxDistance
     *
     * @return Distance
     */
    public function setMaxDistance($maxDistance)
    {
        $this->maxDistance = $maxDistance;

        return $this;
    }

    /**
     * Get maxDistance.
     *
     * @return string
     */
    public function getMaxDistance()
    {
        return $this->maxDistance;
    }

    /**
     * Set price.
     *
     * @param string $price
     *
     * @return Distance
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return string
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return Distance
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
     * Set author.
     *
     * @param int|null $author
     *
     * @return Distance
     */
    public function setAuthor($author = null)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author.
     *
     * @return int|null
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set minSpeed.
     *
     * @param int|null $minSpeed
     *
     * @return Distance
     */
    public function setMinSpeed($minSpeed = null)
    {
        $this->minSpeed = $minSpeed;

        return $this;
    }

    /**
     * Get minSpeed.
     *
     * @return int|null
     */
    public function getMinSpeed()
    {
        return $this->minSpeed;
    }

    /**
     * Set maxSpeed.
     *
     * @param int|null $maxSpeed
     *
     * @return Distance
     */
    public function setMaxSpeed($maxSpeed = null)
    {
        $this->maxSpeed = $maxSpeed;

        return $this;
    }

    /**
     * Get maxSpeed.
     *
     * @return int|null
     */
    public function getMaxSpeed()
    {
        return $this->maxSpeed;
    }

    /**
     * Set authorEdit.
     *
     * @param int|null $authorEdit
     *
     * @return Distance
     */
    public function setAuthorEdit($authorEdit = null)
    {
        $this->authorEdit = $authorEdit;

        return $this;
    }

    /**
     * Get authorEdit.
     *
     * @return int|null
     */
    public function getAuthorEdit()
    {
        return $this->authorEdit;
    }

    /**
     * Set dateEdit.
     *
     * @param \DateTime|null $dateEdit
     *
     * @return Distance
     */
    public function setDateEdit($dateEdit = null)
    {
        $this->dateEdit = $dateEdit;

        return $this;
    }

    /**
     * Get dateEdit.
     *
     * @return \DateTime|null
     */
    public function getDateEdit()
    {
        return $this->dateEdit;
    }
}
