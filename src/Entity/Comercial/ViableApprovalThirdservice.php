<?php

namespace App\Entity\Comercial;

/**
 * ViableApprovalThirdservice
 */
class ViableApprovalThirdservice
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $viableApprovalId;

    /**
     * @var int
     */
    private $thirdserviceId;

    /**
     * @var string
     */
    private $quantity;

    /**
     * @var string
     */
    private $total;

    /**
     * @var string
     */
    private $price;

    /**
     * @var int|null
     */
    private $viable;


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
     * Set viableApprovalId.
     *
     * @param int $viableApprovalId
     *
     * @return ViableApprovalThirdservice
     */
    public function setViableApprovalId($viableApprovalId)
    {
        $this->viableApprovalId = $viableApprovalId;

        return $this;
    }

    /**
     * Get viableApprovalId.
     *
     * @return int
     */
    public function getViableApprovalId()
    {
        return $this->viableApprovalId;
    }

    /**
     * Set thirdserviceId.
     *
     * @param int $thirdserviceId
     *
     * @return ViableApprovalThirdservice
     */
    public function setThirdserviceId($thirdserviceId)
    {
        $this->thirdserviceId = $thirdserviceId;

        return $this;
    }

    /**
     * Get thirdserviceId.
     *
     * @return int
     */
    public function getThirdserviceId()
    {
        return $this->thirdserviceId;
    }

    /**
     * Set quantity.
     *
     * @param string $quantity
     *
     * @return ViableApprovalThirdservice
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return string
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set total.
     *
     * @param string $total
     *
     * @return ViableApprovalThirdservice
     */
    public function setTotal($total)
    {
        $this->total = $total;

        return $this;
    }

    /**
     * Get total.
     *
     * @return string
     */
    public function getTotal()
    {
        return $this->total;
    }

    /**
     * Set price.
     *
     * @param string $price
     *
     * @return ViableApprovalThirdservice
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return string
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set viable.
     *
     * @param int|null $viable
     *
     * @return ViableApprovalThirdservice
     */
    public function setViable($viable = null)
    {
        $this->viable = $viable;

        return $this;
    }

    /**
     * Get viable.
     *
     * @return int|null
     */
    public function getViable()
    {
        return $this->viable;
    }
}
