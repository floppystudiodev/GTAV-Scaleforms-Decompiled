class com.rockstargames.gtav.levelDesign.TATTOO_BUTTONS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var canAddButton;
   var ONSCREEN_BUTTONS;
   var POSITIONAL_ALPHA_VALUES;
   var CONTENT;
   var offset = 50;
   var DURATION = 0.3;
   var tick = 0;
   var currentButtonID = 0;
   var keyrepeatDelay = 4;
   var percent = 0;
   var hasColour = false;
   function TATTOO_BUTTONS()
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
   function debug()
   {
      this.ADD_BUTTON();
   }
   function getKeys()
   {
      if(Key.isDown(40))
      {
         this.SET_STICK_POINTER_ANGLE(this.percent += 8);
      }
      else if(Key.isDown(37))
      {
         this.ADD_BUTTON();
      }
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
      if(this.canAddButton)
      {
         if(this.currentButtonID == -1)
         {
            this.currentButtonID = this.CONTENT.getNextHighestDepth();
         }
         var _loc2_ = undefined;
         var _loc5_ = this.ONSCREEN_BUTTONS.length * 100 + this.offset;
         var _loc4_ = undefined;
         if(whichButton < 8)
         {
            _loc4_ = "LEFT_STICK";
         }
         else if(whichButton >= 8 && whichButton < 16)
         {
            _loc4_ = "RIGHT_STICK";
         }
         else
         {
            _loc4_ = "SPACER";
         }
         _loc2_ = this.CONTENT.attachMovie(_loc4_,"button" + this.CONTENT.getNextHighestDepth(),this.CONTENT.getNextHighestDepth(),{_x:_loc5_,_y:this.offset});
         _loc2_.targetArrowMC._rotation = whichButton % 8 * 45;
         _loc2_.arrowMC._alpha = 0;
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
      var _loc2_ = this.ONSCREEN_BUTTONS[1];
      var _loc6_ = 0;
      var _loc5_ = 0;
      if(arAngle != undefined && arAngle >= 0)
      {
         arAngle -= 90;
         var _loc4_ = 5;
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
   function HIDE_STICK_POINTER()
   {
      var _loc2_ = this.ONSCREEN_BUTTONS[1];
      _loc2_.stickMC._x = _loc2_.stickMC._y = 0;
   }
}
