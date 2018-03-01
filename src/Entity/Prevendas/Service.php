<?php

namespace App\Entity\Prevendas;

/**
 * Service
 */
class Service
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
    private $servCodigoid;

    /**
     * @var bool|null
     */
    private $active = true;

    /**
     * @var bool
     */
    private $quotable = false;


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
     * @return Service
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
     * Set servCodigoid.
     *
     * @param int|null $servCodigoid
     *
     * @return Service
     */
    public function setServCodigoid($servCodigoid = null)
    {
        $this->servCodigoid = $servCodigoid;

        return $this;
    }

    /**
     * Get servCodigoid.
     *
     * @return int|null
     */
    public function getServCodigoid()
    {
        return $this->servCodigoid;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Service
     */
    public function setActive($active = null)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool|null
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set quotable.
     *
     * @param bool $quotable
     *
     * @return Service
     */
    public function setQuotable($quotable)
    {
        $this->quotable = $quotable;

        return $this;
    }

    /**
     * Get quotable.
     *
     * @return bool
     */
    public function getQuotable()
    {
        return $this->quotable;
    }
}
