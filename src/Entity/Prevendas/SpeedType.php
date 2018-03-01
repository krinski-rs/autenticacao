<?php

namespace App\Entity\Prevendas;

/**
 * SpeedType
 */
class SpeedType
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
     * @var int
     */
    private $multiplier = '1';


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
     * @return SpeedType
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
     * Set multiplier.
     *
     * @param int $multiplier
     *
     * @return SpeedType
     */
    public function setMultiplier($multiplier)
    {
        $this->multiplier = $multiplier;

        return $this;
    }

    /**
     * Get multiplier.
     *
     * @return int
     */
    public function getMultiplier()
    {
        return $this->multiplier;
    }
}
