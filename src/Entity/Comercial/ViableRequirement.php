<?php

namespace App\Entity\Comercial;

/**
 * ViableRequirement
 */
class ViableRequirement
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $viableId;

    /**
     * @var int|null
     */
    private $requirementId;

    /**
     * @var string|null
     */
    private $quantity;

    /**
     * @var string|null
     */
    private $price;

    /**
     * @var int|null
     */
    private $groupId;

    /**
     * @var int|null
     */
    private $goal;


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
     * Set viableId.
     *
     * @param int|null $viableId
     *
     * @return ViableRequirement
     */
    public function setViableId($viableId = null)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int|null
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set requirementId.
     *
     * @param int|null $requirementId
     *
     * @return ViableRequirement
     */
    public function setRequirementId($requirementId = null)
    {
        $this->requirementId = $requirementId;

        return $this;
    }

    /**
     * Get requirementId.
     *
     * @return int|null
     */
    public function getRequirementId()
    {
        return $this->requirementId;
    }

    /**
     * Set quantity.
     *
     * @param string|null $quantity
     *
     * @return ViableRequirement
     */
    public function setQuantity($quantity = null)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return string|null
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set price.
     *
     * @param string|null $price
     *
     * @return ViableRequirement
     */
    public function setPrice($price = null)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return string|null
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set groupId.
     *
     * @param int|null $groupId
     *
     * @return ViableRequirement
     */
    public function setGroupId($groupId = null)
    {
        $this->groupId = $groupId;

        return $this;
    }

    /**
     * Get groupId.
     *
     * @return int|null
     */
    public function getGroupId()
    {
        return $this->groupId;
    }

    /**
     * Set goal.
     *
     * @param int|null $goal
     *
     * @return ViableRequirement
     */
    public function setGoal($goal = null)
    {
        $this->goal = $goal;

        return $this;
    }

    /**
     * Get goal.
     *
     * @return int|null
     */
    public function getGoal()
    {
        return $this->goal;
    }
}
