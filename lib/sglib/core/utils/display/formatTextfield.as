package sglib.core.utils.display
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import sglib.core.utils.copyObj;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * format/set properites for a textfield using both textformat when neccessary, included bold, italic, underline, text, ...
	 * @param	ptf the textfield that will be format
	 * @param	pprops the properties / format that will be applied to the textfield
	 */
	public function formatTextField(ptf: TextField, pprops: Object): void {
		var txtFormat : Object = { align: 1, blockIndent: 1, bold: 1, bullet: 1, color: 1, font: 1, indent: 1, italic: 1, italic: 1, kerning: 1, leading: 1, leftMargin: 1, letterSpacing: 1, rightMargin: 1, size: 1, tabStops: 1, target: 1, underline: 1, url: 1 };
		var formatObj : Object = { };
		
		for (var s : String in pprops) {
			if (s in txtFormat) {//save into a formatObj
				formatObj[s] = pprops[s];
			} else {//set properties directly
				ptf[s] = pprops[s];
			}
		}
		
		var format : TextFormat = ptf.getTextFormat();
		copyObj(format, formatObj);
		ptf.setTextFormat(format);
		ptf.defaultTextFormat = format;
	}

}