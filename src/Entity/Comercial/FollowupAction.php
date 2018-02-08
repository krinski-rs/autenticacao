<?php

namespace App\Entity\Comercial;

/**
 * FollowupAction
 */
class FollowupAction
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
     * @var bool|null
     */
    private $subacao = true;

    /**
     * @var int|null
     */
    private $parentId;

    /**
     * @var bool|null
     */
    private $visivel = true;


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
     * @return FollowupAction
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
     * Set subacao.
     *
     * @param bool|null $subacao
     *
     * @return FollowupAction
     */
    public function setSubacao($subacao = null)
    {
        $this->subacao = $subacao;

        return $this;
    }

    /**
     * Get subacao.
     *
     * @return bool|null
     */
    public function getSubacao()
    {
        return $this->subacao;
    }

    /**
     * Set parentId.
     *
     * @param int|null $parentId
     *
     * @return FollowupAction
     */
    public function setParentId($parentId = null)
    {
        $this->parentId = $parentId;

        return $this;
    }

    /**
     * Get parentId.
     *
     * @return int|null
     */
    public function getParentId()
    {
        return $this->parentId;
    }

    /**
     * Set visivel.
     *
     * @param bool|null $visivel
     *
     * @return FollowupAction
     */
    public function setVisivel($visivel = null)
    {
        $this->visivel = $visivel;

        return $this;
    }

    /**
     * Get visivel.
     *
     * @return bool|null
     */
    public function getVisivel()
    {
        return $this->visivel;
    }
}
