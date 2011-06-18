package features.booksearch.view.mediator
{
	import base.BaseMediator;
	import base.NotificationNames;

	import features.booksearch.BookSearchConst;
	import features.booksearch.variable.condition.BookSearchCondition;
	import features.booksearch.variable.event.BookSearchEvent;
	import features.booksearch.view.component.BookSearchList;
	import features.booksearch.view.component.SearchPanel;

	import flash.events.Event;

	import mx.collections.ArrayCollection;

	import org.puremvc.as3.interfaces.INotification;

	public class BookSearchListMediator extends BaseMediator
	{
		public function BookSearchListMediator(view:Object)
		{
			super(BookSearchConst.BOOK_SEARCH_LIST_MEDIATOR, view);

			bookSearch.searchPanel.addEventListener(SearchPanel.BOOK_SEARCH, search);
			bookSearch.searchPanel.addEventListener(SearchPanel.BOOK_RESULT_INIT, resultInit);
		}

		public function get bookSearch():BookSearchList{
			return viewComponent as BookSearchList;
		}

		/**
		 * 登録してある図書の検索を行う<br>
		 * @param event
		 */
		private function search(event:BookSearchEvent):void{
			var condition:BookSearchCondition = event.bookSearchCondition;
			sendNotification(NotificationNames.BOOK_SEARCH, condition);
		}

		/**
		 * 検索結果を非表示にする<br>
		 *
		 * @param event
		 */
		private function resultInit(event:Event):void{
			setResultList(false, new ArrayCollection());
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_SEARCH_RESULT,
				NotificationNames.BOOK_INIT_SEARCH_LIST
			];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				case NotificationNames.BOOK_SEARCH_RESULT:
					setResultList(true, notification.getBody() as ArrayCollection);
					break;
				//検索パネルの初期化
				case NotificationNames.BOOK_INIT_SEARCH_LIST:
					bookSearch.searchPanel.clearSearch();
					break;
			}

		}

		/**
		 * 検索結果の表示切り替え<br>
		 *
		 * @param visible
		 * @param resultList
		 */
		private function setResultList(visible:Boolean, resultList:ArrayCollection):void{
			bookSearch.resultVisible = visible;
			bookSearch.bookResultList.bookList = resultList;
		}
	}
}