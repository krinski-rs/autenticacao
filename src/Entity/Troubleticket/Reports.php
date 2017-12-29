<?php

namespace App\Entity\Troubleticket;

/**
 * Reports
 */
abstract class Reports
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $circuitId;

    /**
     * @var string
     */
    private $designation;

    /**
     * @var \DateTime
     */
    private $initialDate;

    /**
     * @var \DateTime|null
     */
    private $finalDate;

    /**
     * @var string|null
     */
    private $description;

    /**
     * @var int
     */
    private $stack;

    /**
     * @var string|null
     */
    private $operatorReportIdentifier;

    /**
     * @var string|null
     */
    private $responsible;

    /**
     * @var string|null
     */
    private $requesterName;

    /**
     * @var string|null
     */
    private $requesterPhone;

    /**
     * @var string|null
     */
    private $requesterEmail;

    /**
     * @var string|null
     */
    private $cause;

    /**
     * @var string|null
     */
    private $failure;

    /**
     * @var string|null
     */
    private $failureLocal;

    /**
     * @var string|null
     */
    private $problem;

    /**
     * @var int
     */
    private $status;

    /**
     * @var string|null
     */
    private $solution;

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
    private $solvedCounter;

    /**
     * @var int|null
     */
    private $tmrCounter;

    /**
     * @var int|null
     */
    private $nocCounter;

    /**
     * @var int|null
     */
    private $sn1Counter;

    /**
     * @var int|null
     */
    private $sn2Counter;

    /**
     * @var int|null
     */
    private $cocCounter;

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
    private $sn1;

    /**
     * @var int|null
     */
    private $sn2;

    /**
     * @var string
     */
    private $code;

    /**
     * @var string|null
     */
    private $closeReason;

    /**
     * @var int|null
     */
    private $symptom;

    /**
     * @var string|null
     */
    private $stretch;

    /**
     * @var int|null
     */
    private $sn3;

    /**
     * @var int|null
     */
    private $sn3Counter;

    /**
     * @var int|null
     */
    private $voz;

    /**
     * @var int|null
     */
    private $vozCounter;

    /**
     * @var \DateTime|null
     */
    private $lastUpdate;

    /**
     * @var string
     */
    private $issue = '0';

    /**
     * @var bool
     */
    private $createdByClient;

    /**
     * @var int|null
     */
    private $serviceChannel;

    /**
     * @var int|null
     */
    private $closedSymptom;

    /**
     * @var string|null
     */
    private $structure;

    /**
     * @var string|null
     */
    private $element;

    /**
     * @var int|null
     */
    private $popId;

    /**
     * @var int|null
     */
    private $providerId;

    /**
     * @var string|null
     */
    private $incident;

    /**
     * @var int|null
     */
    private $createdBySystem;

    /**
     * @var int|null
     */
    private $mantainerCounter;

    /**
     * @var \DateTime|null
     */
    private $firstCombat;

    /**
     * @var \DateTime|null
     */
    private $reopenDate;

    /**
     * @var string|null
     */
    private $attendanceProtocol;

    /**
     * @var int|null
     */
    private $openingClassification;

    /**
     * @var int|null
     */
    private $serviceType;

    /**
     * @var int|null
     */
    private $monitoringCounter;

    /**
     * @var int|null
     */
    private $openingUser;

    /**
     * @var int|null
     */
    private $closingUser;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @access private
     */
    private $timeCounters;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @access private
     */
    private $subcases;
    
    public function __construct()
    {
        $this->timeCounters = new \Doctrine\Common\Collections\ArrayCollection();
        $this->subcases = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
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
     * Set circuitId.
     *
     * @param int $circuitId
     *
     * @return Reports
     */
    public function setCircuitId($circuitId)
    {
        $this->circuitId = $circuitId;

        return $this;
    }

    /**
     * Get circuitId.
     *
     * @return int
     */
    public function getCircuitId()
    {
        return $this->circuitId;
    }

    /**
     * Set designation.
     *
     * @param string $designation
     *
     * @return Reports
     */
    public function setDesignation($designation)
    {
        $this->designation = $designation;

        return $this;
    }

    /**
     * Get designation.
     *
     * @return string
     */
    public function getDesignation()
    {
        return $this->designation;
    }

    /**
     * Set initialDate.
     *
     * @param \DateTime $initialDate
     *
     * @return Reports
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
     * @return Reports
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
     * Set description.
     *
     * @param string|null $description
     *
     * @return Reports
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set stack.
     *
     * @param int $stack
     *
     * @return Reports
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
     * Set operatorReportIdentifier.
     *
     * @param string|null $operatorReportIdentifier
     *
     * @return Reports
     */
    public function setOperatorReportIdentifier($operatorReportIdentifier = null)
    {
        $this->operatorReportIdentifier = $operatorReportIdentifier;

        return $this;
    }

    /**
     * Get operatorReportIdentifier.
     *
     * @return string|null
     */
    public function getOperatorReportIdentifier()
    {
        return $this->operatorReportIdentifier;
    }

    /**
     * Set responsible.
     *
     * @param string|null $responsible
     *
     * @return Reports
     */
    public function setResponsible($responsible = null)
    {
        $this->responsible = $responsible;

        return $this;
    }

    /**
     * Get responsible.
     *
     * @return string|null
     */
    public function getResponsible()
    {
        return $this->responsible;
    }

    /**
     * Set requesterName.
     *
     * @param string|null $requesterName
     *
     * @return Reports
     */
    public function setRequesterName($requesterName = null)
    {
        $this->requesterName = $requesterName;

        return $this;
    }

    /**
     * Get requesterName.
     *
     * @return string|null
     */
    public function getRequesterName()
    {
        return $this->requesterName;
    }

    /**
     * Set requesterPhone.
     *
     * @param string|null $requesterPhone
     *
     * @return Reports
     */
    public function setRequesterPhone($requesterPhone = null)
    {
        $this->requesterPhone = $requesterPhone;

        return $this;
    }

    /**
     * Get requesterPhone.
     *
     * @return string|null
     */
    public function getRequesterPhone()
    {
        return $this->requesterPhone;
    }

    /**
     * Set requesterEmail.
     *
     * @param string|null $requesterEmail
     *
     * @return Reports
     */
    public function setRequesterEmail($requesterEmail = null)
    {
        $this->requesterEmail = $requesterEmail;

        return $this;
    }

    /**
     * Get requesterEmail.
     *
     * @return string|null
     */
    public function getRequesterEmail()
    {
        return $this->requesterEmail;
    }

    /**
     * Set cause.
     *
     * @param string|null $cause
     *
     * @return Reports
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
     * Set failure.
     *
     * @param string|null $failure
     *
     * @return Reports
     */
    public function setFailure($failure = null)
    {
        $this->failure = $failure;

        return $this;
    }

    /**
     * Get failure.
     *
     * @return string|null
     */
    public function getFailure()
    {
        return $this->failure;
    }

    /**
     * Set failureLocal.
     *
     * @param string|null $failureLocal
     *
     * @return Reports
     */
    public function setFailureLocal($failureLocal = null)
    {
        $this->failureLocal = $failureLocal;

        return $this;
    }

    /**
     * Get failureLocal.
     *
     * @return string|null
     */
    public function getFailureLocal()
    {
        return $this->failureLocal;
    }

    /**
     * Set problem.
     *
     * @param string|null $problem
     *
     * @return Reports
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
     * Set status.
     *
     * @param int $status
     *
     * @return Reports
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
     * Set solution.
     *
     * @param string|null $solution
     *
     * @return Reports
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
     * Set tmeCounter.
     *
     * @param int|null $tmeCounter
     *
     * @return Reports
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
     * @return Reports
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
     * Set solvedCounter.
     *
     * @param int|null $solvedCounter
     *
     * @return Reports
     */
    public function setSolvedCounter($solvedCounter = null)
    {
        $this->solvedCounter = $solvedCounter;

        return $this;
    }

    /**
     * Get solvedCounter.
     *
     * @return int|null
     */
    public function getSolvedCounter()
    {
        return $this->solvedCounter;
    }

    /**
     * Set tmrCounter.
     *
     * @param int|null $tmrCounter
     *
     * @return Reports
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
     * Set nocCounter.
     *
     * @param int|null $nocCounter
     *
     * @return Reports
     */
    public function setNocCounter($nocCounter = null)
    {
        $this->nocCounter = $nocCounter;

        return $this;
    }

    /**
     * Get nocCounter.
     *
     * @return int|null
     */
    public function getNocCounter()
    {
        return $this->nocCounter;
    }

    /**
     * Set sn1Counter.
     *
     * @param int|null $sn1Counter
     *
     * @return Reports
     */
    public function setSn1Counter($sn1Counter = null)
    {
        $this->sn1Counter = $sn1Counter;

        return $this;
    }

    /**
     * Get sn1Counter.
     *
     * @return int|null
     */
    public function getSn1Counter()
    {
        return $this->sn1Counter;
    }

    /**
     * Set sn2Counter.
     *
     * @param int|null $sn2Counter
     *
     * @return Reports
     */
    public function setSn2Counter($sn2Counter = null)
    {
        $this->sn2Counter = $sn2Counter;

        return $this;
    }

    /**
     * Get sn2Counter.
     *
     * @return int|null
     */
    public function getSn2Counter()
    {
        return $this->sn2Counter;
    }

    /**
     * Set cocCounter.
     *
     * @param int|null $cocCounter
     *
     * @return Reports
     */
    public function setCocCounter($cocCounter = null)
    {
        $this->cocCounter = $cocCounter;

        return $this;
    }

    /**
     * Get cocCounter.
     *
     * @return int|null
     */
    public function getCocCounter()
    {
        return $this->cocCounter;
    }

    /**
     * Set displacementCounter.
     *
     * @param int|null $displacementCounter
     *
     * @return Reports
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
     * @return Reports
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
     * @return Reports
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
     * @return Reports
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
     * Set sn1.
     *
     * @param int|null $sn1
     *
     * @return Reports
     */
    public function setSn1($sn1 = null)
    {
        $this->sn1 = $sn1;

        return $this;
    }

    /**
     * Get sn1.
     *
     * @return int|null
     */
    public function getSn1()
    {
        return $this->sn1;
    }

    /**
     * Set sn2.
     *
     * @param int|null $sn2
     *
     * @return Reports
     */
    public function setSn2($sn2 = null)
    {
        $this->sn2 = $sn2;

        return $this;
    }

    /**
     * Get sn2.
     *
     * @return int|null
     */
    public function getSn2()
    {
        return $this->sn2;
    }

    /**
     * Set code.
     *
     * @param string $code
     *
     * @return Reports
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
     * Set closeReason.
     *
     * @param string|null $closeReason
     *
     * @return Reports
     */
    public function setCloseReason($closeReason = null)
    {
        $this->closeReason = $closeReason;

        return $this;
    }

    /**
     * Get closeReason.
     *
     * @return string|null
     */
    public function getCloseReason()
    {
        return $this->closeReason;
    }

    /**
     * Set symptom.
     *
     * @param int|null $symptom
     *
     * @return Reports
     */
    public function setSymptom($symptom = null)
    {
        $this->symptom = $symptom;

        return $this;
    }

    /**
     * Get symptom.
     *
     * @return int|null
     */
    public function getSymptom()
    {
        return $this->symptom;
    }

    /**
     * Set stretch.
     *
     * @param string|null $stretch
     *
     * @return Reports
     */
    public function setStretch($stretch = null)
    {
        $this->stretch = $stretch;

        return $this;
    }

    /**
     * Get stretch.
     *
     * @return string|null
     */
    public function getStretch()
    {
        return $this->stretch;
    }

    /**
     * Set sn3.
     *
     * @param int|null $sn3
     *
     * @return Reports
     */
    public function setSn3($sn3 = null)
    {
        $this->sn3 = $sn3;

        return $this;
    }

    /**
     * Get sn3.
     *
     * @return int|null
     */
    public function getSn3()
    {
        return $this->sn3;
    }

    /**
     * Set sn3Counter.
     *
     * @param int|null $sn3Counter
     *
     * @return Reports
     */
    public function setSn3Counter($sn3Counter = null)
    {
        $this->sn3Counter = $sn3Counter;

        return $this;
    }

    /**
     * Get sn3Counter.
     *
     * @return int|null
     */
    public function getSn3Counter()
    {
        return $this->sn3Counter;
    }

    /**
     * Set voz.
     *
     * @param int|null $voz
     *
     * @return Reports
     */
    public function setVoz($voz = null)
    {
        $this->voz = $voz;

        return $this;
    }

    /**
     * Get voz.
     *
     * @return int|null
     */
    public function getVoz()
    {
        return $this->voz;
    }

    /**
     * Set vozCounter.
     *
     * @param int|null $vozCounter
     *
     * @return Reports
     */
    public function setVozCounter($vozCounter = null)
    {
        $this->vozCounter = $vozCounter;

        return $this;
    }

    /**
     * Get vozCounter.
     *
     * @return int|null
     */
    public function getVozCounter()
    {
        return $this->vozCounter;
    }

    /**
     * Set lastUpdate.
     *
     * @param \DateTime|null $lastUpdate
     *
     * @return Reports
     */
    public function setLastUpdate($lastUpdate = null)
    {
        $this->lastUpdate = $lastUpdate;

        return $this;
    }

    /**
     * Get lastUpdate.
     *
     * @return \DateTime|null
     */
    public function getLastUpdate()
    {
        return $this->lastUpdate;
    }

    /**
     * Set issue.
     *
     * @param string $issue
     *
     * @return Reports
     */
    public function setIssue($issue)
    {
        $this->issue = $issue;

        return $this;
    }

    /**
     * Get issue.
     *
     * @return string
     */
    public function getIssue()
    {
        return $this->issue;
    }

    /**
     * Set createdByClient.
     *
     * @param bool $createdByClient
     *
     * @return Reports
     */
    public function setCreatedByClient($createdByClient)
    {
        $this->createdByClient = $createdByClient;

        return $this;
    }

    /**
     * Get createdByClient.
     *
     * @return bool
     */
    public function getCreatedByClient()
    {
        return $this->createdByClient;
    }

    /**
     * Set serviceChannel.
     *
     * @param int|null $serviceChannel
     *
     * @return Reports
     */
    public function setServiceChannel($serviceChannel = null)
    {
        $this->serviceChannel = $serviceChannel;

        return $this;
    }

    /**
     * Get serviceChannel.
     *
     * @return int|null
     */
    public function getServiceChannel()
    {
        return $this->serviceChannel;
    }

    /**
     * Set closedSymptom.
     *
     * @param int|null $closedSymptom
     *
     * @return Reports
     */
    public function setClosedSymptom($closedSymptom = null)
    {
        $this->closedSymptom = $closedSymptom;

        return $this;
    }

    /**
     * Get closedSymptom.
     *
     * @return int|null
     */
    public function getClosedSymptom()
    {
        return $this->closedSymptom;
    }

    /**
     * Set structure.
     *
     * @param string|null $structure
     *
     * @return Reports
     */
    public function setStructure($structure = null)
    {
        $this->structure = $structure;

        return $this;
    }

    /**
     * Get structure.
     *
     * @return string|null
     */
    public function getStructure()
    {
        return $this->structure;
    }

    /**
     * Set element.
     *
     * @param string|null $element
     *
     * @return Reports
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
     * Set popId.
     *
     * @param int|null $popId
     *
     * @return Reports
     */
    public function setPopId($popId = null)
    {
        $this->popId = $popId;

        return $this;
    }

    /**
     * Get popId.
     *
     * @return int|null
     */
    public function getPopId()
    {
        return $this->popId;
    }

    /**
     * Set providerId.
     *
     * @param int|null $providerId
     *
     * @return Reports
     */
    public function setProviderId($providerId = null)
    {
        $this->providerId = $providerId;

        return $this;
    }

    /**
     * Get providerId.
     *
     * @return int|null
     */
    public function getProviderId()
    {
        return $this->providerId;
    }

    /**
     * Set incident.
     *
     * @param string|null $incident
     *
     * @return Reports
     */
    public function setIncident($incident = null)
    {
        $this->incident = $incident;

        return $this;
    }

    /**
     * Get incident.
     *
     * @return string|null
     */
    public function getIncident()
    {
        return $this->incident;
    }

    /**
     * Set createdBySystem.
     *
     * @param int|null $createdBySystem
     *
     * @return Reports
     */
    public function setCreatedBySystem($createdBySystem = null)
    {
        $this->createdBySystem = $createdBySystem;

        return $this;
    }

    /**
     * Get createdBySystem.
     *
     * @return int|null
     */
    public function getCreatedBySystem()
    {
        return $this->createdBySystem;
    }

    /**
     * Set mantainerCounter.
     *
     * @param int|null $mantainerCounter
     *
     * @return Reports
     */
    public function setMantainerCounter($mantainerCounter = null)
    {
        $this->mantainerCounter = $mantainerCounter;

        return $this;
    }

    /**
     * Get mantainerCounter.
     *
     * @return int|null
     */
    public function getMantainerCounter()
    {
        return $this->mantainerCounter;
    }

    /**
     * Set firstCombat.
     *
     * @param \DateTime|null $firstCombat
     *
     * @return Reports
     */
    public function setFirstCombat($firstCombat = null)
    {
        $this->firstCombat = $firstCombat;

        return $this;
    }

    /**
     * Get firstCombat.
     *
     * @return \DateTime|null
     */
    public function getFirstCombat()
    {
        return $this->firstCombat;
    }

    /**
     * Set reopenDate.
     *
     * @param \DateTime|null $reopenDate
     *
     * @return Reports
     */
    public function setReopenDate($reopenDate = null)
    {
        $this->reopenDate = $reopenDate;

        return $this;
    }

    /**
     * Get reopenDate.
     *
     * @return \DateTime|null
     */
    public function getReopenDate()
    {
        return $this->reopenDate;
    }

    /**
     * Set attendanceProtocol.
     *
     * @param string|null $attendanceProtocol
     *
     * @return Reports
     */
    public function setAttendanceProtocol($attendanceProtocol = null)
    {
        $this->attendanceProtocol = $attendanceProtocol;

        return $this;
    }

    /**
     * Get attendanceProtocol.
     *
     * @return string|null
     */
    public function getAttendanceProtocol()
    {
        return $this->attendanceProtocol;
    }

    /**
     * Set openingClassification.
     *
     * @param int|null $openingClassification
     *
     * @return Reports
     */
    public function setOpeningClassification($openingClassification = null)
    {
        $this->openingClassification = $openingClassification;

        return $this;
    }

    /**
     * Get openingClassification.
     *
     * @return int|null
     */
    public function getOpeningClassification()
    {
        return $this->openingClassification;
    }

    /**
     * Set serviceType.
     *
     * @param int|null $serviceType
     *
     * @return Reports
     */
    public function setServiceType($serviceType = null)
    {
        $this->serviceType = $serviceType;

        return $this;
    }

    /**
     * Get serviceType.
     *
     * @return int|null
     */
    public function getServiceType()
    {
        return $this->serviceType;
    }

    /**
     * Set monitoringCounter.
     *
     * @param int|null $monitoringCounter
     *
     * @return Reports
     */
    public function setMonitoringCounter($monitoringCounter = null)
    {
        $this->monitoringCounter = $monitoringCounter;

        return $this;
    }

    /**
     * Get monitoringCounter.
     *
     * @return int|null
     */
    public function getMonitoringCounter()
    {
        return $this->monitoringCounter;
    }

    /**
     * Set openingUser.
     *
     * @param int|null $openingUser
     *
     * @return Reports
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
     * @return Reports
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
     * Add timeCounters
     *
     * @param \App\Entity\Troubleticket\TimeCounters $timeCounters
     *
     * @return Reports
     */
    public function addTimeCounters(\App\Entity\Troubleticket\TimeCounters $timeCounters)
    {
        $this->timeCounters[] = $timeCounters;
        
        return $this;
    }
    
    /**
     * Remove timeCounters
     *
     * @param \App\Entity\Troubleticket\TimeCounters $timeCounters
     */
    public function removeTimeCounters(\App\Entity\Troubleticket\TimeCounters $timeCounters)
    {
        $this->timeCounters->removeElement($timeCounters);
    }
    
    /**
     * Get timeCounters
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTimeCounters()
    {
        return $this->timeCounters;
    }
    
    /**
     * Add subcases
     *
     * @param \App\Entity\Troubleticket\Subcases $subcases
     *
     * @return Reports
     */
    public function addSubcases(\App\Entity\Troubleticket\Subcases $subcases)
    {
        $this->subcases[] = $subcases;
        
        return $this;
    }
    
    /**
     * Remove subcases
     *
     * @param \App\Entity\Troubleticket\Subcases $subcases
     */
    public function removeSubcases(\App\Entity\Troubleticket\Subcases $subcases)
    {
        $this->subcases->removeElement($subcases);
    }
    
    /**
     * Get subcases
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getSubcases()
    {
        return $this->subcases;
    }
}
