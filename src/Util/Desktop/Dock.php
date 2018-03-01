<?php
namespace App\Util\Desktop;

class Dock implements \Serializable
{
    private $id   = NULL;
    private $href   = NULL;
    private $src    = NULL;
    private $text   = NULL;
    
    public function __construct(string $id = '', string $href = '#', string $src = '', string $text = '')
    {
        $this->id   = $id;
        $this->href = $href;
        $this->src  = $src;
        $this->text = $text;
    }
    
    /**
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }
    
    /**
     * @return string
     */
    public function getHref()
    {
        return $this->href;
    }
    
    /**
     * @return string
     */
    public function getSrc()
    {
        return $this->src;
    }
    
    /**
     * @return string
     */
    public function getTex()
    {
        return $this->text;
    }
    
    /**
     * @param string $id
     */
    public function setId(string $id)
    {
        $this->id = $id;
    }
    
    /**
     * @param string $href
     */
    public function setHref(string $href)
    {
        $this->href = $href;
    }
    
    /**
     * @param string $src
     */
    public function setSrc(string $src)
    {
        $this->src = $src;
    }
    
    /**
     * @param string $tex
     */
    public function setTex(string $tex)
    {
        $this->text = $tex;
    }
    
    public function getArray()
    {
        return [
            'id' => $this->id,
            'href' => $this->href,
            'src' => $this->src,
            'text' => $this->text
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->id,
                $this->href,
                $this->src,
                $this->text
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->id,
            $this->href,
            $this->src,
            $this->text
        ) = unserialize($serialized);
    }
}
