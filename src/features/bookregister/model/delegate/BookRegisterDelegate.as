package features.bookregister.model.delegate
{
	import base.BaseDelegate;

	import datastore.BookDataStore;

	import entity.Book;

	import mx.rpc.IResponder;

	/**
	 * 書棚への登録処理を委譲される<br>
	 * サーバー側を実装してDBにつなぐ場合はここを変更すれば良い<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterDelegate extends BaseDelegate
	{
		public function BookRegisterDelegate(responder:IResponder)
		{
			super(responder);
		}

		/**
		 * 実際に書棚に図書を登録する<br>
		 *
		 * @param book
		 * @return
		 */
		public function registerBook(book:Book):Boolean{
			BookDataStore.bookStore.addItem(book);

			return true;
		}
	}
}