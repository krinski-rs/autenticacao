<?php

namespace App\Entity\Troubleticket;

/**
 * ReportsBA
 */
class ReportsBA extends Reports
{
    
    /**
     * @var \App\Entity\Troubleticket\ReportsBI
     */
    private $reportsBI;
    
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * Set reportsBI.
     *
     * @param \App\Entity\Troubleticket\ReportsBI $reportsBI
     *
     * @return ReportsBA
     */
    public function setReportsBI(\App\Entity\Troubleticket\ReportsBI $reportsBI)
    {
        $this->reportsBI = $reportsBI;
        
        return $this;
    }
    
    /**
     * Get reportsBI.
     *
     * @return \App\Entity\Troubleticket\ReportsBI
     */
    public function getReportsBI()
    {
        return $this->reportsBI;
    }
    
}
