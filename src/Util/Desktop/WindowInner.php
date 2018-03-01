<?php
namespace App\Util\Desktop;

class WindowInner implements \Serializable
{
    private $text               = NULL;
    private $objWindowTop       = NULL;
    private $objWindowContent   = NULL;

    public function __construct(string $text = NULL)
    {
        $this->text             = $text;
        $this->objWindowTop     = new WindowTop();
        $this->objWindowContent = new WindowContent();
    }
    
    /**
     * @return \App\Util\Desktop\WindowTop
     */
    public function getWindowTop()
    {
        return $this->objWindowTop;
    }
    
    /**
     * @return \App\Util\Desktop\WindowContent
     */
    public function getWindowContent()
    {
        return $this->objWindowContent;
    }
    
    /**
     * @param \App\Util\Desktop\WindowTop $objWindowTop
     */
    public function setWindowTop($objWindowTop)
    {
        $this->objWindowTop = $objWindowTop;
    }
    
    /**
     * @param \App\Util\Desktop\WindowContent $objWindowContent
     */
    public function setWindowContent($objWindowContent)
    {
        $this->objWindowContent = $objWindowContent;
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
            'window_top' => $this->objWindowTop->getArray(),
            'window_content' => $this->objWindowContent->getArray()
        ];
    }
    
    public function serialize()
    {
        return serialize(
            [
                $this->text,
                $this->objWindowTop,
                $this->objWindowContent
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->text,
            $this->objWindowTop,
            $this->objWindowContent
        ) = unserialize($serialized);
    }
}

