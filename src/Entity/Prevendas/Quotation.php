<?php

namespace App\Entity\Prevendas;

/**
 * Quotation
 */
class Quotation
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
     * @var \DateTime
     */
    private $dateRecord = 'now()';

    /**
     * @var int
     */
    private $client;

    /**
     * @var int|null
     */
    private $serviceId;

    /**
     * @var int|null
     */
    private $speed;

    /**
     * @var int|null
     */
    private $deadline;


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
     * @return Quotation
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
     * @param \DateTime $dateRecord
     *
     * @return Quotation
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
     * Set client.
     *
     * @param int $client
     *
     * @return Quotation
     */
    public function setClient($client)
    {
        $this->client = $client;

        return $this;
    }

    /**
     * Get client.
     *
     * @return int
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * Set serviceId.
     *
     * @param int|null $serviceId
     *
     * @return Quotation
     */
    public function setServiceId($serviceId = null)
    {
        $this->serviceId = $serviceId;

        return $this;
    }

    /**
     * Get serviceId.
     *
     * @return int|null
     */
    public function getServiceId()
    {
        return $this->serviceId;
    }

    /**
     * Set speed.
     *
     * @param int|null $speed
     *
     * @return Quotation
     */
    public function setSpeed($speed = null)
    {
        $this->speed = $speed;

        return $this;
    }

    /**
     * Get speed.
     *
     * @return int|null
     */
    public function getSpeed()
    {
        return $this->speed;
    }

    /**
     * Set deadline.
     *
     * @param int|null $deadline
     *
     * @return Quotation
     */
    public function setDeadline($deadline = null)
    {
        $this->deadline = $deadline;

        return $this;
    }

    /**
     * Get deadline.
     *
     * @return int|null
     */
    public function getDeadline()
    {
        return $this->deadline;
    }
}
