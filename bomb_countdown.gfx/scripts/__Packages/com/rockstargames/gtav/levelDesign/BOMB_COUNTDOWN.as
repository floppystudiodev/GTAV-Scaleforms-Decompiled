class com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var displays;
   var flashThreshold;
   static var SEGS = [119,36,93,109,46,107,123,37,127,111];
   static var RED = new flash.geom.ColorTransform(0.95,0.29,0.29,1,0,0,0,0);
   static var NUM_DISPLAYS = 4;
   static var NUM_SEGMENTS = 7;
   static var DEFAULT_FLASH_THRESHOLD = 10000;
   static var FLASH_OFF_ALPHA = 50;
   static var FLASH_ON_ALPHA = 100;
   static var FLASH_WAVELENGTH = 350;
   static var HALF_FLASH_WAVELENGTH = com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.FLASH_WAVELENGTH / 2;
   function BOMB_COUNTDOWN()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DIGITAL_SAFE_DISPLAY";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.flashThreshold = com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.DEFAULT_FLASH_THRESHOLD;
      this.displays = new Array(com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.NUM_DISPLAYS);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.NUM_DISPLAYS)
      {
         this.displays[_loc2_] = this.CONTENT["display" + _loc2_];
         this.displays[_loc2_].transform.colorTransform = com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.RED;
         this.SET_TIME(_loc2_,0);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setSegment(segment, digit)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.SEGS[digit];
      var _loc1_ = 0;
      while(_loc1_ < com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.NUM_SEGMENTS)
      {
         segment["seg" + _loc1_]._visible = _loc2_ & 1 << _loc1_;
         _loc1_ = _loc1_ + 1;
      }
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
   function SET_TIME(displayIndex, milliseconds)
   {
      this.clamp(displayIndex,0,com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.NUM_DISPLAYS);
      milliseconds = this.clamp(milliseconds,0,milliseconds);
      var _loc2_ = this.displays[displayIndex];
      var _loc3_ = Math.floor(milliseconds / 1000);
      var _loc5_ = Math.floor(_loc3_ / 60);
      _loc3_ %= 60;
      this.setSegment(_loc2_.segment0,_loc3_ % 10);
      this.setSegment(_loc2_.segment1,Math.floor(_loc3_ / 10) % 10);
      this.setSegment(_loc2_.segment2,_loc5_ % 10);
      this.setSegment(_loc2_.segment3,Math.floor(_loc5_ / 10) % 10);
      if(milliseconds < this.flashThreshold)
      {
         _loc2_._alpha = milliseconds % com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.FLASH_WAVELENGTH >= com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.HALF_FLASH_WAVELENGTH ? com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.FLASH_OFF_ALPHA : com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.FLASH_ON_ALPHA;
      }
      else
      {
         _loc2_._alpha = com.rockstargames.gtav.levelDesign.BOMB_COUNTDOWN.FLASH_ON_ALPHA;
      }
   }
   function SET_FLASHING_TIME_THRESHOLD(milliseconds)
   {
      this.flashThreshold = milliseconds;
   }
}
