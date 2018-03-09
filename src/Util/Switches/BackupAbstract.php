<?php
namespace App\Util\Switches;

use Psr\Log\LoggerInterface;

abstract class BackupAbstract implements BackupInterface
{
    
    const PORT                  = 23;
    const TIME_OUT              = 10;
    
    private $objLoggerInterface = NULL;
    private $host               = NULL;
    private $objDate            = NULL;
    
    public function __construct(LoggerInterface $objLoggerInterface)
    {
        $this->objLoggerInterface   = $objLoggerInterface;
        $this->objDate              = new \DateTime();
    }
    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\BackupInterface::backup()
     */
    public function backup()
    {
        // TODO Auto-generated method stub
        
    }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\BackupInterface::connect()
     */
    public function connect(): BackupInterface
    {
        // TODO Auto-generated method stub
        return $this;
   }

    /**
     * {@inheritDoc}
     * @see \App\Util\Switches\BackupInterface::setHost()
     */
    public function setHost(string $host): BackupInterface
    {
        // TODO Auto-generated method stub
        return $this;
    }

}
