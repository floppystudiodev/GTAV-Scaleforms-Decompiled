class com.rockstargames.gtav.levelDesign.ECG_MONITOR extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var heartRateTF;
   var heartBeatsList = new Array();
   var heartBeatsIndex = 0;
   function ECG_MONITOR()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.heartRateTF = this.CONTENT.displayMC.heartRateTF;
   }
   function removeBeat(args)
   {
      args.mc.removeMovieClip();
   }
   function SET_HEART_RATE(rate)
   {
      this.heartRateTF.text = String(rate + " BPM");
   }
   function SET_HEART_BEAT(speed)
   {
      var _loc2_ = 2;
      if(speed != undefined)
      {
         _loc2_ = speed;
      }
      this.heartBeatsIndex <= 100 ? this.heartBeatsIndex++ : (this.heartBeatsIndex = 0);
      var _loc3_ = this.CONTENT.displayMC.attachMovie("heartBeat","heartBeatMC" + this.heartBeatsIndex,this.heartBeatsIndex,{_x:1285,_y:this.CONTENT.displayMC.lineMC._y});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,_loc2_,{_x:-85,onComplete:this.removeBeat,onCompleteScope:this,onCompleteArgs:{mc:_loc3_}});
   }
   function SET_HEALTH(amount)
   {
      this.CONTENT.displayMC.healthBarMC._xScale = Math.max(Math.min(100,amount),0);
   }
   function SET_ECG_HEALTH(amount)
   {
      this.CONTENT.displayMC.healthBarMC._xScale = Math.max(Math.min(100,amount),0);
   }
   function SET_COLOUR(r, g, b)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.displayMC,r,g,b);
   }
}
