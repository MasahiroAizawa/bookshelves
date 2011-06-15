package base
{
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 * サーバーとの通信処理の委譲クラス<br>
	 *
	 * @author masahiro.A
	 */
	public class BaseDelegate
	{
		public function BaseDelegate(responder:IResponder)
		{
			//サーバーサイドとの通信を実装しないため、responderをくっつけたりはしない
			//実際に実装する時は共通のルールなどを設定したrequestを作成し、
			//役割に応じたDelegateから投げさせる
//			var req:HTTPService = new HTTPService();
//			req.addEventListener(ResultEvent.RESULT, responder.result);
//			req.addEventListener(FaultEvent.FAULT, responder.fault);
		}
	}
}