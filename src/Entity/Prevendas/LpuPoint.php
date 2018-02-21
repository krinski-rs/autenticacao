<?php

namespace App\Entity\Prevendas;

/**
 * LpuPoint
 */
class LpuPoint
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $lpuId;

    /**
     * @var int|null
     */
    private $pointId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var int|null
     */
    private $author;


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
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return LpuPoint
     */
    public function setLpuId($lpuId = null)
    {
        $this->lpuId = $lpuId;

        return $this;
    }

    /**
     * Get lpuId.
     *
     * @return int|null
     */
    public function getLpuId()
    {
        return $this->lpuId;
    }

    /**
     * Set pointId.
     *
     * @param int|null $pointId
     *
     * @return LpuPoint
     */
    public function setPointId($pointId = null)
    {
        $this->pointId = $pointId;

        return $this;
    }

    /**
     * Get pointId.
     *
     * @return int|null
     */
    public function getPointId()
    {
        return $this->pointId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return LpuPoint
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
     * Set author.
     *
     * @param int|null $author
     *
     * @return LpuPoint
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
}
