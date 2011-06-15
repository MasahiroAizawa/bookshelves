package entity
{
	/**
	 * 本のデータ<br>
	 *
	 * @author masahiro.A
	 */
	[Bindable]
	public class Book
	{
		public var isbn:String;
		public var title:String;
		public var explain:String;
		public var registerDate:Date;

		public function Book(isbnValue:String = null, titleValue:String = null,
							 explainValue:String = null, registerDateValue:Date = null)
		{
			this.isbn = isbnValue;
			this.title = titleValue;
			this.explain = explainValue;
			this.registerDate = registerDateValue;
		}
	}
}