<?php

namespace App\Entity\Comercial;

/**
 * GoalWallet
 */
class GoalWallet
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $walletId;

    /**
     * @var int|null
     */
    private $goalId;

    /**
     * @var string|null
     */
    private $score;

    /**
     * @var string|null
     */
    private $team;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var int|null
     */
    private $chanceId;


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
     * Set walletId.
     *
     * @param int|null $walletId
     *
     * @return GoalWallet
     */
    public function setWalletId($walletId = null)
    {
        $this->walletId = $walletId;

        return $this;
    }

    /**
     * Get walletId.
     *
     * @return int|null
     */
    public function getWalletId()
    {
        return $this->walletId;
    }

    /**
     * Set goalId.
     *
     * @param int|null $goalId
     *
     * @return GoalWallet
     */
    public function setGoalId($goalId = null)
    {
        $this->goalId = $goalId;

        return $this;
    }

    /**
     * Get goalId.
     *
     * @return int|null
     */
    public function getGoalId()
    {
        return $this->goalId;
    }

    /**
     * Set score.
     *
     * @param string|null $score
     *
     * @return GoalWallet
     */
    public function setScore($score = null)
    {
        $this->score = $score;

        return $this;
    }

    /**
     * Get score.
     *
     * @return string|null
     */
    public function getScore()
    {
        return $this->score;
    }

    /**
     * Set team.
     *
     * @param string|null $team
     *
     * @return GoalWallet
     */
    public function setTeam($team = null)
    {
        $this->team = $team;

        return $this;
    }

    /**
     * Get team.
     *
     * @return string|null
     */
    public function getTeam()
    {
        return $this->team;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return GoalWallet
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
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return GoalWallet
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
}
