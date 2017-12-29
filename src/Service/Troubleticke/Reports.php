<?php
namespace App\Service\Troubleticke;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Troubleticket\ReportsBI;

class Reports
{
    private $objEntityManager = NULL;
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest)
    {
        $objReportsBA = new ReportsBI();
        print_r($objReportsBA);
    }
}

