<?php

namespace App\Entity\Comercial;

/**
 * DiscountProposalStatus
 */
class DiscountProposalStatus
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $deprCodigoid;

    /**
     * @var int
     */
    private $userId;

    /**
     * @var string
     */
    private $alcada;

    /**
     * @var \DateTime
     */
    private $dateInc;

    /**
     * @var string|null
     */
    private $status = 'G';

    /**
     * @var string|null
     */
    private $motivo;


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
     * Set deprCodigoid.
     *
     * @param int $deprCodigoid
     *
     * @return DiscountProposalStatus
     */
    public function setDeprCodigoid($deprCodigoid)
    {
        $this->deprCodigoid = $deprCodigoid;

        return $this;
    }

    /**
     * Get deprCodigoid.
     *
     * @return int
     */
    public function getDeprCodigoid()
    {
        return $this->deprCodigoid;
    }

    /**
     * Set userId.
     *
     * @param int $userId
     *
     * @return DiscountProposalStatus
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
     * Set alcada.
     *
     * @param string $alcada
     *
     * @return DiscountProposalStatus
     */
    public function setAlcada($alcada)
    {
        $this->alcada = $alcada;

        return $this;
    }

    /**
     * Get alcada.
     *
     * @return string
     */
    public function getAlcada()
    {
        return $this->alcada;
    }

    /**
     * Set dateInc.
     *
     * @param \DateTime $dateInc
     *
     * @return DiscountProposalStatus
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
     * Set status.
     *
     * @param string|null $status
     *
     * @return DiscountProposalStatus
     */
    public function setStatus($status = null)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status.
     *
     * @return string|null
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set motivo.
     *
     * @param string|null $motivo
     *
     * @return DiscountProposalStatus
     */
    public function setMotivo($motivo = null)
    {
        $this->motivo = $motivo;

        return $this;
    }

    /**
     * Get motivo.
     *
     * @return string|null
     */
    public function getMotivo()
    {
        return $this->motivo;
    }
}
