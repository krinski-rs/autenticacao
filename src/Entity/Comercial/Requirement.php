<?php

namespace App\Entity\Comercial;

/**
 * Requirement
 */
class Requirement
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
     * @var int|null
     */
    private $lumaId;

    /**
     * @var string|null
     */
    private $unit;


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
     * @return Requirement
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
     * Set lumaId.
     *
     * @param int|null $lumaId
     *
     * @return Requirement
     */
    public function setLumaId($lumaId = null)
    {
        $this->lumaId = $lumaId;

        return $this;
    }

    /**
     * Get lumaId.
     *
     * @return int|null
     */
    public function getLumaId()
    {
        return $this->lumaId;
    }

    /**
     * Set unit.
     *
     * @param string|null $unit
     *
     * @return Requirement
     */
    public function setUnit($unit = null)
    {
        $this->unit = $unit;

        return $this;
    }

    /**
     * Get unit.
     *
     * @return string|null
     */
    public function getUnit()
    {
        return $this->unit;
    }
}
