class com.rockstargames.gtav.levelDesign.TATTOO_KEYS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var ONSCREEN_BUTTONS;
   var POSITIONAL_ALPHA_VALUES;
   var canAddButton;
   static var USE_KEYS = false;
   var offset = 50;
   var DURATION = 0.3;
   var tick = 0;
   var currentButtonID = 0;
   var keyrepeatDelay = 4;
   var percent = 0;
   var hasColour = false;
   function TATTOO_KEYS()
   {
      super();
      this.canAddButton = true;
      this.ONSCREEN_BUTTONS = [];
      this.POSITIONAL_ALPHA_VALUES = [0,100,50,20,0];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.currentButtonID = -1;
   }
   function ADD_BUTTON(whichButton)
   {
      if(whichButton == undefined)
      {
         if(this.tick > 15)
         {
            this.tick = 0;
         }
         else
         {
            this.tick = this.tick + 1;
         }
         whichButton = this.tick;
      }
      var _loc2_;
      var _loc6_;
      var _loc5_;
      var _loc4_;
      if(this.canAddButton)
      {
         if(this.currentButtonID == -1)
         {
            this.currentButtonID = this.CONTENT.getNextHighestDepth();
         }
         _loc6_ = this.ONSCREEN_BUTTONS.length * 100 + this.offset;
         if(whichButton < 8)
         {
            _loc5_ = !com.rockstargames.gtav.levelDesign.TATTOO_KEYS.USE_KEYS ? "LEFT_STICK" : "DIRECTION_KEYS";
         }
         else if(whichButton >= 8 && whichButton < 16)
         {
            _loc5_ = !com.rockstargames.gtav.levelDesign.TATTOO_KEYS.USE_KEYS ? "RIGHT_STICK" : "DIRECTION_KEYS";
         }
         else
         {
            _loc5_ = "SPACER";
         }
         _loc2_ = this.CONTENT.attachMovie(_loc5_,"button" + this.CONTENT.getNextHighestDepth(),this.CONTENT.getNextHighestDepth(),{_x:_loc6_,_y:this.offset});
         if(com.rockstargames.gtav.levelDesign.TATTOO_KEYS.USE_KEYS)
         {
            _loc4_ = whichButton % 8 * 45;
            _loc2_.keys.keyW.gotoAndStop(!this.angleIsCloseTo(_loc4_,0,45) ? 1 : 2);
            _loc2_.keys.keyA.gotoAndStop(!this.angleIsCloseTo(_loc4_,270,45) ? 1 : 2);
            _loc2_.keys.keyS.gotoAndStop(!this.angleIsCloseTo(_loc4_,180,45) ? 1 : 2);
            _loc2_.keys.keyD.gotoAndStop(!this.angleIsCloseTo(_loc4_,90,45) ? 1 : 2);
         }
         else
         {
            _loc2_.targetArrowMC._rotation = whichButton % 8 * 45;
            _loc2_.arrowMC._alpha = 0;
         }
         _loc2_.spacerMC._alpha = 0;
         _loc2_._alpha = 0;
         this.ONSCREEN_BUTTONS.push(_loc2_);
         if(this.ONSCREEN_BUTTONS.length > 4)
         {
            this.FADE_OUT_OLD_BUTTON();
            _loc2_._alpha = 0;
         }
         else
         {
            this.ONSCREEN_BUTTONS[0]._alpha = this.POSITIONAL_ALPHA_VALUES[0];
            this.ONSCREEN_BUTTONS[1]._alpha = this.POSITIONAL_ALPHA_VALUES[1];
            this.ONSCREEN_BUTTONS[2]._alpha = this.POSITIONAL_ALPHA_VALUES[2];
            this.ONSCREEN_BUTTONS[3]._alpha = this.POSITIONAL_ALPHA_VALUES[3];
            this.ONSCREEN_BUTTONS[4]._alpha = this.POSITIONAL_ALPHA_VALUES[4];
         }
      }
      return this.canAddButton;
   }
   function angleIsCloseTo(angleA, angleB, maxDelta)
   {
      var _loc1_ = ((angleB - angleA) % 360 + 360) % 360;
      if(_loc1_ > 180)
      {
         _loc1_ = 360 - _loc1_;
      }
      return _loc1_ <= maxDelta;
   }
   function FADE_OUT_OLD_BUTTON()
   {
      this.canAddButton = false;
      this.ONSCREEN_BUTTONS[0]._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ONSCREEN_BUTTONS[1],this.DURATION,{_alpha:this.POSITIONAL_ALPHA_VALUES[0],_x:this.ONSCREEN_BUTTONS[1]._x - this.offset * 2});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ONSCREEN_BUTTONS[2],this.DURATION,{_alpha:this.POSITIONAL_ALPHA_VALUES[1],_x:this.ONSCREEN_BUTTONS[2]._x - this.offset * 2});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ONSCREEN_BUTTONS[3],this.DURATION,{_alpha:this.POSITIONAL_ALPHA_VALUES[2],_x:this.ONSCREEN_BUTTONS[3]._x - this.offset * 2});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ONSCREEN_BUTTONS[4],this.DURATION,{_alpha:this.POSITIONAL_ALPHA_VALUES[3],_x:this.ONSCREEN_BUTTONS[4]._x - this.offset * 2});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.ONSCREEN_BUTTONS[5],this.DURATION,{_alpha:this.POSITIONAL_ALPHA_VALUES[4],_x:this.ONSCREEN_BUTTONS[5]._x - this.offset * 2});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.DURATION + 0.001,{onComplete:this.REORDER_BUTTONS_ARRAY,onCompleteScope:this});
   }
   function REORDER_BUTTONS_ARRAY()
   {
      this.canAddButton = true;
      var _loc2_ = this.ONSCREEN_BUTTONS[0];
      _loc2_.removeMovieClip();
      this.ONSCREEN_BUTTONS = this.ONSCREEN_BUTTONS.slice(1,this.ONSCREEN_BUTTONS.length);
      this.currentButtonID = this.currentButtonID + 1;
   }
   function SET_STICK_POINTER_ANGLE(arAngle, color)
   {
      var _loc2_;
      var _loc6_;
      var _loc5_;
      var _loc4_;
      if(!com.rockstargames.gtav.levelDesign.TATTOO_KEYS.USE_KEYS)
      {
         _loc2_ = this.ONSCREEN_BUTTONS[1];
         _loc6_ = 0;
         _loc5_ = 0;
         if(arAngle != undefined && arAngle >= 0)
         {
            arAngle -= 90;
            _loc4_ = 5;
            _loc6_ = Math.cos(arAngle * 3.141592653589793 / 180) * _loc4_;
            _loc5_ = Math.sin(arAngle * 3.141592653589793 / 180) * _loc4_;
         }
         _loc2_.stickMC._x = _loc6_;
         _loc2_.stickMC._y = _loc5_;
         if(color)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.targetArrowMC,color);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.targetArrowMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         }
      }
   }
   function HIDE_STICK_POINTER()
   {
      var _loc2_ = this.ONSCREEN_BUTTONS[1];
      if(com.rockstargames.gtav.levelDesign.TATTOO_KEYS.USE_KEYS)
      {
         _loc2_.keys.keyW.gotoAndStop(1);
         _loc2_.keys.keyA.gotoAndStop(1);
         _loc2_.keys.keyS.gotoAndStop(1);
         _loc2_.keys.keyD.gotoAndStop(1);
      }
      else
      {
         _loc2_.stickMC._x = _loc2_.stickMC._y = 0;
      }
   }
}
