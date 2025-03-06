class com.rockstargames.gtav.hud.hudComponents.HUD_WANTED_STARS extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var defaultX;
   var defaultY;
   var flashStarsForever;
   var flashWholeMovie;
   var _enumID;
   var _HUD;
   var flashCycleCount = 0;
   var wantedEvasionTime = 0;
   var timeSpentFlashing = 0;
   function HUD_WANTED_STARS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
   }
   function READY(id)
   {
      super.READY(id);
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.CONTENT.stars._alpha = 0;
      this.flashStarsForever = false;
      this.flashWholeMovie = false;
   }
   function SET_PLAYER_WANTED_LEVEL(params)
   {
      var _loc3_ = params[0];
      if(_loc3_ >= 6)
      {
         this.CONTENT.stars.star6._visible = true;
         this.CONTENT.stars.star6._x = -20;
      }
      else
      {
         this.CONTENT.stars.star6._visible = false;
         this.CONTENT.stars.star6._x = 0;
      }
      var _loc2_ = 1;
      while(_loc2_ < 7)
      {
         if(_loc2_ <= _loc3_)
         {
            this.CONTENT.stars["star" + _loc2_]._visible = true;
         }
         else
         {
            this.CONTENT.stars["star" + _loc2_]._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.flashCycleCount = 4;
      this.CONTENT.stars._alpha = 100;
   }
   function STOP_FLASHING_WANTED_STARS()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.stars);
      this.flashCycleCount = 0;
      this.flashStarsForever = false;
      this.flashWholeMovie = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.stars,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function FLASH_WANTED_STARS(params)
   {
      this.flashCycleCount = 0;
      this.flashStarsForever = params[0];
      this.wantedEvasionTime = (params[1] == undefined ? 50000 : params[1]) / 1000;
      this.flashWholeMovie = params[2] == undefined ? false : params[2];
      this.timeSpentFlashing = 0;
      this.STAY_OFF_SCREEN();
   }
   function GetAndAdjustBlinkRate()
   {
      if(!this.flashStarsForever)
      {
         return 0.5;
      }
      var _loc3_ = 0.2;
      var _loc4_ = 1.5;
      var _loc6_ = this.timeSpentFlashing / this.wantedEvasionTime;
      var _loc5_ = com.rockstargames.ui.tweenStar.easing.Quad.easeIn;
      var _loc2_ = _loc5_(_loc6_,_loc3_,_loc4_ - _loc3_,1);
      _loc2_ = Math.max(Math.min(_loc4_,_loc2_),_loc3_);
      this.timeSpentFlashing += _loc2_;
      return _loc2_;
   }
   function STAY_ON_SCREEN()
   {
      this.flashCycleCount = this.flashCycleCount + 1;
      this.CONTENT._visible = true;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.stars,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(this.flashStarsForever && !this.flashWholeMovie)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.stars,this.GetAndAdjustBlinkRate(),{onComplete:this.STAY_OFF_SCREEN,onCompleteScope:this});
      }
      else if(this.flashCycleCount < 6 || this.flashWholeMovie)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.stars,0.5,{onComplete:this.STAY_OFF_SCREEN,onCompleteScope:this});
      }
   }
   function STAY_OFF_SCREEN()
   {
      this.flashCycleCount = this.flashCycleCount + 1;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.stars,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP);
      this.CONTENT._visible = !this.flashWholeMovie;
      if(this.flashStarsForever && !this.flashWholeMovie)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.stars,this.GetAndAdjustBlinkRate(),{onComplete:this.STAY_ON_SCREEN,onCompleteScope:this});
      }
      else if(this.flashCycleCount < 6 || this.flashWholeMovie)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.stars,0.5,{onComplete:this.STAY_ON_SCREEN,onCompleteScope:this});
      }
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.stars);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
