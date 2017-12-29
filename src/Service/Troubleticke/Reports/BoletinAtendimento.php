<?php
namespace App\Service\Troubleticke\Reports;

use Doctrine\Bundle\DoctrineBundle\Registry;

class BoletinAtendimento
{
    private $objRegistry = NULL;
    public function __construct(Registry $objRegistry)
    {
    }
}

