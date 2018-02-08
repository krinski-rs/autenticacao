<?php

namespace App\Entity\Comercial;

/**
 * Proposal
 */
class Proposal
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
     * @var int|null
     */
    private $speed;

    /**
     * @var int|null
     */
    private $speedUnit;

    /**
     * @var int|null
     */
    private $activationDays;

    /**
     * @var int|null
     */
    private $contractDeadline;

    /**
     * @var int|null
     */
    private $contractUnit;

    /**
     * @var int|null
     */
    private $followupId;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var bool|null
     */
    private $active = true;

    /**
     * @var string|null
     */
    private $latitude;

    /**
     * @var string|null
     */
    private $longitude;

    /**
     * @var int|null
     */
    private $dateLimit;

    /**
     * @var string|null
     */
    private $priceRight;

    /**
     * @var int|null
     */
    private $viableId;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var string|null
     */
    private $monthlyCostNoDiscount;

    /**
     * @var string|null
     */
    private $activationFareNoDiscount;

    /**
     * @var string
     */
    private $attribs = '{}';

    /**
     * @var string|null
     */
    private $cnpj;

    /**
     * @var int|null
     */
    private $bankInformationId;

    /**
     * @var int|null
     */
    private $planType;

    /**
     * @var string|null
     */
    private $franchiseCost;

    /**
     * @var string|null
     */
    private $franchiseCostNoDiscount;

    /**
     * @var bool|null
     */
    private $accept;

    /**
     * @var int|null
     */
    private $payDay;

    /**
     * @var bool|null
     */
    private $hasPermanenceTerm = false;

    /**
     * @var int|null
     */
    private $contratoSthima;


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
     * @return Proposal
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
     * @return Proposal
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
     * Set speed.
     *
     * @param int|null $speed
     *
     * @return Proposal
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
     * @return Proposal
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
     * Set activationDays.
     *
     * @param int|null $activationDays
     *
     * @return Proposal
     */
    public function setActivationDays($activationDays = null)
    {
        $this->activationDays = $activationDays;

        return $this;
    }

    /**
     * Get activationDays.
     *
     * @return int|null
     */
    public function getActivationDays()
    {
        return $this->activationDays;
    }

    /**
     * Set contractDeadline.
     *
     * @param int|null $contractDeadline
     *
     * @return Proposal
     */
    public function setContractDeadline($contractDeadline = null)
    {
        $this->contractDeadline = $contractDeadline;

        return $this;
    }

    /**
     * Get contractDeadline.
     *
     * @return int|null
     */
    public function getContractDeadline()
    {
        return $this->contractDeadline;
    }

    /**
     * Set contractUnit.
     *
     * @param int|null $contractUnit
     *
     * @return Proposal
     */
    public function setContractUnit($contractUnit = null)
    {
        $this->contractUnit = $contractUnit;

        return $this;
    }

    /**
     * Get contractUnit.
     *
     * @return int|null
     */
    public function getContractUnit()
    {
        return $this->contractUnit;
    }

    /**
     * Set followupId.
     *
     * @param int|null $followupId
     *
     * @return Proposal
     */
    public function setFollowupId($followupId = null)
    {
        $this->followupId = $followupId;

        return $this;
    }

    /**
     * Get followupId.
     *
     * @return int|null
     */
    public function getFollowupId()
    {
        return $this->followupId;
    }

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return Proposal
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Proposal
     */
    public function setActive($active = null)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool|null
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set latitude.
     *
     * @param string|null $latitude
     *
     * @return Proposal
     */
    public function setLatitude($latitude = null)
    {
        $this->latitude = $latitude;

        return $this;
    }

    /**
     * Get latitude.
     *
     * @return string|null
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * Set longitude.
     *
     * @param string|null $longitude
     *
     * @return Proposal
     */
    public function setLongitude($longitude = null)
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * Get longitude.
     *
     * @return string|null
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * Set dateLimit.
     *
     * @param int|null $dateLimit
     *
     * @return Proposal
     */
    public function setDateLimit($dateLimit = null)
    {
        $this->dateLimit = $dateLimit;

        return $this;
    }

    /**
     * Get dateLimit.
     *
     * @return int|null
     */
    public function getDateLimit()
    {
        return $this->dateLimit;
    }

    /**
     * Set priceRight.
     *
     * @param string|null $priceRight
     *
     * @return Proposal
     */
    public function setPriceRight($priceRight = null)
    {
        $this->priceRight = $priceRight;

        return $this;
    }

    /**
     * Get priceRight.
     *
     * @return string|null
     */
    public function getPriceRight()
    {
        return $this->priceRight;
    }

    /**
     * Set viableId.
     *
     * @param int|null $viableId
     *
     * @return Proposal
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
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return Proposal
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
     * Set monthlyCostNoDiscount.
     *
     * @param string|null $monthlyCostNoDiscount
     *
     * @return Proposal
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
     * Set activationFareNoDiscount.
     *
     * @param string|null $activationFareNoDiscount
     *
     * @return Proposal
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
     * Set attribs.
     *
     * @param string $attribs
     *
     * @return Proposal
     */
    public function setAttribs($attribs)
    {
        $this->attribs = $attribs;

        return $this;
    }

    /**
     * Get attribs.
     *
     * @return string
     */
    public function getAttribs()
    {
        return $this->attribs;
    }

    /**
     * Set cnpj.
     *
     * @param string|null $cnpj
     *
     * @return Proposal
     */
    public function setCnpj($cnpj = null)
    {
        $this->cnpj = $cnpj;

        return $this;
    }

    /**
     * Get cnpj.
     *
     * @return string|null
     */
    public function getCnpj()
    {
        return $this->cnpj;
    }

    /**
     * Set bankInformationId.
     *
     * @param int|null $bankInformationId
     *
     * @return Proposal
     */
    public function setBankInformationId($bankInformationId = null)
    {
        $this->bankInformationId = $bankInformationId;

        return $this;
    }

    /**
     * Get bankInformationId.
     *
     * @return int|null
     */
    public function getBankInformationId()
    {
        return $this->bankInformationId;
    }

    /**
     * Set planType.
     *
     * @param int|null $planType
     *
     * @return Proposal
     */
    public function setPlanType($planType = null)
    {
        $this->planType = $planType;

        return $this;
    }

    /**
     * Get planType.
     *
     * @return int|null
     */
    public function getPlanType()
    {
        return $this->planType;
    }

    /**
     * Set franchiseCost.
     *
     * @param string|null $franchiseCost
     *
     * @return Proposal
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
     * Set franchiseCostNoDiscount.
     *
     * @param string|null $franchiseCostNoDiscount
     *
     * @return Proposal
     */
    public function setFranchiseCostNoDiscount($franchiseCostNoDiscount = null)
    {
        $this->franchiseCostNoDiscount = $franchiseCostNoDiscount;

        return $this;
    }

    /**
     * Get franchiseCostNoDiscount.
     *
     * @return string|null
     */
    public function getFranchiseCostNoDiscount()
    {
        return $this->franchiseCostNoDiscount;
    }

    /**
     * Set accept.
     *
     * @param bool|null $accept
     *
     * @return Proposal
     */
    public function setAccept($accept = null)
    {
        $this->accept = $accept;

        return $this;
    }

    /**
     * Get accept.
     *
     * @return bool|null
     */
    public function getAccept()
    {
        return $this->accept;
    }

    /**
     * Set payDay.
     *
     * @param int|null $payDay
     *
     * @return Proposal
     */
    public function setPayDay($payDay = null)
    {
        $this->payDay = $payDay;

        return $this;
    }

    /**
     * Get payDay.
     *
     * @return int|null
     */
    public function getPayDay()
    {
        return $this->payDay;
    }

    /**
     * Set hasPermanenceTerm.
     *
     * @param bool|null $hasPermanenceTerm
     *
     * @return Proposal
     */
    public function setHasPermanenceTerm($hasPermanenceTerm = null)
    {
        $this->hasPermanenceTerm = $hasPermanenceTerm;

        return $this;
    }

    /**
     * Get hasPermanenceTerm.
     *
     * @return bool|null
     */
    public function getHasPermanenceTerm()
    {
        return $this->hasPermanenceTerm;
    }

    /**
     * Set contratoSthima.
     *
     * @param int|null $contratoSthima
     *
     * @return Proposal
     */
    public function setContratoSthima($contratoSthima = null)
    {
        $this->contratoSthima = $contratoSthima;

        return $this;
    }

    /**
     * Get contratoSthima.
     *
     * @return int|null
     */
    public function getContratoSthima()
    {
        return $this->contratoSthima;
    }
}
