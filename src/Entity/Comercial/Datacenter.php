<?php

namespace App\Entity\Comercial;

/**
 * Datacenter
 */
class Datacenter
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $nome;

    /**
     * @var string|null
     */
    private $uf;

    /**
     * @var int|null
     */
    private $cidade;

    /**
     * @var string|null
     */
    private $lat;

    /**
     * @var string|null
     */
    private $lon;

    /**
     * @var string|null
     */
    private $cep;

    /**
     * @var string|null
     */
    private $logradouro;

    /**
     * @var string|null
     */
    private $numero;

    /**
     * @var string|null
     */
    private $complemento;

    /**
     * @var string|null
     */
    private $bairro;


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
     * @param string|null $nome
     *
     * @return Datacenter
     */
    public function setNome($nome = null)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Get nome.
     *
     * @return string|null
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * Set uf.
     *
     * @param string|null $uf
     *
     * @return Datacenter
     */
    public function setUf($uf = null)
    {
        $this->uf = $uf;

        return $this;
    }

    /**
     * Get uf.
     *
     * @return string|null
     */
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * Set cidade.
     *
     * @param int|null $cidade
     *
     * @return Datacenter
     */
    public function setCidade($cidade = null)
    {
        $this->cidade = $cidade;

        return $this;
    }

    /**
     * Get cidade.
     *
     * @return int|null
     */
    public function getCidade()
    {
        return $this->cidade;
    }

    /**
     * Set lat.
     *
     * @param string|null $lat
     *
     * @return Datacenter
     */
    public function setLat($lat = null)
    {
        $this->lat = $lat;

        return $this;
    }

    /**
     * Get lat.
     *
     * @return string|null
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set lon.
     *
     * @param string|null $lon
     *
     * @return Datacenter
     */
    public function setLon($lon = null)
    {
        $this->lon = $lon;

        return $this;
    }

    /**
     * Get lon.
     *
     * @return string|null
     */
    public function getLon()
    {
        return $this->lon;
    }

    /**
     * Set cep.
     *
     * @param string|null $cep
     *
     * @return Datacenter
     */
    public function setCep($cep = null)
    {
        $this->cep = $cep;

        return $this;
    }

    /**
     * Get cep.
     *
     * @return string|null
     */
    public function getCep()
    {
        return $this->cep;
    }

    /**
     * Set logradouro.
     *
     * @param string|null $logradouro
     *
     * @return Datacenter
     */
    public function setLogradouro($logradouro = null)
    {
        $this->logradouro = $logradouro;

        return $this;
    }

    /**
     * Get logradouro.
     *
     * @return string|null
     */
    public function getLogradouro()
    {
        return $this->logradouro;
    }

    /**
     * Set numero.
     *
     * @param string|null $numero
     *
     * @return Datacenter
     */
    public function setNumero($numero = null)
    {
        $this->numero = $numero;

        return $this;
    }

    /**
     * Get numero.
     *
     * @return string|null
     */
    public function getNumero()
    {
        return $this->numero;
    }

    /**
     * Set complemento.
     *
     * @param string|null $complemento
     *
     * @return Datacenter
     */
    public function setComplemento($complemento = null)
    {
        $this->complemento = $complemento;

        return $this;
    }

    /**
     * Get complemento.
     *
     * @return string|null
     */
    public function getComplemento()
    {
        return $this->complemento;
    }

    /**
     * Set bairro.
     *
     * @param string|null $bairro
     *
     * @return Datacenter
     */
    public function setBairro($bairro = null)
    {
        $this->bairro = $bairro;

        return $this;
    }

    /**
     * Get bairro.
     *
     * @return string|null
     */
    public function getBairro()
    {
        return $this->bairro;
    }
}
