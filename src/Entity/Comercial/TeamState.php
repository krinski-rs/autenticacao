<?php

namespace App\Entity\Comercial;

/**
 * TeamState
 */
class TeamState
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
     * @var string
     */
    private $teamstateUf;

    /**
     * @var \DateTime
     */
    private $teamstateDateRecord = 'now()';

    /**
     * @var bool
     */
    private $teamstateActive = true;


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
     * @return TeamState
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
     * Set teamstateUf.
     *
     * @param string $teamstateUf
     *
     * @return TeamState
     */
    public function setTeamstateUf($teamstateUf)
    {
        $this->teamstateUf = $teamstateUf;

        return $this;
    }

    /**
     * Get teamstateUf.
     *
     * @return string
     */
    public function getTeamstateUf()
    {
        return $this->teamstateUf;
    }

    /**
     * Set teamstateDateRecord.
     *
     * @param \DateTime $teamstateDateRecord
     *
     * @return TeamState
     */
    public function setTeamstateDateRecord($teamstateDateRecord)
    {
        $this->teamstateDateRecord = $teamstateDateRecord;

        return $this;
    }

    /**
     * Get teamstateDateRecord.
     *
     * @return \DateTime
     */
    public function getTeamstateDateRecord()
    {
        return $this->teamstateDateRecord;
    }

    /**
     * Set teamstateActive.
     *
     * @param bool $teamstateActive
     *
     * @return TeamState
     */
    public function setTeamstateActive($teamstateActive)
    {
        $this->teamstateActive = $teamstateActive;

        return $this;
    }

    /**
     * Get teamstateActive.
     *
     * @return bool
     */
    public function getTeamstateActive()
    {
        return $this->teamstateActive;
    }
}
