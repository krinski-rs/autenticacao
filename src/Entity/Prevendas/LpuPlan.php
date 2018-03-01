<?php

namespace App\Entity\Prevendas;

/**
 * LpuPlan
 */
class LpuPlan
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
    private $planId;

    /**
     * @var string|null
     */
    private $activationFare;

    /**
     * @var string|null
     */
    private $monthlyCost;

    /**
     * @var string|null
     */
    private $franchiseCost;

    /**
     * @var string|null
     */
    private $discountIpc;


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
     * @return LpuPlan
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
     * Set planId.
     *
     * @param int|null $planId
     *
     * @return LpuPlan
     */
    public function setPlanId($planId = null)
    {
        $this->planId = $planId;

        return $this;
    }

    /**
     * Get planId.
     *
     * @return int|null
     */
    public function getPlanId()
    {
        return $this->planId;
    }

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return LpuPlan
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
     * @return LpuPlan
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
     * Set franchiseCost.
     *
     * @param string|null $franchiseCost
     *
     * @return LpuPlan
     */
    public function setFranchiseCost($franchiseCost = null)
    {
        $this->franchiseCost = $franchiseCost;

        return $this;
    }

    /**
     * Get franchiseCost.
     *
     * @return string|null
     */
    public function getFranchiseCost()
    {
        return $this->franchiseCost;
    }

    /**
     * Set discountIpc.
     *
     * @param string|null $discountIpc
     *
     * @return LpuPlan
     */
    public function setDiscountIpc($discountIpc = null)
    {
        $this->discountIpc = $discountIpc;

        return $this;
    }

    /**
     * Get discountIpc.
     *
     * @return string|null
     */
    public function getDiscountIpc()
    {
        return $this->discountIpc;
    }
}
