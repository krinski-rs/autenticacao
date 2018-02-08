<?php

namespace App\Entity\Comercial;

/**
 * FavoriteAddress
 */
class FavoriteAddress
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $viableId;

    /**
     * @var int
     */
    private $walletId;

    /**
     * @var string
     */
    private $name;

    /**
     * @var int
     */
    private $prospectId;


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
     * Set viableId.
     *
     * @param int $viableId
     *
     * @return FavoriteAddress
     */
    public function setViableId($viableId)
    {
        $this->viableId = $viableId;

        return $this;
    }

    /**
     * Get viableId.
     *
     * @return int
     */
    public function getViableId()
    {
        return $this->viableId;
    }

    /**
     * Set walletId.
     *
     * @param int $walletId
     *
     * @return FavoriteAddress
     */
    public function setWalletId($walletId)
    {
        $this->walletId = $walletId;

        return $this;
    }

    /**
     * Get walletId.
     *
     * @return int
     */
    public function getWalletId()
    {
        return $this->walletId;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return FavoriteAddress
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
     * Set prospectId.
     *
     * @param int $prospectId
     *
     * @return FavoriteAddress
     */
    public function setProspectId($prospectId)
    {
        $this->prospectId = $prospectId;

        return $this;
    }

    /**
     * Get prospectId.
     *
     * @return int
     */
    public function getProspectId()
    {
        return $this->prospectId;
    }
}
