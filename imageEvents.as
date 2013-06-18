package com.fso.fat.events
{
  import flash.display.Bitmap;
	import flash.events.Event;
	
	public class ImageEvent extends Event
	{
		public static const IMAGE_LOADED:String = "image_loaded";		
		public var image:Bitmap;
		
		public function ImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public override function clone():Event
		{
			return new ImageEvent(type, bubbles, cancelable);
		}
	}
}
