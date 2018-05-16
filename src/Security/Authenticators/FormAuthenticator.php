<?php
namespace App\Security\Authenticators;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Guard\Authenticator\AbstractFormLoginAuthenticator;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Security\Core\Encoder\BCryptPasswordEncoder;

class FormAuthenticator extends AbstractFormLoginAuthenticator
{
    private $objRouterInterface                 = NULL;
    
    public function __construct(RouterInterface $objRouterInterface)
    {
        $this->objRouterInterface               = $objRouterInterface;
    }
    
    public function getCredentials(Request $objRequest)
    {
        if ($objRequest->getPathInfo() != '/login_check') {
            return;
        }
        
        $username = $objRequest->request->get('_username');
        $objRequest->getSession()->set(Security::LAST_USERNAME, $username);
        $password = $objRequest->request->get('_password');
        return [
            'username' => $username,
            'password' => $password
        ];
    }
    
    public function getUser($credentials, UserProviderInterface $objUserProviderInterface)
    {
        if(!trim($credentials['username']) || !trim($credentials['password'])){
            return ;
        }

        return $objUserProviderInterface->loadUserByUsername(trim($credentials['username']));
    }
    
    public function checkCredentials($credentials, UserInterface $objUserInterface)
    {
        $objUserPasswordEncoder = new BCryptPasswordEncoder(12);
        $password = $objUserPasswordEncoder->encodePassword(trim($credentials['password']), $objUserInterface->getSalt());
        
        if ($objUserPasswordEncoder->isPasswordValid($objUserInterface->getPassword(), trim( $credentials['password']), $objUserInterface->getSalt())) {
            return true;
        }
        throw new BadCredentialsException();
    }
    
    public function onAuthenticationSuccess(Request $objRequest, TokenInterface $objTokenInterface, $providerKey)
    {
        $url = $this->objRouterInterface->generate('home');
        return new RedirectResponse($url);
    }
    
    public function onAuthenticationFailure(Request $objRequest, AuthenticationException $objAuthenticationException)
    {
        $objRequest->getSession()->set(Security::AUTHENTICATION_ERROR, $objAuthenticationException);
        $url = $this->objRouterInterface->generate('login');
        
        return new RedirectResponse($url);
    }
    
    protected function getLoginUrl()
    {
        return $this->objRouterInterface->generate('login');
    }
    
    protected function getDefaultSuccessRedirectUrl()
    {
        return $this->objRouterInterface->generate('home');
    }
    
    public function supportsRememberMe()
    {
        return false;
    }
    
    public function supports(Request $objRequest)
    {
        return ($objRequest->request->has('_username') && $objRequest->request->has('_username'));
    }
}
