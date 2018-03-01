<?php

namespace App\Entity\Prevendas;

/**
 * QuotationAddressPoint
 */
class QuotationAddressPoint
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $quotationAddressId;

    /**
     * @var int|null
     */
    private $pointId;

    /**
     * @var string|null
     */
    private $distance;

    /**
     * @var bool
     */
    private $approximate = false;

    /**
     * @var string|null
     */
    private $lpus;

    /**
     * @var string|null
     */
    private $name;


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
     * Set quotationAddressId.
     *
     * @param int|null $quotationAddressId
     *
     * @return QuotationAddressPoint
     */
    public function setQuotationAddressId($quotationAddressId = null)
    {
        $this->quotationAddressId = $quotationAddressId;

        return $this;
    }

    /**
     * Get quotationAddressId.
     *
     * @return int|null
     */
    public function getQuotationAddressId()
    {
        return $this->quotationAddressId;
    }

    /**
     * Set pointId.
     *
     * @param int|null $pointId
     *
     * @return QuotationAddressPoint
     */
    public function setPointId($pointId = null)
    {
        $this->pointId = $pointId;

        return $this;
    }

    /**
     * Get pointId.
     *
     * @return int|null
     */
    public function getPointId()
    {
        return $this->pointId;
    }

    /**
     * Set distance.
     *
     * @param string|null $distance
     *
     * @return QuotationAddressPoint
     */
    public function setDistance($distance = null)
    {
        $this->distance = $distance;

        return $this;
    }

    /**
     * Get distance.
     *
     * @return string|null
     */
    public function getDistance()
    {
        return $this->distance;
    }

    /**
     * Set approximate.
     *
     * @param bool $approximate
     *
     * @return QuotationAddressPoint
     */
    public function setApproximate($approximate)
    {
        $this->approximate = $approximate;

        return $this;
    }

    /**
     * Get approximate.
     *
     * @return bool
     */
    public function getApproximate()
    {
        return $this->approximate;
    }

    /**
     * Set lpus.
     *
     * @param string|null $lpus
     *
     * @return QuotationAddressPoint
     */
    public function setLpus($lpus = null)
    {
        $this->lpus = $lpus;

        return $this;
    }

    /**
     * Get lpus.
     *
     * @return string|null
     */
    public function getLpus()
    {
        return $this->lpus;
    }

    /**
     * Set name.
     *
     * @param string|null $name
     *
     * @return QuotationAddressPoint
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
}
