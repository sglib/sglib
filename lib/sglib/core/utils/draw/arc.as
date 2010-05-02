package sglib.core.utils.draw
{
	import flash.display.Graphics;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * draw an arc
	 * @param	graphics the graphics that will be drawn
	 * @param	ox x origin
	 * @param	oy y orign
	 * @param	r radius
	 * @param	stAngle start drawing angle
	 * @param	edAngle end drawing angle
	 * @return
	 */
	public function arc(graphics: Graphics, ox: int, oy: int, r: Number, stAngle: Number, edAngle: Number): Graphics
	{
		var nAngles : int = Math.ceil((edAngle-stAngle) / 45);
		var sAngle : Number = (edAngle-stAngle) / nAngles * Math.PI/180;//always smaller than 45 and more than 45/2
		
		var cAngle : Number = stAngle * Math.PI / 180;
		var rMid	: Number = r / Math.cos(sAngle / 2);
		
		graphics.moveTo(ox + r * Math.cos(cAngle), oy + r * Math.sin(cAngle));
		
		for (var i: int = 0; i < nAngles; i++) {
			graphics.curveTo(rMid * Math.cos(cAngle + sAngle / 2), rMid * Math.sin(cAngle + sAngle / 2), 
							r * Math.cos(cAngle + sAngle), r * Math.sin(cAngle + sAngle));
			cAngle += sAngle;
		}
		
		return graphics;
	}
}