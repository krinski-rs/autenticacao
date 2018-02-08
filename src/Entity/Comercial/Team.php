<?php

namespace App\Entity\Comercial;

/**
 * Team
 */
class Team
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $teamtypeId;

    /**
     * @var string|null
     */
    private $teamName;

    /**
     * @var bool
     */
    private $teamActive = true;

    /**
     * @var \DateTime
     */
    private $teamDateRecord = 'now()';


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
     * Set teamtypeId.
     *
     * @param int $teamtypeId
     *
     * @return Team
     */
    public function setTeamtypeId($teamtypeId)
    {
        $this->teamtypeId = $teamtypeId;

        return $this;
    }

    /**
     * Get teamtypeId.
     *
     * @return int
     */
    public function getTeamtypeId()
    {
        return $this->teamtypeId;
    }

    /**
     * Set teamName.
     *
     * @param string|null $teamName
     *
     * @return Team
     */
    public function setTeamName($teamName = null)
    {
        $this->teamName = $teamName;

        return $this;
    }

    /**
     * Get teamName.
     *
     * @return string|null
     */
    public function getTeamName()
    {
        return $this->teamName;
    }

    /**
     * Set teamActive.
     *
     * @param bool $teamActive
     *
     * @return Team
     */
    public function setTeamActive($teamActive)
    {
        $this->teamActive = $teamActive;

        return $this;
    }

    /**
     * Get teamActive.
     *
     * @return bool
     */
    public function getTeamActive()
    {
        return $this->teamActive;
    }

    /**
     * Set teamDateRecord.
     *
     * @param \DateTime $teamDateRecord
     *
     * @return Team
     */
    public function setTeamDateRecord($teamDateRecord)
    {
        $this->teamDateRecord = $teamDateRecord;

        return $this;
    }

    /**
     * Get teamDateRecord.
     *
     * @return \DateTime
     */
    public function getTeamDateRecord()
    {
        return $this->teamDateRecord;
    }
}
