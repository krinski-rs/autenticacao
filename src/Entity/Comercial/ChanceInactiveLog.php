<?php

namespace App\Entity\Comercial;

/**
 * ChanceInactiveLog
 */
class ChanceInactiveLog
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $chanceInactiveId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var int|null
     */
    private $user;

    /**
     * @var int|null
     */
    private $ev;


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
     * Set chanceInactiveId.
     *
     * @param int|null $chanceInactiveId
     *
     * @return ChanceInactiveLog
     */
    public function setChanceInactiveId($chanceInactiveId = null)
    {
        $this->chanceInactiveId = $chanceInactiveId;

        return $this;
    }

    /**
     * Get chanceInactiveId.
     *
     * @return int|null
     */
    public function getChanceInactiveId()
    {
        return $this->chanceInactiveId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return ChanceInactiveLog
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
     * Set user.
     *
     * @param int|null $user
     *
     * @return ChanceInactiveLog
     */
    public function setUser($user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user.
     *
     * @return int|null
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set ev.
     *
     * @param int|null $ev
     *
     * @return ChanceInactiveLog
     */
    public function setEv($ev = null)
    {
        $this->ev = $ev;

        return $this;
    }

    /**
     * Get ev.
     *
     * @return int|null
     */
    public function getEv()
    {
        return $this->ev;
    }
}
