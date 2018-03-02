<?php
namespace App\Util\Desktop;

class FloatLeft implements \Serializable
{
    private $text   = NULL;
    private $src  = NULL;
    
    public function __construct(string $src = '', string $text = '')
    {
        $this->src    = $src;
        $this->text     = $text;
    }
    
    /**
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }
    
    /**
     * @return string
     */
    public function getSrc()
    {
        return $this->src;
    }
    
    /**
     * @param string $text
     */
    public function setText(string $text)
    {
        $this->text = $text;
    }
    
    /**
     * @param string $src
     */
    public function setSrc(string $src)
    {
        $this->src = $src;
    }
    
    public function getArray()
    {
        return [
            'src' => $this->src,
            'text' => $this->text
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->src,
                $this->text
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->src,
            $this->text
        ) = unserialize($serialized);
    }
}
