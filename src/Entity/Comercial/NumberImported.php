<?php

namespace App\Entity\Comercial;

/**
 * NumberImported
 */
class NumberImported
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $numberImported;

    /**
     * @var string|null
     */
    private $ddd;


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
     * Set numberImported.
     *
     * @param string|null $numberImported
     *
     * @return NumberImported
     */
    public function setNumberImported($numberImported = null)
    {
        $this->numberImported = $numberImported;

        return $this;
    }

    /**
     * Get numberImported.
     *
     * @return string|null
     */
    public function getNumberImported()
    {
        return $this->numberImported;
    }

    /**
     * Set ddd.
     *
     * @param string|null $ddd
     *
     * @return NumberImported
     */
    public function setDdd($ddd = null)
    {
        $this->ddd = $ddd;

        return $this;
    }

    /**
     * Get ddd.
     *
     * @return string|null
     */
    public function getDdd()
    {
        return $this->ddd;
    }
}
