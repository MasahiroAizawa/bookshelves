package features.bookregister.variable.event
{
	import entity.Book;

	import flash.events.Event;

	/**
	 * 図書の登録の際の、図書データの受け渡しに使うEvent<br>
	 * 通常のEventに加えて、Bookのデータを持つ<br>
	 *
	 * @author masahiro.A
	 */
	public class BookRegisterEvent extends Event
	{
		public function BookRegisterEvent(type:String, bookValue:Book, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);

			this.book = bookValue;
		}

		public var book:Book;
	}
}