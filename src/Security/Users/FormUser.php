<?php
namespace App\Security\Users;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\EquatableInterface;
use Doctrine\Common\Collections\Collection;
use App\Util\Regra\Permissao;

class FormUser implements UserInterface, EquatableInterface
{
    use Permissao;
    
    private $salt = NULL;
    private $username = NULL;
    private $password = NULL;
    private $arrayRules = [];
    
    public function eraseCredentials()
    {
        
    }

    public function setRoles(Collection $objArrayCollection)
    {
        if($objArrayCollection->count()){
            $objArrayCollection->first();
            while($objUsuarioRegra = $objArrayCollection->current()){
                $regra = str_replace(' ', '_', trim(preg_replace('!\s+!', ' ', $objUsuarioRegra->getRegra()->getNome())));
                $rules = $this->getNivelPermissao($objUsuarioRegra->getValor());
                if(count($rules)){
                    reset($rules);
                    while($rule = current($rules)){
                        $rule = $regra.$rule;
                        if(!in_array(mb_strtoupper($rule), $this->arrayRules)){
                            $this->arrayRules[] = mb_strtoupper($rule);
                        }
                        next($rules);
                    }
                }
                $objArrayCollection->next();
            }
        }
        if(count($this->arrayRules)){
            $this->arrayRules[] = 'ROLE_USER';
        }
    }

    public function getRoles()
    {
        return $this->arrayRules;
    }
    
    public function isEqualTo(UserInterface $objUserInterface)
    {
        if(!$objUserInterface instanceof FormUser){
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

