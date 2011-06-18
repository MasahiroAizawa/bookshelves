package features.bookregister.view.mediator
{
	import base.BaseMediator;
	import base.NotificationNames;

	import features.bookregister.BookRegisterConst;
	import features.bookregister.variable.event.BookRegisterEvent;
	import features.bookregister.view.component.BookRegisterInput;

	import org.puremvc.as3.interfaces.INotification;

	/**
	 * 図書情報の入力画面のMediator<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterInputMediator extends BaseMediator
	{
		public function BookRegisterInputMediator(view:Object)
		{
			super(BookRegisterConst.BOOK_REGISTER_INPUT_MEDIATOR, view);

			input.addEventListener(BookRegisterInput.BOOK_SEND, sendBook);
		}

		public function get input():BookRegisterInput{
			return viewComponent as BookRegisterInput;
		}

		/**
		 * 画面で入力した図書情報を次の画面へ送る<br>
		 *
		 * @param event
		 */
		public function sendBook(event:BookRegisterEvent):void{
			sendNotification(NotificationNames.BOOK_INIT_REGISTER_CONFIRM, event.book);
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_INIT_INPUT
			];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				case NotificationNames.BOOK_INIT_INPUT:
					input.clearInput();
					break;
			}
		}
	}
}