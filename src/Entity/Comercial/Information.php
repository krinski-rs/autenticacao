<?php

namespace App\Entity\Comercial;

/**
 * Information
 */
class Information
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $description;


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
     * Set description.
     *
     * @param string|null $description
     *
     * @return Information
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }
}
