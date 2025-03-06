class com.rockstargames.gtav.levelDesign.PAUSE_MENU_INSTRUCTIONAL_BUTTONS extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   function PAUSE_MENU_INSTRUCTIONAL_BUTTONS()
   {
      super();
   }
   function SET_PADDING(_padding)
   {
      this.FOUR_THREE_PADDING = _padding;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      this.SET_BACKGROUND_COLOUR(_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
   }
}
