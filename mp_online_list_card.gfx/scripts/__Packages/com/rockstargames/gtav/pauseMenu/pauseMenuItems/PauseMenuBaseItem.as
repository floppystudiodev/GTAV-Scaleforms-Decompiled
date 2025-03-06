class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var itemTextLeft;
   var labelMC;
   var bgMC;
   var index = 0;
   var type = 0;
   var menuID = 0;
   var uniqueID = 0;
   var initialIndex = 0;
   var selectedIndex = 0;
   var isAdjustable = false;
   var isSelectable = 1;
   var itemHeight = 25;
   var menuPrefOffset = 1000;
   function PauseMenuBaseItem()
   {
      super();
      this.itemTextLeft = this.labelMC.titleTF;
      this.highlighted = this._highlighted;
   }
   function set data(_d)
   {
      this.index = _d[0];
      this.menuID = _d[1];
      this.uniqueID = _d[2];
      this.type = _d[3];
      this.initialIndex = _d[4];
      this.isSelectable = _d[5];
      if(_d.length >= 7)
      {
         this._data = _d.slice(6);
      }
      if(this._data[0] != undefined)
      {
         this.itemTextLeft.htmlText = this._data[0];
         this.itemTextLeft.autoSize = true;
      }
   }
   function set highlighted(_h)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      }
      if(this.bgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(this.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      }
      this._highlighted = _h;
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27;
   }
   function stepVal(dir)
   {
   }
   function setPref(val)
   {
      if(this.uniqueID >= 0 && this.uniqueID < this.menuPrefOffset)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_PAUSE_MENU_PREF",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.uniqueID,val);
      }
   }
}
