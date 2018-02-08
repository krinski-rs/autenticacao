<?php

namespace App\Entity\Comercial;

/**
 * Companies
 */
class Companies
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $name;

    /**
     * @var int|null
     */
    private $spid;


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
     * Set name.
     *
     * @param string|null $name
     *
     * @return Companies
     */
    public function setName($name = null)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string|null
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set spid.
     *
     * @param int|null $spid
     *
     * @return Companies
     */
    public function setSpid($spid = null)
    {
        $this->spid = $spid;

        return $this;
    }

    /**
     * Get spid.
     *
     * @return int|null
     */
    public function getSpid()
    {
        return $this->spid;
    }
}
