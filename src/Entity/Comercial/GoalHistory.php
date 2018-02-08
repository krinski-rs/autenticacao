<?php

namespace App\Entity\Comercial;

/**
 * GoalHistory
 */
class GoalHistory
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $goalWalletId;

    /**
     * @var string|null
     */
    private $score;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';


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
     * Set goalWalletId.
     *
     * @param int|null $goalWalletId
     *
     * @return GoalHistory
     */
    public function setGoalWalletId($goalWalletId = null)
    {
        $this->goalWalletId = $goalWalletId;

        return $this;
    }

    /**
     * Get goalWalletId.
     *
     * @return int|null
     */
    public function getGoalWalletId()
    {
        return $this->goalWalletId;
    }

    /**
     * Set score.
     *
     * @param string|null $score
     *
     * @return GoalHistory
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return GoalHistory
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
}
