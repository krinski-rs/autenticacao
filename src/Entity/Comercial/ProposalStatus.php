<?php

namespace App\Entity\Comercial;

/**
 * ProposalStatus
 */
class ProposalStatus
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var bool|null
     */
    private $valproposalId;

    /**
     * @var bool|null
     */
    private $physicalProposalPendency;

    /**
     * @var \DateTime
     */
    private $dateRecord = 'now()';

    /**
     * @var \DateTime|null
     */
    private $dateUpdate;

    /**
     * @var string|null
     */
    private $motivoPropostaInvalida;

    /**
     * @var bool|null
     */
    private $pendingSeller;

    /**
     * @var int|null
     */
    private $idReason;


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
     * Set valproposalId.
     *
     * @param bool|null $valproposalId
     *
     * @return ProposalStatus
     */
    public function setValproposalId($valproposalId = null)
    {
        $this->valproposalId = $valproposalId;

        return $this;
    }

    /**
     * Get valproposalId.
     *
     * @return bool|null
     */
    public function getValproposalId()
    {
        return $this->valproposalId;
    }

    /**
     * Set physicalProposalPendency.
     *
     * @param bool|null $physicalProposalPendency
     *
     * @return ProposalStatus
     */
    public function setPhysicalProposalPendency($physicalProposalPendency = null)
    {
        $this->physicalProposalPendency = $physicalProposalPendency;

        return $this;
    }

    /**
     * Get physicalProposalPendency.
     *
     * @return bool|null
     */
    public function getPhysicalProposalPendency()
    {
        return $this->physicalProposalPendency;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return ProposalStatus
     */
    public function setDateRecord($dateRecord)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set dateUpdate.
     *
     * @param \DateTime|null $dateUpdate
     *
     * @return ProposalStatus
     */
    public function setDateUpdate($dateUpdate = null)
    {
        $this->dateUpdate = $dateUpdate;

        return $this;
    }

    /**
     * Get dateUpdate.
     *
     * @return \DateTime|null
     */
    public function getDateUpdate()
    {
        return $this->dateUpdate;
    }

    /**
     * Set motivoPropostaInvalida.
     *
     * @param string|null $motivoPropostaInvalida
     *
     * @return ProposalStatus
     */
    public function setMotivoPropostaInvalida($motivoPropostaInvalida = null)
    {
        $this->motivoPropostaInvalida = $motivoPropostaInvalida;

        return $this;
    }

    /**
     * Get motivoPropostaInvalida.
     *
     * @return string|null
     */
    public function getMotivoPropostaInvalida()
    {
        return $this->motivoPropostaInvalida;
    }

    /**
     * Set pendingSeller.
     *
     * @param bool|null $pendingSeller
     *
     * @return ProposalStatus
     */
    public function setPendingSeller($pendingSeller = null)
    {
        $this->pendingSeller = $pendingSeller;

        return $this;
    }

    /**
     * Get pendingSeller.
     *
     * @return bool|null
     */
    public function getPendingSeller()
    {
        return $this->pendingSeller;
    }

    /**
     * Set idReason.
     *
     * @param int|null $idReason
     *
     * @return ProposalStatus
     */
    public function setIdReason($idReason = null)
    {
        $this->idReason = $idReason;

        return $this;
    }

    /**
     * Get idReason.
     *
     * @return int|null
     */
    public function getIdReason()
    {
        return $this->idReason;
    }
}
