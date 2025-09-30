class com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var BOUNDING_BOX;
   var CONTENT;
   var IS_OFFSCREEN;
   var ON_SCREEN_DURATION_ONE_FRAME;
   var ON_SCREEN_DURATION_PER_WORD;
   var ON_SCREEN_DURATION_TOTAL;
   var TICKET_NUMBER;
   var TIMELINE;
   var _HUD;
   var _enumID;
   var _fadeType;
   var arrow;
   var arrowHeight;
   var arrowMCOffscreen;
   var arrowPosition;
   var arrowWidth;
   var background;
   var blipLayer;
   var bottomPadding;
   var boxOffset;
   var currentStyle;
   var defaultHelpTextStyle;
   var defaultWidth;
   var helpTextBackgroundOffscreen;
   var helpTextType;
   var helpTextfield;
   var hudCompEnum;
   var isAnimating;
   var isClearing;
   var isOnscreen;
   var leftPadding;
   var offScreenIndicator;
   var rightPadding;
   var sidePadding;
   var topPadding;
   var trimForOneLineText;
   var txtFormat;
   var screenWidth = 1280;
   var screenHeight = 720;
   function HUD_FLOATING_HELP_TEXT()
   {
      super();
      this.defaultWidth = 280;
      this.leftPadding = 7;
      this.rightPadding = 5;
      this.sidePadding = this.leftPadding + this.rightPadding;
      this.topPadding = 5;
      this.bottomPadding = 12;
      this.isAnimating = false;
      this.isClearing = false;
      this.ON_SCREEN_DURATION_ONE_FRAME = 66;
      this.ON_SCREEN_DURATION_PER_WORD = 333;
      this.trimForOneLineText = 3;
      this.currentStyle = -1;
      this.defaultHelpTextStyle = new Array(0,0,0,0,0,77);
      this.hudCompEnum = com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1;
      this.helpTextType = 1;
      this.txtFormat = this.CONTENT.helpText.getTextFormat();
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
      this.background = this.CONTENT.helpTextBackground;
      this.helpTextBackgroundOffscreen = this.CONTENT.helpTextBackgroundOffscreen;
      this.arrowMCOffscreen = this.CONTENT.arrowMCOffscreen;
      this.offScreenIndicator = this.CONTENT.offScreenIndicator;
      this.arrowMCOffscreen._visible = false;
      this.helpTextBackgroundOffscreen._visible = false;
      this.offScreenIndicator._visible = false;
      this.arrow = this.CONTENT.arrowMC;
      this.arrow._visible = false;
      this.arrowHeight = this.arrow._height;
      this.arrowWidth = this.arrow._width;
      this.helpTextfield = this.CONTENT.helpText;
      this.helpTextfield.wordWrap = true;
      this.helpTextfield.autoSize = true;
      this.CONTENT._alpha = 0;
      this.clearBlipLayer();
      this.helpTextfield._x = this.background._x + this.leftPadding;
      this.helpTextfield._y = this.background._y + this.topPadding;
   }
   function clearBlipLayer()
   {
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.createEmptyMovieClip("blipLayer",1000);
   }
   function SET_HELP_TEXT_POSITION(params)
   {
      var _loc4_ = params[0];
      var _loc3_ = params[1];
      var _loc2_ = this.COORDS_TO_SCREEN(_loc4_,_loc3_);
      this.CONTENT._x = Math.floor(_loc2_.x);
      this.CONTENT._y = Math.floor(_loc2_.y);
   }
   function SET_HELP_TEXT_OFFSCREEN(params)
   {
      var _loc2_ = params[0];
      this.isOnscreen = false;
      switch(_loc2_)
      {
         case 0:
            this.isOnscreen = true;
            break;
         case 1:
            this.helpTextBackgroundOffscreen._x = Math.floor(- this.helpTextBackgroundOffscreen._width / 2);
            this.helpTextBackgroundOffscreen._y = Math.floor(0 + this.arrowMCOffscreen._height);
            this.arrowMCOffscreen._x = Math.floor(this.helpTextBackgroundOffscreen._x + this.helpTextBackgroundOffscreen._width / 2);
            this.arrowMCOffscreen._y = Math.floor(0 + this.arrowMCOffscreen._height);
            this.arrowMCOffscreen._rotation = 180;
            break;
         case 4:
            this.helpTextBackgroundOffscreen._x = Math.floor(0 + this.arrowHeight);
            this.helpTextBackgroundOffscreen._y = Math.floor(- this.helpTextBackgroundOffscreen._height / 2);
            this.arrowMCOffscreen._x = Math.floor(0 + this.arrowHeight);
            this.arrowMCOffscreen._y = 0;
            this.arrowMCOffscreen._rotation = 90;
            break;
         case 3:
            this.helpTextBackgroundOffscreen._x = Math.floor(- this.helpTextBackgroundOffscreen._width / 2);
            this.helpTextBackgroundOffscreen._y = Math.floor(- this.helpTextBackgroundOffscreen._height - this.helpTextBackgroundOffscreen._height);
            this.arrowMCOffscreen._x = Math.floor(this.helpTextBackgroundOffscreen._x + this.helpTextBackgroundOffscreen._width / 2);
            this.arrowMCOffscreen._y = Math.floor(this.helpTextBackgroundOffscreen._y + this.helpTextBackgroundOffscreen._height);
            this.arrowMCOffscreen._rotation = 0;
            break;
         case 2:
            this.helpTextBackgroundOffscreen._x = Math.floor(- (this.helpTextBackgroundOffscreen._width + this.arrowHeight));
            this.helpTextBackgroundOffscreen._y = Math.floor(- this.helpTextBackgroundOffscreen._height / 2);
            this.arrowMCOffscreen._rotation = -90;
            this.arrowMCOffscreen._x = Math.floor(- this.arrowHeight);
            this.arrowMCOffscreen._y = 0;
      }
      this.toggleOffScreen(this.isOnscreen);
      this.offScreenIndicator._x = this.helpTextBackgroundOffscreen._x + 12;
      this.offScreenIndicator._y = this.helpTextBackgroundOffscreen._y + 12;
   }
   function toggleOffScreen(isHelpTextVisible)
   {
      if(isHelpTextVisible)
      {
         this.background._visible = true;
         this.helpTextfield._visible = true;
         this.IS_OFFSCREEN = false;
         this.helpTextBackgroundOffscreen._visible = false;
         this.offScreenIndicator._visible = false;
         this.arrowMCOffscreen._visible = this.IS_OFFSCREEN;
         if(this.currentStyle == 0)
         {
            this.arrowPosition = 0;
            this.boxOffset = 0;
         }
         if(this.arrowPosition > 0)
         {
            this.arrow._visible = true;
         }
         else
         {
            this.arrow._visible = false;
         }
      }
      else
      {
         this.IS_OFFSCREEN = true;
         this.background._visible = false;
         this.helpTextfield._visible = false;
         this.arrow._visible = false;
         this.helpTextBackgroundOffscreen._visible = true;
         this.offScreenIndicator._visible = true;
         this.arrowMCOffscreen._visible = this.IS_OFFSCREEN;
      }
   }
   function SET_HELP_TEXT_STYLE(params)
   {
      this.arrow._visible = false;
      var _loc7_ = params[0];
      var _loc3_;
      var _loc6_;
      var _loc2_;
      var _loc4_;
      this.arrowPosition = params[1];
      if(this.arrowPosition == undefined)
      {
         this.arrowPosition = 0;
      }
      this.boxOffset = params[2];
      if(this.boxOffset == undefined)
      {
         this.boxOffset = 0;
      }
      if(params.length > 2)
      {
         _loc3_ = params[3];
         _loc6_ = params[4];
         _loc2_ = params[5];
         _loc4_ = this.defaultHelpTextStyle[5];
      }
      else
      {
         _loc3_ = this.defaultHelpTextStyle[2];
         _loc6_ = this.defaultHelpTextStyle[3];
         _loc2_ = this.defaultHelpTextStyle[4];
         _loc4_ = this.defaultHelpTextStyle[5];
      }
      if(_loc7_ == 0)
      {
         this.arrowPosition = 0;
         this.boxOffset = 0;
      }
      if(!this.IS_OFFSCREEN)
      {
         if(this.arrowPosition > 0)
         {
            this.arrow._visible = true;
         }
         else
         {
            this.arrow._visible = false;
         }
      }
      else
      {
         this.arrow._visible = false;
      }
      if(this.background != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.background,_loc3_,_loc6_,_loc2_,_loc4_);
      }
      if(this.arrow != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.arrow,_loc3_,_loc6_,_loc2_,_loc4_);
      }
      if(this.helpTextBackgroundOffscreen != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.helpTextBackgroundOffscreen,_loc3_,_loc6_,_loc2_,_loc4_);
      }
      if(this.arrowMCOffscreen != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.arrowMCOffscreen,_loc3_,_loc6_,_loc2_,_loc4_);
      }
      this.currentStyle = _loc7_;
      this.SET_BACKGROUND_SIZE();
   }
   function SET_HELP_TEXT(params)
   {
      if(this.currentStyle == -1)
      {
         this.SET_HELP_TEXT_STYLE(this.defaultHelpTextStyle);
      }
      this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION;
      var _loc2_ = params[0];
      this.TICKET_NUMBER = params[2];
      var _loc3_ = params[1];
      if(_loc3_ != undefined)
      {
         this._fadeType = _loc3_;
      }
      else
      {
         this._fadeType = -1;
      }
      var _loc5_ = _loc2_.split(" ");
      this.ON_SCREEN_DURATION_TOTAL += _loc5_.length * this.ON_SCREEN_DURATION_PER_WORD;
      var _loc4_ = this.ON_SCREEN_DURATION_TOTAL / 100 * 30;
      this.ON_SCREEN_DURATION_TOTAL += _loc4_;
      this.helpTextfield.htmlText = _loc2_;
      this.helpTextfield.autoSize = true;
      this.SET_BACKGROUND_SIZE();
      this.FADE_IN();
   }
   function SET_HELP_TEXT_RAW(params)
   {
      this.clearBlipLayer();
      if(this.currentStyle == -1)
      {
         this.SET_HELP_TEXT_STYLE(this.defaultHelpTextStyle);
      }
      this.ON_SCREEN_DURATION_TOTAL = this.ON_SCREEN_DURATION;
      var _loc2_ = params[0];
      this.TICKET_NUMBER = params[2];
      var _loc3_ = params[1];
      if(_loc3_ != undefined)
      {
         this._fadeType = _loc3_;
      }
      else
      {
         this._fadeType = -1;
      }
      var _loc4_ = _loc2_.split(" ");
      this.ON_SCREEN_DURATION_TOTAL += _loc4_.length * this.ON_SCREEN_DURATION_PER_WORD;
      var _loc6_ = new com.rockstargames.ui.utils.Text();
      _loc6_.setTextWithIcons(_loc2_,this.blipLayer,this.CONTENT.helpText,0,14.4,2.65,false);
      this.SET_BACKGROUND_SIZE();
      this.FADE_IN();
   }
   function SET_BACKGROUND_SIZE()
   {
      this.background._height = this.helpTextfield.textHeight + this.topPadding + this.bottomPadding;
      var _loc6_ = this.background._width / 2;
      if(this.helpTextfield.maxscroll == 1)
      {
         this.background._height -= this.trimForOneLineText;
         this.background._width = this.helpTextfield.textWidth + this.sidePadding * 2;
      }
      else
      {
         this.background._width = this.defaultWidth;
      }
      var _loc7_;
      switch(this.arrowPosition)
      {
         case 0:
            this.background._x = 0;
            this.background._y = 0;
            break;
         case 1:
            this.background._x = Math.floor(- this.background._width / 2 + this.boxOffset);
            this.background._y = Math.floor(0 + this.arrowHeight);
            this.arrow._x = Math.floor(- this.background._width / 2 + this.background._width / 2);
            this.arrow._y = Math.floor(0 + this.arrow._height);
            this.arrow._rotation = 180;
            break;
         case 2:
            this.background._x = Math.floor(0 + this.arrowHeight);
            this.background._y = Math.floor(- this.background._height / 2 + this.boxOffset);
            this.arrow._x = Math.floor(0 + this.arrowHeight);
            this.arrow._y = 0;
            this.arrow._rotation = 90;
            break;
         case 3:
            this.background._x = Math.floor(- this.background._width / 2 - this.boxOffset);
            this.background._y = Math.floor(- this.background._height - this.arrow._height);
            this.arrow._x = Math.floor(- this.background._width / 2 + this.background._width / 2);
            this.arrow._y = Math.floor(this.background._y + this.background._height);
            this.arrow._rotation = 0;
            break;
         case 4:
            this.background._x = Math.floor(- (this.background._width + this.arrowHeight));
            this.background._y = Math.floor(- this.background._height / 2 - this.boxOffset);
            this.arrow._rotation = -90;
            this.arrow._x = Math.floor(- this.arrowHeight);
            this.arrow._y = 0;
      }
      this.helpTextfield._x = Math.floor(this.background._x + this.leftPadding);
      this.helpTextfield._y = Math.floor(this.background._y + this.topPadding);
      var _loc5_ = this.CONTENT._x / 1280;
      var _loc4_ = this.CONTENT._y / 720;
      var _loc2_ = this.background._width / 1280;
      var _loc3_ = this.background._height / 720;
      com.rockstargames.ui.game.GameInterface.call("SET_REVISED_COMPONENT_VALUES",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this.hudCompEnum,_loc5_,_loc4_,_loc2_,_loc3_);
   }
   function FADE_IN()
   {
      if(!this.isAnimating)
      {
         this.isAnimating = true;
         if(this._fadeType == 0)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0,{_alpha:100,onCompleteScope:this});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
         }
      }
   }
   function STAY_ON_SCREEN()
   {
      this.isAnimating = false;
      if(this._fadeType == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.ON_SCREEN_DURATION_ONE_FRAME / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.FADE_OUT});
      }
      else if(this._fadeType == -1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.ON_SCREEN_DURATION_TOTAL / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.FADE_OUT});
      }
   }
   function CLEAR_HELP_TEXT(params)
   {
      this.TICKET_NUMBER = params[0];
      if(!this.isClearing)
      {
         this.FADE_OUT();
         this.isClearing = true;
      }
   }
   function CLEAR_HELP_TEXT_NOW(params)
   {
      this.TICKET_NUMBER = params[0];
      this.CONTENT._alpha = 0;
      this.REMOVE();
   }
   function FADE_OUT()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
   }
   function REMOVE()
   {
      this.isAnimating = false;
      this.isClearing = false;
      this.arrowPosition = 0;
      this.boxOffset = 0;
      this.CONTENT._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.game.GameInterface.call("CLEAR_HELP_TEXT",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this.helpTextType,this.TICKET_NUMBER);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function COORDS_TO_SCREEN(posX, posY)
   {
      return new flash.geom.Point(posX * this.screenWidth,posY * this.screenHeight);
   }
   function clamp(value, min, max)
   {
      if(value > max)
      {
         return max;
      }
      if(value < min)
      {
         return min;
      }
      return value;
   }
}
