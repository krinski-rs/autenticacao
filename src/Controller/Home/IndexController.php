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
        
        return $this->render('home/index.html.twig',  $objHome->getArray());
    }
}
