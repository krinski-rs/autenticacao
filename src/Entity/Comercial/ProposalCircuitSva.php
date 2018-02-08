<?php

namespace App\Entity\Comercial;

/**
 * ProposalCircuitSva
 */
class ProposalCircuitSva
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalCircuitId;

    /**
     * @var int
     */
    private $svaId;

    /**
     * @var string
     */
    private $ativationFare = '0';

    /**
     * @var string
     */
    private $monthlyCost = '0';


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
     * Set proposalCircuitId.
     *
     * @param int $proposalCircuitId
     *
     * @return ProposalCircuitSva
     */
    public function setProposalCircuitId($proposalCircuitId)
    {
        $this->proposalCircuitId = $proposalCircuitId;

        return $this;
    }

    /**
     * Get proposalCircuitId.
     *
     * @return int
     */
    public function getProposalCircuitId()
    {
        return $this->proposalCircuitId;
    }

    /**
     * Set svaId.
     *
     * @param int $svaId
     *
     * @return ProposalCircuitSva
     */
    public function setSvaId($svaId)
    {
        $this->svaId = $svaId;

        return $this;
    }

    /**
     * Get svaId.
     *
     * @return int
     */
    public function getSvaId()
    {
        return $this->svaId;
    }

    /**
     * Set ativationFare.
     *
     * @param string $ativationFare
     *
     * @return ProposalCircuitSva
     */
    public function setAtivationFare($ativationFare)
    {
        $this->ativationFare = $ativationFare;

        return $this;
    }

    /**
     * Get ativationFare.
     *
     * @return string
     */
    public function getAtivationFare()
    {
        return $this->ativationFare;
    }

    /**
     * Set monthlyCost.
     *
     * @param string $monthlyCost
     *
     * @return ProposalCircuitSva
     */
    public function setMonthlyCost($monthlyCost)
    {
        $this->monthlyCost = $monthlyCost;

        return $this;
    }

    /**
     * Get monthlyCost.
     *
     * @return string
     */
    public function getMonthlyCost()
    {
        return $this->monthlyCost;
    }
}
