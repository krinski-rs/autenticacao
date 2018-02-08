<?php

namespace App\Entity\Comercial;

/**
 * GroupItem
 */
class GroupItem
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $groupId;

    /**
     * @var int|null
     */
    private $productLuma;

    /**
     * @var float|null
     */
    private $quantity;


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
     * Set groupId.
     *
     * @param int|null $groupId
     *
     * @return GroupItem
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
     * Set productLuma.
     *
     * @param int|null $productLuma
     *
     * @return GroupItem
     */
    public function setProductLuma($productLuma = null)
    {
        $this->productLuma = $productLuma;

        return $this;
    }

    /**
     * Get productLuma.
     *
     * @return int|null
     */
    public function getProductLuma()
    {
        return $this->productLuma;
    }

    /**
     * Set quantity.
     *
     * @param float|null $quantity
     *
     * @return GroupItem
     */
    public function setQuantity($quantity = null)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return float|null
     */
    public function getQuantity()
    {
        return $this->quantity;
    }
}
