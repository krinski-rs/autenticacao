<?php

namespace App\Entity\Comercial;

/**
 * BankInformation
 */
class BankInformation
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
    private $name;

    /**
     * @var string|null
     */
    private $number;

    /**
     * @var string|null
     */
    private $agency;

    /**
     * @var string|null
     */
    private $account;


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
     * @return BankInformation
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
     * Set name.
     *
     * @param string|null $name
     *
     * @return BankInformation
     */
    public function setName($name = null)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string|null
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set number.
     *
     * @param string|null $number
     *
     * @return BankInformation
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
     * Set agency.
     *
     * @param string|null $agency
     *
     * @return BankInformation
     */
    public function setAgency($agency = null)
    {
        $this->agency = $agency;

        return $this;
    }

    /**
     * Get agency.
     *
     * @return string|null
     */
    public function getAgency()
    {
        return $this->agency;
    }

    /**
     * Set account.
     *
     * @param string|null $account
     *
     * @return BankInformation
     */
    public function setAccount($account = null)
    {
        $this->account = $account;

        return $this;
    }

    /**
     * Get account.
     *
     * @return string|null
     */
    public function getAccount()
    {
        return $this->account;
    }
}
