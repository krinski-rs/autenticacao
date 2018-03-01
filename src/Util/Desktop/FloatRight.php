<?php
namespace App\Util\Desktop;

class FloatRight implements \Serializable
{
    private $href  = NULL;
    
    public function __construct(string $href = '')
    {
        $this->href    = $href;
    }
    
    public function getArray()
    {
        return [
            'href' => $this->href
        ];
    }
    
    /**
     * @return string
     */
    public function getHref()
    {
        return $this->href;
    }

    /**
     * @param string $href
     */
    public function setHref(string $href)
    {
        $this->href = $href;
    }

    public function serialize()
    {
        return serialize(
            [
                $this->href
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->href
        ) = unserialize($serialized);
    }
}
