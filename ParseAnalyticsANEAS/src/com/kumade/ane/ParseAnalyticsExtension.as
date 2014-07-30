package com.kumade.ane
{
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	
	public class ParseAnalyticsExtension extends EventDispatcher
	{
		private static const EXTENTION_ID:String = "com.kumade.ane.parse.analytics.extension";
		private var _context:ExtensionContext;
		
		public function ParseAnalyticsExtension()
		{
			_context = ExtensionContext.createExtensionContext(EXTENTION_ID, "");
			if(!_context){
				throw new Error("Parse Analytics ANE could not be initialized");
				return;
			}
		}
		
		/**
		 Init Parse
		 @param appId applicationId
		 @param clientKey clientKey
		 */
		public function setUp(appId:String, clientKey:String):void
		{
			try{
				_context.call("setUp", appId ,clientKey);
			}catch(err:Error){
				trace(err);
			}
		}
		
		/**
		 Call tracking api event
		 @param eventName event name
		 @param parameters parameters you want to track. The format is key1=value1&key2=value2..
		 */
		public function trackEvent(eventName:String, parameters:String):void
		{
			try{
				_context.call("trackEvent", eventName ,parameters);
			}catch(err:Error){
				trace(err);
			}
		}
	}
}