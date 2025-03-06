class com.rockstargames.gtav.minigames.horseracingconsole.Horse
{
   var view;
   var x;
   var goalX;
   var raceDuration;
   var currX;
   var oscX;
   var oscVX;
   var oscA;
   static var AMP_MIN = 4;
   static var AMP_MAX = 8;
   static var AMP_RANGE = com.rockstargames.gtav.minigames.horseracingconsole.Horse.AMP_MAX - com.rockstargames.gtav.minigames.horseracingconsole.Horse.AMP_MIN;
   static var FREQ_MIN = 0.0001;
   static var FREQ_MAX = 0.0005;
   static var FREQ_RANGE = com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_MAX - com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_MIN;
   static var OSCILLATION_DAMPING_THRESHOLD = 0.2;
   var name = "";
   var odds = "";
   var number = 0;
   var primaryColour = 0;
   var secondaryColour = 0;
   var horseColour = 0;
   var maneColour = 0;
   function Horse()
   {
   }
   function init(view, isStationary)
   {
      this.view = view;
      if(isStationary)
      {
         view.num.gotoAndStop(this.number);
      }
      else
      {
         view.attachMovie("horseNumber" + this.number,"num",view.getNextHighestDepth());
         view.num._x = view.horse._x;
         view.num._y = view.horse._y;
         var _loc3_ = Math.floor(Math.random() * view.horse._totalframes) + 1;
         view.legs.gotoAndPlay(_loc3_);
         view.horse.gotoAndPlay(_loc3_);
         view.mane.gotoAndPlay(_loc3_);
         view.body.gotoAndPlay(_loc3_);
         view.arms.gotoAndPlay(_loc3_);
         view.num.gotoAndPlay(_loc3_);
      }
      this.colourise(view.horse,this.horseColour);
      this.colourise(view.mane,this.maneColour);
      this.colourise(view.body,this.primaryColour);
      this.colourise(view.arms,this.secondaryColour);
      this.x = view._x;
   }
   function colourise(part, colour)
   {
      var _loc1_ = (colour >> 16 & 0xFF) / 255;
      var _loc4_ = (colour >> 8 & 0xFF) / 255;
      var _loc2_ = (colour & 0xFF) / 255;
      part.transform.colorTransform = new flash.geom.ColorTransform(_loc1_,_loc4_,_loc2_,1,0,0,0,0);
   }
   function start(goalX, raceDuration)
   {
      this.goalX = goalX;
      this.raceDuration = raceDuration;
      this.currX = 0;
      this.oscX = 0;
      this.oscVX = com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.rnd() * com.rockstargames.gtav.minigames.horseracingconsole.Horse.AMP_RANGE + com.rockstargames.gtav.minigames.horseracingconsole.Horse.AMP_MIN;
      this.oscA = com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.rnd() * com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_RANGE + com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_MIN;
   }
   function update(normElapsed, postRaceOffset)
   {
      this.currX = this.goalX * normElapsed;
      this.view._x = this.currX;
      if(normElapsed < 1)
      {
         var _loc3_ = this.oscVX - this.oscA * this.oscX;
         if((_loc3_ ^ this.oscVX) < 0)
         {
            this.oscA = com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.rnd() * com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_RANGE + com.rockstargames.gtav.minigames.horseracingconsole.Horse.FREQ_MIN;
         }
         this.oscVX = _loc3_;
         this.oscX += this.oscVX;
         var _loc4_ = 1 - normElapsed >= com.rockstargames.gtav.minigames.horseracingconsole.Horse.OSCILLATION_DAMPING_THRESHOLD ? this.oscX : this.oscX * (1 - normElapsed) / com.rockstargames.gtav.minigames.horseracingconsole.Horse.OSCILLATION_DAMPING_THRESHOLD;
         this.view._x += _loc4_;
         this.x = this.view._x;
         return false;
      }
      this.view._x += postRaceOffset;
      this.x = this.view._x;
      return true;
   }
   function reset()
   {
      this.view = null;
   }
}
