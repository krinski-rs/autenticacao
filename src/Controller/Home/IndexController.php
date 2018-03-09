<?php
namespace App\Controller\Home;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use App\Util\Paginas\Home;

class IndexController extends Controller
{
    public function login(Request $objRequest)
    {
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('home'));
        }
        
        $helper = $this->get('security.authentication_utils');
        return $this->render(
            'auth/login.html.twig',
            [
                'last_username' => $helper->getLastUsername(),
                'error'         => $helper->getLastAuthenticationError(),
            ]
        );
    }
    
    public function loginCheck()
    {
        
    }
    
    
    public function logout()
    {
        $this->get('security.context')->setToken(null);
        $this->get('request')->getSession()->invalidate();
    }
    
    public function home(Request $objRequest)
    {
        if (!$this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('login'));
        }
        $pathMenu = $this->get('kernel')->getRootDir().'/../config/menu/menu.yaml';
        $pathPage = $this->get('kernel')->getRootDir().'/../config/page/home.yaml';
        $objHome = new Home($this->getUser(), "Compra Ágil", $pathMenu, $pathPage);
        
//         $objPage->addDock($objDock1);
//         $objPage->setDesktop($objDesktop);
//         $objPage->setBarTop($objBarTop);
        
        
        
        
//         $objDesktop = new Desktop($this->getUser(), 'Compra Ágil');
//         $objIcon1 = new Icon();
//         $objIcon1->setHref('#icon_dock_computer');
//         $objIcon1->setLeft(20);
//         $objIcon1->setSrc('../css/jquery/desktop/images/icons/icon_32_addgroup.png');
//         $objIcon1->setTex('Permissão');
//         $objIcon1->setTop(20);
//         $objDesktop->addIcon($objIcon1);
        
//         $objDock1 = new Dock();
//         $objDock1->setHref('#window_computer');
//         $objDock1->setId('icon_dock_computer');
//         $objDock1->setSrc('../css/jquery/desktop/images/icons/icon_22_addgroup.png');
//         $objDock1->setTex('Permissão');
        
//         $objFloatLeft = new FloatLeft();
//         $objFloatLeft->setSrc('../css/jquery/desktop/images/icons/icon_16_addgroup.png');
//         $objFloatLeft->setText('Permissão');
//         $objFloatRight = new FloatRight();
//         $objFloatRight->setHref('icon_dock_computer');
//         $objWindowTop = new WindowTop();
//         $objWindowTop->setFloatLeft($objFloatLeft);
//         $objWindowTop->setFloatRight($objFloatRight);
        
//         $objBarTop = new BarTop($this->getUser());
//         $objBarTop->createMenuFromFile($pathMenu);
        
        
//         $objWindowContent = new WindowContent();
//         $objWindowContent->getText('Hello. You look nice today!');
        
//         $objTable = new Table();
        
//         $objHead = new Head();
//         $objTr = new Tr();
//         $objTr->addTh(new Th('shrink', '&nbsp;'));
//         $objTr->addTh(new Th(NULL, 'Name'));
//         $objTr->addTh(new Th(NULL, 'Date Modified'));
//         $objTr->addTh(new Th(NULL, 'Date Created'));
//         $objTr->addTh(new Th(NULL, 'Size'));
//         $objTr->addTh(new Th(NULL, 'Kind'));
        
//         $objHead->addTr($objTr);
//         $objTable->setHead($objHead);
        
//         $objBody = new Body();
//         $objTr2 = new Tr();
//         $objTr2->addTd(new Td(NULL, '<img src="../css/jquery/desktop/images/icons/icon_16_drive.png" />'));
//         $objTr2->addTd(new Td(NULL, 'Hard Drive'));
//         $objTr2->addTd(new Td(NULL, 'Today'));
//         $objTr2->addTd(new Td(NULL, '&mdash;'));
//         $objTr2->addTd(new Td(NULL, '200 GB'));
//         $objTr2->addTd(new Td(NULL, 'Volume'));
//         $objBody->addTr($objTr2);
        
//         $objTr3 = new Tr();
//         $objTr3->addTd(new Td(NULL, '<img src="../css/jquery/desktop/images/icons/icon_16_disc.png" />'));
//         $objTr3->addTd(new Td(NULL, 'Audio CD'));
//         $objTr3->addTd(new Td(NULL, '&mdash;'));
//         $objTr3->addTd(new Td(NULL, '&mdash;'));
//         $objTr3->addTd(new Td(NULL, '2.92 GB'));
//         $objTr3->addTd(new Td(NULL, 'Media'));
//         $objBody->addTr($objTr3);
        
//         $objTr4 = new Tr();
//         $objTr4->addTd(new Td(NULL, '<img src="../css/jquery/desktop/images/icons/icon_16_network.png" />'));
//         $objTr4->addTd(new Td(NULL, 'Network'));
//         $objTr4->addTd(new Td(NULL, '&mdash;'));
//         $objTr4->addTd(new Td(NULL, '&mdash;'));
//         $objTr4->addTd(new Td(NULL, '&mdash;'));
//         $objTr4->addTd(new Td(NULL, 'LAN'));
//         $objBody->addTr($objTr4);
        
//         $objTable->setBody($objBody);
        
//         $objWindowContent->setTable($objTable);
        
//         $objWindowContent->setText('Hello. You look nice today');
        
//         $objWindowInner = new WindowInner('Build: TK421');
        
//         $objWindowInner->setWindowTop($objWindowTop);
//         $objWindowInner->setWindowContent($objWindowContent);
        
//         $objWindow = new Window('window_computer');
//         $objWindow->setWindowInner($objWindowInner);
        
//         $objDesktop->addWindow($objWindow);
        
        
        return $this->render('home/index.html.twig',  $objHome->getArray());
    }
}
