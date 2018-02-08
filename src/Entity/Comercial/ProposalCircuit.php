<?php

namespace App\Entity\Comercial;

/**
 * ProposalCircuit
 */
class ProposalCircuit
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $proposalId;

    /**
     * @var int|null
     */
    private $viableId;

    /**
     * @var string|null
     */
    private $discount;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var int|null
     */
    private $speed;

    /**
     * @var int|null
     */
    private $speedUnit;

    /**
     * @var string|null
     */
    private $activationFare;

    /**
     * @var string|null
     */
    private $activationFareNoDiscount;

    /**
     * @var string|null
     */
    private $monthlyCost;

    /**
     * @var string|null
     */
    private $monthlyCostNoDiscount;

    /**
     * @var string|null
     */
    private $attribs;

    /**
     * @var float
     */
    private $percentualLpuDiscount = '0';

    /**
     * @var string
     */
    private $svaActivationFareDiscount = '0';

    /**
     * @var string
     */
    private $svaMonthlyCostDiscount = '0';

    /**
     * @var float
     */
    private $svaMaxPercentualDiscount = '0';

    /**
     * @var string|null
     */
    private $finalClient;


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
     * Set proposalId.
     *
     * @param int|null $proposalId
     *
     * @return ProposalCircuit
     */
    public function setProposalId($proposalId = null)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int|null
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set viableId.
     *
     * @param int|null $viableId
     *
     * @return ProposalCircuit
     */
    public function setViableId($viableId = null)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int|null
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set discount.
     *
     * @param string|null $discount
     *
     * @return ProposalCircuit
     */
    public function setDiscount($discount = null)
    {
        $this->discount = $discount;

        return $this;
    }

    /**
     * Get discount.
     *
     * @return string|null
     */
    public function getDiscount()
    {
        return $this->discount;
    }

    /**
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return ProposalCircuit
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
     * Set speed.
     *
     * @param int|null $speed
     *
     * @return ProposalCircuit
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
     * Set speedUnit.
     *
     * @param int|null $speedUnit
     *
     * @return ProposalCircuit
     */
    public function setSpeedUnit($speedUnit = null)
    {
        $this->speedUnit = $speedUnit;

        return $this;
    }

    /**
     * Get speedUnit.
     *
     * @return int|null
     */
    public function getSpeedUnit()
    {
        return $this->speedUnit;
    }

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return ProposalCircuit
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
     * Set activationFareNoDiscount.
     *
     * @param string|null $activationFareNoDiscount
     *
     * @return ProposalCircuit
     */
    public function setActivationFareNoDiscount($activationFareNoDiscount = null)
    {
        $this->activationFareNoDiscount = $activationFareNoDiscount;

        return $this;
    }

    /**
     * Get activationFareNoDiscount.
     *
     * @return string|null
     */
    public function getActivationFareNoDiscount()
    {
        return $this->activationFareNoDiscount;
    }

    /**
     * Set monthlyCost.
     *
     * @param string|null $monthlyCost
     *
     * @return ProposalCircuit
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
     * Set monthlyCostNoDiscount.
     *
     * @param string|null $monthlyCostNoDiscount
     *
     * @return ProposalCircuit
     */
    public function setMonthlyCostNoDiscount($monthlyCostNoDiscount = null)
    {
        $this->monthlyCostNoDiscount = $monthlyCostNoDiscount;

        return $this;
    }

    /**
     * Get monthlyCostNoDiscount.
     *
     * @return string|null
     */
    public function getMonthlyCostNoDiscount()
    {
        return $this->monthlyCostNoDiscount;
    }

    /**
     * Set attribs.
     *
     * @param string|null $attribs
     *
     * @return ProposalCircuit
     */
    public function setAttribs($attribs = null)
    {
        $this->attribs = $attribs;

        return $this;
    }

    /**
     * Get attribs.
     *
     * @return string|null
     */
    public function getAttribs()
    {
        return $this->attribs;
    }

    /**
     * Set percentualLpuDiscount.
     *
     * @param float $percentualLpuDiscount
     *
     * @return ProposalCircuit
     */
    public function setPercentualLpuDiscount($percentualLpuDiscount)
    {
        $this->percentualLpuDiscount = $percentualLpuDiscount;

        return $this;
    }

    /**
     * Get percentualLpuDiscount.
     *
     * @return float
     */
    public function getPercentualLpuDiscount()
    {
        return $this->percentualLpuDiscount;
    }

    /**
     * Set svaActivationFareDiscount.
     *
     * @param string $svaActivationFareDiscount
     *
     * @return ProposalCircuit
     */
    public function setSvaActivationFareDiscount($svaActivationFareDiscount)
    {
        $this->svaActivationFareDiscount = $svaActivationFareDiscount;

        return $this;
    }

    /**
     * Get svaActivationFareDiscount.
     *
     * @return string
     */
    public function getSvaActivationFareDiscount()
    {
        return $this->svaActivationFareDiscount;
    }

    /**
     * Set svaMonthlyCostDiscount.
     *
     * @param string $svaMonthlyCostDiscount
     *
     * @return ProposalCircuit
     */
    public function setSvaMonthlyCostDiscount($svaMonthlyCostDiscount)
    {
        $this->svaMonthlyCostDiscount = $svaMonthlyCostDiscount;

        return $this;
    }

    /**
     * Get svaMonthlyCostDiscount.
     *
     * @return string
     */
    public function getSvaMonthlyCostDiscount()
    {
        return $this->svaMonthlyCostDiscount;
    }

    /**
     * Set svaMaxPercentualDiscount.
     *
     * @param float $svaMaxPercentualDiscount
     *
     * @return ProposalCircuit
     */
    public function setSvaMaxPercentualDiscount($svaMaxPercentualDiscount)
    {
        $this->svaMaxPercentualDiscount = $svaMaxPercentualDiscount;

        return $this;
    }

    /**
     * Get svaMaxPercentualDiscount.
     *
     * @return float
     */
    public function getSvaMaxPercentualDiscount()
    {
        return $this->svaMaxPercentualDiscount;
    }

    /**
     * Set finalClient.
     *
     * @param string|null $finalClient
     *
     * @return ProposalCircuit
     */
    public function setFinalClient($finalClient = null)
    {
        $this->finalClient = $finalClient;

        return $this;
    }

    /**
     * Get finalClient.
     *
     * @return string|null
     */
    public function getFinalClient()
    {
        return $this->finalClient;
    }
}
