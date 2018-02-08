<?php

namespace App\Entity\Comercial;

/**
 * ChanceInactive
 */
class ChanceInactive
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var \DateTime|null
     */
    private $recordDate = 'now()';

    /**
     * @var bool|null
     */
    private $active = true;


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
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return ChanceInactive
     */
    public function setChanceId($chanceId = null)
    {
        $this->chanceId = $chanceId;

        return $this;
    }

    /**
     * Get chanceId.
     *
     * @return int|null
     */
    public function getChanceId()
    {
        return $this->chanceId;
    }

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return ChanceInactive
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set recordDate.
     *
     * @param \DateTime|null $recordDate
     *
     * @return ChanceInactive
     */
    public function setRecordDate($recordDate = null)
    {
        $this->recordDate = $recordDate;

        return $this;
    }

    /**
     * Get recordDate.
     *
     * @return \DateTime|null
     */
    public function getRecordDate()
    {
        return $this->recordDate;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return ChanceInactive
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
