package features.bookregister.view.mediator
{
	import base.BaseMediator;
	import base.NotificationNames;

	import features.bookregister.BookRegisterConst;
	import features.bookregister.view.component.BookRegisterComplete;

	import flash.events.Event;

	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.observer.Notification;

	public class BookRegisterCompleteMediator extends BaseMediator
	{
		public function BookRegisterCompleteMediator(view:Object)
		{
			super(BookRegisterConst.BOOK_REGISTER_COMPLETE_MEDIATOR, view);

			complete.addEventListener(BookRegisterComplete.RETURN_INPUT, returnInput);
			complete.addEventListener(BookRegisterComplete.SEARCH_BOOK, searchBook);
		}

		public function get complete():BookRegisterComplete{
			return viewComponent as BookRegisterComplete;
		}

		/**
		 * 入力画面をリセットして戻る<br>
		 */
		private function returnInput(event:Event):void{
			sendNotification(NotificationNames.BOOK_INIT_INPUT);
			sendNotification(NotificationNames.BOOK_TRANS_TO_INPUT);
		}

		/**
		 * 検索画面に遷移する<br>
		 *
		 * @param event
		 */
		private function searchBook(event:Event):void{
			sendNotification(NotificationNames.BOOK_INIT_SEARCH_LIST);
			sendNotification(NotificationNames.BOOK_TRANS_TO_SEARCH);
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_REGISTER_COMPLETE];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				case NotificationNames.BOOK_REGISTER_COMPLETE:
					sendNotification(NotificationNames.BOOK_TRANS_TO_COMPLETE);
					break;
			}
		}
	}
}