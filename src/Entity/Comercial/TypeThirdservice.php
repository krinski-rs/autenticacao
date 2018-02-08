<?php

namespace App\Entity\Comercial;

/**
 * TypeThirdservice
 */
class TypeThirdservice
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var bool
     */
    private $active;

    /**
     * @var string
     */
    private $acronyn;


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
     * @param string $name
     *
     * @return TypeThirdservice
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return TypeThirdservice
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set acronyn.
     *
     * @param string $acronyn
     *
     * @return TypeThirdservice
     */
    public function setAcronyn($acronyn)
    {
        $this->acronyn = $acronyn;

        return $this;
    }

    /**
     * Get acronyn.
     *
     * @return string
     */
    public function getAcronyn()
    {
        return $this->acronyn;
    }
}
