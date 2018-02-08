<?php

namespace App\Entity\Comercial;

/**
 * Costs
 */
class Costs
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $serviceId;

    /**
     * @var int|null
     */
    private $interface;

    /**
     * @var string|null
     */
    private $capexEquipament;

    /**
     * @var string|null
     */
    private $capexFiber;

    /**
     * @var string|null
     */
    private $ip;

    /**
     * @var \DateTime
     */
    private $dateRecord = 'now()';

    /**
     * @var \DateTime|null
     */
    private $dateEnd;


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
     * Set serviceId.
     *
     * @param int|null $serviceId
     *
     * @return Costs
     */
    public function setServiceId($serviceId = null)
    {
        $this->serviceId = $serviceId;

        return $this;
    }

    /**
     * Get serviceId.
     *
     * @return int|null
     */
    public function getServiceId()
    {
        return $this->serviceId;
    }

    /**
     * Set interface.
     *
     * @param int|null $interface
     *
     * @return Costs
     */
    public function setInterface($interface = null)
    {
        $this->interface = $interface;

        return $this;
    }

    /**
     * Get interface.
     *
     * @return int|null
     */
    public function getInterface()
    {
        return $this->interface;
    }

    /**
     * Set capexEquipament.
     *
     * @param string|null $capexEquipament
     *
     * @return Costs
     */
    public function setCapexEquipament($capexEquipament = null)
    {
        $this->capexEquipament = $capexEquipament;

        return $this;
    }

    /**
     * Get capexEquipament.
     *
     * @return string|null
     */
    public function getCapexEquipament()
    {
        return $this->capexEquipament;
    }

    /**
     * Set capexFiber.
     *
     * @param string|null $capexFiber
     *
     * @return Costs
     */
    public function setCapexFiber($capexFiber = null)
    {
        $this->capexFiber = $capexFiber;

        return $this;
    }

    /**
     * Get capexFiber.
     *
     * @return string|null
     */
    public function getCapexFiber()
    {
        return $this->capexFiber;
    }

    /**
     * Set ip.
     *
     * @param string|null $ip
     *
     * @return Costs
     */
    public function setIp($ip = null)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip.
     *
     * @return string|null
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime $dateRecord
     *
     * @return Costs
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
     * Set dateEnd.
     *
     * @param \DateTime|null $dateEnd
     *
     * @return Costs
     */
    public function setDateEnd($dateEnd = null)
    {
        $this->dateEnd = $dateEnd;

        return $this;
    }

    /**
     * Get dateEnd.
     *
     * @return \DateTime|null
     */
    public function getDateEnd()
    {
        return $this->dateEnd;
    }
}
