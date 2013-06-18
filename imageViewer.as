package com.fso.fat
{
  import com.fso.fat.events.ImageEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import flashx.textLayout.utils.CharacterUtil;
	
	import lib.Controls;
	
	public class ImageViewer extends Sprite
	{
		private var _imageList:Array;
		private var _path:String;
		private var _currentImage:int;
		private var _ld:imageLoader;

		
		public function ImageViewer()
		{
			super();
			init();			
		}
		
		private function init():void
		{
			_imageList = [];
			_currentImage = 0;
		}
		
		//load in appropriate image
		private function loadImg():void
		{
			_ld = new imageLoader(_path+_imageList[_currentImage].file);
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
		}
		
		//call back function
		private function onLoad(e:ImageEvent):void
		{
			if (this.numChildren > 0)
			{
				this.removeChildAt(0)
			}
			this.addChild(e.image);			
		}
		
		public function display():void //start the loading process
		{			
			loadImg();
		}
		
		public function set path(value:String):void
		{
			_path = value;
		}
		public function set imageList(value:Array):void
		{
			_imageList = value;
			trace(_imageList[0].caption);			
		}
		
		public function next():void
		{
			_currentImage++;
			if (_currentImage == _imageList.length)  
			{
				_currentImage = 0;
			}
			trace(_imageList);
			
			//dispatch event is here
			dispatchEvent(new Event(Event.CLEAR));
			_ld = new imageLoader(_path + _imageList[_currentImage].file);			
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);						
		}
		
		public function previous():void
		{
			_currentImage --;
			if (_currentImage < 0)
			{
				_currentImage = _imageList.length - 1;
			}			
		
			_ld = new imageLoader(_path + _imageList[_currentImage].file);
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
			
			trace(_imageList[_currentImage]);
		}
		//created getter function to "get" the _currentImage variable 
		//and use it my main class
		public function get currentImage():int
		{
			return _currentImage;
		}

	}
}
