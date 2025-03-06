class com.rockstargames.gtav.ng.Replay.SPEED_INDICATOR extends MovieClip
{
   var chevronsMC;
   static var SPEED_INCREASE = 0;
   static var SPEED_DECREASE = 1;
   function SPEED_INDICATOR()
   {
      super();
   }
   function INIT_SPEED_INDICATOR(stateId, width)
   {
      var _loc3_ = flash.display.BitmapData.loadBitmap("whiteChevron");
      var _loc2_ = new flash.geom.Matrix();
      if(stateId == com.rockstargames.gtav.ng.Replay.SPEED_INDICATOR.SPEED_DECREASE)
      {
         _loc2_.scale(-1,1);
      }
      this.chevronsMC.clear();
      this.chevronsMC.beginBitmapFill(_loc3_,_loc2_,true,true);
      this.chevronsMC.moveTo(0,0);
      this.chevronsMC.lineTo(width,0);
      this.chevronsMC.lineTo(width,25);
      this.chevronsMC.lineTo(0,25);
      this.chevronsMC.endFill();
      com.rockstargames.ui.utils.Colour.Colourise(this.chevronsMC,0,0,0,30);
   }
   function DISPOSE()
   {
      this.chevronsMC.clear();
      this.chevronsMC.removeMovieClip();
   }
}
