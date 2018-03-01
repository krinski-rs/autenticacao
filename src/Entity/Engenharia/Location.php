<?php

namespace App\Entity\Engenharia;

/**
 * Location
 */
class Location
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $latitude;

    /**
     * @var string|null
     */
    private $longitude;

    /**
     * @var int|null
     */
    private $radius;

    /**
     * @var \App\Entity\Engenharia\Location
     */
    private $location;

    /**
     * @var \App\Entity\Engenharia\Point
     */
    private $point;


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
     * Set latitude.
     *
     * @param string|null $latitude
     *
     * @return Location
     */
    public function setLatitude($latitude = null)
    {
        $this->latitude = $latitude;

        return $this;
    }

    /**
     * Get latitude.
     *
     * @return string|null
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * Set longitude.
     *
     * @param string|null $longitude
     *
     * @return Location
     */
    public function setLongitude($longitude = null)
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * Get longitude.
     *
     * @return string|null
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * Set radius.
     *
     * @param int|null $radius
     *
     * @return Location
     */
    public function setRadius($radius = null)
    {
        $this->radius = $radius;

        return $this;
    }

    /**
     * Get radius.
     *
     * @return int|null
     */
    public function getRadius()
    {
        return $this->radius;
    }

    /**
     * Set location.
     *
     * @param \App\Entity\Engenharia\Location|null $location
     *
     * @return Location
     */
    public function setLocation(\App\Entity\Engenharia\Location $location = null)
    {
        $this->location = $location;

        return $this;
    }

    /**
     * Get location.
     *
     * @return \App\Entity\Engenharia\Location|null
     */
    public function getLocation()
    {
        return $this->location;
    }

    /**
     * Set point.
     *
     * @param \App\Entity\Engenharia\Point|null $point
     *
     * @return Location
     */
    public function setPoint(\App\Entity\Engenharia\Point $point = null)
    {
        $this->point = $point;

        return $this;
    }

    /**
     * Get point.
     *
     * @return \App\Entity\Engenharia\Point|null
     */
    public function getPoint()
    {
        return $this->point;
    }
}
