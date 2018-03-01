<?php
namespace App\Util\Desktop\Table;

class Tr implements \Serializable
{
    private $arrayTd    = NULL;
    private $arrayTh    = NULL;
    
    public function __construct()
    {
        $this->arrayTd    = new \SplQueue();
        $this->arrayTh    = new \SplQueue();
    }
    
    public function addTd(Td $objTd)
    {
        $this->arrayTd->add($this->arrayTd->count(), $objTd);
    }
    
    public function addTh(Th $objTh)
    {
        $this->arrayTh->add($this->arrayTh->count(), $objTh);
    }
    
    public function getArrayTd()
    {
        $arrayRetorno = [];
        if(!$this->arrayTd->count()){
            return $arrayRetorno;
        }
        
        $this->arrayTd->rewind();
        while ($this->arrayTd->valid()){
            $objTd = $this->arrayTd->current();
            $arrayRetorno[] = $objTd->getArray();
            $this->arrayTd->next();
        }
        
        return $arrayRetorno;
    }
    
    public function getArrayTh()
    {
        $arrayRetorno = [];
        if(!$this->arrayTh->count()){
            return $arrayRetorno;
        }
        
        $this->arrayTh->rewind();
        while ($this->arrayTh->valid()){
            $objTh = $this->arrayTh->current();
            $arrayRetorno[] = $objTh->getArray();
            $this->arrayTh->next();
        }
        
        return $arrayRetorno;
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->arrayTd,
                $this->arrayTh
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->arrayTd,
            $this->arrayTh
        ) = unserialize($serialized);
    }
}

