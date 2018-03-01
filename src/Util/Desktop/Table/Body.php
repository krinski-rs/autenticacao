<?php
namespace App\Util\Desktop\Table;

class Body implements \Serializable
{
    private $arrayTr = NULL;
    
    public function __construct()
    {
        $this->arrayTr    = new \SplQueue();
    }
    
    public function addTr(Tr $objTr)
    {
        $this->arrayTr->add($this->arrayTr->count(), $objTr);
    }
    
    public function getArray()
    {
        $arrayRetorno = [];
        if(!$this->arrayTr->count()){
            return $arrayRetorno;
        }
        
        $this->arrayTr->rewind();
        while ($this->arrayTr->valid()){
            $objTr = $this->arrayTr->current();
            $arrayRetorno[] = $objTr->getArrayTd();
            $this->arrayTr->next();
        }
        return $arrayRetorno;
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->arrayTr
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->arrayTr
        ) = unserialize($serialized);
    }
}
