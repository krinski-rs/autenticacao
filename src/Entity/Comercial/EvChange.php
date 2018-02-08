<?php

namespace App\Entity\Comercial;

/**
 * EvChange
 */
class EvChange
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $idProspect;


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
     * Set idProspect.
     *
     * @param int|null $idProspect
     *
     * @return EvChange
     */
    public function setIdProspect($idProspect = null)
    {
        $this->idProspect = $idProspect;

        return $this;
    }

    /**
     * Get idProspect.
     *
     * @return int|null
     */
    public function getIdProspect()
    {
        return $this->idProspect;
    }
}
