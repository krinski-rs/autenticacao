<?php

namespace App\Entity\Comercial;

/**
 * Grupo
 */
class Grupo
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $groupName;

    /**
     * @var string|null
     */
    private $groupDescription;

    /**
     * @var bool|null
     */
    private $ativo = true;


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
     * Set groupName.
     *
     * @param string $groupName
     *
     * @return Grupo
     */
    public function setGroupName($groupName)
    {
        $this->groupName = $groupName;

        return $this;
    }

    /**
     * Get groupName.
     *
     * @return string
     */
    public function getGroupName()
    {
        return $this->groupName;
    }

    /**
     * Set groupDescription.
     *
     * @param string|null $groupDescription
     *
     * @return Grupo
     */
    public function setGroupDescription($groupDescription = null)
    {
        $this->groupDescription = $groupDescription;

        return $this;
    }

    /**
     * Get groupDescription.
     *
     * @return string|null
     */
    public function getGroupDescription()
    {
        return $this->groupDescription;
    }

    /**
     * Set ativo.
     *
     * @param bool|null $ativo
     *
     * @return Grupo
     */
    public function setAtivo($ativo = null)
    {
        $this->ativo = $ativo;

        return $this;
    }

    /**
     * Get ativo.
     *
     * @return bool|null
     */
    public function getAtivo()
    {
        return $this->ativo;
    }
}
