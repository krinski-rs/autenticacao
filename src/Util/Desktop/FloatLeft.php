<?php
namespace App\Util\Desktop;

class FloatLeft implements \Serializable
{
    private $text   = NULL;
    private $image  = NULL;
    
    public function __construct(string $image = '', string $text = '')
    {
        $this->image    = $image;
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
    public function getImage()
    {
        return $this->image;
    }
    
    /**
     * @param string $text
     */
    public function setText(string $text)
    {
        $this->text = $text;
    }
    
    /**
     * @param string $image
     */
    public function setImage(string $image)
    {
        $this->image = $image;
    }
    
    public function getArray()
    {
        return [
            'image' => $this->image,
            'text' => $this->text
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->image,
                $this->text
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->image,
            $this->text
        ) = unserialize($serialized);
    }
}
