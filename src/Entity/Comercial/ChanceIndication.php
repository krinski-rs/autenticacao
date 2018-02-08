<?php

namespace App\Entity\Comercial;

/**
 * ChanceIndication
 */
class ChanceIndication
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $type;

    /**
     * @var string|null
     */
    private $who;

    /**
     * @var string|null
     */
    private $email;

    /**
     * @var int|null
     */
    private $idChance;

    /**
     * @var bool|null
     */
    private $warn = false;
    
    /**
     * @var \App\Entity\Comercial\Chance
     */
    private $chance;
    

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
     * Set type.
     *
     * @param string|null $type
     *
     * @return ChanceIndication
     */
    public function setType($type = null)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return string|null
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set who.
     *
     * @param string|null $who
     *
     * @return ChanceIndication
     */
    public function setWho($who = null)
    {
        $this->who = $who;

        return $this;
    }

    /**
     * Get who.
     *
     * @return string|null
     */
    public function getWho()
    {
        return $this->who;
    }

    /**
     * Set email.
     *
     * @param string|null $email
     *
     * @return ChanceIndication
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
     * Set idChance.
     *
     * @param int|null $idChance
     *
     * @return ChanceIndication
     */
    public function setIdChance($idChance = null)
    {
        $this->idChance = $idChance;

        return $this;
    }

    /**
     * Get idChance.
     *
     * @return int|null
     */
    public function getIdChance()
    {
        return $this->idChance;
    }

    /**
     * Set warn.
     *
     * @param bool|null $warn
     *
     * @return ChanceIndication
     */
    public function setWarn($warn = null)
    {
        $this->warn = $warn;

        return $this;
    }

    /**
     * Get warn.
     *
     * @return bool|null
     */
    public function getWarn()
    {
        return $this->warn;
    }
    
    /**
     * Set chance.
     *
     * @param \App\Entity\Comercial\Chance $chance
     *
     * @return ChanceIndication
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
}
