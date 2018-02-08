<?php

namespace App\Entity\Comercial;

/**
 * Service
 */
class Service
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
    private $servicoContrato;

    /**
     * @var bool
     */
    private $multipleCircuits = false;

    /**
     * @var int|null
     */
    private $locationService;

    /**
     * @var bool
     */
    private $active = true;


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
     * @return Service
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
     * Set servicoContrato.
     *
     * @param int|null $servicoContrato
     *
     * @return Service
     */
    public function setServicoContrato($servicoContrato = null)
    {
        $this->servicoContrato = $servicoContrato;

        return $this;
    }

    /**
     * Get servicoContrato.
     *
     * @return int|null
     */
    public function getServicoContrato()
    {
        return $this->servicoContrato;
    }

    /**
     * Set multipleCircuits.
     *
     * @param bool $multipleCircuits
     *
     * @return Service
     */
    public function setMultipleCircuits($multipleCircuits)
    {
        $this->multipleCircuits = $multipleCircuits;

        return $this;
    }

    /**
     * Get multipleCircuits.
     *
     * @return bool
     */
    public function getMultipleCircuits()
    {
        return $this->multipleCircuits;
    }

    /**
     * Set locationService.
     *
     * @param int|null $locationService
     *
     * @return Service
     */
    public function setLocationService($locationService = null)
    {
        $this->locationService = $locationService;

        return $this;
    }

    /**
     * Get locationService.
     *
     * @return int|null
     */
    public function getLocationService()
    {
        return $this->locationService;
    }

    /**
     * Set active.
     *
     * @param bool $active
     *
     * @return Service
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool
     */
    public function getActive()
    {
        return $this->active;
    }
}
