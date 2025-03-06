class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var itemTextRight;
   var valueMC;
   var leftTabMC;
   var labelMC;
   var textBGMC;
   var statIconMC;
   var isOption;
   var hasIconText;
   var hasRightTextBG;
   var itemTextLeft;
   var topBorderMC;
   var gamemodeMC;
   var bgMC;
   var dummybgMC;
   static var CYCLE_OPTION_ITEM = 0;
   static var COLOUR_ALL_ITEM = 2;
   static var PROGRESS_ITEM = 3;
   static var ARROW_PADDING = 4;
   static var RIGHT_TXT_BG_PADDING = 3;
   static var RIGHT_TXT_OFFSET = 6;
   var IS_SELECTABLE_GAP = 2;
   var IS_SELECTABLE_NOGAP = -2;
   var modeIcon = 0;
   function PauseMenuFreemodeItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemTextRight = this.valueMC.valueTF;
      this.leftTabMC._visible = false;
      this.labelMC.rMC._visible = false;
      this.labelMC.lMC._visible = false;
      this.textBGMC._visible = false;
      this.statIconMC._visible = false;
      this.labelMC.barMC._visible = false;
      this.isOption = false;
      this.hasIconText = false;
      this.hasRightTextBG = false;
      this.highlighted = false;
   }
   function setTitle()
   {
      this.itemTextLeft.textAutoSize = "none";
      this.itemTextLeft.autoSize = "left";
      this.itemTextLeft.multiline = false;
      this.itemTextLeft.wordWrap = false;
      this.itemTextLeft._x = 144 - this.itemTextLeft._width / 2;
   }
   function set data(_d)
   {
      super.data = _d;
      this.itemTextLeft.textAutoSize = "shrink";
      this.itemTextLeft.autoSize = false;
      this.itemTextLeft.multiline = false;
      this.itemTextLeft.wordWrap = false;
      this.itemTextLeft.text = this.data[0];
      this.topBorderMC._visible = false;
      var _loc7_ = this.data[1];
      this.modeIcon = this.data[2];
      var _loc6_ = _loc7_ + 1;
      this.labelMC.verifiedMC.gotoAndStop(_loc6_);
      var _loc3_ = 1;
      if(this.modeIcon != undefined)
      {
         _loc3_ = this.modeIcon + 1;
      }
      this.gamemodeMC.gotoAndStop(_loc3_);
      if(this.modeIcon != 0 && this.data[3] != undefined)
      {
         if(typeof this.data[3] == "number")
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.gamemodeMC,this.data[3]);
         }
      }
      this.hasRightTextBG = this.initialIndex > 0;
      this.isOption = this.data[3] != undefined && this.data[3] != -1 && this.modeIcon == 0;
      if(this.isOption)
      {
         if(this.modeIcon != 0)
         {
            this.itemTextRight.htmlText = "";
         }
         else
         {
            var _loc4_ = this.data[3];
            this.itemTextLeft.wordWrap = false;
            this.itemTextLeft.multiline = false;
            this.itemTextRight.htmlText = _loc4_;
            this.itemTextRight.autoSize = "left";
            if(this.itemTextRight._width > 128)
            {
               this.itemTextRight.autoSize = false;
               this.itemTextRight._width = 128;
               this.itemTextRight.textAutoSize = "shrink";
               this.itemTextRight.htmlText = _loc4_;
            }
            this.itemTextRight._x = Math.round(this.bgMC._width - this.itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
         }
         if(this.hasRightTextBG)
         {
            this.textBGMC._width = this.itemTextRight._width + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING * 2;
            this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            this.textBGMC._visible = true;
         }
      }
      else
      {
         this.itemTextRight.htmlText = "";
      }
      if(_loc3_ > 1 && this.isOption)
      {
         this.hasIconText = true;
         this.itemTextRight._x = Math.round(250 - this.itemTextRight._width);
      }
      else
      {
         this.hasIconText = false;
      }
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PROGRESS_ITEM)
      {
         var _loc8_ = this.data[4];
         this.statIconMC.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc8_)[1]);
         this.statIconMC._visible = true;
         this.itemTextLeft._x = 35;
         if(!this.labelMC.barMC)
         {
            this.labelMC.attachMovie("GenericColourBar","barMC",this.getNextHighestDepth(),{_x:155,_y:10});
         }
         this.labelMC.barMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,120);
         this.labelMC.barMC.percentDecimal(this.data[5]);
      }
      else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftTabMC,this.data[4]);
      }
      if(this.data[7])
      {
         this.topBorderMC._visible = true;
      }
      var _loc5_ = this.isSelectable != 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP;
      if(_loc5_)
      {
         this.dummybgMC._visible = false;
      }
      else
      {
         this.dummybgMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.dummybgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
      this.highlighted = this._highlighted;
   }
   function set highlighted(_h)
   {
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc13_ = 100;
      var _loc9_ = 100;
      if(this.isSelectable < 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP || this.isSelectable == this.IS_SELECTABLE_GAP)
      {
         _loc9_ = !_h ? 30 : 60;
      }
      if(_h)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(this.data[4],_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc4_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc4_);
            if(this.hasRightTextBG)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,_loc2_);
            }
            else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.data[5])
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc2_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
            }
         }
         var _loc6_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc6_);
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.verifiedMC,_loc6_.r,_loc6_.g,_loc6_.b,_loc6_.a);
         if(this.isOption && this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM)
         {
            var _loc8_ = this.data[8];
            var _loc10_ = (!this.hasRightTextBG ? 0 : com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING) + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING;
            if(_loc8_ == 1)
            {
               this.itemTextRight._x = Math.round(this.labelMC.rMC._x - _loc10_ - this.itemTextRight._width);
               this.labelMC.rMC._visible = true;
               this.labelMC.lMC._visible = false;
            }
            else if(_loc8_ == -1)
            {
               this.itemTextRight._x = 286 - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING - this.itemTextRight._width;
               this.labelMC.rMC._visible = false;
               this.labelMC.lMC._visible = true;
            }
            else if(_loc8_ == undefined || _loc8_ == 0)
            {
               this.itemTextRight._x = Math.round(this.labelMC.rMC._x - _loc10_ - this.itemTextRight._width);
               this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
            }
            this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            this.labelMC.lMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING - (!this.hasRightTextBG ? 0 : com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING);
         }
         else
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
         }
         this.bgMC._visible = true;
      }
      else
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(this.data[4],_loc4_);
            com.rockstargames.ui.utils.Colour.setHudColour(this.data[4],_loc2_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
            if(this.hasRightTextBG)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,_loc2_);
            }
            else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.data[5])
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc2_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
            }
         }
         if(this.isOption && this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
            this.itemTextRight._x = Math.round(this.bgMC._width - this.itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
            this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
         }
         if(this.hasIconText)
         {
            this.itemTextRight._x = Math.round(262 - this.itemTextRight._width);
         }
         var _loc12_ = this.isSelectable != 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP;
         this.bgMC._visible = _loc12_;
      }
      if(this.modeIcon != 0 && this.data[3] == undefined)
      {
         var _loc5_ = new com.rockstargames.ui.utils.HudColour();
         if(_h)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc5_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc5_);
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.gamemodeMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      }
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(this.labelMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc9_);
         com.rockstargames.ui.utils.Colour.Colourise(this.valueMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc9_);
         if(this.hasRightTextBG)
         {
            var _loc7_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(this.initialIndex,_loc7_);
            com.rockstargames.ui.utils.Colour.Colourise(this.textBGMC,_loc7_.r,_loc7_.g,_loc7_.b,_loc7_.a);
         }
      }
      this._highlighted = _h;
   }
}
