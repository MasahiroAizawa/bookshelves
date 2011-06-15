package base
{
	/**
	 * MediatorをFacadeに登録する<br>
	 *
	 * @author masahiro.A
	 */
	public class MediatorManager
	{
		/**
		 * PureMVCにMediatorを登録する<br>
		 *
		 * @param mediator
		 */
		public static function setMediator(mediator:BaseMediator):void{
			BaseFacade.getInstance().registerMediator(mediator);
			BaseLogger.registerMediator(mediator);
		}

		/**
		 * PureMVCからMeditorの登録を削除する<br>
		 *
		 * @param mediatorName
		 */
		public static function removeMediator(mediatorName:String):void{
			BaseFacade.getInstance().removeMediator(mediatorName);
		}
	}
}