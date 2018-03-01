<?php
namespace App\Util\Desktop\Table;

class Table implements \Serializable
{
    private $objBody   = NULL;
    private $objHead   = NULL;
    
    public function __construct()
    {
        $this->objBody   = new Body();
        $this->objHead   = new Head();
    }
    
    /**
     * @return mixed
     */
    public function getBody()
    {
        return $this->objBody;
    }

    /**
     * @return mixed
     */
    public function getHead()
    {
        return $this->objHead;
    }

    /**
     * @param mixed $objBody
     */
    public function setBody($objBody)
    {
        $this->objBody = $objBody;
    }

    /**
     * @param mixed $objHead
     */
    public function setHead($objHead)
    {
        $this->objHead = $objHead;
    }
    
    public function getArray()
    {
        return [
            'thead' => $this->objHead->getArray(),
            'tbody' => $this->objBody->getArray()
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->objBody,
                $this->objHead
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->objBody,
            $this->objHead
        ) = unserialize($serialized);
    }
}
