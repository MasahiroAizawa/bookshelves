package
{
	import base.BaseSimpleCommand;

	import features.bookregister.controller.command.BookRegisterStartUpCommand;
	import features.booksearch.controller.command.BookSearchStartUpCommand;

	import org.puremvc.as3.interfaces.INotification;

	public class StartUpCommand extends BaseSimpleCommand
	{
		/**
		 * 初期化用コマンド<br>
		 * ここにアプリ全体の初期化を記述する<br>
		 * @param notification
		 */
		override public function execute(notification:INotification):void{
			super.execute(notification);

			//以下のCommandの使い方はややイレギュラー

			//書棚検索
			var bookSearchCommand:BookSearchStartUpCommand = new BookSearchStartUpCommand();
			bookSearchCommand.execute(notification);

			//書棚登録
			var bookRegisterCommand:BookRegisterStartUpCommand = new BookRegisterStartUpCommand();
			bookRegisterCommand.execute(notification);
		}
	}
}