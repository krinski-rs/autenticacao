<?php

namespace App\Entity\Comercial;

/**
 * Goal
 */
class Goal
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
     * @var string|null
     */
    private $function;

    /**
     * @var int|null
     */
    private $goalTypeId;


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
     * @return Goal
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
     * Set function.
     *
     * @param string|null $function
     *
     * @return Goal
     */
    public function setFunction($function = null)
    {
        $this->function = $function;

        return $this;
    }

    /**
     * Get function.
     *
     * @return string|null
     */
    public function getFunction()
    {
        return $this->function;
    }

    /**
     * Set goalTypeId.
     *
     * @param int|null $goalTypeId
     *
     * @return Goal
     */
    public function setGoalTypeId($goalTypeId = null)
    {
        $this->goalTypeId = $goalTypeId;

        return $this;
    }

    /**
     * Get goalTypeId.
     *
     * @return int|null
     */
    public function getGoalTypeId()
    {
        return $this->goalTypeId;
    }
}
