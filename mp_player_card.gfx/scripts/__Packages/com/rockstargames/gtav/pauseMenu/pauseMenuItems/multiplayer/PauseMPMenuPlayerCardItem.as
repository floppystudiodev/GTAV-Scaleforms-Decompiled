class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem extends MovieClip
{
   var bgMC;
   var innerMC;
   static var TYPE_NUMERIC_STAT = 1;
   function PauseMPMenuPlayerCardItem()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.innerMC.barMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.barMC);
      _global.gfxExtensions = true;
   }
   function init(_data)
   {
      var _loc3_ = _data[3];
      var _loc2_ = _data.slice(6);
      this.innerMC.titleTF.textAutoSize = "shrink";
      this.innerMC.titleTF.text = _loc2_[0];
      this.innerMC.valTF.textAutoSize = "shrink";
      this.innerMC.valTF.text = _loc2_[1];
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.innerMC.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.innerMC.valTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(_loc3_ == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem.TYPE_NUMERIC_STAT)
      {
         this.innerMC.titleTF._y = (this.bgMC._height - this.innerMC.valTF.textHeight) * 0.5;
         this.innerMC.valTF._y = this.innerMC.titleTF._y;
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.barMC).mc._visible = false;
      }
      else
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.barMC).percent(_loc2_[2]);
      }
   }
   function setColour(colourEnum)
   {
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.barMC).init(colourEnum);
   }
   function setCustomColour(hudColour)
   {
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.barMC).initCustom(hudColour);
   }
}
