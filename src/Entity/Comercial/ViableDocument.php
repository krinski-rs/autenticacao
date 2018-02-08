<?php

namespace App\Entity\Comercial;

/**
 * ViableDocument
 */
class ViableDocument
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $viableId;

    /**
     * @var int|null
     */
    private $documentId;

    /**
     * @var int
     */
    private $author;

    /**
     * @var bool
     */
    private $active;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var string|null
     */
    private $filename;

    /**
     * @var string
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
     * Set viableId.
     *
     * @param int $viableId
     *
     * @return ViableDocument
     */
    public function setViableId($viableId)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set documentId.
     *
     * @param int|null $documentId
     *
     * @return ViableDocument
     */
    public function setDocumentId($documentId = null)
    {
        $this->documentId = $documentId;

        return $this;
    }

    /**
     * Get documentId.
     *
     * @return int|null
     */
    public function getDocumentId()
    {
        return $this->documentId;
    }

    /**
     * Set author.
     *
     * @param int $author
     *
     * @return ViableDocument
     */
    public function setAuthor($author)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author.
     *
     * @return int
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return ViableDocument
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ViableDocument
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
     * Set filename.
     *
     * @param string|null $filename
     *
     * @return ViableDocument
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
     * Set path.
     *
     * @param string $path
     *
     * @return ViableDocument
     */
    public function setPath($path)
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get path.
     *
     * @return string
     */
    public function getPath()
    {
        return $this->path;
    }
}
