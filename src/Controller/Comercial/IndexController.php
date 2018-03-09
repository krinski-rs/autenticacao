<?php
namespace App\Controller\Comercial;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use App\Util\Paginas\Home;
use Symfony\Component\Form\Forms;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class IndexController extends Controller
{
    public function home(Request $objRequest)
    {
        if (!$this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('login'));
        }
        $pathMenu = $this->get('kernel')->getRootDir().'/../config/menu/menu.yaml';
        $pathPage = $this->get('kernel')->getRootDir().'/../config/page/comercial.yaml';
        $objHome = new Home($this->getUser(), "Compra Ágil", $pathMenu, $pathPage);
        return $this->render('comercial/index.html.twig',  $objHome->getArray());
    }
    
    
    public function lpu(Request $objRequest)
    {
        if (!$this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirect($this->generateUrl('login'));
        }
        
        $formFactory = Forms::createFormFactoryBuilder()->getFormFactory();
        
        $form = $formFactory->createBuilder()
            ->add('chitos', TextType::class)
            ->getForm();
        
            return $this->render('comercial/lpu/new.html.twig', array(
                'form' => $form->createView(),
            ));
            
        $pathMenu = $this->get('kernel')->getRootDir().'/../config/menu/menu.yaml';
        $pathPage = $this->get('kernel')->getRootDir().'/../config/page/home.yaml';
        $objHome = new Home($this->getUser(), "Compra Ágil", $pathMenu, $pathPage);
        return $this->render('home/index.html.twig',  $objHome->getArray());
    }
}
