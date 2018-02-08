<?php

namespace App\Entity\Comercial;

/**
 * Viable
 */
class Viable
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string|null
     */
    private $lat;

    /**
     * @var string|null
     */
    private $lon;

    /**
     * @var string|null
     */
    private $cep;

    /**
     * @var string|null
     */
    private $steet;

    /**
     * @var string|null
     */
    private $number;

    /**
     * @var string|null
     */
    private $complement;

    /**
     * @var bool|null
     */
    private $viable = false;

    /**
     * @var string|null
     */
    private $hash;

    /**
     * @var string|null
     */
    private $uf;

    /**
     * @var int|null
     */
    private $city;

    /**
     * @var bool|null
     */
    private $active;

    /**
     * @var int|null
     */
    private $viableStatus;

    /**
     * @var \DateTime|null
     */
    private $dateRecord;

    /**
     * @var int|null
     */
    private $author;

    /**
     * @var int|null
     */
    private $chanceId;

    /**
     * @var int|null
     */
    private $speedType;

    /**
     * @var string|null
     */
    private $minActivation;

    /**
     * @var string|null
     */
    private $minMonthly;

    /**
     * @var string|null
     */
    private $district;

    /**
     * @var int|null
     */
    private $speed;

    /**
     * @var int|null
     */
    private $interface;

    /**
     * @var string|null
     */
    private $coords;

    /**
     * @var int|null
     */
    private $shadowLpuId;

    /**
     * @var int|null
     */
    private $priceZone;

    /**
     * @var string|null
     */
    private $fiberDistance;

    /**
     * @var string|null
     */
    private $fiberUnit;

    /**
     * @var int|null
     */
    private $contCodigoid;

    /**
     * @var int|null
     */
    private $nextViableId;

    /**
     * @var bool|null
     */
    private $latlonManual;

    /**
     * @var int|null
     */
    private $daysDeadline;

    /**
     * @var bool|null
     */
    private $skipEngineer;

    /**
     * @var int|null
     */
    private $requestContractDeadline;

    /**
     * @var int|null
     */
    private $requestContractDeadlineUnit;

    /**
     * @var int|null
     */
    private $interfaceReal;

    /**
     * @var string|null
     */
    private $comment;

    /**
     * @var bool|null
     */
    private $trocaEndereco;

    /**
     * @var int|null
     */
    private $pair;

    /**
     * @var int|null
     */
    private $capilares;

    /**
     * @var string|null
     */
    private $commentPresale;

    /**
     * @var string|null
     */
    private $totalFo;

    /**
     * @var int|null
     */
    private $idGroupSva;

    /**
     * @var string|null
     */
    private $networkType;

    /**
     * @var int|null
     */
    private $idDatacenter;

    /**
     * @var bool|null
     */
    private $espacoDatacenter = false;

    /**
     * @var string|null
     */
    private $deliveryPlace;

    /**
     * @var string|null
     */
    private $commentVoice;


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
     * Set lat.
     *
     * @param string|null $lat
     *
     * @return Viable
     */
    public function setLat($lat = null)
    {
        $this->lat = $lat;

        return $this;
    }

    /**
     * Get lat.
     *
     * @return string|null
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set lon.
     *
     * @param string|null $lon
     *
     * @return Viable
     */
    public function setLon($lon = null)
    {
        $this->lon = $lon;

        return $this;
    }

    /**
     * Get lon.
     *
     * @return string|null
     */
    public function getLon()
    {
        return $this->lon;
    }

    /**
     * Set cep.
     *
     * @param string|null $cep
     *
     * @return Viable
     */
    public function setCep($cep = null)
    {
        $this->cep = $cep;

        return $this;
    }

    /**
     * Get cep.
     *
     * @return string|null
     */
    public function getCep()
    {
        return $this->cep;
    }

    /**
     * Set steet.
     *
     * @param string|null $steet
     *
     * @return Viable
     */
    public function setSteet($steet = null)
    {
        $this->steet = $steet;

        return $this;
    }

    /**
     * Get steet.
     *
     * @return string|null
     */
    public function getSteet()
    {
        return $this->steet;
    }

    /**
     * Set number.
     *
     * @param string|null $number
     *
     * @return Viable
     */
    public function setNumber($number = null)
    {
        $this->number = $number;

        return $this;
    }

    /**
     * Get number.
     *
     * @return string|null
     */
    public function getNumber()
    {
        return $this->number;
    }

    /**
     * Set complement.
     *
     * @param string|null $complement
     *
     * @return Viable
     */
    public function setComplement($complement = null)
    {
        $this->complement = $complement;

        return $this;
    }

    /**
     * Get complement.
     *
     * @return string|null
     */
    public function getComplement()
    {
        return $this->complement;
    }

    /**
     * Set viable.
     *
     * @param bool|null $viable
     *
     * @return Viable
     */
    public function setViable($viable = null)
    {
        $this->viable = $viable;

        return $this;
    }

    /**
     * Get viable.
     *
     * @return bool|null
     */
    public function getViable()
    {
        return $this->viable;
    }

    /**
     * Set hash.
     *
     * @param string|null $hash
     *
     * @return Viable
     */
    public function setHash($hash = null)
    {
        $this->hash = $hash;

        return $this;
    }

    /**
     * Get hash.
     *
     * @return string|null
     */
    public function getHash()
    {
        return $this->hash;
    }

    /**
     * Set uf.
     *
     * @param string|null $uf
     *
     * @return Viable
     */
    public function setUf($uf = null)
    {
        $this->uf = $uf;

        return $this;
    }

    /**
     * Get uf.
     *
     * @return string|null
     */
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * Set city.
     *
     * @param int|null $city
     *
     * @return Viable
     */
    public function setCity($city = null)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city.
     *
     * @return int|null
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set active.
     *
     * @param bool|null $active
     *
     * @return Viable
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
     * Set viableStatus.
     *
     * @param int|null $viableStatus
     *
     * @return Viable
     */
    public function setViableStatus($viableStatus = null)
    {
        $this->viableStatus = $viableStatus;

        return $this;
    }

    /**
     * Get viableStatus.
     *
     * @return int|null
     */
    public function getViableStatus()
    {
        return $this->viableStatus;
    }

    /**
     * Set dateRecord.
     *
     * @param \DateTime|null $dateRecord
     *
     * @return Viable
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
     * Set author.
     *
     * @param int|null $author
     *
     * @return Viable
     */
    public function setAuthor($author = null)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author.
     *
     * @return int|null
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set chanceId.
     *
     * @param int|null $chanceId
     *
     * @return Viable
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
     * Set speedType.
     *
     * @param int|null $speedType
     *
     * @return Viable
     */
    public function setSpeedType($speedType = null)
    {
        $this->speedType = $speedType;

        return $this;
    }

    /**
     * Get speedType.
     *
     * @return int|null
     */
    public function getSpeedType()
    {
        return $this->speedType;
    }

    /**
     * Set minActivation.
     *
     * @param string|null $minActivation
     *
     * @return Viable
     */
    public function setMinActivation($minActivation = null)
    {
        $this->minActivation = $minActivation;

        return $this;
    }

    /**
     * Get minActivation.
     *
     * @return string|null
     */
    public function getMinActivation()
    {
        return $this->minActivation;
    }

    /**
     * Set minMonthly.
     *
     * @param string|null $minMonthly
     *
     * @return Viable
     */
    public function setMinMonthly($minMonthly = null)
    {
        $this->minMonthly = $minMonthly;

        return $this;
    }

    /**
     * Get minMonthly.
     *
     * @return string|null
     */
    public function getMinMonthly()
    {
        return $this->minMonthly;
    }

    /**
     * Set district.
     *
     * @param string|null $district
     *
     * @return Viable
     */
    public function setDistrict($district = null)
    {
        $this->district = $district;

        return $this;
    }

    /**
     * Get district.
     *
     * @return string|null
     */
    public function getDistrict()
    {
        return $this->district;
    }

    /**
     * Set speed.
     *
     * @param int|null $speed
     *
     * @return Viable
     */
    public function setSpeed($speed = null)
    {
        $this->speed = $speed;

        return $this;
    }

    /**
     * Get speed.
     *
     * @return int|null
     */
    public function getSpeed()
    {
        return $this->speed;
    }

    /**
     * Set interface.
     *
     * @param int|null $interface
     *
     * @return Viable
     */
    public function setInterface($interface = null)
    {
        $this->interface = $interface;

        return $this;
    }

    /**
     * Get interface.
     *
     * @return int|null
     */
    public function getInterface()
    {
        return $this->interface;
    }

    /**
     * Set coords.
     *
     * @param string|null $coords
     *
     * @return Viable
     */
    public function setCoords($coords = null)
    {
        $this->coords = $coords;

        return $this;
    }

    /**
     * Get coords.
     *
     * @return string|null
     */
    public function getCoords()
    {
        return $this->coords;
    }

    /**
     * Set shadowLpuId.
     *
     * @param int|null $shadowLpuId
     *
     * @return Viable
     */
    public function setShadowLpuId($shadowLpuId = null)
    {
        $this->shadowLpuId = $shadowLpuId;

        return $this;
    }

    /**
     * Get shadowLpuId.
     *
     * @return int|null
     */
    public function getShadowLpuId()
    {
        return $this->shadowLpuId;
    }

    /**
     * Set priceZone.
     *
     * @param int|null $priceZone
     *
     * @return Viable
     */
    public function setPriceZone($priceZone = null)
    {
        $this->priceZone = $priceZone;

        return $this;
    }

    /**
     * Get priceZone.
     *
     * @return int|null
     */
    public function getPriceZone()
    {
        return $this->priceZone;
    }

    /**
     * Set fiberDistance.
     *
     * @param string|null $fiberDistance
     *
     * @return Viable
     */
    public function setFiberDistance($fiberDistance = null)
    {
        $this->fiberDistance = $fiberDistance;

        return $this;
    }

    /**
     * Get fiberDistance.
     *
     * @return string|null
     */
    public function getFiberDistance()
    {
        return $this->fiberDistance;
    }

    /**
     * Set fiberUnit.
     *
     * @param string|null $fiberUnit
     *
     * @return Viable
     */
    public function setFiberUnit($fiberUnit = null)
    {
        $this->fiberUnit = $fiberUnit;

        return $this;
    }

    /**
     * Get fiberUnit.
     *
     * @return string|null
     */
    public function getFiberUnit()
    {
        return $this->fiberUnit;
    }

    /**
     * Set contCodigoid.
     *
     * @param int|null $contCodigoid
     *
     * @return Viable
     */
    public function setContCodigoid($contCodigoid = null)
    {
        $this->contCodigoid = $contCodigoid;

        return $this;
    }

    /**
     * Get contCodigoid.
     *
     * @return int|null
     */
    public function getContCodigoid()
    {
        return $this->contCodigoid;
    }

    /**
     * Set nextViableId.
     *
     * @param int|null $nextViableId
     *
     * @return Viable
     */
    public function setNextViableId($nextViableId = null)
    {
        $this->nextViableId = $nextViableId;

        return $this;
    }

    /**
     * Get nextViableId.
     *
     * @return int|null
     */
    public function getNextViableId()
    {
        return $this->nextViableId;
    }

    /**
     * Set latlonManual.
     *
     * @param bool|null $latlonManual
     *
     * @return Viable
     */
    public function setLatlonManual($latlonManual = null)
    {
        $this->latlonManual = $latlonManual;

        return $this;
    }

    /**
     * Get latlonManual.
     *
     * @return bool|null
     */
    public function getLatlonManual()
    {
        return $this->latlonManual;
    }

    /**
     * Set daysDeadline.
     *
     * @param int|null $daysDeadline
     *
     * @return Viable
     */
    public function setDaysDeadline($daysDeadline = null)
    {
        $this->daysDeadline = $daysDeadline;

        return $this;
    }

    /**
     * Get daysDeadline.
     *
     * @return int|null
     */
    public function getDaysDeadline()
    {
        return $this->daysDeadline;
    }

    /**
     * Set skipEngineer.
     *
     * @param bool|null $skipEngineer
     *
     * @return Viable
     */
    public function setSkipEngineer($skipEngineer = null)
    {
        $this->skipEngineer = $skipEngineer;

        return $this;
    }

    /**
     * Get skipEngineer.
     *
     * @return bool|null
     */
    public function getSkipEngineer()
    {
        return $this->skipEngineer;
    }

    /**
     * Set requestContractDeadline.
     *
     * @param int|null $requestContractDeadline
     *
     * @return Viable
     */
    public function setRequestContractDeadline($requestContractDeadline = null)
    {
        $this->requestContractDeadline = $requestContractDeadline;

        return $this;
    }

    /**
     * Get requestContractDeadline.
     *
     * @return int|null
     */
    public function getRequestContractDeadline()
    {
        return $this->requestContractDeadline;
    }

    /**
     * Set requestContractDeadlineUnit.
     *
     * @param int|null $requestContractDeadlineUnit
     *
     * @return Viable
     */
    public function setRequestContractDeadlineUnit($requestContractDeadlineUnit = null)
    {
        $this->requestContractDeadlineUnit = $requestContractDeadlineUnit;

        return $this;
    }

    /**
     * Get requestContractDeadlineUnit.
     *
     * @return int|null
     */
    public function getRequestContractDeadlineUnit()
    {
        return $this->requestContractDeadlineUnit;
    }

    /**
     * Set interfaceReal.
     *
     * @param int|null $interfaceReal
     *
     * @return Viable
     */
    public function setInterfaceReal($interfaceReal = null)
    {
        $this->interfaceReal = $interfaceReal;

        return $this;
    }

    /**
     * Get interfaceReal.
     *
     * @return int|null
     */
    public function getInterfaceReal()
    {
        return $this->interfaceReal;
    }

    /**
     * Set comment.
     *
     * @param string|null $comment
     *
     * @return Viable
     */
    public function setComment($comment = null)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment.
     *
     * @return string|null
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set trocaEndereco.
     *
     * @param bool|null $trocaEndereco
     *
     * @return Viable
     */
    public function setTrocaEndereco($trocaEndereco = null)
    {
        $this->trocaEndereco = $trocaEndereco;

        return $this;
    }

    /**
     * Get trocaEndereco.
     *
     * @return bool|null
     */
    public function getTrocaEndereco()
    {
        return $this->trocaEndereco;
    }

    /**
     * Set pair.
     *
     * @param int|null $pair
     *
     * @return Viable
     */
    public function setPair($pair = null)
    {
        $this->pair = $pair;

        return $this;
    }

    /**
     * Get pair.
     *
     * @return int|null
     */
    public function getPair()
    {
        return $this->pair;
    }

    /**
     * Set capilares.
     *
     * @param int|null $capilares
     *
     * @return Viable
     */
    public function setCapilares($capilares = null)
    {
        $this->capilares = $capilares;

        return $this;
    }

    /**
     * Get capilares.
     *
     * @return int|null
     */
    public function getCapilares()
    {
        return $this->capilares;
    }

    /**
     * Set commentPresale.
     *
     * @param string|null $commentPresale
     *
     * @return Viable
     */
    public function setCommentPresale($commentPresale = null)
    {
        $this->commentPresale = $commentPresale;

        return $this;
    }

    /**
     * Get commentPresale.
     *
     * @return string|null
     */
    public function getCommentPresale()
    {
        return $this->commentPresale;
    }

    /**
     * Set totalFo.
     *
     * @param string|null $totalFo
     *
     * @return Viable
     */
    public function setTotalFo($totalFo = null)
    {
        $this->totalFo = $totalFo;

        return $this;
    }

    /**
     * Get totalFo.
     *
     * @return string|null
     */
    public function getTotalFo()
    {
        return $this->totalFo;
    }

    /**
     * Set idGroupSva.
     *
     * @param int|null $idGroupSva
     *
     * @return Viable
     */
    public function setIdGroupSva($idGroupSva = null)
    {
        $this->idGroupSva = $idGroupSva;

        return $this;
    }

    /**
     * Get idGroupSva.
     *
     * @return int|null
     */
    public function getIdGroupSva()
    {
        return $this->idGroupSva;
    }

    /**
     * Set networkType.
     *
     * @param string|null $networkType
     *
     * @return Viable
     */
    public function setNetworkType($networkType = null)
    {
        $this->networkType = $networkType;

        return $this;
    }

    /**
     * Get networkType.
     *
     * @return string|null
     */
    public function getNetworkType()
    {
        return $this->networkType;
    }

    /**
     * Set idDatacenter.
     *
     * @param int|null $idDatacenter
     *
     * @return Viable
     */
    public function setIdDatacenter($idDatacenter = null)
    {
        $this->idDatacenter = $idDatacenter;

        return $this;
    }

    /**
     * Get idDatacenter.
     *
     * @return int|null
     */
    public function getIdDatacenter()
    {
        return $this->idDatacenter;
    }

    /**
     * Set espacoDatacenter.
     *
     * @param bool|null $espacoDatacenter
     *
     * @return Viable
     */
    public function setEspacoDatacenter($espacoDatacenter = null)
    {
        $this->espacoDatacenter = $espacoDatacenter;

        return $this;
    }

    /**
     * Get espacoDatacenter.
     *
     * @return bool|null
     */
    public function getEspacoDatacenter()
    {
        return $this->espacoDatacenter;
    }

    /**
     * Set deliveryPlace.
     *
     * @param string|null $deliveryPlace
     *
     * @return Viable
     */
    public function setDeliveryPlace($deliveryPlace = null)
    {
        $this->deliveryPlace = $deliveryPlace;

        return $this;
    }

    /**
     * Get deliveryPlace.
     *
     * @return string|null
     */
    public function getDeliveryPlace()
    {
        return $this->deliveryPlace;
    }

    /**
     * Set commentVoice.
     *
     * @param string|null $commentVoice
     *
     * @return Viable
     */
    public function setCommentVoice($commentVoice = null)
    {
        $this->commentVoice = $commentVoice;

        return $this;
    }

    /**
     * Get commentVoice.
     *
     * @return string|null
     */
    public function getCommentVoice()
    {
        return $this->commentVoice;
    }
}
