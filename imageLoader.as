package com.fso.fat
{
  import com.fso.fat.events.ImageEvent;
	import com.fso.fat.vo.ImageVO;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	
	import mx.events.Request;
	
	import org.osmf.content.ContentLoader;
	
	public class imageLoader extends EventDispatcher
	{
		private var _ld:Loader;
		private var _weatherVO:ImageVO = new ImageVO();
				
		
		public function imageLoader()
		{
			super();
			
			_ld = new Loader();	
			_ld.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);	
			
		
			if (_ld != null)
			{
				_ld.unload();
			}
			trace('it is responding');
			/*_ld.load(new URLRequest("assets/images/" + _weatherVO.image + ".png"));				
			this.addChild(_ld);
			_ld.x = 100;
			_ld.y = 200;*/
			
		}
		private function onLoad(e:Event):void
		{
			var evt:ImageEvent = new ImageEvent(ImageEvent.IMAGE_LOADED);
			evt.image = e.target.content;
			dispatchEvent(evt);				
			
			//cleaning up
			_ld.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoad);
			_ld.unload(); //unloading the ld
			_ld = null; //now eligible for garbage collection
		}

		public function get weatherVO():ImageVO
		{
			return _weatherVO;
		}

		public function set weatherVO(value:ImageVO):void
		{
			_weatherVO = value;
			trace(value.image + "value.image");
			//run the function to load the image from the vo
			
			var imageLoader:Loader = new Loader();
			imageLoader.load(new URLRequest('assets/images/' + value.image + '.png'));
			
			trace('HEY!!!!!');
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteMethod);			
		}
		
		private function onCompleteMethod(evt:Event):void
		{
			var pic:Bitmap = new Bitmap();
			pic = evt.currentTarget.content;			
		}

	}
}
