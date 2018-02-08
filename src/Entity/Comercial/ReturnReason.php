<?php

namespace App\Entity\Comercial;

/**
 * ReturnReason
 */
class ReturnReason
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $reason;

    /**
     * @var int
     */
    private $categoryId;

    /**
     * @var bool
     */
    private $status;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;


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
     * Set reason.
     *
     * @param string $reason
     *
     * @return ReturnReason
     */
    public function setReason($reason)
    {
        $this->reason = $reason;

        return $this;
    }

    /**
     * Get reason.
     *
     * @return string
     */
    public function getReason()
    {
        return $this->reason;
    }

    /**
     * Set categoryId.
     *
     * @param int $categoryId
     *
     * @return ReturnReason
     */
    public function setCategoryId($categoryId)
    {
        $this->categoryId = $categoryId;

        return $this;
    }

    /**
     * Get categoryId.
     *
     * @return int
     */
    public function getCategoryId()
    {
        return $this->categoryId;
    }

    /**
     * Set status.
     *
     * @param bool $status
     *
     * @return ReturnReason
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status.
     *
     * @return bool
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ReturnReason
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
}
