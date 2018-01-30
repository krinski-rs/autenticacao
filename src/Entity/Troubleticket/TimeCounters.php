<?php

namespace App\Entity\Troubleticket;

/**
 * TimeCounters
 */
class TimeCounters
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var \DateTime
     */
    private $initialDate;

    /**
     * @var \DateTime|null
     */
    private $finalDate;

    /**
     * @var int
     */
    private $stack;

    /**
     * @var int|null
     */
    private $subcaseStatus;

    /**
     * @var int
     */
    private $reportStatus = '0';

    /**
     * @var \App\Entity\Troubleticket\Reports
     */
    private $reports;

    /**
     * @var \App\Entity\Troubleticket\Subcases
     */
    private $subcase;


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
     * Set initialDate.
     *
     * @param \DateTime $initialDate
     *
     * @return TimeCounters
     */
    public function setInitialDate($initialDate)
    {
        $this->initialDate = $initialDate;

        return $this;
    }

    /**
     * Get initialDate.
     *
     * @return \DateTime
     */
    public function getInitialDate()
    {
        return $this->initialDate;
    }

    /**
     * Set finalDate.
     *
     * @param \DateTime|null $finalDate
     *
     * @return TimeCounters
     */
    public function setFinalDate($finalDate = null)
    {
        $this->finalDate = $finalDate;

        return $this;
    }

    /**
     * Get finalDate.
     *
     * @return \DateTime|null
     */
    public function getFinalDate()
    {
        return $this->finalDate;
    }

    /**
     * Set stack.
     *
     * @param int $stack
     *
     * @return TimeCounters
     */
    public function setStack($stack)
    {
        $this->stack = $stack;

        return $this;
    }

    /**
     * Get stack.
     *
     * @return int
     */
    public function getStack()
    {
        return $this->stack;
    }

    /**
     * Set subcaseStatus.
     *
     * @param int|null $subcaseStatus
     *
     * @return TimeCounters
     */
    public function setSubcaseStatus($subcaseStatus = null)
    {
        $this->subcaseStatus = $subcaseStatus;

        return $this;
    }

    /**
     * Get subcaseStatus.
     *
     * @return int|null
     */
    public function getSubcaseStatus()
    {
        return $this->subcaseStatus;
    }

    /**
     * Set reportStatus.
     *
     * @param int $reportStatus
     *
     * @return TimeCounters
     */
    public function setReportStatus($reportStatus)
    {
        $this->reportStatus = $reportStatus;

        return $this;
    }

    /**
     * Get reportStatus.
     *
     * @return int
     */
    public function getReportStatus()
    {
        return $this->reportStatus;
    }

    /**
     * Set reports.
     *
     * @param \App\Entity\Troubleticket\Reports|null $reports
     *
     * @return TimeCounters
     */
    public function setReport(\App\Entity\Troubleticket\Reports $reports = null)
    {
        $this->reports = $reports;

        return $this;
    }

    /**
     * Get reports.
     *
     * @return \App\Entity\Troubleticket\Reports|null
     */
    public function getReport()
    {
        return $this->reports;
    }

    /**
     * Set subcase.
     *
     * @param \App\Entity\Troubleticket\Subcases|null $subcase
     *
     * @return TimeCounters
     */
    public function setSubcase(\App\Entity\Troubleticket\Subcases $subcase = null)
    {
        $this->subcase = $subcase;

        return $this;
    }

    /**
     * Get subcase.
     *
     * @return \App\Entity\Troubleticket\Subcases|null
     */
    public function getSubcase()
    {
        return $this->subcase;
    }
}
