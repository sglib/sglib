package sglib.core.infs 
{
	import flash.events.IEventDispatcher;
	import sglib.core.Callback;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public interface ITask 
	{
		/**
		 * Tasks
		 */
		function add(pfunction: Function, pparams: Array = null): ITask;
		function waitForEvent(pdispatcher: IEventDispatcher, peventName: String):ITask;
		function waitForOneOfEvents(pdispatcher: IEventDispatcher, peventNames: Array):ITask;
		function waitForCallback(pcallback: Callback, pvalidator : Function = null): ITask;
		function delay(ptime: Number):ITask;
		
		/**
		 * Modifiers
		 */
		function removeAfter(pcount: int = 1):ITask;//make previous task transient : remove after pcount time
		function effectiveAfter(pcount: int = 1): ITask; //make the previous task only effective after some count
		function setLoop(value:int):ITask;
		
		/**
		 * functionalities
		 */
		function pause(): ITask;
		function start(): ITask; //resume the paused tasks or start the tasks if it's not currently running
		function stop(): ITask; //stop the task if it's running
	}
	
}