<?php

namespace App\Entity\Autorizacao;

use Symfony\Component\Security\Core\User\UserInterface;

/**
 * Usuario
 */
class Usuario implements UserInterface
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
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $idRegra;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     */
    private $usuarioRegra;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idRegra = new \Doctrine\Common\Collections\ArrayCollection();
        $this->usuarioRegra = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return Usuario
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
     * @return Usuario
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
     * @return Usuario
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
     * @return Usuario
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
     * @return Usuario
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
     * @return Usuario
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
     * @param \App\Entity\Autorizacao\Regra $idRegra
     *
     * @return Usuario
     */
    public function addIdRegra(\App\Entity\Autorizacao\Regra $idRegra)
    {
        $this->idRegra[] = $idRegra;

        return $this;
    }

    /**
     * Remove idRegra.
     *
     * @param \App\Entity\Autorizacao\Regra $idRegra
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeIdRegra(\App\Entity\Autorizacao\Regra $idRegra)
    {
        return $this->idRegra->removeElement($idRegra);
    }

    /**
     * Get idRegra.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdRegra()
    {
        return $this->idRegra;
    }

    /**
     * Add usuarioRegra.
     *
     * @param \App\Entity\Autorizacao\UsuarioRegra $usuarioRegra
     *
     * @return Usuario
     */
    public function addUsuarioRegra(\App\Entity\Autorizacao\UsuarioRegra $usuarioRegra)
    {
        $this->usuarioRegra[] = $usuarioRegra;

        return $this;
    }

    /**
     * Remove usuarioRegra.
     *
     * @param \App\Entity\Autorizacao\UsuarioRegra $usuarioRegra
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeUsuarioRegra(\App\Entity\Autorizacao\UsuarioRegra $usuarioRegra)
    {
        return $this->usuarioRegra->removeElement($usuarioRegra);
    }

    /**
     * Get usuarioRegra.
     *
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getUsuarioRegra()
    {
        return $this->usuarioRegra;
    }
    
    public function eraseCredentials()
    {
        return null;
    }

    public function getRoles()
    {
        return ['ROLE_USER'];
    }

}
