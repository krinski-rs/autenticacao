<?php

namespace App\Entity\Prevendas;

/**
 * Capex
 */
class Capex
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
    private $initialSpeed;

    /**
     * @var int|null
     */
    private $initialSpeedTypeId;

    /**
     * @var int|null
     */
    private $finalSpeed;

    /**
     * @var int|null
     */
    private $finalSpeedTypeId;

    /**
     * @var string|null
     */
    private $cost;


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
     * @return Capex
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
     * Set initialSpeed.
     *
     * @param int|null $initialSpeed
     *
     * @return Capex
     */
    public function setInitialSpeed($initialSpeed = null)
    {
        $this->initialSpeed = $initialSpeed;

        return $this;
    }

    /**
     * Get initialSpeed.
     *
     * @return int|null
     */
    public function getInitialSpeed()
    {
        return $this->initialSpeed;
    }

    /**
     * Set initialSpeedTypeId.
     *
     * @param int|null $initialSpeedTypeId
     *
     * @return Capex
     */
    public function setInitialSpeedTypeId($initialSpeedTypeId = null)
    {
        $this->initialSpeedTypeId = $initialSpeedTypeId;

        return $this;
    }

    /**
     * Get initialSpeedTypeId.
     *
     * @return int|null
     */
    public function getInitialSpeedTypeId()
    {
        return $this->initialSpeedTypeId;
    }

    /**
     * Set finalSpeed.
     *
     * @param int|null $finalSpeed
     *
     * @return Capex
     */
    public function setFinalSpeed($finalSpeed = null)
    {
        $this->finalSpeed = $finalSpeed;

        return $this;
    }

    /**
     * Get finalSpeed.
     *
     * @return int|null
     */
    public function getFinalSpeed()
    {
        return $this->finalSpeed;
    }

    /**
     * Set finalSpeedTypeId.
     *
     * @param int|null $finalSpeedTypeId
     *
     * @return Capex
     */
    public function setFinalSpeedTypeId($finalSpeedTypeId = null)
    {
        $this->finalSpeedTypeId = $finalSpeedTypeId;

        return $this;
    }

    /**
     * Get finalSpeedTypeId.
     *
     * @return int|null
     */
    public function getFinalSpeedTypeId()
    {
        return $this->finalSpeedTypeId;
    }

    /**
     * Set cost.
     *
     * @param string|null $cost
     *
     * @return Capex
     */
    public function setCost($cost = null)
    {
        $this->cost = $cost;

        return $this;
    }

    /**
     * Get cost.
     *
     * @return string|null
     */
    public function getCost()
    {
        return $this->cost;
    }
}
