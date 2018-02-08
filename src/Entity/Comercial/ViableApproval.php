<?php

namespace App\Entity\Comercial;

/**
 * ViableApproval
 */
class ViableApproval
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var int|null
     */
    private $viableId;

    /**
     * @var bool|null
     */
    private $approved;

    /**
     * @var string|null
     */
    private $obs;

    /**
     * @var int
     */
    private $prevViableStatus;

    /**
     * @var string|null
     */
    private $attachment;

    /**
     * @var \DateTime
     */
    private $deadlineApproval;

    /**
     * @var \DateTime|null
     */
    private $dateApproval;

    /**
     * @var int|null
     */
    private $minAtivationDays;

    /**
     * @var string|null
     */
    private $networkType;


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
     * Set author.
     *
     * @param int|null $author
     *
     * @return ViableApproval
     */
    public function setAuthor($author = null)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author.
     *
     * @return int|null
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ViableApproval
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
     * Set viableId.
     *
     * @param int|null $viableId
     *
     * @return ViableApproval
     */
    public function setViableId($viableId = null)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int|null
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set approved.
     *
     * @param bool|null $approved
     *
     * @return ViableApproval
     */
    public function setApproved($approved = null)
    {
        $this->approved = $approved;

        return $this;
    }

    /**
     * Get approved.
     *
     * @return bool|null
     */
    public function getApproved()
    {
        return $this->approved;
    }

    /**
     * Set obs.
     *
     * @param string|null $obs
     *
     * @return ViableApproval
     */
    public function setObs($obs = null)
    {
        $this->obs = $obs;

        return $this;
    }

    /**
     * Get obs.
     *
     * @return string|null
     */
    public function getObs()
    {
        return $this->obs;
    }

    /**
     * Set prevViableStatus.
     *
     * @param int $prevViableStatus
     *
     * @return ViableApproval
     */
    public function setPrevViableStatus($prevViableStatus)
    {
        $this->prevViableStatus = $prevViableStatus;

        return $this;
    }

    /**
     * Get prevViableStatus.
     *
     * @return int
     */
    public function getPrevViableStatus()
    {
        return $this->prevViableStatus;
    }

    /**
     * Set attachment.
     *
     * @param string|null $attachment
     *
     * @return ViableApproval
     */
    public function setAttachment($attachment = null)
    {
        $this->attachment = $attachment;

        return $this;
    }

    /**
     * Get attachment.
     *
     * @return string|null
     */
    public function getAttachment()
    {
        return $this->attachment;
    }

    /**
     * Set deadlineApproval.
     *
     * @param \DateTime $deadlineApproval
     *
     * @return ViableApproval
     */
    public function setDeadlineApproval($deadlineApproval)
    {
        $this->deadlineApproval = $deadlineApproval;

        return $this;
    }

    /**
     * Get deadlineApproval.
     *
     * @return \DateTime
     */
    public function getDeadlineApproval()
    {
        return $this->deadlineApproval;
    }

    /**
     * Set dateApproval.
     *
     * @param \DateTime|null $dateApproval
     *
     * @return ViableApproval
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
     * Set minAtivationDays.
     *
     * @param int|null $minAtivationDays
     *
     * @return ViableApproval
     */
    public function setMinAtivationDays($minAtivationDays = null)
    {
        $this->minAtivationDays = $minAtivationDays;

        return $this;
    }

    /**
     * Get minAtivationDays.
     *
     * @return int|null
     */
    public function getMinAtivationDays()
    {
        return $this->minAtivationDays;
    }

    /**
     * Set networkType.
     *
     * @param string|null $networkType
     *
     * @return ViableApproval
     */
    public function setNetworkType($networkType = null)
    {
        $this->networkType = $networkType;

        return $this;
    }

    /**
     * Get networkType.
     *
     * @return string|null
     */
    public function getNetworkType()
    {
        return $this->networkType;
    }
}
