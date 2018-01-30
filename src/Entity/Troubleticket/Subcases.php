<?php

namespace App\Entity\Troubleticket;

/**
 * Subcases
 */
class Subcases
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $team;

    /**
     * @var \DateTime|null
     */
    private $forecast;

    /**
     * @var int
     */
    private $status;

    /**
     * @var int
     */
    private $type;

    /**
     * @var string
     */
    private $code;

    /**
     * @var string|null
     */
    private $listOfMaterials;

    /**
     * @var int|null
     */
    private $idActivity;

    /**
     * @var string|null
     */
    private $activityType;

    /**
     * @var int|null
     */
    private $provider;

    /**
     * @var int|null
     */
    private $maintainer;

    /**
     * @var string|null
     */
    private $maintainerContact;

    /**
     * @var string|null
     */
    private $phone;

    /**
     * @var string|null
     */
    private $email;

    /**
     * @var string|null
     */
    private $ticket;

    /**
     * @var string|null
     */
    private $element;

    /**
     * @var string|null
     */
    private $cause;

    /**
     * @var string|null
     */
    private $problem;

    /**
     * @var string|null
     */
    private $solution;

    /**
     * @var string|null
     */
    private $comment;

    /**
     * @var int|null
     */
    private $openingUser;

    /**
     * @var int|null
     */
    private $closingUser;

    /**
     * @var int|null
     */
    private $tmeCounter;

    /**
     * @var int|null
     */
    private $pausedCounter;

    /**
     * @var int|null
     */
    private $thirdTeamCounter;

    /**
     * @var int|null
     */
    private $displacementCounter;

    /**
     * @var int|null
     */
    private $infraCounter;

    /**
     * @var int|null
     */
    private $fieldCounter;

    /**
     * @var int|null
     */
    private $clientCounter;

    /**
     * @var int|null
     */
    private $tmrCounter;

    /**
     * @var \DateTime|null
     */
    private $initialDate;

    /**
     * @var \DateTime|null
     */
    private $finalDate;

    /**
     * @var \App\Entity\Troubleticket\Reports
     */
    private $reports;


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
     * Set team.
     *
     * @param string|null $team
     *
     * @return Subcases
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
     * Set forecast.
     *
     * @param \DateTime|null $forecast
     *
     * @return Subcases
     */
    public function setForecast($forecast = null)
    {
        $this->forecast = $forecast;

        return $this;
    }

    /**
     * Get forecast.
     *
     * @return \DateTime|null
     */
    public function getForecast()
    {
        return $this->forecast;
    }

    /**
     * Set status.
     *
     * @param int $status
     *
     * @return Subcases
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status.
     *
     * @return int
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set type.
     *
     * @param int $type
     *
     * @return Subcases
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return int
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set code.
     *
     * @param string $code
     *
     * @return Subcases
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code.
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set listOfMaterials.
     *
     * @param string|null $listOfMaterials
     *
     * @return Subcases
     */
    public function setListOfMaterials($listOfMaterials = null)
    {
        $this->listOfMaterials = $listOfMaterials;

        return $this;
    }

    /**
     * Get listOfMaterials.
     *
     * @return string|null
     */
    public function getListOfMaterials()
    {
        return $this->listOfMaterials;
    }

    /**
     * Set idActivity.
     *
     * @param int|null $idActivity
     *
     * @return Subcases
     */
    public function setIdActivity($idActivity = null)
    {
        $this->idActivity = $idActivity;

        return $this;
    }

    /**
     * Get idActivity.
     *
     * @return int|null
     */
    public function getIdActivity()
    {
        return $this->idActivity;
    }

    /**
     * Set activityType.
     *
     * @param string|null $activityType
     *
     * @return Subcases
     */
    public function setActivityType($activityType = null)
    {
        $this->activityType = $activityType;

        return $this;
    }

    /**
     * Get activityType.
     *
     * @return string|null
     */
    public function getActivityType()
    {
        return $this->activityType;
    }

    /**
     * Set provider.
     *
     * @param int|null $provider
     *
     * @return Subcases
     */
    public function setProvider($provider = null)
    {
        $this->provider = $provider;

        return $this;
    }

    /**
     * Get provider.
     *
     * @return int|null
     */
    public function getProvider()
    {
        return $this->provider;
    }

    /**
     * Set maintainer.
     *
     * @param int|null $maintainer
     *
     * @return Subcases
     */
    public function setMaintainer($maintainer = null)
    {
        $this->maintainer = $maintainer;

        return $this;
    }

    /**
     * Get maintainer.
     *
     * @return int|null
     */
    public function getMaintainer()
    {
        return $this->maintainer;
    }

    /**
     * Set maintainerContact.
     *
     * @param string|null $maintainerContact
     *
     * @return Subcases
     */
    public function setMaintainerContact($maintainerContact = null)
    {
        $this->maintainerContact = $maintainerContact;

        return $this;
    }

    /**
     * Get maintainerContact.
     *
     * @return string|null
     */
    public function getMaintainerContact()
    {
        return $this->maintainerContact;
    }

    /**
     * Set phone.
     *
     * @param string|null $phone
     *
     * @return Subcases
     */
    public function setPhone($phone = null)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone.
     *
     * @return string|null
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set email.
     *
     * @param string|null $email
     *
     * @return Subcases
     */
    public function setEmail($email = null)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email.
     *
     * @return string|null
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set ticket.
     *
     * @param string|null $ticket
     *
     * @return Subcases
     */
    public function setTicket($ticket = null)
    {
        $this->ticket = $ticket;

        return $this;
    }

    /**
     * Get ticket.
     *
     * @return string|null
     */
    public function getTicket()
    {
        return $this->ticket;
    }

    /**
     * Set element.
     *
     * @param string|null $element
     *
     * @return Subcases
     */
    public function setElement($element = null)
    {
        $this->element = $element;

        return $this;
    }

    /**
     * Get element.
     *
     * @return string|null
     */
    public function getElement()
    {
        return $this->element;
    }

    /**
     * Set cause.
     *
     * @param string|null $cause
     *
     * @return Subcases
     */
    public function setCause($cause = null)
    {
        $this->cause = $cause;

        return $this;
    }

    /**
     * Get cause.
     *
     * @return string|null
     */
    public function getCause()
    {
        return $this->cause;
    }

    /**
     * Set problem.
     *
     * @param string|null $problem
     *
     * @return Subcases
     */
    public function setProblem($problem = null)
    {
        $this->problem = $problem;

        return $this;
    }

    /**
     * Get problem.
     *
     * @return string|null
     */
    public function getProblem()
    {
        return $this->problem;
    }

    /**
     * Set solution.
     *
     * @param string|null $solution
     *
     * @return Subcases
     */
    public function setSolution($solution = null)
    {
        $this->solution = $solution;

        return $this;
    }

    /**
     * Get solution.
     *
     * @return string|null
     */
    public function getSolution()
    {
        return $this->solution;
    }

    /**
     * Set comment.
     *
     * @param string|null $comment
     *
     * @return Subcases
     */
    public function setComment($comment = null)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment.
     *
     * @return string|null
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set openingUser.
     *
     * @param int|null $openingUser
     *
     * @return Subcases
     */
    public function setOpeningUser($openingUser = null)
    {
        $this->openingUser = $openingUser;

        return $this;
    }

    /**
     * Get openingUser.
     *
     * @return int|null
     */
    public function getOpeningUser()
    {
        return $this->openingUser;
    }

    /**
     * Set closingUser.
     *
     * @param int|null $closingUser
     *
     * @return Subcases
     */
    public function setClosingUser($closingUser = null)
    {
        $this->closingUser = $closingUser;

        return $this;
    }

    /**
     * Get closingUser.
     *
     * @return int|null
     */
    public function getClosingUser()
    {
        return $this->closingUser;
    }

    /**
     * Set tmeCounter.
     *
     * @param int|null $tmeCounter
     *
     * @return Subcases
     */
    public function setTmeCounter($tmeCounter = null)
    {
        $this->tmeCounter = $tmeCounter;

        return $this;
    }

    /**
     * Get tmeCounter.
     *
     * @return int|null
     */
    public function getTmeCounter()
    {
        return $this->tmeCounter;
    }

    /**
     * Set pausedCounter.
     *
     * @param int|null $pausedCounter
     *
     * @return Subcases
     */
    public function setPausedCounter($pausedCounter = null)
    {
        $this->pausedCounter = $pausedCounter;

        return $this;
    }

    /**
     * Get pausedCounter.
     *
     * @return int|null
     */
    public function getPausedCounter()
    {
        return $this->pausedCounter;
    }

    /**
     * Set thirdTeamCounter.
     *
     * @param int|null $thirdTeamCounter
     *
     * @return Subcases
     */
    public function setThirdTeamCounter($thirdTeamCounter = null)
    {
        $this->thirdTeamCounter = $thirdTeamCounter;

        return $this;
    }

    /**
     * Get thirdTeamCounter.
     *
     * @return int|null
     */
    public function getThirdTeamCounter()
    {
        return $this->thirdTeamCounter;
    }

    /**
     * Set displacementCounter.
     *
     * @param int|null $displacementCounter
     *
     * @return Subcases
     */
    public function setDisplacementCounter($displacementCounter = null)
    {
        $this->displacementCounter = $displacementCounter;

        return $this;
    }

    /**
     * Get displacementCounter.
     *
     * @return int|null
     */
    public function getDisplacementCounter()
    {
        return $this->displacementCounter;
    }

    /**
     * Set infraCounter.
     *
     * @param int|null $infraCounter
     *
     * @return Subcases
     */
    public function setInfraCounter($infraCounter = null)
    {
        $this->infraCounter = $infraCounter;

        return $this;
    }

    /**
     * Get infraCounter.
     *
     * @return int|null
     */
    public function getInfraCounter()
    {
        return $this->infraCounter;
    }

    /**
     * Set fieldCounter.
     *
     * @param int|null $fieldCounter
     *
     * @return Subcases
     */
    public function setFieldCounter($fieldCounter = null)
    {
        $this->fieldCounter = $fieldCounter;

        return $this;
    }

    /**
     * Get fieldCounter.
     *
     * @return int|null
     */
    public function getFieldCounter()
    {
        return $this->fieldCounter;
    }

    /**
     * Set clientCounter.
     *
     * @param int|null $clientCounter
     *
     * @return Subcases
     */
    public function setClientCounter($clientCounter = null)
    {
        $this->clientCounter = $clientCounter;

        return $this;
    }

    /**
     * Get clientCounter.
     *
     * @return int|null
     */
    public function getClientCounter()
    {
        return $this->clientCounter;
    }

    /**
     * Set tmrCounter.
     *
     * @param int|null $tmrCounter
     *
     * @return Subcases
     */
    public function setTmrCounter($tmrCounter = null)
    {
        $this->tmrCounter = $tmrCounter;

        return $this;
    }

    /**
     * Get tmrCounter.
     *
     * @return int|null
     */
    public function getTmrCounter()
    {
        return $this->tmrCounter;
    }

    /**
     * Set initialDate.
     *
     * @param \DateTime|null $initialDate
     *
     * @return Subcases
     */
    public function setInitialDate($initialDate = null)
    {
        $this->initialDate = $initialDate;

        return $this;
    }

    /**
     * Get initialDate.
     *
     * @return \DateTime|null
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
     * @return Subcases
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
     * Set reports.
     *
     * @param \App\Entity\Troubleticket\Reports|null $reports
     *
     * @return Subcases
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
}
