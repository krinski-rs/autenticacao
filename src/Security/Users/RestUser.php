<?php
namespace App\Security\Users;

use Symfony\Component\Security\Core\User\UserInterface;
use App\Entity\Autorizacao\Usuarios;
use Symfony\Component\Security\Core\User\EquatableInterface;

class RestUser extends Usuarios implements UserInterface, EquatableInterface
{

    public function eraseCredentials()
    {}

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
}

