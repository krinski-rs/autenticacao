<?php
namespace App\Security\Providers;

use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;
use App\Entity\Autorizacao\Usuario;
use Doctrine\Bundle\DoctrineBundle\Registry;
use App\Security\Users\FormUser;

class FormUserProvider implements UserProviderInterface
{
    private $objRepository = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $objEntityManager = $objRegistry->getManager('trouble');
        $this->objRepository = $objEntityManager->getRepository('App\Entity\Autorizacao\Usuario');
    }
    
    public function setRepository(UserLoaderInterface $objUserLoaderInterface)
    {
        $this->objRepository = $objUserLoaderInterface;
    }
    
    public function supportsClass($class)
    {
        return FormUser::class === $class;
    }

    public function refreshUser(UserInterface $objUserInterface)
    {
       if(!$objUserInterface instanceof FormUser){
            throw new UnsupportedUserException(
                sprintf('Instances of "%s" are not supported.', get_class($objUserInterface))
            );
        }
        return $this->loadUserByUsername($objUserInterface->getUsername());
    }

    public function loadUserByUsername($username)
    {
        /*
         * buscar o usuario de onde estiver da forma que achar melhor
         */
        $objUsuario = $this->objRepository->loadUserByUsername($username);
        if($objUsuario instanceof Usuario){
            $objFormUser = new FormUser();
            $objFormUser->setPassword($objUsuario->getPassword());
            $objFormUser->setSalt($objUsuario->getSalt());
            $objFormUser->setUsername($objUsuario->getUsername());
            $objFormUser->setRoles($objUsuario->getUsuarioRegra());
            return $objFormUser;
        }
        throw new UsernameNotFoundException( sprintf('Username "%s" does not exist.', $username) );
    }
}
