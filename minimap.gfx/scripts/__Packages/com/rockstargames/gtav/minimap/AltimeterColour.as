class com.rockstargames.gtav.minimap.AltimeterColour extends MovieClip
{
   var colour_panel;
   function AltimeterColour()
   {
      super();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = this.colour_panel;
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURPLE,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(_loc4_,_loc3_.r,_loc3_.g,_loc3_.b,35);
   }
   function Recolor(colour)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = this.colour_panel;
      com.rockstargames.ui.utils.Colour.setHudColour(colour,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(_loc3_,_loc2_.r,_loc2_.g,_loc2_.b,35);
   }
}
