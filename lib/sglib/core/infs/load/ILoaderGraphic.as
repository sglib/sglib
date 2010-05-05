package sglib.core.infs.load
{
	import flash.display.AVM1Movie;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import sglib.core.infs.play.IPlayerGraphic;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note	Flash use the same LoaderInfo for all loaded instances if they are sharing the same Loader, 
	 * 			so we'd better clone Loader instead of reuse them, this way we can access content.loaderInfo to get specific information about content
	 * 			There are still cases when we can reuse the Loader instance : the content themselves supposed to be replaced by each other
	 *  		(old content is not supposed to be existed when there is newer content loaded - like pages on a site)
	 * 		 	Check policy == true will slow down file download a little bit
	 * 
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public interface ILoaderGraphic extends ILoader
	{
		/**
		 * set the context, remember to do this before calling start()
		 * @param	pcheckPolicy remember that checkPolicy == true will slow down download a little bit
		 * @param	pappDomain
		 * @param	psecurDomain
		 * @return
		 */
		function context(pcheckPolicy : Boolean = false, pappDomain: ApplicationDomain = null, psecurDomain: SecurityDomain = null ): ILoaderGraphic;
		
		/**
		 * use the same Loader to load content or instantiate each time the url is set (default = true)
		 */
		function set reuseLoader(pvalue: Boolean): void;
		
		/**
		 * get the loaded content (only accessible after LoaderInfo dispatch event Event.INIT)
		 */
		function get loadContent(): DisplayObject;
		
		/**
		 * get the player attached to this loader - can be null
		 */
		function get player(): IPlayerGraphic;
		
		/**
		 * use a graphic cacher to improve load time / memory management
		 */
		function set cacher(pcacher: IGraphicCacher): void;
		
		/**
		 * the cacher using for this ILoaderGraphic intance - can be null
		 */
		function get cacher():IGraphicCacher;
		
	}
	
}