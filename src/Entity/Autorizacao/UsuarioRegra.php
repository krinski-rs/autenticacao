<?php

namespace App\Entity\Autorizacao;

/**
 * UsuarioRegra
 */
class UsuarioRegra
{
    /**
     * @var int
     */
    private $valor;
    
    /**
     * @var \App\Entity\Autorizacao\Usuario
     */
    private $usuario;
    
    /**
     * @var \App\Entity\Autorizacao\Regra
     */
    private $regra;

    /**
     * Set valor.
     *
     * @param int $valor
     *
     * @return UsuarioRegra
     */
    public function setValor($valor)
    {
        $this->valor = $valor;

        return $this;
    }

    /**
     * Get valor.
     *
     * @return int
     */
    public function getValor()
    {
        return $this->valor;
    }

    /**
     * Set usuario.
     *
     * @param \App\Entity\Autorizacao\Usuario $usuario
     *
     * @return UsuarioRegra
     */
    public function setUsuario(\App\Entity\Autorizacao\Usuario $usuario)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario.
     *
     * @return \App\Entity\Autorizacao\Usuario $usuario
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set regra.
     *
     * @param \App\Entity\Autorizacao\Regra $regra
     *
     * @return UsuarioRegra
     */
    public function setRegra(\App\Entity\Autorizacao\Regra $regra)
    {
        $this->regra = $regra;

        return $this;
    }

    /**
     * Get regra.
     *
     * @return \App\Entity\Autorizacao\Regra $regra
     */
    public function getRegra()
    {
        return $this->regra;
    }
}
