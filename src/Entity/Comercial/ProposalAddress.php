<?php

namespace App\Entity\Comercial;

/**
 * ProposalAddress
 */
class ProposalAddress
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $uf;

    /**
     * @var int|null
     */
    private $city;

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
    private $complement;

    /**
     * @var int|null
     */
    private $proposalId;

    /**
     * @var string|null
     */
    private $district;


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
     * Set uf.
     *
     * @param string|null $uf
     *
     * @return ProposalAddress
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
     * Set city.
     *
     * @param int|null $city
     *
     * @return ProposalAddress
     */
    public function setCity($city = null)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city.
     *
     * @return int|null
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set cep.
     *
     * @param string|null $cep
     *
     * @return ProposalAddress
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
     * @return ProposalAddress
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
     * @return ProposalAddress
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
     * Set complement.
     *
     * @param string|null $complement
     *
     * @return ProposalAddress
     */
    public function setComplement($complement = null)
    {
        $this->complement = $complement;

        return $this;
    }

    /**
     * Get complement.
     *
     * @return string|null
     */
    public function getComplement()
    {
        return $this->complement;
    }

    /**
     * Set proposalId.
     *
     * @param int|null $proposalId
     *
     * @return ProposalAddress
     */
    public function setProposalId($proposalId = null)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int|null
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set district.
     *
     * @param string|null $district
     *
     * @return ProposalAddress
     */
    public function setDistrict($district = null)
    {
        $this->district = $district;

        return $this;
    }

    /**
     * Get district.
     *
     * @return string|null
     */
    public function getDistrict()
    {
        return $this->district;
    }
}
