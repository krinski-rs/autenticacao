<?php

namespace App\Entity\Comercial;

/**
 * TeamUser
 */
class TeamUser
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $teamId;

    /**
     * @var int
     */
    private $userId;

    /**
     * @var \DateTime
     */
    private $teamuserDateRecord = 'now()';

    /**
     * @var bool
     */
    private $teamuserActive = true;


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
     * Set teamId.
     *
     * @param int $teamId
     *
     * @return TeamUser
     */
    public function setTeamId($teamId)
    {
        $this->teamId = $teamId;

        return $this;
    }

    /**
     * Get teamId.
     *
     * @return int
     */
    public function getTeamId()
    {
        return $this->teamId;
    }

    /**
     * Set userId.
     *
     * @param int $userId
     *
     * @return TeamUser
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId.
     *
     * @return int
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set teamuserDateRecord.
     *
     * @param \DateTime $teamuserDateRecord
     *
     * @return TeamUser
     */
    public function setTeamuserDateRecord($teamuserDateRecord)
    {
        $this->teamuserDateRecord = $teamuserDateRecord;

        return $this;
    }

    /**
     * Get teamuserDateRecord.
     *
     * @return \DateTime
     */
    public function getTeamuserDateRecord()
    {
        return $this->teamuserDateRecord;
    }

    /**
     * Set teamuserActive.
     *
     * @param bool $teamuserActive
     *
     * @return TeamUser
     */
    public function setTeamuserActive($teamuserActive)
    {
        $this->teamuserActive = $teamuserActive;

        return $this;
    }

    /**
     * Get teamuserActive.
     *
     * @return bool
     */
    public function getTeamuserActive()
    {
        return $this->teamuserActive;
    }
}
