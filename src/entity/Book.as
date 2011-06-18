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

		/**
		 * 登録日をyyyy/mm/dd形式の日付で返す<br>
		 *
		 * @return
		 */
		public function get YYYYMMDD():String{
			return registerDate.fullYear + "/" + (registerDate.month + 1) + "/" + registerDate.date;
		}

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