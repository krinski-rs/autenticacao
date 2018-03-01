<?php
namespace App\Util\Desktop;

class Icon implements \Serializable
{
    private $left   = NULL;
    private $top    = NULL;
    private $href   = NULL;
    private $src    = NULL;
    private $text   = NULL;
        
    public function __construct(int $left = 20, int $top = 20, string $href = '#', string $src = '', string $text = '')
    {
        $this->left = $left;
        $this->top  = $top;
        $this->href = $href;
        $this->src  = $src;
        $this->text = $text;
    }
    
    /**
     * @return integer
     */
    public function getLeft()
    {
        return $this->left;
    }
    
    /**
     * @return integer
     */
    public function getTop()
    {
        return $this->top;
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
     * @param integer $left
     */
    public function setLeft(int $left)
    {
        $this->left = $left;
    }
    
    /**
     * @param integer $top
     */
    public function setTop(int $top)
    {
        $this->top = $top;
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
    public function setTex($tex)
    {
        $this->text = $tex;
    }
    
    public function getArray()
    {
        return [
            'left' => $this->left,
            'top' => $this->top,
            'href' => $this->href,
            'src' => $this->src,
            'text' => $this->text
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->left,
                $this->top,
                $this->href,
                $this->src,
                $this->text
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->left,
            $this->top,
            $this->href,
            $this->src,
            $this->text
        ) = unserialize($serialized);
    }
}
