package base
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class BaseMediator extends Mediator
	{
		public function BaseMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}

		/**
		 * Notificationを投げる<br>
		 *
		 * @param notificationName
		 * @param body
		 * @param type
		 */
		override public function sendNotification(notificationName:String, body:Object=null, type:String=null):void{
			BaseLogger.sendNotificationLog(this, notificationName);
			super.sendNotification(notificationName, body, type);
		}

		override public function handleNotification(notification:INotification):void{
			BaseLogger.catchNotification(notification, this);
			super.handleNotification(notification);
		}
	}
}