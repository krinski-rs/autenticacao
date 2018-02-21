<?php
namespace App\Security\Users;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\EquatableInterface;

class RestUser implements UserInterface, EquatableInterface
{
    private $salt = NULL;
    private $username = NULL;
    private $password = NULL;
    
    public function eraseCredentials()
    {
        
    }

    public function getRoles()
    {
        return ['ROLE_REST_USER'];
    }
    
    public function isEqualTo(UserInterface $objUserInterface)
    {
        if(!$objUserInterface instanceof RestUser){
            return FALSE;
        }
        
        if($this->getPassword() !== $objUserInterface->getPassword()){
            return FALSE;
        }
        
        if($this->getSalt() !== $objUserInterface->getSalt()){
            return FALSE;
        }
        
        if($this->getUsername() !== $objUserInterface->getUsername()){
            return FALSE;
        }
        
        return TRUE;
    }
    
    public function getPassword()
    {
        return $this->password;
    }
    
    public function getUsername()
    {
        return $this->username;
    }
    
    public function getSalt()
    {
        return $this->salt;
    }
    
    public function setPassword($password)
    {
        $this->password = $password;
    }
    
    public function setUsername($username)
    {
        $this->username = $username;
    }
    
    public function setSalt($salt)
    {
        $this->salt = $salt;
    }
}

