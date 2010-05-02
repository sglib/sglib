package sglib.core.gen
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import sglib.core.utils.copyObj;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newShape(parent: DisplayObject = null, props: Object = null) : Shape
	{
		var shape : Shape = new Shape();
		if (parent) (parent as DisplayObjectContainer).addChild(shape);
		if (props) copyObj(shape, props);
		return shape;
	}
}