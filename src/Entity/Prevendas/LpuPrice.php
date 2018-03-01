<?php

namespace App\Entity\Prevendas;

/**
 * LpuPrice
 */
class LpuPrice
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var int|null
     */
    private $regionId;

    /**
     * @var int|null
     */
    private $price;


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
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return LpuPrice
     */
    public function setLpuId($lpuId = null)
    {
        $this->lpuId = $lpuId;

        return $this;
    }

    /**
     * Get lpuId.
     *
     * @return int|null
     */
    public function getLpuId()
    {
        return $this->lpuId;
    }

    /**
     * Set regionId.
     *
     * @param int|null $regionId
     *
     * @return LpuPrice
     */
    public function setRegionId($regionId = null)
    {
        $this->regionId = $regionId;

        return $this;
    }

    /**
     * Get regionId.
     *
     * @return int|null
     */
    public function getRegionId()
    {
        return $this->regionId;
    }

    /**
     * Set price.
     *
     * @param int|null $price
     *
     * @return LpuPrice
     */
    public function setPrice($price = null)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return int|null
     */
    public function getPrice()
    {
        return $this->price;
    }
}
