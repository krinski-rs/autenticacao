<?php

namespace App\Entity\Comercial;

/**
 * LostChance
 */
class LostChance
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var int|null
     */
    private $lostActionId;

    /**
     * @var \DateTime|null
     */
    private $dateRecord = 'now()';

    /**
     * @var int|null
     */
    private $walletId;

    /**
     * @var string|null
     */
    private $description;
    
    /**
     * @var \App\Entity\Comercial\Chance
     */
    private $chance;
    
    /**
     * @var \App\Entity\Comercial\Wallet
     */
    private $wallet;
    
    /**
     * @var \App\Entity\Comercial\LostAction
     */
    private $lostAction;

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
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return LostChance
     */
    public function setChanceId($chanceId = null)
    {
        $this->chanceId = $chanceId;

        return $this;
    }

    /**
     * Get chanceId.
     *
     * @return int|null
     */
    public function getChanceId()
    {
        return $this->chanceId;
    }

    /**
     * Set lostActionId.
     *
     * @param int|null $lostActionId
     *
     * @return LostChance
     */
    public function setLostActionId($lostActionId = null)
    {
        $this->lostActionId = $lostActionId;

        return $this;
    }

    /**
     * Get lostActionId.
     *
     * @return int|null
     */
    public function getLostActionId()
    {
        return $this->lostActionId;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return LostChance
     */
    public function setDateRecord($dateRecord = null)
    {
        $this->dateRecord = $dateRecord;

        return $this;
    }

    /**
     * Get dateRecord.
     *
     * @return \DateTime|null
     */
    public function getDateRecord()
    {
        return $this->dateRecord;
    }

    /**
     * Set walletId.
     *
     * @param int|null $walletId
     *
     * @return LostChance
     */
    public function setwalletId($walletId = null)
    {
        $this->walletId = $walletId;

        return $this;
    }

    /**
     * Get walletId.
     *
     * @return int|null
     */
    public function getwalletId()
    {
        return $this->walletId;
    }

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return LostChance
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }
    
    /**
     * Set chance.
     *
     * @param \App\Entity\Comercial\Chance $chance
     *
     * @return LostChance
     */
    public function setChance(\App\Entity\Comercial\Chance $chance = null)
    {
        $this->chance = $chance;
        
        return $this;
    }
    
    /**
     * Get chance.
     *
     * @return \App\Entity\Comercial\Chance
     */
    public function getChance()
    {
        return $this->chance;
    }
    
    /**
     * Set wallet.
     *
     * @param \App\Entity\Comercial\Wallet $wallet
     *
     * @return LostChance
     */
    public function setWallet(\App\Entity\Comercial\Wallet $wallet = null)
    {
        $this->wallet = $wallet;
        
        return $this;
    }
    
    /**
     * Get wallet.
     *
     * @return \App\Entity\Comercial\Wallet
     */
    public function getWallet()
    {
        return $this->wallet;
    }
    
    /**
     * Set lostAction.
     *
     * @param \App\Entity\Comercial\LostAction $lostAction
     *
     * @return LostChance
     */
    public function setLostAction(\App\Entity\Comercial\LostAction $lostAction = null)
    {
        $this->lostAction = $lostAction;
        
        return $this;
    }
    
    /**
     * Get lostAction.
     *
     * @return \App\Entity\Comercial\Wallet
     */
    public function getLostAction()
    {
        return $this->lostAction;
    }
}
