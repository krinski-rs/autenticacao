<?php

namespace App\Entity\Comercial;

/**
 * Agreement
 */
class Agreement
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $ip;

    /**
     * @var bool
     */
    private $agreed;

    /**
     * @var \DateTime
     */
    private $date;

    /**
     * @var int
     */
    private $proposalId;


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
     * Set ip.
     *
     * @param string $ip
     *
     * @return Agreement
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip.
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set agreed.
     *
     * @param bool $agreed
     *
     * @return Agreement
     */
    public function setAgreed($agreed)
    {
        $this->agreed = $agreed;

        return $this;
    }

    /**
     * Get agreed.
     *
     * @return bool
     */
    public function getAgreed()
    {
        return $this->agreed;
    }

    /**
     * Set date.
     *
     * @param \DateTime $date
     *
     * @return Agreement
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
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return Agreement
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
}
