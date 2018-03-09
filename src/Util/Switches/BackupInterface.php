<?php
namespace App\Util\Switches;

interface BackupInterface
{
    public function connect(): BackupInterface;
    public function backup();
    
    /**
     * 
     * @param string $host
     * @return \App\Util\Switches\BackupInterface
     * 
     */
    public function setHost(string $host):BackupInterface;
    
}
