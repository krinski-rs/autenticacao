<?php

namespace App\Entity\Comercial;

/**
 * ProposalTimeCounters
 */
class ProposalTimeCounters
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var \DateTime
     */
    private $initialDate = 'now()';

    /**
     * @var \DateTime|null
     */
    private $finalDate;

    /**
     * @var int
     */
    private $proposalTimeCountersStacksId;

    /**
     * @var int|null
     */
    private $proposalProtocolStatusId;


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
     * @param int $proposalId
     *
     * @return ProposalTimeCounters
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
     * Set initialDate.
     *
     * @param \DateTime $initialDate
     *
     * @return ProposalTimeCounters
     */
    public function setInitialDate($initialDate)
    {
        $this->initialDate = $initialDate;

        return $this;
    }

    /**
     * Get initialDate.
     *
     * @return \DateTime
     */
    public function getInitialDate()
    {
        return $this->initialDate;
    }

    /**
     * Set finalDate.
     *
     * @param \DateTime|null $finalDate
     *
     * @return ProposalTimeCounters
     */
    public function setFinalDate($finalDate = null)
    {
        $this->finalDate = $finalDate;

        return $this;
    }

    /**
     * Get finalDate.
     *
     * @return \DateTime|null
     */
    public function getFinalDate()
    {
        return $this->finalDate;
    }

    /**
     * Set proposalTimeCountersStacksId.
     *
     * @param int $proposalTimeCountersStacksId
     *
     * @return ProposalTimeCounters
     */
    public function setProposalTimeCountersStacksId($proposalTimeCountersStacksId)
    {
        $this->proposalTimeCountersStacksId = $proposalTimeCountersStacksId;

        return $this;
    }

    /**
     * Get proposalTimeCountersStacksId.
     *
     * @return int
     */
    public function getProposalTimeCountersStacksId()
    {
        return $this->proposalTimeCountersStacksId;
    }

    /**
     * Set proposalProtocolStatusId.
     *
     * @param int|null $proposalProtocolStatusId
     *
     * @return ProposalTimeCounters
     */
    public function setProposalProtocolStatusId($proposalProtocolStatusId = null)
    {
        $this->proposalProtocolStatusId = $proposalProtocolStatusId;

        return $this;
    }

    /**
     * Get proposalProtocolStatusId.
     *
     * @return int|null
     */
    public function getProposalProtocolStatusId()
    {
        return $this->proposalProtocolStatusId;
    }
}
