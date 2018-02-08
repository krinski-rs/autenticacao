<?php

namespace App\Entity\Comercial;

/**
 * ChanceTag
 */
class ChanceTag
{
    /**
     * @var int
     */
    private $idChance;

    /**
     * @var int
     */
    private $idTag;


    /**
     * Set idChance.
     *
     * @param int $idChance
     *
     * @return ChanceTag
     */
    public function setIdChance($idChance)
    {
        $this->idChance = $idChance;

        return $this;
    }

    /**
     * Get idChance.
     *
     * @return int
     */
    public function getIdChance()
    {
        return $this->idChance;
    }

    /**
     * Set idTag.
     *
     * @param int $idTag
     *
     * @return ChanceTag
     */
    public function setIdTag($idTag)
    {
        $this->idTag = $idTag;

        return $this;
    }

    /**
     * Get idTag.
     *
     * @return int
     */
    public function getIdTag()
    {
        return $this->idTag;
    }
}
