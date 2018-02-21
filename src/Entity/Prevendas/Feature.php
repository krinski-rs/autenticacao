<?php

namespace App\Entity\Prevendas;

/**
 * Feature
 */
class Feature
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
    private $atriCodigoid;

    /**
     * @var bool
     */
    private $mandatory;

    /**
     * @var int
     */
    private $serviceId;

    /**
     * @var bool
     */
    private $active = true;

    /**
     * @var int|null
     */
    private $group;


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
     * @return Feature
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
     * Set atriCodigoid.
     *
     * @param int|null $atriCodigoid
     *
     * @return Feature
     */
    public function setAtriCodigoid($atriCodigoid = null)
    {
        $this->atriCodigoid = $atriCodigoid;

        return $this;
    }

    /**
     * Get atriCodigoid.
     *
     * @return int|null
     */
    public function getAtriCodigoid()
    {
        return $this->atriCodigoid;
    }

    /**
     * Set mandatory.
     *
     * @param bool $mandatory
     *
     * @return Feature
     */
    public function setMandatory($mandatory)
    {
        $this->mandatory = $mandatory;

        return $this;
    }

    /**
     * Get mandatory.
     *
     * @return bool
     */
    public function getMandatory()
    {
        return $this->mandatory;
    }

    /**
     * Set serviceId.
     *
     * @param int $serviceId
     *
     * @return Feature
     */
    public function setServiceId($serviceId)
    {
        $this->serviceId = $serviceId;

        return $this;
    }

    /**
     * Get serviceId.
     *
     * @return int
     */
    public function getServiceId()
    {
        return $this->serviceId;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return Feature
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
     * Set group.
     *
     * @param int|null $group
     *
     * @return Feature
     */
    public function setGroup($group = null)
    {
        $this->group = $group;

        return $this;
    }

    /**
     * Get group.
     *
     * @return int|null
     */
    public function getGroup()
    {
        return $this->group;
    }
}
