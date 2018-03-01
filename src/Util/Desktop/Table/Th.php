<?php
namespace App\Util\Desktop\Table;

class Th implements \Serializable
{
    private $class  = NULL;
    private $text   = NULL;
    
    public function __construct(string $class = NULL, string $text = '')
    {
        $this->class    = $class;
        $this->text     = $text;
    }
    
    /**
     * @return string
     */
    public function getClass()
    {
        return $this->class;
    }
    
    /**
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }
    
    /**
     * @param string $class
     */
    public function setClass(string $class)
    {
        $this->class = $class;
    }
    
    /**
     * @param string $text
     */
    public function setText(string $text)
    {
        $this->text = $text;
    }
    
    public function getArray()
    {
        return [
            'class' => $this->class,
            'text' => $this->text
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->class,
                $this->text
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->class,
            $this->text
        ) = unserialize($serialized);
    }
}

