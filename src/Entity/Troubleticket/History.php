<?php

namespace App\Entity\Troubleticket;

/**
 * History
 */
class History
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $comment;

    /**
     * @var \DateTime
     */
    private $date;

    /**
     * @var string|null
     */
    private $reason;

    /**
     * @var string|null
     */
    private $supportLevel;

    /**
     * @var int
     */
    private $reportStatus;

    /**
     * @var string|null
     */
    private $usuario;

    /**
     * @var \App\Entity\Troubleticket\Reports
     */
    private $report;

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
     * Set comment.
     *
     * @param string $comment
     *
     * @return History
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment.
     *
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set date.
     *
     * @param \DateTime $date
     *
     * @return History
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date.
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set reason.
     *
     * @param string|null $reason
     *
     * @return History
     */
    public function setReason($reason = null)
    {
        $this->reason = $reason;

        return $this;
    }

    /**
     * Get reason.
     *
     * @return string|null
     */
    public function getReason()
    {
        return $this->reason;
    }

    /**
     * Set supportLevel.
     *
     * @param string|null $supportLevel
     *
     * @return History
     */
    public function setSupportLevel($supportLevel = null)
    {
        $this->supportLevel = $supportLevel;

        return $this;
    }

    /**
     * Get supportLevel.
     *
     * @return string|null
     */
    public function getSupportLevel()
    {
        return $this->supportLevel;
    }

    /**
     * Set reportStatus.
     *
     * @param int $reportStatus
     *
     * @return History
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
     * Set usuario.
     *
     * @param string|null $usuario
     *
     * @return History
     */
    public function setUsuario($usuario = null)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario.
     *
     * @return string|null
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set report.
     *
     * @param \App\Entity\Troubleticket\Reports|null $report
     *
     * @return History
     */
    public function setReport(\App\Entity\Troubleticket\Reports $report = null)
    {
        $this->report = $report;

        return $this;
    }

    /**
     * Get report.
     *
     * @return \App\Entity\Troubleticket\Reports|null
     */
    public function getReport()
    {
        return $this->report;
    }

    /**
     * Set subcase.
     *
     * @param \App\Entity\Troubleticket\Subcases|null $subcase
     *
     * @return History
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
