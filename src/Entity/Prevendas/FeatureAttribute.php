<?php

namespace App\Entity\Prevendas;

/**
 * FeatureAttribute
 */
class FeatureAttribute
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
    private $featureId;

    /**
     * @var bool
     */
    private $defaultSelected = false;

    /**
     * @var bool
     */
    private $active = true;


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
     * @return FeatureAttribute
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
     * Set featureId.
     *
     * @param int|null $featureId
     *
     * @return FeatureAttribute
     */
    public function setFeatureId($featureId = null)
    {
        $this->featureId = $featureId;

        return $this;
    }

    /**
     * Get featureId.
     *
     * @return int|null
     */
    public function getFeatureId()
    {
        return $this->featureId;
    }

    /**
     * Set defaultSelected.
     *
     * @param bool $defaultSelected
     *
     * @return FeatureAttribute
     */
    public function setDefaultSelected($defaultSelected)
    {
        $this->defaultSelected = $defaultSelected;

        return $this;
    }

    /**
     * Get defaultSelected.
     *
     * @return bool
     */
    public function getDefaultSelected()
    {
        return $this->defaultSelected;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return FeatureAttribute
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
}
