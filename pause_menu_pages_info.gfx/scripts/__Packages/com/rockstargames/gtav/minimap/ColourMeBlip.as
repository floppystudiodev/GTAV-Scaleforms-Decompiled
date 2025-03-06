class com.rockstargames.gtav.minimap.ColourMeBlip extends MovieClip
{
   var innerMC;
   var outerMC;
   function ColourMeBlip()
   {
      super();
   }
   function addColour(innerColour, outerColour)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(innerColour,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.innerMC,_loc2_.r,_loc2_.g,_loc2_.b);
      com.rockstargames.ui.utils.Colour.setHudColour(outerColour,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.outerMC,_loc2_.r,_loc2_.g,_loc2_.b);
   }
}
