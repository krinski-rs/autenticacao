<?php

namespace App\Entity\Comercial;

/**
 * GlobalAddress
 */
class GlobalAddress
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
     * @var string
     */
    private $cep;

    /**
     * @var int
     */
    private $city;

    /**
     * @var string
     */
    private $complement;

    /**
     * @var \DateTime
     */
    private $dateRecord;

    /**
     * @var string
     */
    private $district;

    /**
     * @var string
     */
    private $lat;

    /**
     * @var string
     */
    private $lon;

    /**
     * @var string
     */
    private $street;

    /**
     * @var string
     */
    private $uf;

    /**
     * @var bool
     */
    private $active;

    /**
     * @var int
     */
    private $number;


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
     * @return GlobalAddress
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
     * Set cep.
     *
     * @param string $cep
     *
     * @return GlobalAddress
     */
    public function setCep($cep)
    {
        $this->cep = $cep;

        return $this;
    }

    /**
     * Get cep.
     *
     * @return string
     */
    public function getCep()
    {
        return $this->cep;
    }

    /**
     * Set city.
     *
     * @param int $city
     *
     * @return GlobalAddress
     */
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city.
     *
     * @return int
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set complement.
     *
     * @param string $complement
     *
     * @return GlobalAddress
     */
    public function setComplement($complement)
    {
        $this->complement = $complement;

        return $this;
    }

    /**
     * Get complement.
     *
     * @return string
     */
    public function getComplement()
    {
        return $this->complement;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return GlobalAddress
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
     * Set district.
     *
     * @param string $district
     *
     * @return GlobalAddress
     */
    public function setDistrict($district)
    {
        $this->district = $district;

        return $this;
    }

    /**
     * Get district.
     *
     * @return string
     */
    public function getDistrict()
    {
        return $this->district;
    }

    /**
     * Set lat.
     *
     * @param string $lat
     *
     * @return GlobalAddress
     */
    public function setLat($lat)
    {
        $this->lat = $lat;

        return $this;
    }

    /**
     * Get lat.
     *
     * @return string
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set lon.
     *
     * @param string $lon
     *
     * @return GlobalAddress
     */
    public function setLon($lon)
    {
        $this->lon = $lon;

        return $this;
    }

    /**
     * Get lon.
     *
     * @return string
     */
    public function getLon()
    {
        return $this->lon;
    }

    /**
     * Set street.
     *
     * @param string $street
     *
     * @return GlobalAddress
     */
    public function setStreet($street)
    {
        $this->street = $street;

        return $this;
    }

    /**
     * Get street.
     *
     * @return string
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * Set uf.
     *
     * @param string $uf
     *
     * @return GlobalAddress
     */
    public function setUf($uf)
    {
        $this->uf = $uf;

        return $this;
    }

    /**
     * Get uf.
     *
     * @return string
     */
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return GlobalAddress
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
     * Set number.
     *
     * @param int $number
     *
     * @return GlobalAddress
     */
    public function setNumber($number)
    {
        $this->number = $number;

        return $this;
    }

    /**
     * Get number.
     *
     * @return int
     */
    public function getNumber()
    {
        return $this->number;
    }
}
