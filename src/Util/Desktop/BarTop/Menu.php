<?php
namespace App\Util\Desktop\BarTop;

final class Menu implements \Serializable
{
    private $href   = NULL;
    private $tex    = NULL;
    private $ul     = NULL;
    
    public function __construct()
    {
        $this->href = '#';
        $this->tex  = '';
        $this->ul  = new \SplQueue();
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
    public function getTex()
    {
        return $this->tex;
    }

    /**
     * @return array
     */
    public function getUl()
    {
        return $this->ul;
    }

    /**
     * @param string $href
     */
    public function setHref(string $href)
    {
        $this->href = $href;
    }

    /**
     * @param string $tex
     */
    public function setTex(string $tex)
    {
        $this->tex = $tex;
    }

    /**
     * @param Menu $objMenu
     */
    public function addMenu(Menu $objMenu):Menu
    {
        $this->ul->add($this->ul->count(), $objMenu);
        return $this;
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->href,
                $this->tex,
                $this->ul
            ]
        );
    }

    public function unserialize($serialized)
    {
        list(
            $this->href,
            $this->tex,
            $this->ul
            ) = unserialize($serialized);
    }

    public function getArray():array
    {
        $arrayMenu = [
            'href' => $this->href,
            'text' => $this->tex,
            'ul' => []
        ];
        if($this->ul->count()){
            $this->ul->rewind();
            while($this->ul->valid()){
                $objMenu = $this->ul->current();
                $arrayMenu['ul'][] =  $objMenu->getArray();
                $this->ul->next();
            }
        }
        
        return $arrayMenu;
    }
}

