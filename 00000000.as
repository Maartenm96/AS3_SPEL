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
                public var velocityX: int = 3; //aantal pixels/frame per seconde horizontaal
                public var velocityY: int = 3;
                
                
                
                public function Main():void 
                {
                //Opdracht 1
                
                //tekenVijand();
                
                //Opdracht 2
                
                //tekenRups();
                
                //Opdracht 3
                
                stuiterbal.x = 400
                stuiterbal.y = 300
                stuiterbal.graphics.beginFill(0x49A116, 1);
                stuiterbal.graphics.drawCircle (0, 0, 10);
                addChild(stuiterbal) //addchild buiten main functie werkt niet (?)
                
                
                //stuiterbal.addEventListener(Event.ENTER_FRAME, beweegX)
                //stuiterbal.addEventListener(Event.ENTER_FRAME, beweegY)
                
                //stuiterbal.addEventListener(Event.ENTER_FRAME, beweegBinnenCirkel)
                stuiterbal.addEventListener(MouseEvent.CLICK, verdwijnen)
                vindmaxwaardenXcirkel(400, 100, 10);
                vindmaxwaardenYcirkel(300, 100, 10);
                
                
                
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
                                }
                        }
                        else
                        {
                                if (stuiterbal.x < 400)
                                {
                                        velocityX = velocityX * -1
                                        naarLinks = false;
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
                public function vindmaxwaardenXcirkel (Xmidden:int, radius:Number, n:Number = 10 ):void //alle  x punten op de rand van de cirkel zoeken
                {
                        var cirkelformule:Number = Math.PI * 2 / n
                        var maxXwaardencirkel:Array = new Array (n) // 
                        var i:int = -1; // interval
                        while (i++ < n ) // herhaal met een verandert interval
                        {
                                var alpha:Number = cirkelformule * i;
                                var berekenXpunten:Point = new Point ( Math.cos (alpha) * radius, Math.sin (alpha) * radius); // x coordinaat dus cosinus
                                maxXwaardencirkel [i] = Xmidden + (berekenXpunten); // voeg de uitkomst van de formule toe aan de coordinaten van het beginpunt
                        }
                       // maxXwaardencirkel; // geef de waardes terug
                        
                }
                public function vindmaxwaardenYcirkel (Ymidden:int , radius: Number, n:Number = 10):Array // alle y punten op de rand van de cirkel zoeken
                {
                        var cirkelformule:Number = Math.PI * 2 / n
                        var maxYwaardencirkel: Array = new Array (n)
                        var i:int = -1;
                        while (i++ < n )
                        {
                                var alpha:Number = cirkelformule * i;
                                var berekenYpunten:int = new int (Math.sin (alpha) * radius);
                                maxYwaardencirkel [i] = Ymidden + (berekenYpunten); // voeg de uitkomst van de formule toe aan de coordinaten van het beginpunt
                        }
                        return maxYwaardencirkel;
                }
                public function beweegBinnenCirkelX (e:Event):void // beweeg binnen de cirkel
                {
                        stuiterbal.x += velocityX;
                        if (naarLinks == false)
                        {
                                if (stuiterbal.x >  vindmaxwaardenXcirkel)
                                {
                                        velocityX = velocityX * -1;
                                        naarLinks = true;
                                }
                        }
                        else
                        {
                                if (stuiterbal.x < vindmaxwaardenXcirkel)
                                {
                                        velocityX = velocityX * -1
                                        naarLinks = false;
                                }
                        }
                }
                
        }
        
        
        
        
}
