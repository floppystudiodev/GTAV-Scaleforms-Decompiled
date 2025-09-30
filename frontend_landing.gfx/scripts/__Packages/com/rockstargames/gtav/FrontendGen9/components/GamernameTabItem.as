class com.rockstargames.gtav.FrontendGen9.components.GamernameTabItem extends com.rockstargames.gtav.FrontendGen9.components.TabItem
{
   var background;
   var bgColourBlack;
   var bgColourWhite;
   var textTF;
   function GamernameTabItem()
   {
      super();
      this.bgColourWhite = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.bgColourWhite);
      this.bgColourBlack = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.bgColourBlack);
   }
   function SET_HOVER_STATE(state)
   {
      if(state == 0)
      {
         this.setHighlight(false);
      }
      if(state == 1)
      {
         this.setHighlight(true);
      }
   }
   function setHighlight(isLit)
   {
      this.background._visible = isLit;
      if(isLit)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.Colourise(this.background,this.bgColourWhite.r,this.bgColourWhite.g,this.bgColourWhite.b,100);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.Colourise(this.background,this.bgColourBlack.r,this.bgColourBlack.g,this.bgColourBlack.b,100);
      }
   }
}
