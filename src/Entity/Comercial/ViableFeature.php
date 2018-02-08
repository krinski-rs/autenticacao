<?php

namespace App\Entity\Comercial;

/**
 * ViableFeature
 */
class ViableFeature
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $featureattributeId;

    /**
     * @var int|null
     */
    private $viableId;

    /**
     * @var int|null
     */
    private $quantity;

    /**
     * @var int|null
     */
    private $viableFeatureId;


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
     * Set featureattributeId.
     *
     * @param int|null $featureattributeId
     *
     * @return ViableFeature
     */
    public function setFeatureattributeId($featureattributeId = null)
    {
        $this->featureattributeId = $featureattributeId;

        return $this;
    }

    /**
     * Get featureattributeId.
     *
     * @return int|null
     */
    public function getFeatureattributeId()
    {
        return $this->featureattributeId;
    }

    /**
     * Set viableId.
     *
     * @param int|null $viableId
     *
     * @return ViableFeature
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
     * Set quantity.
     *
     * @param int|null $quantity
     *
     * @return ViableFeature
     */
    public function setQuantity($quantity = null)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return int|null
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set viableFeatureId.
     *
     * @param int|null $viableFeatureId
     *
     * @return ViableFeature
     */
    public function setViableFeatureId($viableFeatureId = null)
    {
        $this->viableFeatureId = $viableFeatureId;

        return $this;
    }

    /**
     * Get viableFeatureId.
     *
     * @return int|null
     */
    public function getViableFeatureId()
    {
        return $this->viableFeatureId;
    }
}
