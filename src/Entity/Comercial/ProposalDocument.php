<?php

namespace App\Entity\Comercial;

/**
 * ProposalDocument
 */
class ProposalDocument
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $proposalId;

    /**
     * @var int|null
     */
    private $proposalOdtId;

    /**
     * @var string|null
     */
    private $odtFile;

    /**
     * @var string|null
     */
    private $pdfFile;

    /**
     * @var int|null
     */
    private $userId;

    /**
     * @var \DateTime|null
     */
    private $dateinc;

    /**
     * @var \DateTime|null
     */
    private $dategen;


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
     * Set proposalId.
     *
     * @param int $proposalId
     *
     * @return ProposalDocument
     */
    public function setProposalId($proposalId)
    {
        $this->proposalId = $proposalId;

        return $this;
    }

    /**
     * Get proposalId.
     *
     * @return int
     */
    public function getProposalId()
    {
        return $this->proposalId;
    }

    /**
     * Set proposalOdtId.
     *
     * @param int|null $proposalOdtId
     *
     * @return ProposalDocument
     */
    public function setProposalOdtId($proposalOdtId = null)
    {
        $this->proposalOdtId = $proposalOdtId;

        return $this;
    }

    /**
     * Get proposalOdtId.
     *
     * @return int|null
     */
    public function getProposalOdtId()
    {
        return $this->proposalOdtId;
    }

    /**
     * Set odtFile.
     *
     * @param string|null $odtFile
     *
     * @return ProposalDocument
     */
    public function setOdtFile($odtFile = null)
    {
        $this->odtFile = $odtFile;

        return $this;
    }

    /**
     * Get odtFile.
     *
     * @return string|null
     */
    public function getOdtFile()
    {
        return $this->odtFile;
    }

    /**
     * Set pdfFile.
     *
     * @param string|null $pdfFile
     *
     * @return ProposalDocument
     */
    public function setPdfFile($pdfFile = null)
    {
        $this->pdfFile = $pdfFile;

        return $this;
    }

    /**
     * Get pdfFile.
     *
     * @return string|null
     */
    public function getPdfFile()
    {
        return $this->pdfFile;
    }

    /**
     * Set userId.
     *
     * @param int|null $userId
     *
     * @return ProposalDocument
     */
    public function setUserId($userId = null)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId.
     *
     * @return int|null
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set dateinc.
     *
     * @param \DateTime|null $dateinc
     *
     * @return ProposalDocument
     */
    public function setDateinc($dateinc = null)
    {
        $this->dateinc = $dateinc;

        return $this;
    }

    /**
     * Get dateinc.
     *
     * @return \DateTime|null
     */
    public function getDateinc()
    {
        return $this->dateinc;
    }

    /**
     * Set dategen.
     *
     * @param \DateTime|null $dategen
     *
     * @return ProposalDocument
     */
    public function setDategen($dategen = null)
    {
        $this->dategen = $dategen;

        return $this;
    }

    /**
     * Get dategen.
     *
     * @return \DateTime|null
     */
    public function getDategen()
    {
        return $this->dategen;
    }
}
