package datastore
{
	import entity.Book;

	import mx.collections.ArrayCollection;

	/**
	 * DB代わりの仮データ置き場<br>
	 *
	 * @author masahiro.A
	 */
	[Bindable]
	public class BookDataStore
	{
		private static var instance:BookDataStore;

		public static var bookStore:ArrayCollection = new ArrayCollection();

		public static function createBookData():void{
			bookStore = new ArrayCollection([
				new Book("9784274067938", "情熱プログラマー", "", new Date()),
				new Book("9784873114798", "プログラマが知るべき97のこと", "", new Date()),
				new Book("9784873114293", "ソフトウェアアーキテクトが知るべき97のこと", "", new Date()),
				new Book("9784873114026", "プロダクティブ・プログラマ", "", new Date()),
				new Book("9784873114026", "Effective Java", "", new Date()),
				new Book("9784774145969", "良いコードを書く技術", "", new Date()),
				new Book("9784798029184", "俺のコードのどこが悪い？", "", new Date()),
				new Book("9784048687157", "メタプログラミングRuby", "", new Date()),
				new Book("9784844329947", "エンジニアとしての生き方", "", new Date()),
				new Book("9784894712744", "達人プログラマー", "", new Date()),
				new Book("9784839924027", "アジャイルな見積りと計画づくり", "", new Date())
			]);
		}
	}
}