<?php

namespace App\Entity\Engenharia;

/**
 * Point
 */
class Point
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $name;

    /**
     * @var string|null
     */
    private $color;

    /**
     * @var \DateTime|null
     */
    private $dateValid;

    /**
     * @var int|null
     */
    private $maxSpeed;

    /**
     * @var string|null
     */
    private $interface;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var int|null
     */
    private $locationType;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var int|null
     */
    private $circCodigoid;

    /**
     * @var int|null
     */
    private $activationDeadline;

    /**
     * @var string|null
     */
    private $state;

    /**
     * @var \App\Entity\Engenharia\Type
     */
    private $type;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $location;
    
    public function __construct()
    {
        $this->location = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set name.
     *
     * @param string|null $name
     *
     * @return Point
     */
    public function setName($name = null)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string|null
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set color.
     *
     * @param string|null $color
     *
     * @return Point
     */
    public function setColor($color = null)
    {
        $this->color = $color;

        return $this;
    }

    /**
     * Get color.
     *
     * @return string|null
     */
    public function getColor()
    {
        return $this->color;
    }

    /**
     * Set dateValid.
     *
     * @param \DateTime|null $dateValid
     *
     * @return Point
     */
    public function setDateValid($dateValid = null)
    {
        $this->dateValid = $dateValid;

        return $this;
    }

    /**
     * Get dateValid.
     *
     * @return \DateTime|null
     */
    public function getDateValid()
    {
        return $this->dateValid;
    }

    /**
     * Set maxSpeed.
     *
     * @param int|null $maxSpeed
     *
     * @return Point
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
     * Set interface.
     *
     * @param string|null $interface
     *
     * @return Point
     */
    public function setInterface($interface = null)
    {
        $this->interface = $interface;

        return $this;
    }

    /**
     * Get interface.
     *
     * @return string|null
     */
    public function getInterface()
    {
        return $this->interface;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Point
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
     * Set locationType.
     *
     * @param int|null $locationType
     *
     * @return Point
     */
    public function setLocationType($locationType = null)
    {
        $this->locationType = $locationType;

        return $this;
    }

    /**
     * Get locationType.
     *
     * @return int|null
     */
    public function getLocationType()
    {
        return $this->locationType;
    }

    /**
     * Set author.
     *
     * @param int|null $author
     *
     * @return Point
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Point
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
     * Set circCodigoid.
     *
     * @param int|null $circCodigoid
     *
     * @return Point
     */
    public function setCircCodigoid($circCodigoid = null)
    {
        $this->circCodigoid = $circCodigoid;

        return $this;
    }

    /**
     * Get circCodigoid.
     *
     * @return int|null
     */
    public function getCircCodigoid()
    {
        return $this->circCodigoid;
    }

    /**
     * Set activationDeadline.
     *
     * @param int|null $activationDeadline
     *
     * @return Point
     */
    public function setActivationDeadline($activationDeadline = null)
    {
        $this->activationDeadline = $activationDeadline;

        return $this;
    }

    /**
     * Get activationDeadline.
     *
     * @return int|null
     */
    public function getActivationDeadline()
    {
        return $this->activationDeadline;
    }

    /**
     * Set state.
     *
     * @param string|null $state
     *
     * @return Point
     */
    public function setState($state = null)
    {
        $this->state = $state;

        return $this;
    }

    /**
     * Get state.
     *
     * @return string|null
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Set type.
     *
     * @param \App\Entity\Engenharia\Type|null $type
     *
     * @return Point
     */
    public function setType(\App\Entity\Engenharia\Type $type = null)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return \App\Entity\Engenharia\Type|null
     */
    public function getType()
    {
        return $this->type;
    }
    
    /**
     * Add location
     *
     * @param \App\Entity\Engenharia\Location $location
     *
     * @return Point
     */
    public function addLocation(\App\Entity\Engenharia\Location $location)
    {
        $this->location[] = $location;
        
        return $this;
    }
    
    /**
     * Remove location
     *
     * @param \App\Entity\Engenharia\Location $location
     */
    public function removeLocation(\App\Entity\Engenharia\Location $location)
    {
        $this->location->removeElement($location);
    }
    
    /**
     * Get location
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getLocation()
    {
        return $this->location;
    }
}
