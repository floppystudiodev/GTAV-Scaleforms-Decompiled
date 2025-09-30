class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__columnID;
   var __get__data;
   var __get__highlighted;
   var _highlighted;
   var attachMovie;
   var barMC;
   var bgMC;
   var darkbarMC;
   var darkmaskMC;
   var getNextHighestDepth;
   var index;
   var isSelectable;
   var itemTextLeft;
   var itemTextRight;
   var labelMC;
   var maskMC;
   var type;
   function PauseMenuCharacterStatsItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      var _loc3_ = this.attachMovie("GenericColourBar","darkbarMC",this.getNextHighestDepth());
      var _loc4_ = this.attachMovie("GenericColourBar","barMC",this.getNextHighestDepth());
      this.barMC = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc4_);
      this.darkbarMC = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc3_);
      this.barMC._x = this.darkbarMC._x = this.maskMC._x;
      this.barMC._y = this.darkbarMC._y = this.maskMC._y;
   }
   function set data(_d)
   {
      super.data = _d;
      var _loc0_;
      switch(this.type)
      {
         case 0:
            this.darkmaskMC._visible = _loc0_ = true;
            this.maskMC._visible = _loc0_;
            this.barMC.mc.baralphaMC._visible = false;
            this.barMC._height = 6;
            this.barMC.setMask(this.maskMC);
            this.darkbarMC._visible = true;
            this.darkbarMC.setMask(this.darkmaskMC);
            this.bgMC._height = 40;
            break;
         case 1:
            this.darkmaskMC._visible = _loc0_ = false;
            this.maskMC._visible = _loc0_;
            this.barMC.mc.baralphaMC._visible = true;
            this.barMC._height = 10;
            this.barMC.setMask(null);
            this.darkbarMC._visible = false;
            this.bgMC._height = 46;
      }
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this.data[0]);
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[1]);
      this.itemTextRight._x = 280 - this.itemTextRight.textWidth;
      var _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      if(this.data[2] != undefined)
      {
         _loc5_ = this.data[2];
      }
      var _loc4_ = 100;
      if(this.data[3] != undefined)
      {
         _loc4_ = Math.max(0,Math.min(this.data[3],100));
      }
      var _loc3_ = 0;
      if(this.data[4] != undefined)
      {
         _loc3_ = Math.max(0,Math.min(this.data[4],100));
      }
      var _loc6_;
      if(this.barMC != undefined)
      {
         this.barMC.init(_loc5_,278);
         _loc6_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(_loc4_,54,2,5);
         this.barMC.percent(_loc6_,false);
      }
      var _loc7_;
      if(this.darkbarMC != undefined)
      {
         this.darkbarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,278);
         this.darkbarMC._alpha = 70;
         _loc7_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(_loc3_,54,2,5);
         this.darkbarMC.percent(_loc7_,false);
      }
      this.highlighted = this._highlighted;
   }
   function mOver()
   {
      if(this.isSelectable == 1)
      {
         _level0.TIMELINE.M_OVER_EVENT(this.index,this.columnID,this);
      }
   }
   function mOut()
   {
      if(this.isSelectable == 1)
      {
         _level0.TIMELINE.M_OUT_EVENT(this.index,this.columnID);
      }
   }
   function mPress()
   {
      if(this.isSelectable == 1)
      {
         if(!this.highlighted)
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,false);
         }
         else
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,true);
         }
      }
   }
   function set highlighted(_h)
   {
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = 100;
      if(this.isSelectable == 0)
      {
         _loc3_ = !_h ? 30 : 60;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc3_);
      this._highlighted = _h;
   }
}
