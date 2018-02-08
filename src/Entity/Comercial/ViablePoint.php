<?php

namespace App\Entity\Comercial;

/**
 * ViablePoint
 */
class ViablePoint
{
    /**
     * @var int
     */
    private $viableId;

    /**
     * @var int
     */
    private $pointId;


    /**
     * Set viableId.
     *
     * @param int $viableId
     *
     * @return ViablePoint
     */
    public function setViableId($viableId)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set pointId.
     *
     * @param int $pointId
     *
     * @return ViablePoint
     */
    public function setPointId($pointId)
    {
        $this->pointId = $pointId;

        return $this;
    }

    /**
     * Get pointId.
     *
     * @return int
     */
    public function getPointId()
    {
        return $this->pointId;
    }
}
