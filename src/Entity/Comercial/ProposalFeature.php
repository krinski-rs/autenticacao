<?php

namespace App\Entity\Comercial;

/**
 * ProposalFeature
 */
class ProposalFeature
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $atrivaloCodigoid;

    /**
     * @var string|null
     */
    private $value;

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
    private $proposalId;

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
     * Set atrivaloCodigoid.
     *
     * @param int|null $atrivaloCodigoid
     *
     * @return ProposalFeature
     */
    public function setAtrivaloCodigoid($atrivaloCodigoid = null)
    {
        $this->atrivaloCodigoid = $atrivaloCodigoid;

        return $this;
    }

    /**
     * Get atrivaloCodigoid.
     *
     * @return int|null
     */
    public function getAtrivaloCodigoid()
    {
        return $this->atrivaloCodigoid;
    }

    /**
     * Set value.
     *
     * @param string|null $value
     *
     * @return ProposalFeature
     */
    public function setValue($value = null)
    {
        $this->value = $value;

        return $this;
    }

    /**
     * Get value.
     *
     * @return string|null
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Set activationFare.
     *
     * @param string|null $activationFare
     *
     * @return ProposalFeature
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
     * @return ProposalFeature
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
     * Set proposalId.
     *
     * @param int|null $proposalId
     *
     * @return ProposalFeature
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
     * Set quantity.
     *
     * @param int|null $quantity
     *
     * @return ProposalFeature
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
