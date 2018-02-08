<?php

namespace App\Entity\Comercial;

/**
 * ChanceClosed
 */
class ChanceClosed
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $walletId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var \DateTime|null
     */
    private $dateApproval;

    /**
     * @var int|null
     */
    private $approvedBy;

    /**
     * @var bool|null
     */
    private $active = false;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var \DateTime|null
     */
    private $dateClosed;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var int|null
     */
    private $idChanceClassification;

    /**
     * @var string|null
     */
    private $tag;

    /**
     * @var float|null
     */
    private $delta;


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
     * Set walletId.
     *
     * @param int|null $walletId
     *
     * @return ChanceClosed
     */
    public function setWalletId($walletId = null)
    {
        $this->walletId = $walletId;

        return $this;
    }

    /**
     * Get walletId.
     *
     * @return int|null
     */
    public function getWalletId()
    {
        return $this->walletId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ChanceClosed
     */
    public function setDateRecord($dateRecord = null)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime|null
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set dateApproval.
     *
     * @param \DateTime|null $dateApproval
     *
     * @return ChanceClosed
     */
    public function setDateApproval($dateApproval = null)
    {
        $this->dateApproval = $dateApproval;

        return $this;
    }

    /**
     * Get dateApproval.
     *
     * @return \DateTime|null
     */
    public function getDateApproval()
    {
        return $this->dateApproval;
    }

    /**
     * Set approvedBy.
     *
     * @param int|null $approvedBy
     *
     * @return ChanceClosed
     */
    public function setApprovedBy($approvedBy = null)
    {
        $this->approvedBy = $approvedBy;

        return $this;
    }

    /**
     * Get approvedBy.
     *
     * @return int|null
     */
    public function getApprovedBy()
    {
        return $this->approvedBy;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return ChanceClosed
     */
    public function setActive($active = null)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool|null
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return ChanceClosed
     */
    public function setChanceId($chanceId = null)
    {
        $this->chanceId = $chanceId;

        return $this;
    }

    /**
     * Get chanceId.
     *
     * @return int|null
     */
    public function getChanceId()
    {
        return $this->chanceId;
    }

    /**
     * Set dateClosed.
     *
     * @param \DateTime|null $dateClosed
     *
     * @return ChanceClosed
     */
    public function setDateClosed($dateClosed = null)
    {
        $this->dateClosed = $dateClosed;

        return $this;
    }

    /**
     * Get dateClosed.
     *
     * @return \DateTime|null
     */
    public function getDateClosed()
    {
        return $this->dateClosed;
    }

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return ChanceClosed
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set idChanceClassification.
     *
     * @param int|null $idChanceClassification
     *
     * @return ChanceClosed
     */
    public function setIdChanceClassification($idChanceClassification = null)
    {
        $this->idChanceClassification = $idChanceClassification;

        return $this;
    }

    /**
     * Get idChanceClassification.
     *
     * @return int|null
     */
    public function getIdChanceClassification()
    {
        return $this->idChanceClassification;
    }

    /**
     * Set tag.
     *
     * @param string|null $tag
     *
     * @return ChanceClosed
     */
    public function setTag($tag = null)
    {
        $this->tag = $tag;

        return $this;
    }

    /**
     * Get tag.
     *
     * @return string|null
     */
    public function getTag()
    {
        return $this->tag;
    }

    /**
     * Set delta.
     *
     * @param float|null $delta
     *
     * @return ChanceClosed
     */
    public function setDelta($delta = null)
    {
        $this->delta = $delta;

        return $this;
    }

    /**
     * Get delta.
     *
     * @return float|null
     */
    public function getDelta()
    {
        return $this->delta;
    }
}
