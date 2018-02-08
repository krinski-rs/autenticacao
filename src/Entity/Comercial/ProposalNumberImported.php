<?php

namespace App\Entity\Comercial;

/**
 * ProposalNumberImported
 */
class ProposalNumberImported
{
    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var int
     */
    private $numberImportedId;


    /**
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return ProposalNumberImported
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
     * Set numberImportedId.
     *
     * @param int $numberImportedId
     *
     * @return ProposalNumberImported
     */
    public function setNumberImportedId($numberImportedId)
    {
        $this->numberImportedId = $numberImportedId;

        return $this;
    }

    /**
     * Get numberImportedId.
     *
     * @return int
     */
    public function getNumberImportedId()
    {
        return $this->numberImportedId;
    }
}
