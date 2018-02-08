<?php

namespace App\Entity\Comercial;

/**
 * ProposalNumber
 */
class ProposalNumber
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
    private $numberType;

    /**
     * @var int|null
     */
    private $quantity;

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
     * Set proposalId.
     *
     * @param int|null $proposalId
     *
     * @return ProposalNumber
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
     * Set numberType.
     *
     * @param int|null $numberType
     *
     * @return ProposalNumber
     */
    public function setNumberType($numberType = null)
    {
        $this->numberType = $numberType;

        return $this;
    }

    /**
     * Get numberType.
     *
     * @return int|null
     */
    public function getNumberType()
    {
        return $this->numberType;
    }

    /**
     * Set quantity.
     *
     * @param int|null $quantity
     *
     * @return ProposalNumber
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

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return ProposalNumber
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
     * @return ProposalNumber
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
