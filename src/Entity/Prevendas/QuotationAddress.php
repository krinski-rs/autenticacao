<?php

namespace App\Entity\Prevendas;

/**
 * QuotationAddress
 */
class QuotationAddress
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $cep;

    /**
     * @var string|null
     */
    private $street;

    /**
     * @var string|null
     */
    private $number;

    /**
     * @var string|null
     */
    private $lat;

    /**
     * @var string|null
     */
    private $lon;

    /**
     * @var int|null
     */
    private $quotationId;

    /**
     * @var bool|null
     */
    private $selecao;


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
     * Set cep.
     *
     * @param string|null $cep
     *
     * @return QuotationAddress
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
     * Set street.
     *
     * @param string|null $street
     *
     * @return QuotationAddress
     */
    public function setStreet($street = null)
    {
        $this->street = $street;

        return $this;
    }

    /**
     * Get street.
     *
     * @return string|null
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * Set number.
     *
     * @param string|null $number
     *
     * @return QuotationAddress
     */
    public function setNumber($number = null)
    {
        $this->number = $number;

        return $this;
    }

    /**
     * Get number.
     *
     * @return string|null
     */
    public function getNumber()
    {
        return $this->number;
    }

    /**
     * Set lat.
     *
     * @param string|null $lat
     *
     * @return QuotationAddress
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
     * @return QuotationAddress
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
     * Set quotationId.
     *
     * @param int|null $quotationId
     *
     * @return QuotationAddress
     */
    public function setQuotationId($quotationId = null)
    {
        $this->quotationId = $quotationId;

        return $this;
    }

    /**
     * Get quotationId.
     *
     * @return int|null
     */
    public function getQuotationId()
    {
        return $this->quotationId;
    }

    /**
     * Set selecao.
     *
     * @param bool|null $selecao
     *
     * @return QuotationAddress
     */
    public function setSelecao($selecao = null)
    {
        $this->selecao = $selecao;

        return $this;
    }

    /**
     * Get selecao.
     *
     * @return bool|null
     */
    public function getSelecao()
    {
        return $this->selecao;
    }
}
