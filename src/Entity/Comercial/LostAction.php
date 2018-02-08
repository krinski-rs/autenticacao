<?php

namespace App\Entity\Comercial;

/**
 * LostAction
 */
class LostAction
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
     * @var int|null
     */
    private $parentId;

    /**
     * @var bool|null
     */
    private $visible;

    /**
     * @var bool|null
     */
    private $select;


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
     * @return LostAction
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
     * Set parentId.
     *
     * @param int|null $parentId
     *
     * @return LostAction
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
     * Set visible.
     *
     * @param bool|null $visible
     *
     * @return LostAction
     */
    public function setVisible($visible = null)
    {
        $this->visible = $visible;

        return $this;
    }

    /**
     * Get visible.
     *
     * @return bool|null
     */
    public function getVisible()
    {
        return $this->visible;
    }

    /**
     * Set select.
     *
     * @param bool|null $select
     *
     * @return LostAction
     */
    public function setSelect($select = null)
    {
        $this->select = $select;

        return $this;
    }

    /**
     * Get select.
     *
     * @return bool|null
     */
    public function getSelect()
    {
        return $this->select;
    }
}
