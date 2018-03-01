<?php
namespace App\Util\Desktop;

use Symfony\Component\Security\Core\User\UserInterface;

class Desktop implements \Serializable
{
    private $arrayIcon = NULL;
    private $arrayWindow = NULL;
    
    public function __construct(UserInterface $objUserInterface)
    {
        $this->arrayIcon    = new \SplQueue();
        $this->arrayWindow  = new \SplQueue();
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
        $this->arrayIcon->add($this->arrayIcon->count(), $objIcon);
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
                $this->arrayWindow
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->arrayIcon,
            $this->arrayWindow
        ) = unserialize($serialized);
    }
}
