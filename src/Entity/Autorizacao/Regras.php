<?php

namespace App\Entity\Autorizacao;

/**
 * Regras
 */
class Regras
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $nome;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $idUsuarios;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idUsuarios = new \Doctrine\Common\Collections\ArrayCollection();
    }

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
     * Set nome.
     *
     * @param string $nome
     *
     * @return Regras
     */
    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Get nome.
     *
     * @return string
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * Add idUsuario.
     *
     * @param \App\Entity\Autorizacao\Usuarios $idUsuario
     *
     * @return Regras
     */
    public function addIdUsuario(\App\Entity\Autorizacao\Usuarios $idUsuario)
    {
        $this->idUsuarios[] = $idUsuario;

        return $this;
    }

    /**
     * Remove idUsuario.
     *
     * @param \App\Entity\Autorizacao\Usuarios $idUsuario
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeIdUsuario(\App\Entity\Autorizacao\Usuarios $idUsuario)
    {
        return $this->idUsuarios->removeElement($idUsuario);
    }

    /**
     * Get idUsuarios.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdUsuarios()
    {
        return $this->idUsuarios;
    }
}
