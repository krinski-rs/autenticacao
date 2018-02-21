<?php
namespace App\Util\Desktop;

use Symfony\Component\Security\Core\User\UserInterface;

class BarTop
{
    private $objUserInterface = NULL;
    public function __construct(UserInterface $objUserInterface)
    {
        try {
            $this->objUserInterface = $objUserInterface;
        } catch (\Exception $e) {
            throw $e;
        }
    }
}

