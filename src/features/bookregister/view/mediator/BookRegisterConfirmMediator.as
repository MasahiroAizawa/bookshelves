package features.bookregister.view.mediator
{
	import base.BaseMediator;
	import base.NotificationNames;

	import entity.Book;

	import features.bookregister.BookRegisterConst;
	import features.bookregister.variable.event.BookRegisterEvent;
	import features.bookregister.view.component.BookRegisterConfirm;

	import org.puremvc.as3.interfaces.INotification;

	/**
	 * 図書登録の確認画面のMediator<br>
	 * このMediatorから登録処理自体を行わせるNotificationを投げる<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterConfirmMediator extends BaseMediator
	{
		public function BookRegisterConfirmMediator(view:Object)
		{
			super(BookRegisterConst.BOOK_REGISTER_CONFIRM_MEDIATOR, view);

			confirm.addEventListener(BookRegisterConfirm.BOOK_REGISTER, bookRegister);
		}

		public function get confirm():BookRegisterConfirm{
			return viewComponent as BookRegisterConfirm;
		}

		/**
		 * 図書の登録処理<br>
		 *
		 * @param event
		 */
		public function bookRegister(event:BookRegisterEvent):void{
			sendNotification(NotificationNames.BOOK_REGISTER, event.book);
		}

		override public function listNotificationInterests():Array{
			return [NotificationNames.BOOK_INIT_REGISTER_CONFIRM];
		}

		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()){
				case NotificationNames.BOOK_INIT_REGISTER_CONFIRM:
					//画面に、入力画面で入力した本の情報を渡す
					confirm.book = notification.getBody() as Book;

					//画面遷移
					sendNotification(NotificationNames.BOOK_TRANS_TO_CONFIRM);
					break;
			}
		}
	}
}