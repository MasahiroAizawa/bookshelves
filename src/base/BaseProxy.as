package base
{
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class BaseProxy extends Proxy implements IProxy
	{
		public function BaseProxy(proxyName:String)
		{
			super(proxyName);
		}

		/**
		 * Delegateに渡す結果処理Functionを作成する<br>
		 * 何も引数に渡さなければログなどを設定したデフォルトFunctionが呼ばれる<br>
		 *
		 * @param resultFunc
		 * @param faultFunc
		 * @return
		 */
		protected function getResponder(resultFunc:Function = null, faultFunc:Function = null):IResponder{
			if(resultFunc != null)
				resultFunc = onResult;
			if(faultFunc != null)
				faultFunc = onFault;
			return new Responder(resultFunc, faultFunc);
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
		/**
		 * Delegateの実行結果をログ出力する<br>
		 *
		 * @param event
		 */
		protected function onResult(event:ResultEvent):void{
			BaseLogger.onResultLogger(event);
		}

		/**
		 * Delegateの失敗をアラート表示する<br>
		 *
		 * @param event
		 */
		protected function onFault(event:FaultEvent):void{
			Alert.show("通信に失敗しました。\n" + event.message, "通信エラー");
		}
	}
}