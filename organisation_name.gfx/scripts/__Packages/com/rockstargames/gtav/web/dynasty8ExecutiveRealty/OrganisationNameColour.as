class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour
{
   static var POP = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_LOCATION,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRIENDLY,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURPLE,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TENNIS,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RADAR_HEALTH];
   static var RETRO_80S = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G3,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G14,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G5,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G13,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G12];
   static var EARTHY = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_EXTRA_DIMMED,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_VIDEO_EDITOR_AMBIENT,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NET_PLAYER7,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GANG3,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_T,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G10,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G6];
   static var COLOUR_SCHEMES_BY_STYLE = [com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.EARTHY,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.EARTHY,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.EARTHY,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.POP,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.RETRO_80S,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.EARTHY,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.POP,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.POP,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.POP];
   function OrganisationNameColour()
   {
   }
   static function getColourString(styleIndex, colourIndex)
   {
      var _loc2_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColourEnum(styleIndex,colourIndex);
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
      return "#" + ("00" + _loc1_.r.toString(16)).substr(-2) + ("00" + _loc1_.g.toString(16)).substr(-2) + ("00" + _loc1_.b.toString(16)).substr(-2);
   }
   static function getColour(styleIndex, colourIndex)
   {
      var _loc2_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColourEnum(styleIndex,colourIndex);
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
      return _loc1_.r << 16 | _loc1_.g << 8 | _loc1_.b;
   }
   static function getColourEnum(styleIndex, colourIndex)
   {
      while(styleIndex < 0)
      {
         styleIndex += com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.COLOUR_SCHEMES_BY_STYLE.length;
      }
      styleIndex %= com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.COLOUR_SCHEMES_BY_STYLE.length;
      while(colourIndex < 0)
      {
         colourIndex += com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.COLOUR_SCHEMES_BY_STYLE[styleIndex].length;
      }
      colourIndex %= com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.COLOUR_SCHEMES_BY_STYLE[styleIndex].length;
      return com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.COLOUR_SCHEMES_BY_STYLE[styleIndex][colourIndex];
   }
}
