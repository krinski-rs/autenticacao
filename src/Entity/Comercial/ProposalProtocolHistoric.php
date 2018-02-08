<?php

namespace App\Entity\Comercial;

/**
 * ProposalProtocolHistoric
 */
class ProposalProtocolHistoric
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var \DateTime
     */
    private $dateInc;

    /**
     * @var int
     */
    private $proposalProtocolId;

    /**
     * @var int
     */
    private $autUsuariosId;

    /**
     * @var string
     */
    private $department;

    /**
     * @var int
     */
    private $proposalProtocolStatusId;

    /**
     * @var string
     */
    private $reasonDenial;

    /**
     * @var int|null
     */
    private $contractDenialReasonId;


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
     * Set dateInc.
     *
     * @param \DateTime $dateInc
     *
     * @return ProposalProtocolHistoric
     */
    public function setDateInc($dateInc)
    {
        $this->dateInc = $dateInc;

        return $this;
    }

    /**
     * Get dateInc.
     *
     * @return \DateTime
     */
    public function getDateInc()
    {
        return $this->dateInc;
    }

    /**
     * Set proposalProtocolId.
     *
     * @param int $proposalProtocolId
     *
     * @return ProposalProtocolHistoric
     */
    public function setProposalProtocolId($proposalProtocolId)
    {
        $this->proposalProtocolId = $proposalProtocolId;

        return $this;
    }

    /**
     * Get proposalProtocolId.
     *
     * @return int
     */
    public function getProposalProtocolId()
    {
        return $this->proposalProtocolId;
    }

    /**
     * Set autUsuariosId.
     *
     * @param int $autUsuariosId
     *
     * @return ProposalProtocolHistoric
     */
    public function setAutUsuariosId($autUsuariosId)
    {
        $this->autUsuariosId = $autUsuariosId;

        return $this;
    }

    /**
     * Get autUsuariosId.
     *
     * @return int
     */
    public function getAutUsuariosId()
    {
        return $this->autUsuariosId;
    }

    /**
     * Set department.
     *
     * @param string $department
     *
     * @return ProposalProtocolHistoric
     */
    public function setDepartment($department)
    {
        $this->department = $department;

        return $this;
    }

    /**
     * Get department.
     *
     * @return string
     */
    public function getDepartment()
    {
        return $this->department;
    }

    /**
     * Set proposalProtocolStatusId.
     *
     * @param int $proposalProtocolStatusId
     *
     * @return ProposalProtocolHistoric
     */
    public function setProposalProtocolStatusId($proposalProtocolStatusId)
    {
        $this->proposalProtocolStatusId = $proposalProtocolStatusId;

        return $this;
    }

    /**
     * Get proposalProtocolStatusId.
     *
     * @return int
     */
    public function getProposalProtocolStatusId()
    {
        return $this->proposalProtocolStatusId;
    }

    /**
     * Set reasonDenial.
     *
     * @param string $reasonDenial
     *
     * @return ProposalProtocolHistoric
     */
    public function setReasonDenial($reasonDenial)
    {
        $this->reasonDenial = $reasonDenial;

        return $this;
    }

    /**
     * Get reasonDenial.
     *
     * @return string
     */
    public function getReasonDenial()
    {
        return $this->reasonDenial;
    }

    /**
     * Set contractDenialReasonId.
     *
     * @param int|null $contractDenialReasonId
     *
     * @return ProposalProtocolHistoric
     */
    public function setContractDenialReasonId($contractDenialReasonId = null)
    {
        $this->contractDenialReasonId = $contractDenialReasonId;

        return $this;
    }

    /**
     * Get contractDenialReasonId.
     *
     * @return int|null
     */
    public function getContractDenialReasonId()
    {
        return $this->contractDenialReasonId;
    }
}
