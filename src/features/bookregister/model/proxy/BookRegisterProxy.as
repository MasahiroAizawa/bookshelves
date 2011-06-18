package features.bookregister.model.proxy
{
	import base.BaseProxy;
	import base.NotificationNames;

	import entity.Book;

	import features.bookregister.BookRegisterConst;
	import features.bookregister.model.delegate.BookRegisterDelegate;

	/**
	 * 本を書棚に登録する処理を行う<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterProxy extends BaseProxy
	{
		public function BookRegisterProxy()
		{
			super(BookRegisterConst.BOOK_REGISTER_PROXY);
		}

		public function registerBook(book:Book):void{
			//図書の登録処理を行う
			var delegate:BookRegisterDelegate = new BookRegisterDelegate(getResponder());
			if(delegate.registerBook(book))
				sendNotification(NotificationNames.BOOK_REGISTER_COMPLETE);
		}
	}
}