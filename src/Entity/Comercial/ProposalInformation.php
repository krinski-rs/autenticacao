<?php

namespace App\Entity\Comercial;

/**
 * ProposalInformation
 */
class ProposalInformation
{
    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var int
     */
    private $informationId;


    /**
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return ProposalInformation
     */
    public function setProposalId($proposalId)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set informationId.
     *
     * @param int $informationId
     *
     * @return ProposalInformation
     */
    public function setInformationId($informationId)
    {
        $this->informationId = $informationId;

        return $this;
    }

    /**
     * Get informationId.
     *
     * @return int
     */
    public function getInformationId()
    {
        return $this->informationId;
    }
}
