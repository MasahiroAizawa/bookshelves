package
{
	import base.BaseMediator;
	import base.NotificationNames;

	import flash.events.Event;

	import org.puremvc.as3.interfaces.INotification;

	public class BookShelvesMediator extends BaseMediator
	{
		public function BookShelvesMediator(view:Object)
		{
			super(bookshelves.BOOK_SHELVES, view);

			app.addEventListener(bookshelves.BOOK_SEARCH_INIT, bookSearchInit);
			app.addEventListener(bookshelves.BOOK_REGISTER_INIT, bookRegisterInit);
		}

		public function get app():bookshelves{
			return viewComponent as bookshelves;
		}

		/**
		 * 書棚検索の初期化<br>
		 *
		 * @param event
		 */
		private function bookSearchInit(event:Event):void{
			sendNotification(NotificationNames.BOOK_INIT_SEARCH_LIST);
		}

		/**
		 * 書棚登録入力画面の初期化<br>
		 *
		 * @param event
		 */
		private function bookRegisterInit(event:Event):void{
			sendNotification(NotificationNames.BOOK_INIT_INPUT);
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_TRANS_TO_CONFIRM,
				NotificationNames.BOOK_TRANS_TO_COMPLETE,
				NotificationNames.BOOK_TRANS_TO_INPUT,
				NotificationNames.BOOK_TRANS_TO_SEARCH
				];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				//書棚登録入力画面
				case NotificationNames.BOOK_TRANS_TO_INPUT:
					app.viewStack.selectedChild = app.bookRegisterInput;
					break;
				//書棚登録確認画面
				case NotificationNames.BOOK_TRANS_TO_CONFIRM:
					app.viewStack.selectedChild = app.bookRegisterConfirm;
					break;
				//書棚登録完了画面
				case NotificationNames.BOOK_TRANS_TO_COMPLETE:
					app.viewStack.selectedChild = app.bookRegisterComplete;
					break;
				//書棚検索画面
				case NotificationNames.BOOK_TRANS_TO_SEARCH:
					app.viewStack.selectedChild = app.bookSearchList;
					break;
			}
		}
	}
}