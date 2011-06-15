package base
{
	import flash.utils.getQualifiedClassName;

	import mx.rpc.events.ResultEvent;

	import org.puremvc.as3.interfaces.INotification;

	public class BaseLogger
	{
		/**
		 * ログの出力フラグ<br>
		 *
		 * @default
		 */
		private static var debugMode:Boolean = true;

		/**
		 * Mediatorの登録ログ<br>
		 * @param mediator
		 */
		public static function registerMediator(mediator:BaseMediator):void{
			debug("[register mediator]" + mediator.getMediatorName());
		}

		/**
		 * Mediator他からNotificationをsendするときにログ出力する<br>
		 *
		 * @param mediator
		 * @param notification
		 */
		public static function sendNotificationLog(target:Object, notificationName:String):void{
			debug("[send by " + getQualifiedClassName(target) + "]" + notificationName);
		}

		/**
		 * CommandでNotificationを受信した時に出力する<br>
		 * @param notification
		 */
		public static function catchCommandNotification(command:BaseSimpleCommand, notification:INotification):void{
			debug("[exec by " + getQualifiedClassName(command) + "]" + notification.getName());
		}

		/**
		 * Proxyの実行結果をログ出力する<br>
		 * @param event
		 */
		public static function onResultLogger(event:ResultEvent):void{
			debug("[onResult]" + event.message);
		}

		/**
		 * MediatorがNotificationを受信した時にログ出力する<br>
		 *
		 * @param notification
		 * @param mediator
		 */
		public static function catchNotification(notification:INotification, mediator:BaseMediator):void{
			debug("[catch by " + mediator.getMediatorName() + "]" + notification.getName());
		}
		/**
		 * ログ出力<br>
		 * @param parameters
		 */
		public static function debug(...parameters:*):void{
			if(debugMode)
				trace("[debug]" + new Date().toLocaleDateString() + parameters);
		}
	}
}