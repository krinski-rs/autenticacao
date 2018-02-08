<?php

namespace App\Entity\Comercial;

/**
 * ReasonCategory
 */
class ReasonCategory
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $category;

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
     * Set category.
     *
     * @param string $category
     *
     * @return ReasonCategory
     */
    public function setCategory($category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category.
     *
     * @return string
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set status.
     *
     * @param bool $status
     *
     * @return ReasonCategory
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
     * @return ReasonCategory
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
