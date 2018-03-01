<?php

namespace App\Entity\Prevendas;

/**
 * LpuCustomer
 */
class LpuCustomer
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
    private $custumer;

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
     * Set lpuId.
     *
     * @param int|null $lpuId
     *
     * @return LpuCustomer
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
     * Set custumer.
     *
     * @param int|null $custumer
     *
     * @return LpuCustomer
     */
    public function setCustumer($custumer = null)
    {
        $this->custumer = $custumer;

        return $this;
    }

    /**
     * Get custumer.
     *
     * @return int|null
     */
    public function getCustumer()
    {
        return $this->custumer;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return LpuCustomer
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
