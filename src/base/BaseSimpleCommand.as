package base
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 書棚管理システムの基底Commandクラス<br>
	 *
	 * @author masahiro.A
	 */
	public class BaseSimpleCommand extends SimpleCommand
	{
		/**
		 * Command基底クラスのアプリケーション共通処理<br>
		 *
		 * @param notification
		 */
		override public function execute(notification:INotification):void{
			BaseLogger.catchCommandNotification(this, notification);
		}
	}
}