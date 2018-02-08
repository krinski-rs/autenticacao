<?php

namespace App\Entity\Comercial;

/**
 * ContractDenialReason
 */
class ContractDenialReason
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var int
     */
    private $contractDenialReasonCategoryId;


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
     * Set name.
     *
     * @param string $name
     *
     * @return ContractDenialReason
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set contractDenialReasonCategoryId.
     *
     * @param int $contractDenialReasonCategoryId
     *
     * @return ContractDenialReason
     */
    public function setContractDenialReasonCategoryId($contractDenialReasonCategoryId)
    {
        $this->contractDenialReasonCategoryId = $contractDenialReasonCategoryId;

        return $this;
    }

    /**
     * Get contractDenialReasonCategoryId.
     *
     * @return int
     */
    public function getContractDenialReasonCategoryId()
    {
        return $this->contractDenialReasonCategoryId;
    }
}
