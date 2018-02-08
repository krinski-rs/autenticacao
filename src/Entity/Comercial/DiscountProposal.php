<?php

namespace App\Entity\Comercial;

/**
 * DiscountProposal
 */
class DiscountProposal
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $userId;

    /**
     * @var \DateTime
     */
    private $dateInc;

    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var string
     */
    private $tipo;

    /**
     * @var string
     */
    private $descativval;

    /**
     * @var string
     */
    private $descativporc;

    /**
     * @var string
     */
    private $descmensval;

    /**
     * @var string
     */
    private $descmensporc;

    /**
     * @var string
     */
    private $motivo;

    /**
     * @var bool|null
     */
    private $status;

    /**
     * @var string
     */
    private $valorativAtual;

    /**
     * @var string
     */
    private $valorativProposto;

    /**
     * @var string
     */
    private $valormensAtual;

    /**
     * @var string
     */
    private $valormensProposto;

    /**
     * @var int|null
     */
    private $proposalApproved;


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
     * Set userId.
     *
     * @param int $userId
     *
     * @return DiscountProposal
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId.
     *
     * @return int
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set dateInc.
     *
     * @param \DateTime $dateInc
     *
     * @return DiscountProposal
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
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return DiscountProposal
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
     * Set tipo.
     *
     * @param string $tipo
     *
     * @return DiscountProposal
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;

        return $this;
    }

    /**
     * Get tipo.
     *
     * @return string
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set descativval.
     *
     * @param string $descativval
     *
     * @return DiscountProposal
     */
    public function setDescativval($descativval)
    {
        $this->descativval = $descativval;

        return $this;
    }

    /**
     * Get descativval.
     *
     * @return string
     */
    public function getDescativval()
    {
        return $this->descativval;
    }

    /**
     * Set descativporc.
     *
     * @param string $descativporc
     *
     * @return DiscountProposal
     */
    public function setDescativporc($descativporc)
    {
        $this->descativporc = $descativporc;

        return $this;
    }

    /**
     * Get descativporc.
     *
     * @return string
     */
    public function getDescativporc()
    {
        return $this->descativporc;
    }

    /**
     * Set descmensval.
     *
     * @param string $descmensval
     *
     * @return DiscountProposal
     */
    public function setDescmensval($descmensval)
    {
        $this->descmensval = $descmensval;

        return $this;
    }

    /**
     * Get descmensval.
     *
     * @return string
     */
    public function getDescmensval()
    {
        return $this->descmensval;
    }

    /**
     * Set descmensporc.
     *
     * @param string $descmensporc
     *
     * @return DiscountProposal
     */
    public function setDescmensporc($descmensporc)
    {
        $this->descmensporc = $descmensporc;

        return $this;
    }

    /**
     * Get descmensporc.
     *
     * @return string
     */
    public function getDescmensporc()
    {
        return $this->descmensporc;
    }

    /**
     * Set motivo.
     *
     * @param string $motivo
     *
     * @return DiscountProposal
     */
    public function setMotivo($motivo)
    {
        $this->motivo = $motivo;

        return $this;
    }

    /**
     * Get motivo.
     *
     * @return string
     */
    public function getMotivo()
    {
        return $this->motivo;
    }

    /**
     * Set status.
     *
     * @param bool|null $status
     *
     * @return DiscountProposal
     */
    public function setStatus($status = null)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status.
     *
     * @return bool|null
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set valorativAtual.
     *
     * @param string $valorativAtual
     *
     * @return DiscountProposal
     */
    public function setValorativAtual($valorativAtual)
    {
        $this->valorativAtual = $valorativAtual;

        return $this;
    }

    /**
     * Get valorativAtual.
     *
     * @return string
     */
    public function getValorativAtual()
    {
        return $this->valorativAtual;
    }

    /**
     * Set valorativProposto.
     *
     * @param string $valorativProposto
     *
     * @return DiscountProposal
     */
    public function setValorativProposto($valorativProposto)
    {
        $this->valorativProposto = $valorativProposto;

        return $this;
    }

    /**
     * Get valorativProposto.
     *
     * @return string
     */
    public function getValorativProposto()
    {
        return $this->valorativProposto;
    }

    /**
     * Set valormensAtual.
     *
     * @param string $valormensAtual
     *
     * @return DiscountProposal
     */
    public function setValormensAtual($valormensAtual)
    {
        $this->valormensAtual = $valormensAtual;

        return $this;
    }

    /**
     * Get valormensAtual.
     *
     * @return string
     */
    public function getValormensAtual()
    {
        return $this->valormensAtual;
    }

    /**
     * Set valormensProposto.
     *
     * @param string $valormensProposto
     *
     * @return DiscountProposal
     */
    public function setValormensProposto($valormensProposto)
    {
        $this->valormensProposto = $valormensProposto;

        return $this;
    }

    /**
     * Get valormensProposto.
     *
     * @return string
     */
    public function getValormensProposto()
    {
        return $this->valormensProposto;
    }

    /**
     * Set proposalApproved.
     *
     * @param int|null $proposalApproved
     *
     * @return DiscountProposal
     */
    public function setProposalApproved($proposalApproved = null)
    {
        $this->proposalApproved = $proposalApproved;

        return $this;
    }

    /**
     * Get proposalApproved.
     *
     * @return int|null
     */
    public function getProposalApproved()
    {
        return $this->proposalApproved;
    }
}
