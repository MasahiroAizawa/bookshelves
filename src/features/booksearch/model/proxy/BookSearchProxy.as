package features.booksearch.model.proxy
{
	import base.BaseProxy;
	import base.NotificationNames;

	import features.booksearch.BookSearchConst;
	import features.booksearch.model.delegate.BookSearchDelegate;
	import features.booksearch.variable.condition.BookSearchCondition;

	import mx.collections.ArrayCollection;

	public class BookSearchProxy extends BaseProxy
	{
		public function BookSearchProxy()
		{
			super(BookSearchConst.BOOK_SEARCH_PROXY);
		}

		/**
		 * 本の検索の処理のあれこれをする<br>
		 *
		 * @param condition
		 */
		public function searchBooks(condition:BookSearchCondition):void{
			//サーバーサイドへ処理を投げる際にDelegateを呼ぶ
			//現在は使用しないが、サーバー実装時に変更が最小で済むように利用する
			var delegate:BookSearchDelegate = new BookSearchDelegate(getResponder());
			var resultList:ArrayCollection = delegate.searchBook(condition);

			returnResult(resultList);

			//サーバーと通信する時は不要
			function returnResult(result:ArrayCollection):void{
				sendNotification(NotificationNames.BOOK_SEARCH_RESULT, result);
			}
		}
	}
}