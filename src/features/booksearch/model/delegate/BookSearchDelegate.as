package features.booksearch.model.delegate
{
	import base.BaseDelegate;

	import datastore.BookDataStore;

	import entity.Book;

	import features.booksearch.variable.condition.BookSearchCondition;

	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class BookSearchDelegate extends BaseDelegate
	{
		public function BookSearchDelegate(responder:IResponder)
		{
			super(responder);
		}

		/**
		 * 条件として投げられた本を検索する<br>
		 *
		 * @param condition
		 * @return
		 */
		public function searchBook(condition:BookSearchCondition):ArrayCollection{
			//検索で元データを壊さないようにコピーを作成する
			var bookList:ArrayCollection = new ArrayCollection(BookDataStore.bookStore.toArray());

			searchBookList(bookList);

			return bookList;

			function searchBookList(list:ArrayCollection):void{
				var isbn:String = condition.isbn;
				var title:String = condition.title;
				var fromDate:Date = condition.from;
				var toDate:Date = condition.to;
				toDate.hours = 23;
				toDate.minutes = 59;
				toDate.seconds = 59;

				list.filterFunction = searchFilter;
				list.refresh();

				function searchFilter(item:Object):Boolean{
					if(!(item is Book)) return false;
					var book:Book = Book(item);
					//ISBNチェック
					if(isbn){
						if(book.isbn.indexOf(isbn) != 0)
							return false;
					}
					//書籍名チェック
					if(title){
						if(book.title.indexOf(title) == -1)
							return false;
					}
					//登録日 FROMチェック
					if(fromDate){
						if(book.registerDate < fromDate)
							return false;
					}
					//登録日 TOチェック
					if(toDate){
						if(book.registerDate > toDate)
							return false;
					}
					return true;
				} // searchFilter end
			} //  searchBookList end
		}
	}
}