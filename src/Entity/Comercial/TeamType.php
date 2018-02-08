<?php

namespace App\Entity\Comercial;

/**
 * TeamType
 */
class TeamType
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $teamtypeName;

    /**
     * @var \DateTime
     */
    private $teamtypeDateRecord = 'now()';

    /**
     * @var bool
     */
    private $teamtypeActive = true;


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
     * Set teamtypeName.
     *
     * @param string|null $teamtypeName
     *
     * @return TeamType
     */
    public function setTeamtypeName($teamtypeName = null)
    {
        $this->teamtypeName = $teamtypeName;

        return $this;
    }

    /**
     * Get teamtypeName.
     *
     * @return string|null
     */
    public function getTeamtypeName()
    {
        return $this->teamtypeName;
    }

    /**
     * Set teamtypeDateRecord.
     *
     * @param \DateTime $teamtypeDateRecord
     *
     * @return TeamType
     */
    public function setTeamtypeDateRecord($teamtypeDateRecord)
    {
        $this->teamtypeDateRecord = $teamtypeDateRecord;

        return $this;
    }

    /**
     * Get teamtypeDateRecord.
     *
     * @return \DateTime
     */
    public function getTeamtypeDateRecord()
    {
        return $this->teamtypeDateRecord;
    }

    /**
     * Set teamtypeActive.
     *
     * @param bool $teamtypeActive
     *
     * @return TeamType
     */
    public function setTeamtypeActive($teamtypeActive)
    {
        $this->teamtypeActive = $teamtypeActive;

        return $this;
    }

    /**
     * Get teamtypeActive.
     *
     * @return bool
     */
    public function getTeamtypeActive()
    {
        return $this->teamtypeActive;
    }
}
