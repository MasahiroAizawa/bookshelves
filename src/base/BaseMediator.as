package base
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class BaseMediator extends Mediator
	{
		public function BaseMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
	}
}