class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRankItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var _data;
   var _highlighted;
   var bgMC;
   var itemTextLeft;
   var itemTextRight;
   var labelMC;
   var rpMC;
   var type;
   function PauseMenuCrewRankItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemTextLeft = this.labelMC.rankTF;
      this.itemTextRight = this.labelMC.xpTF;
      this.itemTextRight.textAutoSize = "shrink";
   }
   function set data(_d)
   {
      super.data = _d;
      this.itemTextLeft.text = this._data[0];
      this.itemTextLeft.autoSize = "right";
      this.itemTextRight.text = this.data[2];
      this.rpMC._visible = this.labelMC._visible = this.itemTextLeft.text != "" || this.itemTextRight.text != "";
      this.snapBGGrid(this.bgMC);
      this.highlighted = this._highlighted;
   }
   function set highlighted(_h)
   {
      super.highlighted = _h;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rpMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      var _loc3_;
      if(this.bgMC)
      {
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         if(_h)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         }
         if(this.type == 3)
         {
            _loc3_.a = 20;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
   }
   function snapBGGrid(bgMC)
   {
      bgMC._width = 290;
      bgMC._x = -2;
   }
}
