package 
{
        import flash.display.Sprite;
        import flash.events.Event;
        import flash.events.MouseEvent;
        import flash.geom.Point;
        import flash.text.TextField;
        
        
        /**
         * ...
         * @author Maarten Molendijk
         */
        
          
        public class Main extends Sprite 
        {
                public var stuiterbal: Sprite = new Sprite();
                public var naarLinks: Boolean = false;
                public var naarBoven: Boolean = false;
                public var velocityX: int = 5; //aantal pixels/frame per seconde horizontaal
                public var velocityY: int = 5;
                public var cirkel: Sprite = new Sprite();
				public var nogeenstuiterbal:Sprite = new Sprite();
				
                
                
                public function Main():void 
                {
                //Opdracht 1
                
                //tekenVijand();
                
                //Opdracht 2
                
                //tekenRups();
                
                //Opdracht 3
                
                stuiterbal.x = 400
                stuiterbal.y = 300
                stuiterbal.graphics.beginFill(0x000000, 1);
                stuiterbal.graphics.drawCircle (0, 0, 10);
                addChild(stuiterbal)
                cirkel.graphics.beginFill(0x000000, 0.1);
                cirkel.graphics.drawCircle(400, 300, 150)
                addChild(cirkel)       
                
                
                //stuiterbal.addEventListener(Event.ENTER_FRAME, beweegX)
                //stuiterbal.addEventListener(Event.ENTER_FRAME, beweegY)
                stuiterbal.addEventListener(Event.ENTER_FRAME, beweegBinnenCirkelY)
                stuiterbal.addEventListener(Event.ENTER_FRAME, beweegBinnenCirkelX)
                stuiterbal.addEventListener(MouseEvent.CLICK, verdwijnen)
				trace(stuiterbal.x, stuiterbal.y)
                
                
                
                
                }
                
                
                /*public function tekenVijand():void // publieke functie die de vijand tekent
                {
                        var vg: Number = new Number();
                        var vijand: Sprite = new Sprite();
                        vg = 1.0; //Vergroting
                        
                        vijand.graphics.beginFill(0xFFC866, 1);
                        vijand.graphics.drawCircle(65 * vg, 466 * vg, vg * 35);
                        vijand.graphics.endFill();
                        vijand.graphics.beginFill(0x153270, 1);
                        vijand.graphics.drawEllipse(43 * vg, 500 * vg, 50 * vg, 70 * vg);
                        vijand.graphics.endFill();
                        vijand.graphics.beginFill(0xB01033, 1);
                        vijand.graphics.drawRect (50 * vg, 560 * vg, 15 * vg, 40 * vg)
                        vijand.graphics.drawRect (70 * vg, 560 * vg, 15 * vg, 40 * vg)
                        vijand.graphics.endFill();
                        vijand.graphics.beginFill (0x000000, 1);
                        vijand.graphics.moveTo (45 * vg, 484 * vg)
                        vijand.graphics.curveTo (70 * vg, 515 * vg, 86 * vg, 484 * vg)
                        vijand.graphics.drawRect (45 * vg, 450 * vg, 40 * vg, 8* vg)
                        vijand.graphics.endFill();
                        vijand.graphics.beginFill (0xFFFFFF, 1);
                        vijand.graphics.drawCircle (55 * vg, 465 * vg, vg * 10);
                        vijand.graphics.drawCircle (77 * vg, 465 * vg, vg * 10);
                        vijand.graphics.endFill();
                        vijand.graphics.beginFill (0x000000, 1);
                        vijand.graphics.drawCircle (55 * vg, 467 * vg, vg * 4);
                        vijand.graphics.drawCircle (77 * vg, 467 * vg, vg * 4);
                        
                        addChild(vijand);
                }        
                
                public function tekenRups():void // publieke functie die een rups maakt
                {
                        
                var cirkel: Sprite = new Sprite();
                for (var i:int = 0; i < 5; i++)
                        {
                
                                var p: int = i * 2; // Vergrotingsfactor die telkens 2 toeneemt
                                cirkel.graphics.beginFill(0x49A116, 1);
                                cirkel.graphics.drawCircle (20 * p, 20 * p, 10 * p);        
                                addChild(cirkel);                
                                
                        }        
                                
                                
                }
                                */
                public function beweegX(e:Event):void // zorgt ervoor dat het balletje horizontaal gaat bewegen
                {
						
                        stuiterbal.x += velocityX;
                        if (naarLinks == false)
                        {
                                if (stuiterbal.x > 600)
                                {
                                        velocityX = velocityX * -1;
                                        naarLinks = true;
										velocityX = velocityX * Math.random() * 10
                                }
                        }
                        else
                        {
                                if (stuiterbal.x < 400)
                                {
                                        velocityX = velocityX * -1
                                        naarLinks = false;
										velocityX = velocityX * Math.random() * 10
                                }
                        }
                        
                }        
                public function beweegY(e:Event):void // zorgt ervoor dat het balletje verticaal gaat bewegen
                {
                        stuiterbal.y += velocityY;
                        if (naarBoven == false)
                        {
                                if (stuiterbal.y > 600 - 10)
                                {
                                        velocityY = velocityY * -1;
                                        naarBoven = true;
                                }
                        }
                        else
                        {
                                if (stuiterbal.y < 0 + 10)
                                {
                                        velocityY = velocityY * -1
                                        naarBoven = false;
                                }
                        }
                }        
                public function verdwijnen(e:MouseEvent):void // Als je klikt verdwijnt het balletje
                {
                        stuiterbal.visible = false;
                
                }
				
                public function beweegBinnenCirkelX (e:Event):void // beweeg binnen de cirkel
                {
						var radius: int = 150;
                        stuiterbal.x += velocityX;
                        if (naarLinks == false)
                        {
                                if (Math.sqrt(((stuiterbal.x -400) * (stuiterbal.x -400)) + ((stuiterbal.y - 300)* (stuiterbal.y -300))) + 10> radius)
                                {
                                        velocityX = velocityX * -1;
                                        naarLinks = true;
										velocityX = velocityX * Math.random()
                                }
                        }
                        else
                        {
                                if (Math.sqrt(((stuiterbal.x -400) * (stuiterbal.x -400)) + ((stuiterbal.y - 300)* (stuiterbal.y -300))) + 10 > radius)
                                {
                                        velocityX = velocityX * -1
                                        naarLinks = false;
										velocityX = velocityX * Math.random()
                                }
                        }
                }
                
				public function beweegBinnenCirkelY (e:Event):void // beweeg binnen de cirkel
                {
						var radius: int = 150;
                        stuiterbal.y += velocityY;
                        if (naarBoven == false)
                        {
                                if (Math.sqrt(((stuiterbal.x -400) * (stuiterbal.x -400)) + ((stuiterbal.y - 300)* (stuiterbal.y -300))) + 10> radius)
                                {
                                        velocityY = velocityY * -1;
                                        naarBoven = true;
										velocityX = velocityY * Math.random()
                                }
                        }
                        else
                        {
                                if (Math.sqrt(((stuiterbal.x -400) * (stuiterbal.x -400)) + ((stuiterbal.y - 300)* (stuiterbal.y -300))) + 10 > radius)
                                {
                                        velocityY = velocityY * -1
                                        naarBoven = false;
										velocityX = velocityY * Math.random()
                                }
                        }
                }
				
				
				
        }
        
        
        
        
}
