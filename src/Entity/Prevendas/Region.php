<?php

namespace App\Entity\Prevendas;

/**
 * Region
 */
class Region
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
    private $max;


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
     * @return Region
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
     * Set max.
     *
     * @param int|null $max
     *
     * @return Region
     */
    public function setMax($max = null)
    {
        $this->max = $max;

        return $this;
    }

    /**
     * Get max.
     *
     * @return int|null
     */
    public function getMax()
    {
        return $this->max;
    }
}
