<?php

namespace App\Entity\Troubleticket;

/**
 * ReportsBI
 */
class ReportsBI extends Reports
{
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @access private
     */
    private $reportsBA;
    
    /**
     * @var int|null
     */
    private $biCounter;
    
    public function __construct()
    {
        parent::__construct();
        $this->reportsBA = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add reportsBA
     *
     * @param \App\Entity\Troubleticket\ReportsBA $reportsBA
     *
     * @return ReportsBI
     */
    public function addReportsBA(\App\Entity\Troubleticket\ReportsBA $reportsBA)
    {
        $this->reportsBA[] = $reportsBA;
        
        return $this;
    }
    
    /**
     * Remove reportsBA
     *
     * @param \App\Entity\Troubleticket\ReportsBA $reportsBA
     */
    public function removeReportsBA(\App\Entity\Troubleticket\ReportsBA $reportsBA)
    {
        $this->reportsBA->removeElement($reportsBA);
    }
    
    /**
     * Get reportsBA
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getReportsBA()
    {
        return $this->reportsBA;
    }
    
    /**
     * Set biCounter.
     *
     * @param int|null
     *
     * @return ReportsBI
     */
    public function setBiCounter($biCounter = null)
    {
        $this->biCounter = $biCounter;
        
        return $this;
    }
    
    /**
     * Get biCounter.
     *
     * @return int|null
     */
    public function getBiCounter()
    {
        return $this->biCounter;
    }
}
