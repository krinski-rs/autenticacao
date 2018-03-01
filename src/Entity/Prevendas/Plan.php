<?php

namespace App\Entity\Prevendas;

/**
 * Plan
 */
class Plan
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $feeCodigoid;

    /**
     * @var string
     */
    private $name;

    /**
     * @var int|null
     */
    private $maxDdr;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var \DateTime|null
     */
    private $dateEnd;

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
     * Set feeCodigoid.
     *
     * @param int|null $feeCodigoid
     *
     * @return Plan
     */
    public function setFeeCodigoid($feeCodigoid = null)
    {
        $this->feeCodigoid = $feeCodigoid;

        return $this;
    }

    /**
     * Get feeCodigoid.
     *
     * @return int|null
     */
    public function getFeeCodigoid()
    {
        return $this->feeCodigoid;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return Plan
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set maxDdr.
     *
     * @param int|null $maxDdr
     *
     * @return Plan
     */
    public function setMaxDdr($maxDdr = null)
    {
        $this->maxDdr = $maxDdr;

        return $this;
    }

    /**
     * Get maxDdr.
     *
     * @return int|null
     */
    public function getMaxDdr()
    {
        return $this->maxDdr;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Plan
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
     * Set dateEnd.
     *
     * @param \DateTime|null $dateEnd
     *
     * @return Plan
     */
    public function setDateEnd($dateEnd = null)
    {
        $this->dateEnd = $dateEnd;

        return $this;
    }

    /**
     * Get dateEnd.
     *
     * @return \DateTime|null
     */
    public function getDateEnd()
    {
        return $this->dateEnd;
    }

    /**
     * Set author.
     *
     * @param int|null $author
     *
     * @return Plan
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
