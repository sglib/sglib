package service
{
	import flash.events.MouseEvent;
	import sglib.core.Callback;
	import sglib.core.gen.newTask;
	import sglib.core.infs.ITask;
	import sglib.service.Task;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public class TaskTest extends Test
	{
		protected var tsk : ITask;
		protected var cb : Callback;
		
		public function TaskTest() 
		{
			//import 
			var a : Task;
			
			cb = new Callback();
			
			tsk = newTask().setLoop(-1);
			
			tsk		.add(trace, ['first Task: ------------------------------------'])
					.delay(1)
					.add(trace, ['second Task : Function trigger after 1 second '])
					.add(trace, ['special task :: --- This will only appears 2 times at loopId == 1 || loopId == 2 ----']).effectiveAfter(1).removeAfter(2)
					.waitForEvent(stage, MouseEvent.CLICK)
					.add(trace, ['third Task : Function trigger after mouse click'])
					.waitForCallback(cb)
					.add(trace, ['fourth Task : Function trigger after callback dispatch by mouse wheel'])
					.start();
					
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
		}
		
		private function onMouseWheel(e:MouseEvent):void 
		{
			cb.dispatch();
		}
		
	}

}