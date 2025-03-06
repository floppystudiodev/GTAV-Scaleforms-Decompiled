class com.rockstargames.gtav.minimap.WantedRadiusBlip extends MovieClip
{
   var wantedBlue;
   var wantedRadiusInterval;
   var wantedRed;
   var redVis = true;
   function WantedRadiusBlip()
   {
      super();
      this.wantedBlue._visible = false;
      this.wantedRadiusInterval = setInterval(this,"wantedColour",500);
   }
   function wantedColour()
   {
      var _loc2_ = undefined;
      if(this.redVis)
      {
         _loc2_ = true;
         this.redVis = false;
      }
      else
      {
         _loc2_ = false;
         this.redVis = true;
      }
      this.wantedRed._visible = this.redVis;
      this.wantedBlue._visible = _loc2_;
   }
}
