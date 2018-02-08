<?php

namespace App\Entity\Comercial;

/**
 * ProposalProtocol
 */
class ProposalProtocol
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var string|null
     */
    private $client;

    /**
     * @var string|null
     */
    private $salesman;

    /**
     * @var string|null
     */
    private $activationValue;

    /**
     * @var string|null
     */
    private $monthlyPayment;

    /**
     * @var \DateTime
     */
    private $dateRecord;

    /**
     * @var string
     */
    private $nameProtocol;

    /**
     * @var \DateTime|null
     */
    private $dateProposal;

    /**
     * @var string
     */
    private $service;

    /**
     * @var int
     */
    private $status;

    /**
     * @var \DateTime|null
     */
    private $dateAssignment;

    /**
     * @var string|null
     */
    private $delta;

    /**
     * @var string|null
     */
    private $prevMonthlyPayment;

    /**
     * @var string|null
     */
    private $prevDelta;

    /**
     * @var string|null
     */
    private $prevSpeed;

    /**
     * @var int|null
     */
    private $activationRule;

    /**
     * @var \DateTime|null
     */
    private $estimatedDate;

    /**
     * @var \DateTime|null
     */
    private $datePayment;

    /**
     * @var int|null
     */
    private $fare;

    /**
     * @var \DateTime|null
     */
    private $activationDate;

    /**
     * @var int|null
     */
    private $revenueFilialId;

    /**
     * @var int|null
     */
    private $businessRuleId;

    /**
     * @var bool|null
     */
    private $hasEarlyFare;

    /**
     * @var \DateTime|null
     */
    private $earlyFareDueDate;

    /**
     * @var int|null
     */
    private $fareQuoteQuantity;

    /**
     * @var string|null
     */
    private $farePeriodicity;

    /**
     * @var int|null
     */
    private $fareDueDay;

    /**
     * @var int|null
     */
    private $fareBankId;

    /**
     * @var int|null
     */
    private $fareDeliveryTypeId;

    /**
     * @var bool|null
     */
    private $hasGracePeriod;

    /**
     * @var string|null
     */
    private $gracePeriodNumber;

    /**
     * @var string|null
     */
    private $gracePeriodType;

    /**
     * @var string|null
     */
    private $comment;


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
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return ProposalProtocol
     */
    public function setProposalId($proposalId)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set client.
     *
     * @param string|null $client
     *
     * @return ProposalProtocol
     */
    public function setClient($client = null)
    {
        $this->client = $client;

        return $this;
    }

    /**
     * Get client.
     *
     * @return string|null
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * Set salesman.
     *
     * @param string|null $salesman
     *
     * @return ProposalProtocol
     */
    public function setSalesman($salesman = null)
    {
        $this->salesman = $salesman;

        return $this;
    }

    /**
     * Get salesman.
     *
     * @return string|null
     */
    public function getSalesman()
    {
        return $this->salesman;
    }

    /**
     * Set activationValue.
     *
     * @param string|null $activationValue
     *
     * @return ProposalProtocol
     */
    public function setActivationValue($activationValue = null)
    {
        $this->activationValue = $activationValue;

        return $this;
    }

    /**
     * Get activationValue.
     *
     * @return string|null
     */
    public function getActivationValue()
    {
        return $this->activationValue;
    }

    /**
     * Set monthlyPayment.
     *
     * @param string|null $monthlyPayment
     *
     * @return ProposalProtocol
     */
    public function setMonthlyPayment($monthlyPayment = null)
    {
        $this->monthlyPayment = $monthlyPayment;

        return $this;
    }

    /**
     * Get monthlyPayment.
     *
     * @return string|null
     */
    public function getMonthlyPayment()
    {
        return $this->monthlyPayment;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return ProposalProtocol
     */
    public function setDateRecord($dateRecord)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set nameProtocol.
     *
     * @param string $nameProtocol
     *
     * @return ProposalProtocol
     */
    public function setNameProtocol($nameProtocol)
    {
        $this->nameProtocol = $nameProtocol;

        return $this;
    }

    /**
     * Get nameProtocol.
     *
     * @return string
     */
    public function getNameProtocol()
    {
        return $this->nameProtocol;
    }

    /**
     * Set dateProposal.
     *
     * @param \DateTime|null $dateProposal
     *
     * @return ProposalProtocol
     */
    public function setDateProposal($dateProposal = null)
    {
        $this->dateProposal = $dateProposal;

        return $this;
    }

    /**
     * Get dateProposal.
     *
     * @return \DateTime|null
     */
    public function getDateProposal()
    {
        return $this->dateProposal;
    }

    /**
     * Set service.
     *
     * @param string $service
     *
     * @return ProposalProtocol
     */
    public function setService($service)
    {
        $this->service = $service;

        return $this;
    }

    /**
     * Get service.
     *
     * @return string
     */
    public function getService()
    {
        return $this->service;
    }

    /**
     * Set status.
     *
     * @param int $status
     *
     * @return ProposalProtocol
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
     * Set dateAssignment.
     *
     * @param \DateTime|null $dateAssignment
     *
     * @return ProposalProtocol
     */
    public function setDateAssignment($dateAssignment = null)
    {
        $this->dateAssignment = $dateAssignment;

        return $this;
    }

    /**
     * Get dateAssignment.
     *
     * @return \DateTime|null
     */
    public function getDateAssignment()
    {
        return $this->dateAssignment;
    }

    /**
     * Set delta.
     *
     * @param string|null $delta
     *
     * @return ProposalProtocol
     */
    public function setDelta($delta = null)
    {
        $this->delta = $delta;

        return $this;
    }

    /**
     * Get delta.
     *
     * @return string|null
     */
    public function getDelta()
    {
        return $this->delta;
    }

    /**
     * Set prevMonthlyPayment.
     *
     * @param string|null $prevMonthlyPayment
     *
     * @return ProposalProtocol
     */
    public function setPrevMonthlyPayment($prevMonthlyPayment = null)
    {
        $this->prevMonthlyPayment = $prevMonthlyPayment;

        return $this;
    }

    /**
     * Get prevMonthlyPayment.
     *
     * @return string|null
     */
    public function getPrevMonthlyPayment()
    {
        return $this->prevMonthlyPayment;
    }

    /**
     * Set prevDelta.
     *
     * @param string|null $prevDelta
     *
     * @return ProposalProtocol
     */
    public function setPrevDelta($prevDelta = null)
    {
        $this->prevDelta = $prevDelta;

        return $this;
    }

    /**
     * Get prevDelta.
     *
     * @return string|null
     */
    public function getPrevDelta()
    {
        return $this->prevDelta;
    }

    /**
     * Set prevSpeed.
     *
     * @param string|null $prevSpeed
     *
     * @return ProposalProtocol
     */
    public function setPrevSpeed($prevSpeed = null)
    {
        $this->prevSpeed = $prevSpeed;

        return $this;
    }

    /**
     * Get prevSpeed.
     *
     * @return string|null
     */
    public function getPrevSpeed()
    {
        return $this->prevSpeed;
    }

    /**
     * Set activationRule.
     *
     * @param int|null $activationRule
     *
     * @return ProposalProtocol
     */
    public function setActivationRule($activationRule = null)
    {
        $this->activationRule = $activationRule;

        return $this;
    }

    /**
     * Get activationRule.
     *
     * @return int|null
     */
    public function getActivationRule()
    {
        return $this->activationRule;
    }

    /**
     * Set estimatedDate.
     *
     * @param \DateTime|null $estimatedDate
     *
     * @return ProposalProtocol
     */
    public function setEstimatedDate($estimatedDate = null)
    {
        $this->estimatedDate = $estimatedDate;

        return $this;
    }

    /**
     * Get estimatedDate.
     *
     * @return \DateTime|null
     */
    public function getEstimatedDate()
    {
        return $this->estimatedDate;
    }

    /**
     * Set datePayment.
     *
     * @param \DateTime|null $datePayment
     *
     * @return ProposalProtocol
     */
    public function setDatePayment($datePayment = null)
    {
        $this->datePayment = $datePayment;

        return $this;
    }

    /**
     * Get datePayment.
     *
     * @return \DateTime|null
     */
    public function getDatePayment()
    {
        return $this->datePayment;
    }

    /**
     * Set fare.
     *
     * @param int|null $fare
     *
     * @return ProposalProtocol
     */
    public function setFare($fare = null)
    {
        $this->fare = $fare;

        return $this;
    }

    /**
     * Get fare.
     *
     * @return int|null
     */
    public function getFare()
    {
        return $this->fare;
    }

    /**
     * Set activationDate.
     *
     * @param \DateTime|null $activationDate
     *
     * @return ProposalProtocol
     */
    public function setActivationDate($activationDate = null)
    {
        $this->activationDate = $activationDate;

        return $this;
    }

    /**
     * Get activationDate.
     *
     * @return \DateTime|null
     */
    public function getActivationDate()
    {
        return $this->activationDate;
    }

    /**
     * Set revenueFilialId.
     *
     * @param int|null $revenueFilialId
     *
     * @return ProposalProtocol
     */
    public function setRevenueFilialId($revenueFilialId = null)
    {
        $this->revenueFilialId = $revenueFilialId;

        return $this;
    }

    /**
     * Get revenueFilialId.
     *
     * @return int|null
     */
    public function getRevenueFilialId()
    {
        return $this->revenueFilialId;
    }

    /**
     * Set businessRuleId.
     *
     * @param int|null $businessRuleId
     *
     * @return ProposalProtocol
     */
    public function setBusinessRuleId($businessRuleId = null)
    {
        $this->businessRuleId = $businessRuleId;

        return $this;
    }

    /**
     * Get businessRuleId.
     *
     * @return int|null
     */
    public function getBusinessRuleId()
    {
        return $this->businessRuleId;
    }

    /**
     * Set hasEarlyFare.
     *
     * @param bool|null $hasEarlyFare
     *
     * @return ProposalProtocol
     */
    public function setHasEarlyFare($hasEarlyFare = null)
    {
        $this->hasEarlyFare = $hasEarlyFare;

        return $this;
    }

    /**
     * Get hasEarlyFare.
     *
     * @return bool|null
     */
    public function getHasEarlyFare()
    {
        return $this->hasEarlyFare;
    }

    /**
     * Set earlyFareDueDate.
     *
     * @param \DateTime|null $earlyFareDueDate
     *
     * @return ProposalProtocol
     */
    public function setEarlyFareDueDate($earlyFareDueDate = null)
    {
        $this->earlyFareDueDate = $earlyFareDueDate;

        return $this;
    }

    /**
     * Get earlyFareDueDate.
     *
     * @return \DateTime|null
     */
    public function getEarlyFareDueDate()
    {
        return $this->earlyFareDueDate;
    }

    /**
     * Set fareQuoteQuantity.
     *
     * @param int|null $fareQuoteQuantity
     *
     * @return ProposalProtocol
     */
    public function setFareQuoteQuantity($fareQuoteQuantity = null)
    {
        $this->fareQuoteQuantity = $fareQuoteQuantity;

        return $this;
    }

    /**
     * Get fareQuoteQuantity.
     *
     * @return int|null
     */
    public function getFareQuoteQuantity()
    {
        return $this->fareQuoteQuantity;
    }

    /**
     * Set farePeriodicity.
     *
     * @param string|null $farePeriodicity
     *
     * @return ProposalProtocol
     */
    public function setFarePeriodicity($farePeriodicity = null)
    {
        $this->farePeriodicity = $farePeriodicity;

        return $this;
    }

    /**
     * Get farePeriodicity.
     *
     * @return string|null
     */
    public function getFarePeriodicity()
    {
        return $this->farePeriodicity;
    }

    /**
     * Set fareDueDay.
     *
     * @param int|null $fareDueDay
     *
     * @return ProposalProtocol
     */
    public function setFareDueDay($fareDueDay = null)
    {
        $this->fareDueDay = $fareDueDay;

        return $this;
    }

    /**
     * Get fareDueDay.
     *
     * @return int|null
     */
    public function getFareDueDay()
    {
        return $this->fareDueDay;
    }

    /**
     * Set fareBankId.
     *
     * @param int|null $fareBankId
     *
     * @return ProposalProtocol
     */
    public function setFareBankId($fareBankId = null)
    {
        $this->fareBankId = $fareBankId;

        return $this;
    }

    /**
     * Get fareBankId.
     *
     * @return int|null
     */
    public function getFareBankId()
    {
        return $this->fareBankId;
    }

    /**
     * Set fareDeliveryTypeId.
     *
     * @param int|null $fareDeliveryTypeId
     *
     * @return ProposalProtocol
     */
    public function setFareDeliveryTypeId($fareDeliveryTypeId = null)
    {
        $this->fareDeliveryTypeId = $fareDeliveryTypeId;

        return $this;
    }

    /**
     * Get fareDeliveryTypeId.
     *
     * @return int|null
     */
    public function getFareDeliveryTypeId()
    {
        return $this->fareDeliveryTypeId;
    }

    /**
     * Set hasGracePeriod.
     *
     * @param bool|null $hasGracePeriod
     *
     * @return ProposalProtocol
     */
    public function setHasGracePeriod($hasGracePeriod = null)
    {
        $this->hasGracePeriod = $hasGracePeriod;

        return $this;
    }

    /**
     * Get hasGracePeriod.
     *
     * @return bool|null
     */
    public function getHasGracePeriod()
    {
        return $this->hasGracePeriod;
    }

    /**
     * Set gracePeriodNumber.
     *
     * @param string|null $gracePeriodNumber
     *
     * @return ProposalProtocol
     */
    public function setGracePeriodNumber($gracePeriodNumber = null)
    {
        $this->gracePeriodNumber = $gracePeriodNumber;

        return $this;
    }

    /**
     * Get gracePeriodNumber.
     *
     * @return string|null
     */
    public function getGracePeriodNumber()
    {
        return $this->gracePeriodNumber;
    }

    /**
     * Set gracePeriodType.
     *
     * @param string|null $gracePeriodType
     *
     * @return ProposalProtocol
     */
    public function setGracePeriodType($gracePeriodType = null)
    {
        $this->gracePeriodType = $gracePeriodType;

        return $this;
    }

    /**
     * Get gracePeriodType.
     *
     * @return string|null
     */
    public function getGracePeriodType()
    {
        return $this->gracePeriodType;
    }

    /**
     * Set comment.
     *
     * @param string|null $comment
     *
     * @return ProposalProtocol
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
}
