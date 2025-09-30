class com.rockstargames.gtav.minigames.dancing.DANCER extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var beatB;
   var beatColourTransform;
   var beatFadeCounter;
   var beatG;
   var beatR;
   var controlIsAlt;
   var controlIsLT;
   var controlIsMouse;
   var currLevel;
   var displayConfig;
   var flashB;
   var flashColourTransform;
   var flashFadeCounter;
   var flashG;
   var flashR;
   var meter;
   var musicBeat;
   var playerBeat;
   var pulseFadeCounter;
   static var WIDTH = 1280;
   static var HEIGHT = 720;
   static var MUSIC_BEAT_MAX = 130;
   static var MUSIC_BEAT_MIN = 100;
   static var MUSIC_BEAT_SHRINK_SCALAR = 0.2;
   static var PLAYER_BEAT_FADE_DURATION = 20;
   static var PLAYER_BEAT_FADE_DELAY = 10;
   static var MAX_GLOW_ALPHA = 75;
   static var BEAT_COLOUR_FADE_DURATION = 40;
   static var FLASH_COLOUR_FADE_DURATION = 12;
   static var NUM_LEVELS = 4;
   static var COLOUR_DEFAULT = 3655934;
   static var COLOUR_DEFAULT_R = com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT >> 16 & 0xFF;
   static var COLOUR_DEFAULT_G = com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT >> 8 & 0xFF;
   static var COLOUR_DEFAULT_B = com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT & 0xFF;
   static var COLOUR_HIT = 2546227;
   static var COLOUR_MISS = 16711884;
   static var COLOUR_FLASH = 16777003;
   static var COLOUR_METER_RED = 16720384;
   static var FLASH_ALPHA = 0.6;
   static var PULSE_MAX_SCALE = 50;
   static var PULSE_MIN_SCALE = 38;
   static var PULSE_FADE_DURATION = 6;
   function DANCER()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DANCER";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.meter = new com.rockstargames.gtav.minigames.dancing.Meter(this.CONTENT.icon.meter,23);
      this.CONTENT.icon.meter.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_FLASH >> 16 & 0xFF,com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_FLASH >> 8 & 0xFF,com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_FLASH & 0xFF,0);
      this.musicBeat = com.rockstargames.gtav.minigames.dancing.DANCER.MUSIC_BEAT_MIN;
      this.playerBeat = [0,0,0];
      this.currLevel = 0;
      this.beatFadeCounter = 0;
      this.beatColourTransform = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
      this.setColour(com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT);
      this.flashFadeCounter = 0;
      this.flashColourTransform = new flash.geom.ColorTransform();
      this.pulseFadeCounter = 0;
      this.CONTENT.background._visible = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.SET_IS_MOUSE_CONTROL(false);
      this.SET_SCREEN_POSITION(1,1);
      this.SET_LEVEL(this.currLevel);
      this.SET_IS_LT_CONTROL(false);
      this.SET_GAMEPAD_TYPE_IS_ALT(false);
      this.CONTENT.onEnterFrame = this.delegate(this,this.update);
   }
   function SET_SCREEN_POSITION(xNorm, yNorm)
   {
      xNorm = Math.min(1,Math.max(0,xNorm));
      yNorm = Math.min(1,Math.max(0,yNorm));
      var _loc3_ = com.rockstargames.gtav.minigames.dancing.DANCER.WIDTH * this.displayConfig.safeLeft;
      var _loc7_ = com.rockstargames.gtav.minigames.dancing.DANCER.WIDTH * this.displayConfig.safeRight - this.CONTENT._width;
      var _loc2_ = com.rockstargames.gtav.minigames.dancing.DANCER.HEIGHT * this.displayConfig.safeTop;
      var _loc6_ = com.rockstargames.gtav.minigames.dancing.DANCER.HEIGHT * this.displayConfig.safeBottom - this.CONTENT._height;
      this.CONTENT._x = xNorm * (_loc7_ - _loc3_) + _loc3_;
      this.CONTENT._y = yNorm * (_loc6_ - _loc2_) + _loc2_;
   }
   function SET_IS_MOUSE_CONTROL(isMouse)
   {
      this.controlIsMouse = isMouse;
      this.setIcon();
   }
   function SET_IS_LT_CONTROL(isLT)
   {
      this.controlIsLT = isLT;
      this.setIcon();
   }
   function SET_GAMEPAD_TYPE_IS_ALT(isAlt)
   {
      this.controlIsAlt = isAlt;
      this.setIcon();
   }
   function SET_LEVEL(level)
   {
      this.currLevel = Math.min(com.rockstargames.gtav.minigames.dancing.DANCER.NUM_LEVELS - 1,Math.max(0,level));
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.minigames.dancing.DANCER.NUM_LEVELS)
      {
         this.CONTENT.icon.rings["ring" + _loc2_]._visible = _loc2_ <= this.currLevel;
         this.CONTENT.icon.rings["glow" + _loc2_]._visible = _loc2_ <= this.currLevel;
         _loc2_ = _loc2_ + 1;
      }
   }
   function MUSIC_BEAT()
   {
      this.musicBeat = com.rockstargames.gtav.minigames.dancing.DANCER.MUSIC_BEAT_MAX;
   }
   function PLAYER_BEAT(isAGoodBeat)
   {
      var _loc3_ = this.currLevel * com.rockstargames.gtav.minigames.dancing.DANCER.PLAYER_BEAT_FADE_DELAY;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.minigames.dancing.DANCER.NUM_LEVELS)
      {
         this.playerBeat[_loc2_] = com.rockstargames.gtav.minigames.dancing.DANCER.PLAYER_BEAT_FADE_DURATION + _loc3_;
         _loc3_ -= com.rockstargames.gtav.minigames.dancing.DANCER.PLAYER_BEAT_FADE_DELAY;
         _loc2_ = _loc2_ + 1;
      }
      this.setColour(!isAGoodBeat ? com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_MISS : com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_HIT);
   }
   function FLASH_ICON()
   {
      this.setFlash(com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_FLASH);
   }
   function PULSE_ICON()
   {
      this.setPulse();
   }
   function SET_METER(normValue)
   {
      this.meter.value = normValue;
   }
   function SET_METER_IS_RED(isRed)
   {
      var _loc2_ = !isRed ? com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_FLASH : com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_METER_RED;
      var _loc3_ = this.CONTENT.icon.meter._alpha;
      this.CONTENT.icon.meter.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,_loc2_ >> 16 & 0xFF,_loc2_ >> 8 & 0xFF,_loc2_ & 0xFF,0);
      this.CONTENT.icon.meter._alpha = _loc3_;
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function update()
   {
      this.musicBeat += com.rockstargames.gtav.minigames.dancing.DANCER.MUSIC_BEAT_SHRINK_SCALAR * (com.rockstargames.gtav.minigames.dancing.DANCER.MUSIC_BEAT_MIN - this.musicBeat);
      this.CONTENT.icon.rings._xscale = this.CONTENT.icon.rings._yscale = this.musicBeat;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.minigames.dancing.DANCER.NUM_LEVELS)
      {
         if(this.playerBeat[_loc2_] >= 0)
         {
            _loc3_ = Math.min(com.rockstargames.gtav.minigames.dancing.DANCER.MAX_GLOW_ALPHA,com.rockstargames.gtav.minigames.dancing.DANCER.MAX_GLOW_ALPHA * this.playerBeat[_loc2_] / com.rockstargames.gtav.minigames.dancing.DANCER.PLAYER_BEAT_FADE_DURATION);
            this.CONTENT.icon.rings["glow" + _loc2_]._alpha = _loc3_;
            this.playerBeat[_loc2_]--;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.fadeColour();
      this.fadeFlash();
      this.fadePulse();
   }
   function setColour(colour)
   {
      this.beatColourTransform.rgb = colour;
      this.CONTENT.icon.rings.transform.colorTransform = this.beatColourTransform;
      this.beatFadeCounter = com.rockstargames.gtav.minigames.dancing.DANCER.BEAT_COLOUR_FADE_DURATION;
      this.beatR = colour >> 16 & 0xFF;
      this.beatG = colour >> 8 & 0xFF;
      this.beatB = colour & 0xFF;
   }
   function fadeColour()
   {
      var _loc2_ = this.beatFadeCounter / com.rockstargames.gtav.minigames.dancing.DANCER.BEAT_COLOUR_FADE_DURATION;
      var _loc4_ = Math.round(_loc2_ * (this.beatR - com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_R)) + com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_R;
      var _loc5_ = Math.round(_loc2_ * (this.beatG - com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_G)) + com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_G;
      var _loc3_ = Math.round(_loc2_ * (this.beatB - com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_B)) + com.rockstargames.gtav.minigames.dancing.DANCER.COLOUR_DEFAULT_B;
      this.beatColourTransform.rgb = _loc4_ << 16 | _loc5_ << 8 | _loc3_;
      this.CONTENT.icon.rings.transform.colorTransform = this.beatColourTransform;
      if(this.beatFadeCounter > 0)
      {
         this.beatFadeCounter = this.beatFadeCounter - 1;
      }
   }
   function setFlash(colour)
   {
      this.flashFadeCounter = com.rockstargames.gtav.minigames.dancing.DANCER.FLASH_COLOUR_FADE_DURATION;
      this.flashR = colour >> 16 & 0xFF;
      this.flashG = colour >> 8 & 0xFF;
      this.flashB = colour & 0xFF;
      this.fadeFlash();
      this.flashFadeCounter = this.flashFadeCounter + 1;
   }
   function fadeFlash()
   {
      var _loc2_;
      var _loc3_;
      if(this.flashFadeCounter > 0)
      {
         _loc2_ = com.rockstargames.gtav.minigames.dancing.DANCER.FLASH_ALPHA * this.flashFadeCounter / com.rockstargames.gtav.minigames.dancing.DANCER.FLASH_COLOUR_FADE_DURATION;
         _loc3_ = 1 - _loc2_;
         this.flashColourTransform.redMultiplier = _loc3_;
         this.flashColourTransform.greenMultiplier = _loc3_;
         this.flashColourTransform.blueMultiplier = _loc3_;
         this.flashColourTransform.redOffset = Math.round(_loc2_ * this.flashR);
         this.flashColourTransform.greenOffset = Math.round(_loc2_ * this.flashG);
         this.flashColourTransform.blueOffset = Math.round(_loc2_ * this.flashB);
         this.CONTENT.icon.centre.transform.colorTransform = this.flashColourTransform;
         this.flashFadeCounter = this.flashFadeCounter - 1;
      }
   }
   function setPulse()
   {
      this.pulseFadeCounter = com.rockstargames.gtav.minigames.dancing.DANCER.PULSE_FADE_DURATION;
   }
   function fadePulse()
   {
      var _loc3_;
      var _loc2_;
      if(this.pulseFadeCounter > 0)
      {
         _loc3_ = this.pulseFadeCounter / com.rockstargames.gtav.minigames.dancing.DANCER.PULSE_FADE_DURATION;
         _loc2_ = _loc3_ * (com.rockstargames.gtav.minigames.dancing.DANCER.PULSE_MIN_SCALE - com.rockstargames.gtav.minigames.dancing.DANCER.PULSE_MAX_SCALE) + com.rockstargames.gtav.minigames.dancing.DANCER.PULSE_MAX_SCALE;
         this.CONTENT.icon.centre._xscale = _loc2_;
         this.CONTENT.icon.centre._yscale = _loc2_;
         this.pulseFadeCounter = this.pulseFadeCounter - 1;
      }
   }
   function setIcon()
   {
      this.CONTENT.icon.centre.leftMouseButton._visible = this.controlIsMouse && !this.controlIsLT;
      this.CONTENT.icon.centre.rightMouseButton._visible = this.controlIsMouse && this.controlIsLT;
      this.CONTENT.icon.centre.controllerButtonA._visible = !this.controlIsMouse && !this.controlIsLT && !this.controlIsAlt;
      this.CONTENT.icon.centre.controllerButtonLT._visible = !this.controlIsMouse && this.controlIsLT && !this.controlIsAlt;
      this.CONTENT.icon.centre.controllerButtonAltA._visible = !this.controlIsMouse && !this.controlIsLT && this.controlIsAlt;
      this.CONTENT.icon.centre.controllerButtonAltLT._visible = !this.controlIsMouse && this.controlIsLT && this.controlIsAlt;
   }
}
