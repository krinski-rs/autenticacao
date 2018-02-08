<?php

namespace App\Entity\Comercial;

/**
 * FollowupContact
 */
class FollowupContact
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $sistechId;

    /**
     * @var int|null
     */
    private $chanceContactId;

    /**
     * @var int|null
     */
    private $followupId;


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
     * Set sistechId.
     *
     * @param int|null $sistechId
     *
     * @return FollowupContact
     */
    public function setSistechId($sistechId = null)
    {
        $this->sistechId = $sistechId;

        return $this;
    }

    /**
     * Get sistechId.
     *
     * @return int|null
     */
    public function getSistechId()
    {
        return $this->sistechId;
    }

    /**
     * Set chanceContactId.
     *
     * @param int|null $chanceContactId
     *
     * @return FollowupContact
     */
    public function setChanceContactId($chanceContactId = null)
    {
        $this->chanceContactId = $chanceContactId;

        return $this;
    }

    /**
     * Get chanceContactId.
     *
     * @return int|null
     */
    public function getChanceContactId()
    {
        return $this->chanceContactId;
    }

    /**
     * Set followupId.
     *
     * @param int|null $followupId
     *
     * @return FollowupContact
     */
    public function setFollowupId($followupId = null)
    {
        $this->followupId = $followupId;

        return $this;
    }

    /**
     * Get followupId.
     *
     * @return int|null
     */
    public function getFollowupId()
    {
        return $this->followupId;
    }
}
