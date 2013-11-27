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
                public var velocityX: int = 6; //aantal pixels/frame per seconde horizontaal
                public var xpunten:int = 0;
                

                
                
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
                        var cirkelformuleX: int = new int();
						var hoek:Number = 2 * Math.PI;
						

                       
                        for (var i: int = 0; i < 10; i++)
                        {
                            cirkelformuleX = middelpuntX + (radius * Math.cos(hoek * i));
							
                        }
                        return cirkelformuleX;
						
                        
                }
				
                
                
                public function beweegX(e:Event):void // Heeft als resultaat dat het figuur binnen de maximaal aangegeven waarden blijft
                {
                        
                        var arie:Array = new Array();
						xpunten = vindRandpuntenCirkelX();
                        arie.push (xpunten);
                        
                        stuiterbal.x += velocityX;
                       
                        
                        if (stuiterbal.x >= xpunten - 10)
                                {
                                        velocityX = velocityX * -1;
                                        
                                }
                        
                        if (stuiterbal.x <= 310)
                                {
                                        velocityX = velocityX * -1
                                        
                                }
                       
 
                }        

        } 
        
}
