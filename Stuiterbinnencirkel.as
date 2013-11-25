package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLVariables;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Maarten
	 */
	public class Main extends Sprite 
	{
		
		public var stuiterbal: Sprite = new Sprite();
		public var naarLinks: Boolean = false;
		public var naarBoven: Boolean = false;
		public var cirkel: Sprite = new Sprite();
		public var velocityX: int = 3; //aantal pixels/frame per seconde horizontaal
		public var xpunten:int=vindRandpuntenCirkelX();
		

		
		
		public function Main():void 
		{
			stuiterbal.x = 400
			stuiterbal.y = 300
			stuiterbal.graphics.beginFill(0x49A116, 1);
			stuiterbal.graphics.drawCircle (0, 0, 10);
			addChild(stuiterbal) //addchild buiten main functie werkt niet (?)
			cirkel.graphics.beginFill(0x000000, 0.2);
			cirkel.graphics.drawCircle(400, 300, 100)
			addChild(cirkel)
			
			stuiterbal.addEventListener(Event.ENTER_FRAME, beweegX)
			
			
			
		}
		
		public function vindRandpuntenCirkelX():int
		{
			var radius: Number = 100;
			var middelpuntX: int = 400 ;
			var cirkelformuleX: Number = middelpuntX + radius * Math.cos(2 * Math.PI * i / aantalpunten);
			var aantalpunten: int = 10;
			
			for (var i: int = 0; i < aantalpunten; i++)
			{
				
				var xpuntenberekenen : Number = cirkelformuleX;
				
			}
			return xpuntenberekenen;
			
			
		}
		
		
		public function beweegX(e:Event):void // Heeft als resultaat dat het figuur binnen de maximaal aangegeven waarden blijft
		{
			stuiterbal.x += velocityX;
			if (stuiterbal.x = xpunten)
			{
				velocityX = velocityX * -1
			}
			
		}	
		
	}
	
}
