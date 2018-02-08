<?php

namespace App\Entity\Comercial;

/**
 * ProposalOdt
 */
class ProposalOdt
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $filename;

    /**
     * @var int|null
     */
    private $serviceId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var bool|null
     */
    private $active;


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
     * Set filename.
     *
     * @param string|null $filename
     *
     * @return ProposalOdt
     */
    public function setFilename($filename = null)
    {
        $this->filename = $filename;

        return $this;
    }

    /**
     * Get filename.
     *
     * @return string|null
     */
    public function getFilename()
    {
        return $this->filename;
    }

    /**
     * Set serviceId.
     *
     * @param int|null $serviceId
     *
     * @return ProposalOdt
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ProposalOdt
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
     * @return ProposalOdt
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
     * Set active.
     *
     * @param bool|null $active
     *
     * @return ProposalOdt
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
}
