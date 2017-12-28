<?php

namespace App\Entity\Troubleticket;

/**
 * ProvidersCache
 */
class ProvidersCache
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $cnpj;

    /**
     * @var string|null
     */
    private $razaoSocial;

    /**
     * @var string|null
     */
    private $nomeFantasia;


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
     * Set cnpj.
     *
     * @param string $cnpj
     *
     * @return ProvidersCache
     */
    public function setCnpj($cnpj)
    {
        $this->cnpj = $cnpj;

        return $this;
    }

    /**
     * Get cnpj.
     *
     * @return string
     */
    public function getCnpj()
    {
        return $this->cnpj;
    }

    /**
     * Set razaoSocial.
     *
     * @param string|null $razaoSocial
     *
     * @return ProvidersCache
     */
    public function setRazaoSocial($razaoSocial = null)
    {
        $this->razaoSocial = $razaoSocial;

        return $this;
    }

    /**
     * Get razaoSocial.
     *
     * @return string|null
     */
    public function getRazaoSocial()
    {
        return $this->razaoSocial;
    }

    /**
     * Set nomeFantasia.
     *
     * @param string|null $nomeFantasia
     *
     * @return ProvidersCache
     */
    public function setNomeFantasia($nomeFantasia = null)
    {
        $this->nomeFantasia = $nomeFantasia;

        return $this;
    }

    /**
     * Get nomeFantasia.
     *
     * @return string|null
     */
    public function getNomeFantasia()
    {
        return $this->nomeFantasia;
    }
}
