class com.rockstargames.gtav.FrontendGen9.components.BaseItem extends MovieClip
{
   var textColour;
   static var DEFAULT_STATE = 0;
   static var SELECTED_STATE = 1;
   static var HOVER_STATE = 2;
   static var DISABLED_STATE = 3;
   function BaseItem()
   {
      super();
      this.textColour = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.textColour);
   }
   function SET_STATE(state)
   {
   }
}
