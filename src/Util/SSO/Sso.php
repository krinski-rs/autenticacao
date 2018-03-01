<?php
namespace App\Util\SSO;

use Symfony\Component\HttpFoundation\Request;

class Sso extends SsoAbstract
{
    public function login(Request $objRequest):array
    {
        try {
            if($this->isLoggedIn()){
                $this->invalidate();
            }
            $this->validate($objRequest);
            return $this->setUserData(['a'=>1,'b'=>2])
            ->getUserData();
        } catch (\Exception $ex){
            throw $ex;
        }
    }
    
    public function validate(Request $objRequest):bool
    {
        try {

            $objRequest->attributes->get('login', true);
            $objRequest->attributes->get('password', true);
            
            $objRequest = $this->getRequest();
            $objHeaderBag = $objRequest->headers;
            
            $appKey = trim($objHeaderBag->get('AppKey'));
            $authVersion = trim($objHeaderBag->get('AuthVersion'));
            
            if(!$appKey){
                throw new \InvalidArgumentException("Parameter 'AppKey' of value '' violated a constraint 'This value should not be blank.'");
            }
            
            if(!$authVersion){
                throw new \InvalidArgumentException("Parameter 'AuthVersion' of value '' violated a constraint 'This value should not be blank.'");
            }
            
        } catch (\InvalidArgumentException $ex){
            throw $ex;
        } catch (\Exception $ex){
            throw $ex;
        }
        return true;
    }
}
