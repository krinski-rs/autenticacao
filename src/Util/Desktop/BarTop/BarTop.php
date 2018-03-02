<?php
namespace App\Util\Desktop\BarTop;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Yaml\Yaml;
use App\Util\Traits\Regra\Permissao;

class BarTop implements \Serializable
{

    use Permissao;
    
    private $objUserInterface = NULL;
    private $arrayMenu = [];
    private $pathMenu = NULL;
    public function __construct(UserInterface $objUserInterface, string $pathMenu)
    {
        try {
            $this->objUserInterface = $objUserInterface;
            $this->arrayMenu  = new \SplQueue();
            $this->pathMenu = $pathMenu;
        } catch (\Exception $e) {
            throw $e;
        }
    }
    
    private function addChildren(Menu $objMenu, array $arrayUserRoles, array $arrayMenu)
    {
        if(count($arrayMenu)){
            reset($arrayMenu);
            while($menu = current($arrayMenu)){
                if($this->hasPermissao($arrayUserRoles, $menu['roles'])){
                    $objMenuChildren = new Menu();
                    $objMenuChildren->setHref($menu['href']);
                    $objMenuChildren->setTex($menu['text']);
                    if(count($menu['children'])){
                        $this->addChildren($objMenuChildren, $arrayUserRoles, $menu['children']);
                    }
                    $objMenu->addMenu($objMenuChildren);
                }
                next($arrayMenu);
            }
        }
    }
    
    public function createMenu(){
        try {
            $arrayUserRoles = $this->objUserInterface->getRoles();
            $arrayMenu  = Yaml::parseFile($this->pathMenu);
            if(count($arrayMenu)){
                reset($arrayMenu);
                while($menu = current($arrayMenu)){
                    if($this->hasPermissao($arrayUserRoles, $menu['roles'])){
                        $objMenu = new Menu();
                        $objMenu->setHref($menu['href']);
                        $objMenu->setTex($menu['text']);
                        if(count($menu['children'])){
                            $this->addChildren($objMenu, $arrayUserRoles, $menu['children']);
                        }
                        $this->addMenu($objMenu);
                    }
                    next($arrayMenu);
                }
            }
        } catch (\Exception $e) {
            throw $e;
        }
    }
    
    /**
     * @param Menu $objMenu
     */
    public function addMenu(Menu $objMenu):BarTop
    {
        $this->arrayMenu->add($this->arrayMenu->count(), $objMenu);
        return $this;
    }
    
    public function getArray():array
    {
        if($this->arrayMenu->count()){
            $arrayMenu = [];
            $this->arrayMenu->rewind();
            while($this->arrayMenu->valid()){
                $objMenu = $this->arrayMenu->current();
                $arrayMenu[] =  $objMenu->getArray();
                $this->arrayMenu->next();
            }
            return $arrayMenu;
        }
        return [];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->objUserInterface,
                $this->objMenu
            ]
        );
    }

    public function unserialize($serialized)
    {
        list(
            $this->objUserInterface,
            $this->objMenu
        ) = unserialize($serialized);
    }
}

