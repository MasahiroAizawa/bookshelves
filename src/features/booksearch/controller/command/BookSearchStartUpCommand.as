package features.booksearch.controller.command
{
	import base.BaseSimpleCommand;
	import base.NotificationNames;

	import features.booksearch.model.proxy.BookSearchProxy;

	import org.puremvc.as3.interfaces.INotification;

	/**
	 * 書棚検索のMediatorやProxyを登録する<br>
	 *
	 * @author masahiro.A
	 */
	public class BookSearchStartUpCommand extends BaseSimpleCommand
	{
		override public function execute(notification:INotification):void{
			super.execute(notification);

			//書棚検索
			//Command
			facade.registerCommand(NotificationNames.BOOK_SEARCH, BookSearchCommand);

			//Proxy
			facade.registerProxy(new BookSearchProxy());
		}
	}
}