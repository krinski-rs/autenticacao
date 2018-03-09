<?php
namespace App\Util\Paginas;

use App\Util\Desktop\Page;
use Symfony\Component\Yaml\Yaml;
use App\Util\Desktop\Icon;
use App\Util\Desktop\Dock;
use App\Util\Desktop\Window;
use App\Util\Desktop\FloatLeft;
use App\Util\Desktop\FloatRight;
use App\Util\Desktop\WindowTop;
use App\Util\Desktop\WindowContent;
use App\Util\Desktop\WindowInner;

class Home extends Page
{
    protected function configure()
    {
        $this->objBarTop->createMenu();
        $arrayIcons  = Yaml::parseFile($this->pathPage);
        if(count($arrayIcons)){
            $this->objDesktop->setIncrementLeft(100);
            $this->objDesktop->setIncrementTop(80);
            reset($arrayIcons);
            while($icon = current($arrayIcons)){
                
                
                if($this->hasPermissao($this->getUserInterface()->getRoles(), $icon['roles'])){
                    $key = key($arrayIcons);
                    $objIcon = new Icon('#icon_dock_'.$key, $icon['image_icon'], $icon['name']);
                    $this->objDesktop->addIcon($objIcon);
                    
                    $objFloatLeft = new FloatLeft($icon['image_window'], $icon['name']);
                    $objFloatRight = new FloatRight('icon_dock_'.$key);
                    $objWindowTop = new WindowTop();
                    $objWindowTop->setFloatLeft($objFloatLeft);
                    $objWindowTop->setFloatRight($objFloatRight);
                    
                    $objWindow = new Window('window_'.$key);
                    
                    $objWindowContent = new WindowContent('Teste');
                    $objWindowInner = new WindowInner();
                    
                    $objWindowInner->setWindowTop($objWindowTop);
                    $objWindowInner->setWindowContent($objWindowContent);
                    
                    $objWindow->setWindowInner($objWindowInner);
                    $this->objDesktop->addWindow($objWindow);
                    
                    $objDock = new Dock('icon_dock_'.$key, '#window_'.$key, $icon['image_doc'], $icon['name']);
                    $this->addDock($objDock);
                }
                next($arrayIcons);
            }
        }
    }
}

