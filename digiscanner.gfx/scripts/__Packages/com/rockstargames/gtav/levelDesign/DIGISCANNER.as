class com.rockstargames.gtav.levelDesign.DIGISCANNER extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var barsMC;
   var barsRGB;
   var lightsMC;
   var lightsRGB;
   var wrongWayRGB;
   var wrongWay = false;
   var wrongWayDelay = 0.4;
   var flashing = false;
   var currentLight1 = 1;
   var currentLight2 = 8;
   var lightFade = 0.4;
   var blinkSpeed = 0.5;
   var debugValue = 0;
   function DIGISCANNER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.barsMC = this.CONTENT.barsMC;
      this.lightsMC = this.CONTENT.lightsMC;
      this.SET_COLOUR(67,200,255,255,209,67,255,0,0);
      this.SET_DISTANCE(0);
      this.lightsManager();
   }
   function SET_DISTANCE(distance)
   {
      var _loc3_ = Math.abs(Math.round(distance / 10));
      var _loc2_;
      if(distance >= 0)
      {
         this.wrongWay = false;
         if(distance > 100)
         {
            distance = 100;
         }
         _loc2_ = 1;
         while(_loc2_ < 11)
         {
            if(_loc2_ <= _loc3_)
            {
               this.barsMC["bar_" + _loc2_]._alpha = 100;
            }
            else
            {
               this.barsMC["bar_" + _loc2_]._alpha = 25;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else if(distance < 0)
      {
         if(distance < -100)
         {
            distance = -100;
         }
         this.wrongWay = true;
         _loc2_ = 1;
         while(_loc2_ < 11)
         {
            if(_loc2_ <= _loc3_)
            {
               this.barsMC["bar_" + _loc2_]._alpha = 100;
            }
            else
            {
               this.barsMC["bar_" + _loc2_]._alpha = 25;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc5_ = _loc3_;
      if(_loc5_ == 0)
      {
         _loc5_ = 1;
      }
      this.blinkSpeed = 1 / (_loc5_ + 0.75);
      if(this.wrongWay)
      {
         if(this.flashing == false)
         {
            this.flashOff();
         }
      }
      else if(this.flashing == true)
      {
         this.stopFlash();
      }
      this.SET_COLOUR();
   }
   function SET_COLOUR()
   {
      var _loc3_ = arguments;
      if(_loc3_.length > 0)
      {
         this.barsRGB = _loc3_.splice(0,3);
         this.lightsRGB = _loc3_.splice(0,3);
         this.wrongWayRGB = _loc3_.splice(0,3);
      }
      if(this.wrongWay)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.barsMC,this.wrongWayRGB[0],this.wrongWayRGB[1],this.wrongWayRGB[2],100);
         com.rockstargames.ui.utils.Colour.Colourise(this.lightsMC,this.wrongWayRGB[0],this.wrongWayRGB[1],this.wrongWayRGB[2],100);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.barsMC,this.barsRGB[0],this.barsRGB[1],this.barsRGB[2],100);
         com.rockstargames.ui.utils.Colour.Colourise(this.lightsMC,this.lightsRGB[0],this.lightsRGB[1],this.lightsRGB[2],100);
      }
   }
   function lightsManager()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.lightsMC["light_" + this.currentLight1],this.lightFade,{_alpha:10,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.lightsMC["light_" + this.currentLight1]]});
      this.currentLight1 = this.currentLight1 + 1;
      if(this.currentLight1 > 14)
      {
         this.currentLight1 = 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.lightsMC["light_" + this.currentLight1],true);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.lightsMC["light_" + this.currentLight1]);
      this.lightsMC["light_" + this.currentLight1]._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.lightsMC["light_" + this.currentLight2],this.lightFade,{_alpha:10,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.lightsMC["light_" + this.currentLight2]]});
      this.currentLight2 = this.currentLight2 + 1;
      if(this.currentLight2 > 14)
      {
         this.currentLight2 = 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.lightsMC["light_" + this.currentLight2],true);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.lightsMC["light_" + this.currentLight2]);
      this.lightsMC["light_" + this.currentLight2]._alpha = 100;
      var _loc2_ = this.lightsMC._x;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.lightsMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.lightsMC,this.blinkSpeed,{_x:_loc2_,onCompleteScope:this,onComplete:this.lightsManager});
   }
   function flashOn()
   {
      this.flashing = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.barsMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.barsMC,this.wrongWayDelay,{_alpha:100,onCompleteScope:this,onComplete:this.flashOff});
   }
   function flashOff(mc)
   {
      this.flashing = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.barsMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.barsMC,this.wrongWayDelay,{_alpha:40,onCompleteScope:this,onComplete:this.flashOn});
   }
   function stopFlash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.barsMC);
      this.barsMC._alpha = 100;
      this.flashing = false;
   }
}
