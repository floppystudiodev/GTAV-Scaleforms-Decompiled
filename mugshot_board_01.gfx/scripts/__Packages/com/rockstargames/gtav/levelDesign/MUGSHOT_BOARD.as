class com.rockstargames.gtav.levelDesign.MUGSHOT_BOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var footerTF;
   var headerTF;
   var importedBGMC;
   var importedTF;
   var numTF;
   var rankMC;
   var importedWidth = 388;
   var importedMargin = 5;
   var stageWidth = 1280;
   function MUGSHOT_BOARD()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.headerTF = this.CONTENT.headerTF;
      this.numTF = this.CONTENT.numTF;
      this.footerTF = this.CONTENT.footerTF;
      this.importedTF = this.CONTENT.importedTF;
      this.importedBGMC = this.CONTENT.importedBGMC;
      this.rankMC = this.CONTENT.rankMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.importedBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      this.importedWidth = this.importedBGMC._width - 2 * this.importedMargin;
      this.importedBGMC._visible = false;
      this.rankMC._visible = false;
   }
   function SET_BOARD(headerStr, numStr, footerStr, importedStr, importCol, rankNum, rankCol)
   {
      this.headerTF.text = headerStr;
      this.headerTF.textAutoSize = "shrink";
      this.numTF.text = numStr;
      this.numTF.textAutoSize = "shrink";
      this.footerTF.text = footerStr;
      this.footerTF.textAutoSize = "shrink";
      var _loc2_ = importedStr != "";
      if(_loc2_)
      {
         this.importedTF.text = importedStr.toUpperCase();
         this.importedTF.textAutoSize = "shrink";
      }
      if(rankCol == undefined)
      {
         rankCol = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      var _loc4_;
      if(rankNum != undefined)
      {
         this.rankMC.rankTF.text = rankNum;
         this.rankMC.rankTF.textAutoSize = "shrink";
         _loc4_ = com.rockstargames.ui.utils.HudColour.getGlobeColID(rankNum);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rankMC.bgMC,_loc4_);
         this.rankMC._visible = true;
      }
      else
      {
         this.rankMC._visible = false;
      }
      var _loc3_ = 8;
      this.importedTF._x = this.stageWidth / 2 - this.numTF.textWidth / 2 - this.importedTF.textWidth - _loc3_;
      if(_loc2_)
      {
         this.importedBGMC._x = this.importedTF._x - this.importedMargin + 2;
         this.importedBGMC._width = this.importedTF.textWidth + 2 * this.importedMargin;
         this.importedBGMC._visible = true;
      }
      else
      {
         this.importedBGMC._visible = false;
      }
      if(importCol != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.importedBGMC,importCol);
      }
   }
}
