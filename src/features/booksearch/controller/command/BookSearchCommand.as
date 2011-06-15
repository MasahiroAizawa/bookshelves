package features.booksearch.controller.command
{
	import base.BaseSimpleCommand;

	import features.booksearch.BookSearchConst;
	import features.booksearch.model.proxy.BookSearchProxy;
	import features.booksearch.variable.condition.BookSearchCondition;

	import org.puremvc.as3.interfaces.INotification;

	public class BookSearchCommand extends BaseSimpleCommand
	{
		override public function execute(notification:INotification):void{
			super.execute(notification);

			var condition:BookSearchCondition = notification.getBody() as BookSearchCondition;

			var proxy:BookSearchProxy = BookSearchProxy(facade.retrieveProxy(BookSearchConst.BOOK_SEARCH_PROXY));
			proxy.searchBooks(condition);
		}
	}
}