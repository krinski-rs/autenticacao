<?php
namespace App\Security\Authenticators;

use Symfony\Component\Security\Guard\AbstractGuardAuthenticator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Bundle\DoctrineBundle\Registry;
use App\Security\Providers\RestUserProvider;

class RestAuthenticator extends AbstractGuardAuthenticator
{
    private $objRegistry = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objRegistry = $objRegistry;
    }

    public function supportsRememberMe()
    {
        return FALSE;
    }

    public function onAuthenticationFailure(Request $objRequest, AuthenticationException $objAuthenticationException)
    {
        $data = array(
            'message' => strtr($objAuthenticationException->getMessageKey(), $objAuthenticationException->getMessageData())
        );
        
        return new JsonResponse($data, Response::HTTP_FORBIDDEN);
    }

    public function onAuthenticationSuccess(Request $objRequest, TokenInterface $objTokenInterface, $providerKey)
    {
        // on success, let the request continue
        return null;
    }

    public function getUser($credentials, UserProviderInterface $objUserProviderInterface)
    {
        if(!trim($credentials['username']) || !trim($credentials['password'])){
            return ;
        }
        /*
         * para verificar senha e outras coisas colocar no checkCredentials
         */
        if($objUserProviderInterface instanceof RestUserProvider){
            $objEntityManager = $this->objRegistry->getManager('trouble');
            $objEntityManager->getRepository('App\Entity\Autorizacao\Usuarios');
            $objUserLoaderInterface = $objEntityManager->getRepository('App\Entity\Autorizacao\Usuarios');
            $objUserProviderInterface->setRepository($objUserLoaderInterface);
        }
        return $objUserProviderInterface->loadUserByUsername($credentials['username']);
    }

    public function start(Request $objRequest, AuthenticationException $objAuthenticationException = null)
    {
        $data = array(
            'message' => 'Authentication Required'
        );
        
        return new JsonResponse($data, Response::HTTP_UNAUTHORIZED);
    }

    public function supports(Request $objRequest)
    {
        return ($objRequest->headers->has('Authorization') && (substr($objRequest->headers->get('Authorization'), 0, 5) === 'Basic') );
    }

    public function getCredentials(Request $objRequest)
    {
        $usernamePasswod = base64_decode(trim(substr($objRequest->headers->get('Authorization'), 5)));
        $usernamePasswod = explode(':', $usernamePasswod);
        if(count($usernamePasswod) !== 2){
            return ['username'=>'', 'password'=>''];
        }
        
        return ['username'=>$usernamePasswod[0], 'password'=>$usernamePasswod[1]];
    }

    public function checkCredentials($credentials, UserInterface $objUserInterface)
    {
        return ($objUserInterface->getPassword() == trim($credentials['password']));
    }
}

