<?php
namespace App\Security\Providers;

use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use App\Security\Users\RestUser;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;
use App\Entity\Autorizacao\Usuario;
use Doctrine\Bundle\DoctrineBundle\Registry;

class RestUserProvider implements UserProviderInterface
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
        return RestUser::class === $class;
    }

    public function refreshUser(UserInterface $objUserInterface)
    {
       if(!$objUserInterface instanceof RestUser){
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
        
        $objUsuarios = $this->objRepository->loadUserByUsername($username);
        if($objUsuarios instanceof Usuario){
            $objRestUser = new RestUser();
            $objRestUser->setPassword($objUsuarios->getPassword());
            $objRestUser->setSalt($objUsuarios->getSalt());
            $objRestUser->setUsername($objUsuarios->getUsername());
            return $objRestUser;
        }
        throw new UsernameNotFoundException( sprintf('Username "%s" does not exist.', $username) );
    }
}
