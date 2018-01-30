<?php
namespace App\Service\Troubleticke\Reports;

use Doctrine\ORM\EntityManager;
use App\Entity\Troubleticket\ReportsBA;

class BoletinAtendimentoService
{
    private $objEntityManager = NULL;
    private $objReportsBA = NULL;
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setReportsBA(ReportsBA $objReportsBA)
    {
        $this->objReportsBA = $objReportsBA;
    }
    
    public function getReportsBA()
    {
        return $this->objReportsBA;
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objReportsBA);
        $this->objEntityManager->flush();
    }
    
    public function create()
    {
        try {
            $this->objReportsBA = new ReportsBA();
            $this->objReportsBA->setAttendanceProtocol();
            $this->objReportsBA->setCause();
            $this->objReportsBA->setCircuitId($circuitId);
            $this->objReportsBA->setClientCounter();
            $this->objReportsBA->setClosedSymptom();
            $this->objReportsBA->setCloseReason();
            $this->objReportsBA->setClosingUser();
            $this->objReportsBA->setCocCounter();
            $this->objReportsBA->setCode($code);
            $this->objReportsBA->setCreatedByClient($createdByClient);
            $this->objReportsBA->setCreatedBySystem();
            $this->objReportsBA->setDescription();
            $this->objReportsBA->setDesignation($designation);
            $this->objReportsBA->setDisplacementCounter();
            $this->objReportsBA->setElement();
            $this->objReportsBA->setFailure();
            $this->objReportsBA->setFailureLocal();
            $this->objReportsBA->setFieldCounter();
            $this->objReportsBA->setFinalDate();
            $this->objReportsBA->setFirstCombat();
            $this->objReportsBA->setIncident();
            $this->objReportsBA->setInfraCounter();
            $this->objReportsBA->setInitialDate($initialDate);
            $this->objReportsBA->setIssue($issue);
            $this->objReportsBA->setLastUpdate();
            $this->objReportsBA->setMantainerCounter();
            $this->objReportsBA->setMonitoringCounter();
            $this->objReportsBA->setNocCounter();
            $this->objReportsBA->setOpeningClassification();
            $this->objReportsBA->setOpeningUser();
            $this->objReportsBA->setOperatorReportIdentifier();
            $this->objReportsBA->setPausedCounter();
            $this->objReportsBA->setPopId();
            $this->objReportsBA->setProblem();
            $this->objReportsBA->setProviderId();
            $this->objReportsBA->setReopenDate();
            $this->objReportsBA->setReportsBI($reportsBI);
            $this->objReportsBA->setRequesterEmail();
            $this->objReportsBA->setRequesterName();
            $this->objReportsBA->setRequesterPhone();
            $this->objReportsBA->setResponsible();
            $this->objReportsBA->setServiceChannel();
            $this->objReportsBA->setServiceType();
            $this->objReportsBA->setSn1();
            $this->objReportsBA->setSn1Counter();
            $this->objReportsBA->setSn2();
            $this->objReportsBA->setSn2Counter();
            $this->objReportsBA->setSn3();
            $this->objReportsBA->setSn3Counter();
            $this->objReportsBA->setSolution();
            $this->objReportsBA->setSolvedCounter();
            $this->objReportsBA->setStack($stack);
            $this->objReportsBA->setStatus($status);
            $this->objReportsBA->setStretch();
            $this->objReportsBA->setStructure();
            $this->objReportsBA->setSymptom();
            $this->objReportsBA->setTmeCounter();
            $this->objReportsBA->setTmrCounter();
            $this->objReportsBA->setVoz();
            $this->objReportsBA->setVozCounter();
        } catch (\Exception $e) {
            throw $e;
        }
    }
}

