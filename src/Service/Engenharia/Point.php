<?php
namespace App\Service\Engenharia;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Engenharia\Point\Create;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;

class Point
{
    private $objEntityManager   = NULL;
    
    const INTERFACE_E1              = 'E1';
    const INTERFACE_FIBRA_APAGADA   = 'Fibra Apagada';
    const INTERFACE_ETHERNET        = 'Ethernet';
    
    const TIPO_PONTO    = 'Ponto';
    const TIPO_POLIGONO = 'Poligono';
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public static function getArrayInterface()
    {
        return [ 1 => self::INTERFACE_E1, 2 => self::INTERFACE_FIBRA_APAGADA, 3 => self::INTERFACE_ETHERNET ];
    }
    
    public static function getArrayTipoPonto()
    {
        return [ 1 => self::TIPO_PONTO, 2 => self::TIPO_POLIGONO ];
    }
    
    public function create(Request $objRequest)
    {
        try {
            $objEngenhariaPointCreate = new Create($this->objEntityManager);
            $objEngenhariaPointCreate->create($objRequest);
            return $objEngenhariaPointCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
}

