package features.bookregister.controller.command
{
	import base.BaseSimpleCommand;
	import base.NotificationNames;

	import features.bookregister.model.proxy.BookRegisterProxy;

	import org.puremvc.as3.interfaces.INotification;

	public class BookRegisterStartUpCommand extends BaseSimpleCommand
	{
		override public function execute(notification:INotification):void{
			super.execute(notification);

			//Command
			facade.registerCommand(NotificationNames.BOOK_REGISTER, BookRegisterCommand);

			//Proxy
			facade.registerProxy(new BookRegisterProxy());
		}
	}
}