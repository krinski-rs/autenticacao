<?php

namespace App\Entity\Comercial;

/**
 * ActivationDeadline
 */
class ActivationDeadline
{
    /**
     * @var string
     */
    private $state;

    /**
     * @var int
     */
    private $daysDeadline;


    /**
     * Get state.
     *
     * @return string
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Set daysDeadline.
     *
     * @param int $daysDeadline
     *
     * @return ActivationDeadline
     */
    public function setDaysDeadline($daysDeadline)
    {
        $this->daysDeadline = $daysDeadline;

        return $this;
    }

    /**
     * Get daysDeadline.
     *
     * @return int
     */
    public function getDaysDeadline()
    {
        return $this->daysDeadline;
    }
}
