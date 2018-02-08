<?php

namespace App\Entity\Comercial;

/**
 * ProposalCircuitSvaProducts
 */
class ProposalCircuitSvaProducts
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalCircuitSvaId;

    /**
     * @var int|null
     */
    private $externalId;

    /**
     * @var string
     */
    private $name;

    /**
     * @var int
     */
    private $amount;

    /**
     * @var string
     */
    private $type;


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
     * Set proposalCircuitSvaId.
     *
     * @param int $proposalCircuitSvaId
     *
     * @return ProposalCircuitSvaProducts
     */
    public function setProposalCircuitSvaId($proposalCircuitSvaId)
    {
        $this->proposalCircuitSvaId = $proposalCircuitSvaId;

        return $this;
    }

    /**
     * Get proposalCircuitSvaId.
     *
     * @return int
     */
    public function getProposalCircuitSvaId()
    {
        return $this->proposalCircuitSvaId;
    }

    /**
     * Set externalId.
     *
     * @param int|null $externalId
     *
     * @return ProposalCircuitSvaProducts
     */
    public function setExternalId($externalId = null)
    {
        $this->externalId = $externalId;

        return $this;
    }

    /**
     * Get externalId.
     *
     * @return int|null
     */
    public function getExternalId()
    {
        return $this->externalId;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return ProposalCircuitSvaProducts
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set amount.
     *
     * @param int $amount
     *
     * @return ProposalCircuitSvaProducts
     */
    public function setAmount($amount)
    {
        $this->amount = $amount;

        return $this;
    }

    /**
     * Get amount.
     *
     * @return int
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     * Set type.
     *
     * @param string $type
     *
     * @return ProposalCircuitSvaProducts
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }
}
