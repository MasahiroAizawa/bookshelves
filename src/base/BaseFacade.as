package base
{
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	/**
	 * PureMVCの核となるクラス<br>
	 *
	 * @author masahiro.A
	 */
	public class BaseFacade extends Facade implements IFacade
	{
		/**
		 * PureMVCの起動に使うNotificationの名前<br>
		 * @default
		 */
		private static const STARTUP:String = "startUp";

		/**
		 * シングルトン<br>
		 *
		 * @return
		 */
		public static function getInstance():BaseFacade{
			if(!instance) instance = new BaseFacade();
			return instance as BaseFacade;
		}

		/**
		 * コマンドを登録する<br>
		 */
		override protected function initializeController():void{
			super.initializeController();

			registerCommand(STARTUP, StartUpCommand);
		}

		/**
		 * メインアプリから呼ぶ起動スイッチ<br>
		 * @param app
		 */
		public function startup(app:bookshelves):void{
			sendNotification(STARTUP, app);
		}

		public function BaseFacade()
		{
			super();
		}
	}
}