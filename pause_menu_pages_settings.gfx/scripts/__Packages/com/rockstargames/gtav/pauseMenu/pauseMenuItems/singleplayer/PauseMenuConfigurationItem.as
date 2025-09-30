class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var _data;
   var _highlighted;
   var bgMC;
   var highlightMC;
   var isLastItem;
   var isSelectable;
   var itemTextLeft;
   var itemTextMid;
   var itemTextRight;
   var labelMC;
   var defaultLabelColourEnum = 0;
   function PauseMenuConfigurationItem()
   {
      super();
      this.itemTextMid = this.labelMC.value1TF;
      this.itemTextRight = this.labelMC.value2TF;
      this.defaultLabelColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      _global.gfxExtensions = true;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this._data[0] != undefined)
      {
         this.itemTextLeft.autoSize = "none";
         this.itemTextLeft._width = 390;
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
      }
      if(this.data[1] != undefined && this.data[1] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextMid,this.data[1],true);
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextMid,"");
      }
      if(this.data[2] != undefined && this.data[2] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[2],true);
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
      }
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc4_);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Debug.log("_data[0] " + this._data[0] + " // " + _d + " /// " + this.isLastItem);
      if(this.isLastItem)
      {
         this.highlightMC._height = this.bgMC._height = 25;
      }
      else
      {
         this.bgMC._height = 27;
         this.highlightMC._height = this.bgMC._height - 2;
      }
      this.bgMC._visible = false;
      this.highlighted = this._highlighted;
   }
   function set highlighted(_h)
   {
      this.highlightMC._visible = _h;
      if(this.labelMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,!this.isSelectable ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY : (!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK));
      }
      this._highlighted = _h;
   }
}
