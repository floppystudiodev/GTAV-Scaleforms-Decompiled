class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var colourIconMC;
   var itemTextRight;
   var labelMC;
   var rankIconMC;
   var type;
   var TYPE_WORLD_RANKING = 1;
   function PauseMenuCrewsCardItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.colourIconMC._visible = false;
      this.rankIconMC._visible = false;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this.data[1] != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[1],true);
      }
      if(this.data[2] != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.colourIconMC,this.data[2],this.data[3],this.data[4],100);
         this.colourIconMC._visible = true;
      }
      if(this.type == this.TYPE_WORLD_RANKING)
      {
         this.rankIconMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rankIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
   }
   function collapse(isCollapsed)
   {
      if(isCollapsed)
      {
         this.colourIconMC._x = 143 - this.colourIconMC._width - 6;
         this.itemTextRight._x = 143 - this.itemTextRight._width - 6;
      }
      else
      {
         this.colourIconMC._x = 288 - this.colourIconMC._width - 6;
         this.itemTextRight._x = 288 - this.itemTextRight._width - 6;
      }
   }
}
