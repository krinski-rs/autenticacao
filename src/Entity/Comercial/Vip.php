<?php

namespace App\Entity\Comercial;

/**
 * Vip
 */
class Vip
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $userId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var int|null
     */
    private $levelId;


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
     * Set userId.
     *
     * @param int|null $userId
     *
     * @return Vip
     */
    public function setUserId($userId = null)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId.
     *
     * @return int|null
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Vip
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
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Vip
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

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return Vip
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
     * Set levelId.
     *
     * @param int|null $levelId
     *
     * @return Vip
     */
    public function setLevelId($levelId = null)
    {
        $this->levelId = $levelId;

        return $this;
    }

    /**
     * Get levelId.
     *
     * @return int|null
     */
    public function getLevelId()
    {
        return $this->levelId;
    }
}
