<?php

namespace App\Entity\Engenharia;

/**
 * Kmz
 */
class Kmz
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
    private $latitude;

    /**
     * @var string|null
     */
    private $longitude;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var string|null
     */
    private $color;

    /**
     * @var \DateTime|null
     */
    private $dateValid;

    /**
     * @var int|null
     */
    private $maxSpeed;

    /**
     * @var int|null
     */
    private $radius;

    /**
     * @var string|null
     */
    private $interface;

    /**
     * @var bool|null
     */
    private $prox;

    /**
     * @var bool|null
     */
    private $error;

    /**
     * @var string|null
     */
    private $tipoArquivo;

    /**
     * @var string|null
     */
    private $coordenadasPoligono;

    /**
     * @var int|null
     */
    private $activationDeadline;

    /**
     * @var \App\Entity\Engenharia\KmzFile
     */
    private $kmzFile;

    /**
     * @var \App\Entity\Engenharia\Type
     */
    private $type;


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
     * @return Kmz
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
     * Set latitude.
     *
     * @param string|null $latitude
     *
     * @return Kmz
     */
    public function setLatitude($latitude = null)
    {
        $this->latitude = $latitude;

        return $this;
    }

    /**
     * Get latitude.
     *
     * @return string|null
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * Set longitude.
     *
     * @param string|null $longitude
     *
     * @return Kmz
     */
    public function setLongitude($longitude = null)
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * Get longitude.
     *
     * @return string|null
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Kmz
     */
    public function setActive($active = null)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active.
     *
     * @return bool|null
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set color.
     *
     * @param string|null $color
     *
     * @return Kmz
     */
    public function setColor($color = null)
    {
        $this->color = $color;

        return $this;
    }

    /**
     * Get color.
     *
     * @return string|null
     */
    public function getColor()
    {
        return $this->color;
    }

    /**
     * Set dateValid.
     *
     * @param \DateTime|null $dateValid
     *
     * @return Kmz
     */
    public function setDateValid($dateValid = null)
    {
        $this->dateValid = $dateValid;

        return $this;
    }

    /**
     * Get dateValid.
     *
     * @return \DateTime|null
     */
    public function getDateValid()
    {
        return $this->dateValid;
    }

    /**
     * Set maxSpeed.
     *
     * @param int|null $maxSpeed
     *
     * @return Kmz
     */
    public function setMaxSpeed($maxSpeed = null)
    {
        $this->maxSpeed = $maxSpeed;

        return $this;
    }

    /**
     * Get maxSpeed.
     *
     * @return int|null
     */
    public function getMaxSpeed()
    {
        return $this->maxSpeed;
    }

    /**
     * Set radius.
     *
     * @param int|null $radius
     *
     * @return Kmz
     */
    public function setRadius($radius = null)
    {
        $this->radius = $radius;

        return $this;
    }

    /**
     * Get radius.
     *
     * @return int|null
     */
    public function getRadius()
    {
        return $this->radius;
    }

    /**
     * Set interface.
     *
     * @param string|null $interface
     *
     * @return Kmz
     */
    public function setInterface($interface = null)
    {
        $this->interface = $interface;

        return $this;
    }

    /**
     * Get interface.
     *
     * @return string|null
     */
    public function getInterface()
    {
        return $this->interface;
    }

    /**
     * Set prox.
     *
     * @param bool|null $prox
     *
     * @return Kmz
     */
    public function setProx($prox = null)
    {
        $this->prox = $prox;

        return $this;
    }

    /**
     * Get prox.
     *
     * @return bool|null
     */
    public function getProx()
    {
        return $this->prox;
    }

    /**
     * Set error.
     *
     * @param bool|null $error
     *
     * @return Kmz
     */
    public function setError($error = null)
    {
        $this->error = $error;

        return $this;
    }

    /**
     * Get error.
     *
     * @return bool|null
     */
    public function getError()
    {
        return $this->error;
    }

    /**
     * Set tipoArquivo.
     *
     * @param string|null $tipoArquivo
     *
     * @return Kmz
     */
    public function setTipoArquivo($tipoArquivo = null)
    {
        $this->tipoArquivo = $tipoArquivo;

        return $this;
    }

    /**
     * Get tipoArquivo.
     *
     * @return string|null
     */
    public function getTipoArquivo()
    {
        return $this->tipoArquivo;
    }

    /**
     * Set coordenadasPoligono.
     *
     * @param string|null $coordenadasPoligono
     *
     * @return Kmz
     */
    public function setCoordenadasPoligono($coordenadasPoligono = null)
    {
        $this->coordenadasPoligono = $coordenadasPoligono;

        return $this;
    }

    /**
     * Get coordenadasPoligono.
     *
     * @return string|null
     */
    public function getCoordenadasPoligono()
    {
        return $this->coordenadasPoligono;
    }

    /**
     * Set activationDeadline.
     *
     * @param int|null $activationDeadline
     *
     * @return Kmz
     */
    public function setActivationDeadline($activationDeadline = null)
    {
        $this->activationDeadline = $activationDeadline;

        return $this;
    }

    /**
     * Get activationDeadline.
     *
     * @return int|null
     */
    public function getActivationDeadline()
    {
        return $this->activationDeadline;
    }

    /**
     * Set kmzFile.
     *
     * @param \App\Entity\Engenharia\KmzFile|null $kmzFile
     *
     * @return Kmz
     */
    public function setKmzFile(\App\Entity\Engenharia\KmzFile $kmzFile = null)
    {
        $this->kmzFile = $kmzFile;

        return $this;
    }

    /**
     * Get kmzFile.
     *
     * @return \App\Entity\Engenharia\KmzFile|null
     */
    public function getKmzFile()
    {
        return $this->kmzFile;
    }

    /**
     * Set type.
     *
     * @param \App\Entity\Engenharia\Type|null $type
     *
     * @return Kmz
     */
    public function setType(\App\Entity\Engenharia\Type $type = null)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type.
     *
     * @return \App\Entity\Engenharia\Type|null
     */
    public function getType()
    {
        return $this->type;
    }
}
