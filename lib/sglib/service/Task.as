package sglib.service 
{
	import sglib.core.Callback;
	import flash.events.IEventDispatcher;
	import sglib.core.infs.ITask;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public class Task implements ITask
	{
		protected var _list			: Array; //of TaskItemList
		protected var _id			: int; //executing id
		protected var _isRunning 	: Boolean;
		protected var _loop			: int;
		
		public function Task() 
		{
			_list = [];
		}
		
		public function add(pfunction:Function, pparams:Array = null):ITask
		{
			_list.push(new FunctionTaskItem(pfunction, pparams));
			return this;
		}
		
		public function waitForEvent(pdispatcher:IEventDispatcher, peventName:String):ITask
		{
			_list.push(new EventTaskItem(pdispatcher, [peventName]));
			return this;
		}
		
		public function waitForOneOfEvents(pdispatcher:IEventDispatcher, peventNames:Array):ITask
		{
			_list.push(new EventTaskItem(pdispatcher, peventNames));
			return this;
		}
		
		public function waitForCallback(pcallback:Callback, pvalidator:Function = null):ITask
		{
			_list.push(new CallbackTaskItem(pcallback, pvalidator));
			return this;
		}
		
		public function delay(ptime:Number):ITask
		{
			_list.push(new DelayTaskItem(ptime));
			return this;
		}
		
		public function removeAfter(pcount:int = 1):ITask
		{
			(_list[_list.length - 1] as TaskItemInfo).remove = pcount;
			return this;
		}
		
		public function effectiveAfter(pcount:int = 1):ITask
		{
			(_list[_list.length - 1] as TaskItemInfo).effective = pcount;
			return this;
		}
		
		public function pause():ITask
		{
			if (_isRunning) {
				_isRunning = false;
				(_list[_id] as TaskItemInfo).stop();
			}
			return this;
		}
		
		public function start():ITask
		{
			if (!_isRunning) {
				_isRunning = true;
				
				var tii : TaskItemInfo = _list[_id];
				if (tii.effective > 0) {
					tii.effective--;
					_isRunning = false;
					_id++;
					start();//next
				} else {
					tii.onComplete = _onTaskComplete;
					tii.start();
				}
				
				
			}
			return this;
		}
		
		private function _onTaskComplete():void
		{
			var tii : TaskItemInfo = _list[_id];
			//tii.onComplete = null;
			
			if (tii.remove > 0) {
				tii.remove--;
				_id++;
			} else if (tii.remove == 0 ){
				_list.splice(_id, 1);//remove this tii
			} else {
				_id++;//next task
			}
			
			//next task
			_isRunning = false;
			if (_id < _list.length) {//force start :: will consider organizing the code in this case
				start();
			} else {
				if (_loop != 0) {
					if (_loop > 0) _loop--;
					_id = 0;
					start();//restart
				}
			}
		}
		
		public function stop():ITask
		{
			pause();
			_id = 0;
			return this;
		}
		
		public function setLoop(value:int):ITask 
		{
			_loop = value;
			return this;
		}
		
	}

}

import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;
import sglib.core.Callback;

class TaskItemInfo {
	public var effective	: int;
	public var remove		: int;
	public var onComplete	: Function;
	
	public function TaskItemInfo(peffective: int = -1, premove: int = -1) {
		effective = peffective;
		remove = premove;
	}
	
	protected function _doStart():void {
		
	}
	
	public function start():void {
		_doStart();
	}
	
	public function stop():void {
		
	}
}

class FunctionTaskItem extends TaskItemInfo {
	public var f : Function;
	public var p : Array;
	
	public function FunctionTaskItem(pf: Function, pp : Array, peffective: int = -1, premove: int = -1) {
		f = pf;
		p = pp;
		super(peffective, premove);
	}
	
	override protected function _doStart():void 
	{
		f.apply(f, p);
		onComplete();
	}
}

class EventTaskItem extends TaskItemInfo {
	public var obj		: IEventDispatcher;
	public var evtTypes	: Array;
	
	public function EventTaskItem(pobj: IEventDispatcher, ptype: Array, peffective: int = -1, premove : int = -1) {
		obj = pobj;
		evtTypes = ptype;
		super(peffective, premove);
	}
	
	override protected function _doStart():void 
	{
		var l : int = evtTypes.length;
		
		for (var i: int = 0 ; i < l; i++) {
			obj.addEventListener(evtTypes[i], _onEvent);
		}
	}
	
	override public function stop():void 
	{
		var l : int = evtTypes.length;
		for (var i: int = 0 ; i < l; i++) {
			obj.removeEventListener(evtTypes[i], _onEvent);
		}
	}
	
	private function _onEvent(e:Event):void 
	{
		stop();
		onComplete();
	}
}

class DelayTaskItem extends TaskItemInfo {
	public var delay		: int; //miliseconds
	protected var timeId	: int;
	
	public function DelayTaskItem(pdelay: Number, peffective: int = -1, premove : int = -1) {
		delay = pdelay * 1000;
		super(peffective, premove);
	}
	
	override protected function _doStart():void 
	{
		timeId = setTimeout(_onTimeout, delay);
	}
	
	override public function stop():void 
	{
		clearTimeout(timeId);
		super.stop();
	}
	
	private function _onTimeout():void
	{
		//stop();
		onComplete();
	}
}

class CallbackTaskItem extends TaskItemInfo {
	public var callback		: Callback;
	public var validator	: Function;
	public var params		: Array;
	
	public function CallbackTaskItem(pcallback: Callback, pvalidator: Function = null, pparams: Array = null, peffective: int = -1, premove : int = -1) {
		callback = pcallback;
		validator = pvalidator;
		params = pparams;
		
		super(peffective, premove);
	}
	
	override protected function _doStart():void 
	{
		callback.addLsn(_onCallback);
	}
	
	override public function stop():void 
	{
		callback.remLsn(_onCallback);
	}
	
	private function _onCallback():void
	{
		if (validator == null || validator.apply(validator, params)) {
			stop();
			onComplete();
		}
	}
}