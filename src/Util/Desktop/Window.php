<?php
namespace App\Util\Desktop;

class Window implements \Serializable
{
    private $id             = NULL;
    private $objWindowInner = NULL;
    
    public function __construct(string $id = NULL)
    {
        $this->id               = $id;
        $this->objWindowInner   = new WindowInner();
    }
    
    /**
     * @return \App\Util\Desktop\WindowInner
     */
    public function getWindowInner()
    {
        return $this->objWindowInner;
    }

    /**
     * @param \App\Util\Desktop\WindowInner $objWindowInner
     */
    public function setWindowInner($objWindowInner)
    {
        $this->objWindowInner = $objWindowInner;
    }
    
    /**
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }
    
    /**
     * @param string $id
     */
    public function setId(string $id)
    {
        $this->id = $id;
    }
    
    public function getArray()
    {
        return [
            'id' => $this->id,
            'window_inner' => $this->objWindowInner->getArray()
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->id
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->id
        ) = unserialize($serialized);
    }
}
