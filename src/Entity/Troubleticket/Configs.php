<?php

namespace App\Entity\Troubleticket;

/**
 * Configs
 */
class Configs
{
    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $value;


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
     * Set value.
     *
     * @param string $value
     *
     * @return Configs
     */
    public function setValue($value)
    {
        $this->value = $value;

        return $this;
    }

    /**
     * Get value.
     *
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }
}
