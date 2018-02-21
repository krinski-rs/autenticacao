<?php

namespace App\Entity\Prevendas;

/**
 * Speed
 */
class Speed
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $speed;

    /**
     * @var string|null
     */
    private $activationFare;

    /**
     * @var string|null
     */
    private $monthlyCost;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var int|null
     */
    private $speedTypeId;


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
     * Set speed.
     *
     * @param int|null $speed
     *
     * @return Speed
     */
    public function setSpeed($speed = null)
    {
        $this->speed = $speed;

        return $this;
    }

    /**
     * Get speed.
     *
     * @return int|null
     */
    public function getSpeed()
    {
        return $this->speed;
    }

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return Speed
     */
    public function setActivationFare($activationFare = null)
    {
        $this->activationFare = $activationFare;

        return $this;
    }

    /**
     * Get activationFare.
     *
     * @return string|null
     */
    public function getActivationFare()
    {
        return $this->activationFare;
    }

    /**
     * Set monthlyCost.
     *
     * @param string|null $monthlyCost
     *
     * @return Speed
     */
    public function setMonthlyCost($monthlyCost = null)
    {
        $this->monthlyCost = $monthlyCost;

        return $this;
    }

    /**
     * Get monthlyCost.
     *
     * @return string|null
     */
    public function getMonthlyCost()
    {
        return $this->monthlyCost;
    }

    /**
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return Speed
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
     * Set speedTypeId.
     *
     * @param int|null $speedTypeId
     *
     * @return Speed
     */
    public function setSpeedTypeId($speedTypeId = null)
    {
        $this->speedTypeId = $speedTypeId;

        return $this;
    }

    /**
     * Get speedTypeId.
     *
     * @return int|null
     */
    public function getSpeedTypeId()
    {
        return $this->speedTypeId;
    }
}
