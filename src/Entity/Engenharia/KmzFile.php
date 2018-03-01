<?php

namespace App\Entity\Engenharia;

/**
 * KmzFile
 */
class KmzFile
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
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var string|null
     */
    private $userId;

    /**
     * @var string|null
     */
    private $path;


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
     * @return KmzFile
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return KmzFile
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
     * Set userId.
     *
     * @param string|null $userId
     *
     * @return KmzFile
     */
    public function setUserId($userId = null)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId.
     *
     * @return string|null
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set path.
     *
     * @param string|null $path
     *
     * @return KmzFile
     */
    public function setPath($path = null)
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get path.
     *
     * @return string|null
     */
    public function getPath()
    {
        return $this->path;
    }
}
