<?php
namespace App\Util\Desktop;

use Symfony\Component\Security\Core\User\UserInterface;

class Desktop implements \Serializable
{
    const MAX_ICONS_LINE = 13;
    private $arrayIcon          = NULL;
    private $arrayWindow        = NULL;
    private $incrementLeft      = NULL;
    private $incrementTop       = NULL;
    private $left               = 20;
    private $top                = 20;
    
    public function __construct(UserInterface $objUserInterface)
    {
        $this->arrayIcon    = new \SplQueue();
        $this->arrayWindow  = new \SplQueue();
    }
    
    /**
     * @return integer
     */
    public function getIncrementLeft()
    {
        return $this->incrementLeft;
    }

    /**
     * @return integer
     */
    public function getIncrementTop()
    {
        return $this->incrementTop;
    }

    /**
     * @param integer $incrementLeft
     */
    public function setIncrementLeft(int $incrementLeft)
    {
        $this->incrementLeft = $incrementLeft;
    }

    /**
     * @param integer $incrementTop
     */
    public function setIncrementTop(int $incrementTop)
    {
        $this->incrementTop = $incrementTop;
    }
    
    /**
     * @param Window $objWindow
     */
    public function addWindow(Window $objWindow):Desktop
    {
        $this->arrayWindow->add($this->arrayWindow->count(), $objWindow);
        return $this;
    }
    
    /**
     * @param Icon $objIcon
     */
    public function addIcon(Icon $objIcon):Desktop
    {
//         echo '(',$this->arrayIcon->count(),' % ', '5', ') =', ($this->arrayIcon->count() % 5);
//         print_r($this->getArray());
        $objIcon->setLeft($this->left);
        $objIcon->setTop($this->top);
        $this->arrayIcon->add($this->arrayIcon->count(), $objIcon);
        $this->left = ($this->left + $this->incrementLeft);
        if(($this->arrayIcon->count() % self::MAX_ICONS_LINE) === 0){
            $this->left = 20;
            $this->top = ($this->top + $this->incrementTop);
        }
        return $this;
    }
    
    public function getArrayIcon():array
    {
        $arrayIcon = [];
        if($this->arrayIcon->count()){
            $this->arrayIcon->rewind();
            while($this->arrayIcon->valid()){
                $objIcon = $this->arrayIcon->current();
                $arrayIcon[] = $objIcon->getArray();
                $this->arrayIcon->next();
            }
        }
        return $arrayIcon;
    }
    
    public function getArrayWindow():array
    {
        $arrayWindow = [];
        if($this->arrayWindow->count()){
            $this->arrayWindow->rewind();
            while($this->arrayWindow->valid()){
                $objWindow = $this->arrayWindow->current();
                $arrayWindow[] = $objWindow->getArray();
                $this->arrayWindow->next();
            }
        }
        return $arrayWindow;
    }
    
    public function getArray()
    {
        return [
            'icons' => $this->getArrayIcon(),
            'windows' => $this->getArrayWindow()
        ];
    }

    public function serialize()
    {
        return serialize(
            [
                $this->arrayIcon,
                $this->arrayWindow,
                $this->incrementLeft,
                $this->incrementTop,
                $this->left,
                $this->top
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->arrayIcon,
            $this->arrayWindow,
            $this->incrementLeft,
            $this->incrementTop,
            $this->left,
            $this->top
        ) = unserialize($serialized);
    }
}
