<?php
namespace App\Util\Switches;

interface SwitchInterface
{
    public function getAlias(): array;
    public function getAdminStatus(): array;
    public function getOperStatus(): array;
    public function getName(): array;
    public function getStatsDuplexStatus(): array;
    public function backup():SwitchInterface;
    public function status(): array;
}
