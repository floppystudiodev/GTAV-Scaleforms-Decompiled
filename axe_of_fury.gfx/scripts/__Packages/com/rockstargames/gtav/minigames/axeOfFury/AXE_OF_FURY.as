class com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var displayConfig;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var FRAME_DURATION = 0.03333333333333333;
   static var MAIN_FADE_IN_DURATION = 15 * com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.FRAME_DURATION;
   static var MAIN_FADE_OUT_DURATION = 15 * com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.FRAME_DURATION;
   static var METER_BAR_FADE_IN_DURATION = 5 * com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.FRAME_DURATION;
   static var METER_FLASH_IN_DURATION = 6 * com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.FRAME_DURATION;
   static var METER_BAR_FLASH_OUT_FRAMES = 6;
   static var RED_TINT = 153;
   static var WHITE_OFFSET = 180;
   static var RED_COLOUR_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_TINT,0,0,0);
   static var WHITE_COLOUR_TRANSFORM = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   function AXE_OF_FURY()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "AXE_OF_FURY";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT.background._visible = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.SET_IS_KEYBOARD_CONTROL(false);
      this.SET_SCREEN_POSITION(0.75,0.5);
      this.reset();
   }
   function reset()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.meterBar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.meterBar.icon);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.meterBar.marker);
      this.CONTENT.meterBar.marker._alpha = 100;
      this.CONTENT.meterBar.icon._alpha = 100;
      this.CONTENT.buttonIcon.gotoAndStop("normal");
      this.SET_BUTTON_VISIBLE(false);
      this.SET_METER_BAR_LINE_VISIBLE(false);
      this.SET_METER_BAR_ICON_VISIBLE(false);
      this.SET_METER_FILL_VALUE(0);
      this.CONTENT._alpha = 0;
   }
   function updateMeterFlash(frameCountdown)
   {
      var _loc4_ = frameCountdown / com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.METER_BAR_FLASH_OUT_FRAMES;
      var _loc3_ = 1 - _loc4_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM.redMultiplier = _loc3_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM.greenMultiplier = _loc3_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM.blueMultiplier = _loc3_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM.redOffset = Math.round(com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_TINT * _loc4_);
      this.CONTENT.meterBar.marker.transform.colorTransform = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM;
      this.CONTENT.meter.transform.colorTransform = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM;
      var _loc5_ = Math.round(com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.WHITE_OFFSET * _loc4_);
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.WHITE_COLOUR_TRANSFORM.redOffset = _loc5_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.WHITE_COLOUR_TRANSFORM.greenOffset = _loc5_;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.WHITE_COLOUR_TRANSFORM.blueOffset = _loc5_;
      this.CONTENT.meterBar.icon.transform.colorTransform = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.WHITE_COLOUR_TRANSFORM;
      if(frameCountdown > 0)
      {
         arguments[0] = arguments[0] - 1;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.meterBar,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.FRAME_DURATION,{onCompleteScope:this,onComplete:this.updateMeterFlash,onCompleteArgs:arguments});
      }
   }
   function SHOW()
   {
      this.reset();
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.MAIN_FADE_IN_DURATION,{_alpha:100});
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.MAIN_FADE_OUT_DURATION,{_alpha:0});
   }
   function SET_SCREEN_POSITION(xNorm, yNorm)
   {
      xNorm = Math.min(1,Math.max(0,xNorm));
      yNorm = Math.min(1,Math.max(0,yNorm));
      var _loc3_ = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.STAGE_WIDTH * this.displayConfig.safeLeft;
      var _loc7_ = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.STAGE_WIDTH * this.displayConfig.safeRight - this.CONTENT.background._width;
      var _loc2_ = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.STAGE_HEIGHT * this.displayConfig.safeTop;
      var _loc6_ = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.STAGE_HEIGHT * this.displayConfig.safeBottom - this.CONTENT.background._height;
      this.CONTENT._x = xNorm * (_loc7_ - _loc3_) + _loc3_;
      this.CONTENT._y = yNorm * (_loc6_ - _loc2_) + _loc2_;
   }
   function SET_BUTTON_VISIBLE(isVisible)
   {
      this.CONTENT.buttonIcon._visible = isVisible;
   }
   function FLASH_BUTTON()
   {
      this.CONTENT.buttonIcon.gotoAndPlay("flash");
   }
   function SET_METER_BAR_LINE_VISIBLE(isVisible)
   {
      if(this.CONTENT.meterBar.marker._visible == !isVisible)
      {
         this.CONTENT.meterBar.marker._visible = isVisible;
         if(isVisible)
         {
            this.CONTENT.meterBar.marker._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.meterBar.marker,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.METER_BAR_FADE_IN_DURATION,{_alpha:100});
         }
      }
   }
   function SET_METER_BAR_ICON_VISIBLE(isVisible)
   {
      if(this.CONTENT.meterBar.icon._visible == !isVisible)
      {
         this.CONTENT.meterBar.icon._visible = isVisible;
         if(isVisible)
         {
            this.CONTENT.meterBar.icon._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.meterBar.icon,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.METER_BAR_FADE_IN_DURATION,{_alpha:100});
         }
      }
   }
   function SET_METER_BAR_VALUE(value)
   {
      value = Math.min(1,Math.max(0,value));
      this.CONTENT.meterBar._y = this.CONTENT.meter._y + (1 - value) * this.CONTENT.meter._height;
   }
   function SET_METER_FILL_VALUE(value)
   {
      value = Math.min(1,Math.max(0,value));
      this.CONTENT.meter.fill._yscale = 100 * value;
   }
   function FLASH_METER()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.meterBar.icon);
      this.CONTENT.meterBar.icon._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.meterBar.marker);
      this.CONTENT.meterBar.marker._alpha = 100;
      com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM.redOffset = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_TINT;
      this.CONTENT.meterBar.marker.transform.colorTransform = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM;
      this.CONTENT.meter.transform.colorTransform = com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.RED_COLOUR_TRANSFORM;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.meterBar,com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.METER_FLASH_IN_DURATION,{onCompleteScope:this,onComplete:this.updateMeterFlash,onCompleteArgs:[com.rockstargames.gtav.minigames.axeOfFury.AXE_OF_FURY.METER_BAR_FLASH_OUT_FRAMES]});
   }
   function SET_IS_KEYBOARD_CONTROL(isKeyboard)
   {
      this.CONTENT.meterBar.icon.icon.keyButton._visible = isKeyboard;
      this.CONTENT.buttonIcon.icon.keyButton._visible = isKeyboard;
      this.CONTENT.meterBar.icon.icon.controllerButtonA._visible = !isKeyboard && !this.displayConfig.isCircleAccept;
      this.CONTENT.buttonIcon.icon.controllerButtonA._visible = !isKeyboard && !this.displayConfig.isCircleAccept;
      this.CONTENT.meterBar.icon.icon.controllerButtonB._visible = !isKeyboard && this.displayConfig.isCircleAccept;
      this.CONTENT.buttonIcon.icon.controllerButtonB._visible = !isKeyboard && this.displayConfig.isCircleAccept;
   }
}
