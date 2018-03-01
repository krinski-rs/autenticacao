<?php

namespace App\Entity\Prevendas;

/**
 * Number
 */
class Number
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $numberTypeId;

    /**
     * @var int|null
     */
    private $lpuPlanId;

    /**
     * @var string|null
     */
    private $activationFare;

    /**
     * @var string|null
     */
    private $monthlyCost;


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
     * Set numberTypeId.
     *
     * @param int $numberTypeId
     *
     * @return Number
     */
    public function setNumberTypeId($numberTypeId)
    {
        $this->numberTypeId = $numberTypeId;

        return $this;
    }

    /**
     * Get numberTypeId.
     *
     * @return int
     */
    public function getNumberTypeId()
    {
        return $this->numberTypeId;
    }

    /**
     * Set lpuPlanId.
     *
     * @param int|null $lpuPlanId
     *
     * @return Number
     */
    public function setLpuPlanId($lpuPlanId = null)
    {
        $this->lpuPlanId = $lpuPlanId;

        return $this;
    }

    /**
     * Get lpuPlanId.
     *
     * @return int|null
     */
    public function getLpuPlanId()
    {
        return $this->lpuPlanId;
    }

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return Number
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
     * @return Number
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
}
