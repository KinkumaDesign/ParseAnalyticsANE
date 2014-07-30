package
{
	import com.kumade.ane.ParseAnalyticsExtension;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	public class ParseAnalyticsANETest extends Sprite
	{
		private var _button:Sprite;
		
		public function ParseAnalyticsANETest()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			setupButton();
			
			//Set up
			var parseController:ParseAnalyticsExtension = new ParseAnalyticsExtension();
			parseController.setUp("yourApplicationId", "yourClientKey");
		}
		
		private function setupButton():void
		{
			_button = new Sprite();
			var g:Graphics = _button.graphics;
			g.beginFill(0x0000ee, 1);
			g.drawRect(0,0, 100, 44);
			g.endFill();
			_button.x = 10;
			_button.y = 10;
			addChild(_button);
			_button.addEventListener(MouseEvent.CLICK, buttonClickHandler);
		}
		
		protected function buttonClickHandler(event:MouseEvent):void
		{
			var parseController:ParseAnalyticsExtension = new ParseAnalyticsExtension();
			parseController.trackEvent("tap", "program=as3&button=blue");
		}
	}
}