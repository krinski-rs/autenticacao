<?php
namespace App\Util\Desktop;

use App\Util\Desktop\Table\Table;

class WindowContent implements \Serializable
{
    private $text       = NULL;
    private $objTable   = NULL;
    
    public function __construct(string $text = '')
    {
        $this->text     = $text;
        $this->objTable = new Table();
    }
    
    /**
     * @return \App\Util\Desktop\Table\Table
     */
    public function getTable()
    {
        return $this->objTable;
    }

    /**
     * @param \App\Util\Desktop\Table\Table $objTable
     */
    public function setTable(Table $objTable)
    {
        $this->objTable = $objTable;
    }

    /**
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * @param string $text
     */
    public function setText(string $text)
    {
        $this->text = $text;
    }

    public function getArray()
    {
        return [
            'text' => $this->text,
            'table' => $this->objTable->getArray()
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->text,
                $this->objTable
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->text,
            $this->objTable
        ) = unserialize($serialized);
    }
}

