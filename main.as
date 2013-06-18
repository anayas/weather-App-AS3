package
{
  import com.fso.fat.Weather;
	import com.fso.fat.imageLoader;
	import com.fso.fat.ImageViewer;
	import com.fso.fat.vo.ImageVO;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	import lib.FlashActionScriptTechniquesBase;
	import lib.JillAnayasBase;
	import lib.LineBase;	
	
	
	[SWF(width="990", height="800", frameRate="30", backgroundColor="0x333333")]
	public class Main extends Sprite
	{
		
		private var _xmlData:XML; //contains all data from xml
		private var _xmlURL:String; //url of the XML that will load
			
		
		public function Main()
		{
			super();
			
		//Begin FAT Template
			var ja:JillAnayasBase = new JillAnayasBase;
			this.addChild(ja);
			ja.y = 90;
			ja.x = 10;
			
			var line:LineBase = new LineBase;
			this.addChild(line);
			line.y = 130;
			
			var fat:FlashActionScriptTechniquesBase = new FlashActionScriptTechniquesBase();
			this.addChild(fat);
			fat.y = 125;
			fat.x = 7;
		//End FAT Template
									
			var weather:Weather = new Weather();
			this.addChild(weather);			
			
		}
		
	}
}
