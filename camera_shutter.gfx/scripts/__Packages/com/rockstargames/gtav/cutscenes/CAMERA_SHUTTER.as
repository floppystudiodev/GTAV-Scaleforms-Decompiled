class com.rockstargames.gtav.cutscenes.CAMERA_SHUTTER
{
   var TIMEINE;
   var shutter;
   var numberOfBlades;
   function CAMERA_SHUTTER(mc)
   {
      this.TIMEINE = mc;
      this.shutter = this.TIMEINE.shutter;
      this.numberOfBlades = 9;
   }
   function OPEN_SHUTTER()
   {
      this.goTo("openShutter");
   }
   function CLOSE_SHUTTER()
   {
      this.goTo("closeShutter");
   }
   function CLOSE_THEN_OPEN_SHUTTER()
   {
      this.goTo("close_then_open");
   }
   function goTo(whichFrame)
   {
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.numberOfBlades)
      {
         var _loc3_ = this.shutter["blade" + _loc2_];
         _loc3_.gotoAndPlay(whichFrame);
         _loc2_ = _loc2_ + 1;
      }
   }
}
