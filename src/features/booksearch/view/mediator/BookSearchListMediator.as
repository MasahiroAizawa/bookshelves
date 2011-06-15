package features.booksearch.view.mediator
{
	import base.BaseMediator;
	import base.NotificationNames;

	import features.booksearch.BookSearchConst;
	import features.booksearch.variable.condition.BookSearchCondition;
	import features.booksearch.variable.event.BookSearchEvent;
	import features.booksearch.view.component.BookSearchList;
	import features.booksearch.view.component.SearchPanel;

	import mx.collections.ArrayCollection;

	import org.puremvc.as3.interfaces.INotification;

	public class BookSearchListMediator extends BaseMediator
	{
		public function BookSearchListMediator(view:Object)
		{
			super(BookSearchConst.BOOK_SEARCH_LIST_MEDIATOR, view);

			bookSearch.searchPanel.addEventListener(SearchPanel.BOOK_SEARCH, search);
		}

		public function get bookSearch():BookSearchList{
			return viewComponent as BookSearchList;
		}

		/**
		 * 登録してある図書の検索を行う<br>
		 * @param event
		 */
		public function search(event:BookSearchEvent):void{
			var condition:BookSearchCondition = event.bookSearchCondition;
			sendNotification(NotificationNames.BOOK_SEARCH, condition);
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_SEARCH_RESULT
				];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				case NotificationNames.BOOK_SEARCH_RESULT:
					setResultList(notification.getBody());
					break;
			}

			function setResultList(resultList:ArrayCollection):void{
				bookSearch.resultVisible = true;
				bookSearch.bookResultList.bookList = resultList;
			}
		}
	}
}