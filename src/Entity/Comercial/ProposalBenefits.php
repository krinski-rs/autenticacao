<?php

namespace App\Entity\Comercial;

/**
 * ProposalBenefits
 */
class ProposalBenefits
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
     * @var string|null
     */
    private $investmentValue;

    /**
     * @var string|null
     */
    private $monthlyBonusValue;

    /**
     * @var string|null
     */
    private $activationBonusValue;

    /**
     * @var int|null
     */
    private $permanenceDeadline;

    /**
     * @var int|null
     */
    private $permanenceUnit;


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
     * @return ProposalBenefits
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
     * Set investmentValue.
     *
     * @param string|null $investmentValue
     *
     * @return ProposalBenefits
     */
    public function setInvestmentValue($investmentValue = null)
    {
        $this->investmentValue = $investmentValue;

        return $this;
    }

    /**
     * Get investmentValue.
     *
     * @return string|null
     */
    public function getInvestmentValue()
    {
        return $this->investmentValue;
    }

    /**
     * Set monthlyBonusValue.
     *
     * @param string|null $monthlyBonusValue
     *
     * @return ProposalBenefits
     */
    public function setMonthlyBonusValue($monthlyBonusValue = null)
    {
        $this->monthlyBonusValue = $monthlyBonusValue;

        return $this;
    }

    /**
     * Get monthlyBonusValue.
     *
     * @return string|null
     */
    public function getMonthlyBonusValue()
    {
        return $this->monthlyBonusValue;
    }

    /**
     * Set activationBonusValue.
     *
     * @param string|null $activationBonusValue
     *
     * @return ProposalBenefits
     */
    public function setActivationBonusValue($activationBonusValue = null)
    {
        $this->activationBonusValue = $activationBonusValue;

        return $this;
    }

    /**
     * Get activationBonusValue.
     *
     * @return string|null
     */
    public function getActivationBonusValue()
    {
        return $this->activationBonusValue;
    }

    /**
     * Set permanenceDeadline.
     *
     * @param int|null $permanenceDeadline
     *
     * @return ProposalBenefits
     */
    public function setPermanenceDeadline($permanenceDeadline = null)
    {
        $this->permanenceDeadline = $permanenceDeadline;

        return $this;
    }

    /**
     * Get permanenceDeadline.
     *
     * @return int|null
     */
    public function getPermanenceDeadline()
    {
        return $this->permanenceDeadline;
    }

    /**
     * Set permanenceUnit.
     *
     * @param int|null $permanenceUnit
     *
     * @return ProposalBenefits
     */
    public function setPermanenceUnit($permanenceUnit = null)
    {
        $this->permanenceUnit = $permanenceUnit;

        return $this;
    }

    /**
     * Get permanenceUnit.
     *
     * @return int|null
     */
    public function getPermanenceUnit()
    {
        return $this->permanenceUnit;
    }
}
