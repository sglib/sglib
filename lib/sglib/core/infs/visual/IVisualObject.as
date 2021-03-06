﻿package sglib.core.infs.visual
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import sglib.core.data.State;
	import sglib.core.infs.transition.ITransition;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualObject 
	{
		/**
		 * the view is the sprite that contains the content of this VisualObject
		 */
		function get view() : Sprite;
		
		function set view(pview:Sprite):void;
		
		
		/**
		 * reset the registry point
		 * @param	px percentage based : 0-Left 1-Right
		 * @param	py percentage based : 0-Top 1-Bottom
		 */
		function setReg(px: Number, py: Number): IVisualObject;
		
		/**
		 * original width of the content
		 */
		function get width(): int;
		
		/**
		 * original height of the content
		 */
		function get height(): int;
		
		
		/**
		 * status of the VisualObject READY | DISABLE | ERROR
		 */
		function get status(): State;
		
		
		/**
		 * content Transitioner
		 */
		function get transition(): ITransition;
		
		function setTransition(ptrans: ITransition): IVisualObject;
	}
}