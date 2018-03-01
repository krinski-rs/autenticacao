<?php

namespace App\Entity\Prevendas;

/**
 * LpuFeature
 */
class LpuFeature
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $activationFare;

    /**
     * @var string|null
     */
    private $monthlyCost;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var \DateTime|null
     */
    private $dateValid;

    /**
     * @var int|null
     */
    private $featureAttributeId;

    /**
     * @var int|null
     */
    private $quantity;


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
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return LpuFeature
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
     * @return LpuFeature
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return LpuFeature
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
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return LpuFeature
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
     * Set dateValid.
     *
     * @param \DateTime|null $dateValid
     *
     * @return LpuFeature
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
     * Set featureAttributeId.
     *
     * @param int|null $featureAttributeId
     *
     * @return LpuFeature
     */
    public function setFeatureAttributeId($featureAttributeId = null)
    {
        $this->featureAttributeId = $featureAttributeId;

        return $this;
    }

    /**
     * Get featureAttributeId.
     *
     * @return int|null
     */
    public function getFeatureAttributeId()
    {
        return $this->featureAttributeId;
    }

    /**
     * Set quantity.
     *
     * @param int|null $quantity
     *
     * @return LpuFeature
     */
    public function setQuantity($quantity = null)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return int|null
     */
    public function getQuantity()
    {
        return $this->quantity;
    }
}
