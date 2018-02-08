<?php

namespace App\Entity\Comercial;

/**
 * ChanceContact
 */
class ChanceContact
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $name;

    /**
     * @var string|null
     */
    private $telephone;

    /**
     * @var string|null
     */
    private $email;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var bool|null
     */
    private $warn;

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
     * Set name.
     *
     * @param string|null $name
     *
     * @return ChanceContact
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
     * Set telephone.
     *
     * @param string|null $telephone
     *
     * @return ChanceContact
     */
    public function setTelephone($telephone = null)
    {
        $this->telephone = $telephone;

        return $this;
    }

    /**
     * Get telephone.
     *
     * @return string|null
     */
    public function getTelephone()
    {
        return $this->telephone;
    }

    /**
     * Set email.
     *
     * @param string|null $email
     *
     * @return ChanceContact
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
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return ChanceContact
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
     * Set warn.
     *
     * @param bool|null $warn
     *
     * @return ChanceContact
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
     * @return ChanceContact
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
