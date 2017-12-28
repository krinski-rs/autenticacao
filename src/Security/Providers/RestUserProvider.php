<?php
namespace App\Security\Providers;

use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use App\Security\Users\RestUser;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;

class RestUserProvider implements UserProviderInterface
{
    private $objRepository = NULL;

    public function supportsClass($class)
    {
        exit('supportsClass');
        return RestUser::class === $class;
    }

    public function refreshUser(UserInterface $objUserInterface)
    {
         exit('refreshUser');
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
         * buscar o usuario de onde estiver da foma que achar melhor
         * exit('loadUserByUsername');
         * throw new UsernameNotFoundException( sprintf('Username "%s" does not exist.', $username) );
         */
        return new RestUser();
    }
}

