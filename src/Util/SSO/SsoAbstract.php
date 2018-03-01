<?php
namespace App\Util\SSO;

use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Request;

abstract class SsoAbstract implements SsoInterface {
    
    private $objContainer = NULL;
    protected $objSession = NULL;
    protected $objLogger = NULL;
    private $objRequestStack = NULL;
    private $params = array();
    
    public function __construct(Container $objContainer, array $params){
        $this->objContainer = $objContainer;
        $this->objLogger = $this->objContainer->get('logger');
        $this->params = $params;
    }
    
    public function isLoggedIn():bool
    {
        $this->objLogger->info('sessionData', [$this->getUserSession()->all()]);
        return !empty($this->getUserData());
    }
    
    public function invalidate():bool
    {
        if($this->isLoggedIn() && $this->objSession instanceof Session)
        {
            if(!$this->objSession->isStarted()){
                $this->objSession->start();
            }
            $this->objSession->clear();
            $this->objSession->invalidate();
            $this->objSession = NULL;
        }
        return true;
    }
    
    public function getUserSession():Session
    {
        if (!($this->objSession instanceof Session)) {
            $this->objSession = $this->objContainer->get('session');
        }
        return $this->objSession;
    }
    
    public function getUserData():array
    {
        return (is_array($this->getUserSession()->get('userData')) ? $this->getUserSession()->get('userData') : array());
    }
    
    public function setUserData(array $userData):SsoInterface
    {
        $this->getUserSession();
        $userData['accessToken'] = $this->objSession->getId();
        $this->objSession->set('userData', $userData);
        return $this;
    }
    
    public function getRequest():Request
    {
        return $this->objRequestStack->getMasterRequest();
    }
    
    public function setRequestStack(RequestStack $objRequestStack):SsoInterface
    {
        $this->objRequestStack = $objRequestStack;
        return $this;
    }
    
    public function getParams():array
    {
        return (is_array($this->params) ? $this->params : []);
    }
    
    public function getCredentials():array
    {
        $objRequest = $this->getRequest();
        $objHeaderBag = $objRequest->headers;
        
        $accessToken = trim($objHeaderBag->get('AccessToken'));
        if(!$accessToken){
            throw new \InvalidArgumentException("Parameter 'AccessToken' of value '' violated a constraint 'This value should not be blank.'");
        }
        
        $this->getUserSession();
        $this->objSession->save();
        $this->objSession->setId($accessToken);
        if($this->isLoggedIn()){
            return $this->getUserData();
        }
        return array();
    }
}