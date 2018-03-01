<?php
namespace App\Util\Desktop;

class WindowTop implements \Serializable
{
    private $objFloatLeft = NULL;
    private $objFloatRight = NULL;
    
    public function __construct()
    {
        $this->objFloatLeft     = new FloatLeft();
        $this->objFloatRight    = new FloatRight();
    }
    
    public function getArray()
    {
        return [
            'float_left'    => $this->objFloatLeft->getArray(),
            'float_right'   => $this->objFloatRight->getArray()
        ];
    }
    
    /**
     * @return \App\Util\Desktop\FloatLeft
     */
    public function getFloatLeft()
    {
        return $this->objFloatLeft;
    }

    /**
     * @return \App\Util\Desktop\FloatRight
     */
    public function getFloatRight()
    {
        return $this->objFloatRight;
    }

    /**
     * @param \App\Util\Desktop\FloatLeft $objFloatLeft
     */
    public function setFloatLeft(FloatLeft $objFloatLeft)
    {
        $this->objFloatLeft = $objFloatLeft;
    }

    /**
     * @param \App\Util\Desktop\FloatRight $objFloatRight
     */
    public function setFloatRight(FloatRight $objFloatRight)
    {
        $this->objFloatRight = $objFloatRight;
    }

    public function serialize()
    {
        return serialize(
            [
                $this->objFloatLeft,
                $this->objFloatRight
            ]
        );
    }
    
    public function unserialize($serialized)
    {
        list(
            $this->objFloatLeft,
            $this->objFloatRight
        ) = unserialize($serialized);
    }
}

