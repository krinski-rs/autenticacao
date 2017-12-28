<?php

namespace App\Entity\Autorizacao;

/**
 * Usuarios
 */
abstract class Usuarios
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
     * @var string
     */
    private $username;

    /**
     * @var string
     */
    private $password;

    /**
     * @var string
     */
    private $salt;

    /**
     * @var bool
     */
    private $ativo = true;

    /**
     * @var \DateTime
     */
    private $dataCadastro = 'now()';

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $idRegras;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idRegras = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return Usuarios
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
     * Set username.
     *
     * @param string $username
     *
     * @return Usuarios
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username.
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set password.
     *
     * @param string $password
     *
     * @return Usuarios
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Get password.
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set salt.
     *
     * @param string $salt
     *
     * @return Usuarios
     */
    public function setSalt($salt)
    {
        $this->salt = $salt;

        return $this;
    }

    /**
     * Get salt.
     *
     * @return string
     */
    public function getSalt()
    {
        return $this->salt;
    }

    /**
     * Set ativo.
     *
     * @param bool $ativo
     *
     * @return Usuarios
     */
    public function setAtivo($ativo)
    {
        $this->ativo = $ativo;

        return $this;
    }

    /**
     * Get ativo.
     *
     * @return bool
     */
    public function getAtivo()
    {
        return $this->ativo;
    }

    /**
     * Set dataCadastro.
     *
     * @param \DateTime $dataCadastro
     *
     * @return Usuarios
     */
    public function setDataCadastro($dataCadastro)
    {
        $this->dataCadastro = $dataCadastro;

        return $this;
    }

    /**
     * Get dataCadastro.
     *
     * @return \DateTime
     */
    public function getDataCadastro()
    {
        return $this->dataCadastro;
    }

    /**
     * Add idRegra.
     *
     * @param \App\Entity\Autorizacao\Regras $idRegra
     *
     * @return Usuarios
     */
    public function addIdRegra(\App\Entity\Autorizacao\Regras $idRegra)
    {
        $this->idRegras[] = $idRegra;

        return $this;
    }

    /**
     * Remove idRegra.
     *
     * @param \App\Entity\Autorizacao\Regras $idRegra
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeIdRegra(\App\Entity\Autorizacao\Regras $idRegra)
    {
        return $this->idRegras->removeElement($idRegra);
    }

    /**
     * Get idRegras.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdRegras()
    {
        return $this->idRegras;
    }
}
