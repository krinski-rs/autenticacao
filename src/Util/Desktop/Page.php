<?php
namespace App\Util\Desktop;

use Symfony\Component\Security\Core\User\UserInterface;
use App\Util\Desktop\BarTop\BarTop;

class Page implements \Serializable
{
    private $objUserInterface   = NULL;
    private $maxIcons           = NULL;
    private $incrementLeft      = NULL;
    private $incrementTop       = NULL;
    private $title              = NULL;
    private $arrayDoc           = NULL;
    private $objDesktop         = NULL;
    private $objBarTop          = NULL;

    public function __construct(UserInterface $objUserInterface, int $maxIcons = 10, int $incrementLeft = 20, int $incrementTop = 80, string $title = NULL)
    {
        $this->objUserInterface = $objUserInterface;
        $this->maxIcons         = $maxIcons;
        $this->incrementLeft    = $incrementLeft;
        $this->incrementTop     = $incrementTop;
        $this->title            = $title;
        $this->arrayDoc         = new \SplQueue();
        $this->objDesktop       = new Desktop($objUserInterface);
        $this->objBarTop        = new BarTop($objUserInterface);
    }
    
    /**
     * @return \Symfony\Component\Security\Core\User\UserInterface
     */
    public function getUserInterface():UserInterface
    {
        return $this->objUserInterface;
    }

    /**
     * @return int
     */
    public function getMaxIcons():int
    {
        return $this->maxIcons;
    }

    /**
     * @return int
     */
    public function getIncrementLeft():int
    {
        return $this->incrementLeft;
    }

    /**
     * @return int
     */
    public function getIncrementTop():int
    {
        return $this->incrementTop;
    }

    /**
     * @return \SplQueue
     */
    public function getArrayDoc():\SplQueue
    {
        return $this->arrayDoc;
    }

    /**
     * @return \App\Util\Desktop\Desktop
     */
    public function getDesktop():Desktop
    {
        return $this->objDesktop;
    }

    /**
     * @return \App\Util\Desktop\BarTop\BarTop
     */
    public function getBarTop():BarTop
    {
        return $this->objBarTop;
    }

    /**
     * @param \Symfony\Component\Security\Core\User\UserInterface $objUserInterface
     */
    public function setUserInterface(UserInterface $objUserInterface):Page
    {
        $this->objUserInterface = $objUserInterface;
        return $this;
    }

    /**
     * @param int $maxIcons
     */
    public function setMaxIcons(int $maxIcons):Page
    {
        $this->maxIcons = $maxIcons;
        return $this;
    }

    /**
     * @param int $incrementLeft
     */
    public function setIncrementLeft(int $incrementLeft):Page
    {
        $this->incrementLeft = $incrementLeft;
        return $this;
    }

    /**
     * @param int $incrementTop
     */
    public function setIncrementTop(int $incrementTop):Page
    {
        $this->incrementTop = $incrementTop;
        return $this;
    }

    /**
     * @param \SplQueue $arrayDoc
     */
    public function setArrayDoc(\SplQueue $arrayDoc):Page
    {
        $this->arrayDoc = $arrayDoc;
        return $this;
    }

    /**
     * @param \App\Util\Desktop\Desktop $objDesktop
     */
    public function setDesktop(Desktop $objDesktop):Page
    {
        $this->objDesktop = $objDesktop;
        return $this;
    }

    /**
     * @param \App\Util\Desktop\BarTop\BarTop $objBarTop
     */
    public function setBarTop(BarTop $objBarTop):Page
    {
        $this->objBarTop = $objBarTop;
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle():string
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle(string $title):Page
    {
        $this->title = $title;
        return $this;
    }
    
    /**
     * @param Dock $objDock
     */
    public function addDock(Dock $objDock):Page
    {
        $this->arrayDoc->add($this->arrayDoc->count(), $objDock);
        return $this;
    }
    
    public function getArray():array
    {
        return [
            'title' => $this->title,
            'desktop' => $this->objDesktop->getArray(),
            'dock' => $this->getArrayDock(),
            'bar_top' => $this->objBarTop->getArray()
        ];
    }
    
    public function getArrayDock():array
    {
        $arrayDock = [];
        if($this->arrayDoc->count()){
            $this->arrayDoc->rewind();
            while($this->arrayDoc->valid()){
                $objDock = $this->arrayDoc->current();
                $arrayDock[] = $objDock->getArray();
                $this->arrayDoc->next();
            }
        }
        return $arrayDock;
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->arrayDoc,
                $this->incrementLeft,
                $this->incrementTop
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->arrayDoc,
            $this->incrementLeft,
            $this->incrementTop
        ) = unserialize($serialized);
    }
}
