class com.rockstargames.gtav.levelDesign.COUNTDOWN extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var messageMC;
   var CONTENT;
   var messageAlphaMC;
   var messageText;
   var messageTextOutline;
   var goMC;
   var directionMC;
   var startPosition;
   var startPositionMP;
   var circleMC;
   var circleAlphaMC;
   var bar;
   var countdownFiveMC;
   var circleArray;
   var defaultFadeDuration = 500;
   var debugTimeModifier = 1;
   var BIG_TEXT_OUTLINE_STRENGTH = 9;
   static var DIRECTION_FADE_OUT_DURATION = 1;
   static var DIRECTIONS = ["hidden","straight","left","right","uturn","up","down","stop"];
   function COUNTDOWN()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.messageMC = this.CONTENT.messageMC;
      this.messageAlphaMC = this.messageMC.messageAlphaMC;
      this.messageText = this.messageAlphaMC.messageText;
      this.messageTextOutline = this.messageAlphaMC.messageTextOutline;
      this.messageTextOutline.outline = this.BIG_TEXT_OUTLINE_STRENGTH;
      this.goMC = this.messageAlphaMC.goMC;
      this.goMC._visible = false;
      this.directionMC = this.CONTENT.directionMC;
      this.directionMC._visible = false;
      this.startPosition = new flash.geom.Point(this.messageMC._x,this.messageMC._y);
      this.startPositionMP = new flash.geom.Point(this.messageMC._x,180);
   }
   function SET_MESSAGE(newString, r, g, b, isMP)
   {
      if(isMP)
      {
         this.FADE_MP.apply(this,arguments);
      }
      else
      {
         this.FADE_SP.apply(this,arguments);
      }
   }
   function FADE_SP(newString, r, g, b)
   {
      if(this.circleMC != undefined)
      {
         this.circleMC.removeMovieClip();
      }
      this.goMC._visible = false;
      com.rockstargames.ui.utils.Colour.Colourise(this.messageAlphaMC,r,g,b,100);
      this.messageText.text = this.messageTextOutline.text = newString;
      this.messageMC._x = this.startPosition.x;
      this.messageMC._y = this.startPosition.y;
      this.messageMC._xscale = this.messageMC._yscale = 100;
      this.messageText._alpha = this.messageTextOutline._alpha = 100;
      this.messageTextOutline._visible = true;
      this.messageAlphaMC._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageMC,0.3,{_xscale:66,_yscale:66,delay:0.4,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageText,0.06,{_alpha:0,delay:0.6,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageTextOutline,0.05,{_alpha:0,delay:0.6,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function FADE_MP(newString, r, g, b)
   {
      this.goMC._visible = false;
      this.messageText.text = newString;
      this.messageText._alpha = 100;
      this.messageMC._xscale = this.messageMC._yscale = 70;
      this.messageMC._x = this.startPositionMP.x;
      this.messageMC._y = this.startPositionMP.y - 8;
      this.messageAlphaMC._alpha = 100;
      this.messageTextOutline._visible = false;
      if(this.circleMC == undefined)
      {
         this.circleMC = this.CONTENT.attachMovie("circle","circleMC",this.messageMC.getDepth() - 1,{_x:this.startPositionMP.x,_y:this.startPositionMP.y});
         this.circleAlphaMC = this.circleMC.alphaMC;
      }
      else
      {
         this.circleMC._y = this.startPositionMP.y;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.circleMC,r,g,b,100);
      this.circleAlphaMC._alpha = 75;
      if(newString == "-")
      {
         this.messageText.text = "";
         if(!this.messageAlphaMC.bar)
         {
            this.bar = this.messageAlphaMC.attachMovie("bar","bar",this.messageAlphaMC.getNextHighestDepth());
         }
         else
         {
            this.bar._alpha = 100;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bar,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
      else if(this.messageAlphaMC.bar)
      {
         this.bar._alpha = 0;
      }
      if(isNaN(newString))
      {
         this.messageText._alpha = 0;
         this.goMC._visible = true;
         var _loc2_ = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_y:_loc2_ + (this.messageMC._y - this.circleMC._y),ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_y:_loc2_,delay:0.66,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.messageAlphaMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleAlphaMC,0.33 * this.debugTimeModifier,{delay:0.66 * this.debugTimeModifier,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleAlphaMC,0.33 * this.debugTimeModifier,{_alpha:0,delay:0.66 * this.debugTimeModifier,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
   }
   function OVERRIDE_FADE_DURATION(newFadeDuration)
   {
      this.defaultFadeDuration = newFadeDuration;
   }
   function IS_COUNTDOWN_VISIBLE()
   {
      return this.messageText._alpha > 0;
   }
   function SET_DIRECTION(direction, r, g, b)
   {
      var _loc7_ = direction == 7;
      if(_loc7_)
      {
         var _loc6_ = "hexagon";
         if(isNaN(r))
         {
            r = 224;
         }
         if(isNaN(g))
         {
            g = 50;
         }
         if(isNaN(b))
         {
            b = 50;
         }
      }
      else
      {
         _loc6_ = "circle";
         if(isNaN(r))
         {
            r = 73;
         }
         if(isNaN(g))
         {
            g = 190;
         }
         if(isNaN(b))
         {
            b = 226;
         }
      }
      this.directionMC.gotoAndStop(com.rockstargames.gtav.levelDesign.COUNTDOWN.DIRECTIONS[direction]);
      this.directionMC._visible = true;
      this.directionMC._alpha = 75;
      this.directionMC._y = this.startPositionMP.y;
      if(this.circleMC == undefined)
      {
         this.circleMC = this.CONTENT.attachMovie("circle","circleMC",this.messageMC.getDepth() - 1,{_x:this.startPositionMP.x,_y:this.startPositionMP.y});
         this.circleAlphaMC = this.circleMC.alphaMC;
      }
      this.circleMC.gotoAndStop(_loc6_);
      this.circleMC._y = this.startPositionMP.y;
      var _loc5_ = new flash.geom.ColorTransform();
      _loc5_.rgb = r << 16 | g << 8 | b;
      this.circleMC.transform.colorTransform = _loc5_;
      this.circleAlphaMC._alpha = 75;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.directionMC,com.rockstargames.gtav.levelDesign.COUNTDOWN.DIRECTION_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.circleAlphaMC,com.rockstargames.gtav.levelDesign.COUNTDOWN.DIRECTION_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
   }
   function SET_COUNTDOWN_LIGHTS(value)
   {
      this.goMC._visible = false;
      if(value == undefined)
      {
         value = 0;
      }
      if(this.countdownFiveMC == undefined)
      {
         this.initCountdown();
      }
      this.setCountdownLights(value);
   }
   function initCountdown()
   {
      this.countdownFiveMC = this.CONTENT.attachMovie("countdownFive","countdownFiveMC",1,{_x:this.startPositionMP.x,_y:this.startPositionMP.y});
      this.countdownFiveMC._xscale = this.countdownFiveMC._yscale = 40;
      this.countdownFiveMC._alpha = 80;
      this.circleArray = [this.countdownFiveMC.circle1,this.countdownFiveMC.circle2,this.countdownFiveMC.circle3,this.countdownFiveMC.circle4,this.countdownFiveMC.circle5];
   }
   function setCountdownLights(value)
   {
      var _loc4_ = -50;
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.circleArray[_loc2_],com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         _loc2_ = _loc2_ + 1;
      }
      if(value < 6)
      {
         _loc2_ = 0;
         while(_loc2_ < value)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.circleArray[_loc2_],com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.countdownFiveMC,0.33,{delay:0.66,_alpha:0,_y:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
   }
}
