<?php

namespace App\Entity\Prevendas;

/**
 * Lpu
 */
class Lpu
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
     * @var int|null
     */
    private $serviceId;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var \DateTime|null
     */
    private $dateValid;

    /**
     * @var int|null
     */
    private $distance;

    /**
     * @var bool
     */
    private $active = true;

    /**
     * @var int|null
     */
    private $minContractDeadline = '12';

    /**
     * @var int|null
     */
    private $minContractUnit = '1';

    /**
     * @var string|null
     */
    private $sla;

    /**
     * @var int|null
     */
    private $modeCodigoid;

    /**
     * @var string|null
     */
    private $minimumPrice;

    /**
     * @var bool|null
     */
    private $onlineSales;

    /**
     * @var string
     */
    private $type = 'P';


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
     * @return Lpu
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
     * Set serviceId.
     *
     * @param int|null $serviceId
     *
     * @return Lpu
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
     * Set author.
     *
     * @param int|null $author
     *
     * @return Lpu
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
     * @return Lpu
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
     * Set dateValid.
     *
     * @param \DateTime|null $dateValid
     *
     * @return Lpu
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
     * Set distance.
     *
     * @param int|null $distance
     *
     * @return Lpu
     */
    public function setDistance($distance = null)
    {
        $this->distance = $distance;

        return $this;
    }

    /**
     * Get distance.
     *
     * @return int|null
     */
    public function getDistance()
    {
        return $this->distance;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return Lpu
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
     * Set minContractDeadline.
     *
     * @param int|null $minContractDeadline
     *
     * @return Lpu
     */
    public function setMinContractDeadline($minContractDeadline = null)
    {
        $this->minContractDeadline = $minContractDeadline;

        return $this;
    }

    /**
     * Get minContractDeadline.
     *
     * @return int|null
     */
    public function getMinContractDeadline()
    {
        return $this->minContractDeadline;
    }

    /**
     * Set minContractUnit.
     *
     * @param int|null $minContractUnit
     *
     * @return Lpu
     */
    public function setMinContractUnit($minContractUnit = null)
    {
        $this->minContractUnit = $minContractUnit;

        return $this;
    }

    /**
     * Get minContractUnit.
     *
     * @return int|null
     */
    public function getMinContractUnit()
    {
        return $this->minContractUnit;
    }

    /**
     * Set sla.
     *
     * @param string|null $sla
     *
     * @return Lpu
     */
    public function setSla($sla = null)
    {
        $this->sla = $sla;

        return $this;
    }

    /**
     * Get sla.
     *
     * @return string|null
     */
    public function getSla()
    {
        return $this->sla;
    }

    /**
     * Set modeCodigoid.
     *
     * @param int|null $modeCodigoid
     *
     * @return Lpu
     */
    public function setModeCodigoid($modeCodigoid = null)
    {
        $this->modeCodigoid = $modeCodigoid;

        return $this;
    }

    /**
     * Get modeCodigoid.
     *
     * @return int|null
     */
    public function getModeCodigoid()
    {
        return $this->modeCodigoid;
    }

    /**
     * Set minimumPrice.
     *
     * @param string|null $minimumPrice
     *
     * @return Lpu
     */
    public function setMinimumPrice($minimumPrice = null)
    {
        $this->minimumPrice = $minimumPrice;

        return $this;
    }

    /**
     * Get minimumPrice.
     *
     * @return string|null
     */
    public function getMinimumPrice()
    {
        return $this->minimumPrice;
    }

    /**
     * Set onlineSales.
     *
     * @param bool|null $onlineSales
     *
     * @return Lpu
     */
    public function setOnlineSales($onlineSales = null)
    {
        $this->onlineSales = $onlineSales;

        return $this;
    }

    /**
     * Get onlineSales.
     *
     * @return bool|null
     */
    public function getOnlineSales()
    {
        return $this->onlineSales;
    }

    /**
     * Set type.
     *
     * @param string $type
     *
     * @return Lpu
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }
}
