<?php

namespace App\Entity\Comercial;

/**
 * ProposalResponsible
 */
class ProposalResponsible
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var int
     */
    private $typeId;

    /**
     * @var string|null
     */
    private $name;

    /**
     * @var string|null
     */
    private $cpf;

    /**
     * @var \DateTime|null
     */
    private $birthday;

    /**
     * @var string|null
     */
    private $phone;

    /**
     * @var string|null
     */
    private $cellphone;

    /**
     * @var string|null
     */
    private $email;

    /**
     * @var int|null
     */
    private $cadUsersId;


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
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return ProposalResponsible
     */
    public function setProposalId($proposalId)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set typeId.
     *
     * @param int $typeId
     *
     * @return ProposalResponsible
     */
    public function setTypeId($typeId)
    {
        $this->typeId = $typeId;

        return $this;
    }

    /**
     * Get typeId.
     *
     * @return int
     */
    public function getTypeId()
    {
        return $this->typeId;
    }

    /**
     * Set name.
     *
     * @param string|null $name
     *
     * @return ProposalResponsible
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
     * Set cpf.
     *
     * @param string|null $cpf
     *
     * @return ProposalResponsible
     */
    public function setCpf($cpf = null)
    {
        $this->cpf = $cpf;

        return $this;
    }

    /**
     * Get cpf.
     *
     * @return string|null
     */
    public function getCpf()
    {
        return $this->cpf;
    }

    /**
     * Set birthday.
     *
     * @param \DateTime|null $birthday
     *
     * @return ProposalResponsible
     */
    public function setBirthday($birthday = null)
    {
        $this->birthday = $birthday;

        return $this;
    }

    /**
     * Get birthday.
     *
     * @return \DateTime|null
     */
    public function getBirthday()
    {
        return $this->birthday;
    }

    /**
     * Set phone.
     *
     * @param string|null $phone
     *
     * @return ProposalResponsible
     */
    public function setPhone($phone = null)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone.
     *
     * @return string|null
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set cellphone.
     *
     * @param string|null $cellphone
     *
     * @return ProposalResponsible
     */
    public function setCellphone($cellphone = null)
    {
        $this->cellphone = $cellphone;

        return $this;
    }

    /**
     * Get cellphone.
     *
     * @return string|null
     */
    public function getCellphone()
    {
        return $this->cellphone;
    }

    /**
     * Set email.
     *
     * @param string|null $email
     *
     * @return ProposalResponsible
     */
    public function setEmail($email = null)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email.
     *
     * @return string|null
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set cadUsersId.
     *
     * @param int|null $cadUsersId
     *
     * @return ProposalResponsible
     */
    public function setCadUsersId($cadUsersId = null)
    {
        $this->cadUsersId = $cadUsersId;

        return $this;
    }

    /**
     * Get cadUsersId.
     *
     * @return int|null
     */
    public function getCadUsersId()
    {
        return $this->cadUsersId;
    }
}
