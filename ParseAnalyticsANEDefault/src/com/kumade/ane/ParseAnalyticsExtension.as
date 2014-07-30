package com.kumade.ane
{
	import flash.events.EventDispatcher;
	
	public class ParseAnalyticsExtension extends EventDispatcher
	{
		public function ParseAnalyticsExtension()
		{
			trace("default ParseAnalyticsExtension's constructor");
		}
		
		public function setUp(appId:String, clientKey:String):void
		{
			trace("default setUp is called");
		}

		public function trackEvent(eventName:String, parameters:String):void
		{
			trace("default trackEvent is called");
		}
	}
}