package sglib.core.gen  
{
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	import sglib.core.utils.display.formatTextField;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newTextField(p: DisplayObject = null, props: Object = null) : TextField
	{
		var tf : TextField = new TextField();
		tf.blendMode = BlendMode.LAYER;
		
		if (p) (p as DisplayObjectContainer).addChild(tf);
		if (props) formatTextField(tf, props);
		
		return tf;
	}
}