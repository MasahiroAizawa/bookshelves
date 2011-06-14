package features.booksearch.variable.event
{
	import features.booksearch.variable.condition.BookSearchCondition;

	import flash.events.Event;

	public class BookSearchEvent extends Event
	{
		public function BookSearchEvent(type:String, condition:BookSearchCondition,
										bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);

			bookSearchCondition = condition;
		}

		public var bookSearchCondition:BookSearchCondition;
	}
}