<?php

namespace App\Entity\Comercial;

/**
 * Ranking
 */
class Ranking
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $points;

    /**
     * @var string|null
     */
    private $team;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var int|null
     */
    private $total;

    /**
     * @var int|null
     */
    private $ciclo = '1';


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
     * Set points.
     *
     * @param int|null $points
     *
     * @return Ranking
     */
    public function setPoints($points = null)
    {
        $this->points = $points;

        return $this;
    }

    /**
     * Get points.
     *
     * @return int|null
     */
    public function getPoints()
    {
        return $this->points;
    }

    /**
     * Set team.
     *
     * @param string|null $team
     *
     * @return Ranking
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
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Ranking
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
     * Set total.
     *
     * @param int|null $total
     *
     * @return Ranking
     */
    public function setTotal($total = null)
    {
        $this->total = $total;

        return $this;
    }

    /**
     * Get total.
     *
     * @return int|null
     */
    public function getTotal()
    {
        return $this->total;
    }

    /**
     * Set ciclo.
     *
     * @param int|null $ciclo
     *
     * @return Ranking
     */
    public function setCiclo($ciclo = null)
    {
        $this->ciclo = $ciclo;

        return $this;
    }

    /**
     * Get ciclo.
     *
     * @return int|null
     */
    public function getCiclo()
    {
        return $this->ciclo;
    }
}
