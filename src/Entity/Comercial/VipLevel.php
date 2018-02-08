<?php

namespace App\Entity\Comercial;

/**
 * VipLevel
 */
class VipLevel
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $level;

    /**
     * @var string|null
     */
    private $name;


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
     * Set level.
     *
     * @param int|null $level
     *
     * @return VipLevel
     */
    public function setLevel($level = null)
    {
        $this->level = $level;

        return $this;
    }

    /**
     * Get level.
     *
     * @return int|null
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * Set name.
     *
     * @param string|null $name
     *
     * @return VipLevel
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
}
