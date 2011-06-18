package features.bookregister.controller.command
{
	import base.BaseSimpleCommand;

	import entity.Book;

	import features.bookregister.BookRegisterConst;
	import features.bookregister.model.proxy.BookRegisterProxy;

	import org.puremvc.as3.interfaces.INotification;

	/**
	 * 図書の登録処理を行うためにデータをまとめる役割<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterCommand extends BaseSimpleCommand
	{
		override public function execute(notification:INotification):void{
			super.execute(notification);

			var book:Book = notification.getBody() as Book;

			var proxy:BookRegisterProxy = BookRegisterProxy(facade.retrieveProxy(BookRegisterConst.BOOK_REGISTER_PROXY));
			proxy.registerBook(book);
		}
	}
}