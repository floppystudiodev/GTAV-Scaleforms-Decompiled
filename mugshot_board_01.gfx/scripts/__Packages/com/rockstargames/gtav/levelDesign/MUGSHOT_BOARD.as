class com.rockstargames.gtav.levelDesign.MUGSHOT_BOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var headerTF;
   var CONTENT;
   var numTF;
   var footerTF;
   var importedTF;
   var importedBGMC;
   var rankMC;
   var importedWidth = 388;
   var importedMargin = 15;
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
      else
      {
         this.importedTF.text = "";
      }
      if(rankCol == undefined)
      {
         rankCol = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      if(rankNum != undefined)
      {
         this.rankMC.rankTF.text = rankNum;
         this.rankMC.rankTF.textAutoSize = "shrink";
         var _loc3_ = com.rockstargames.ui.utils.HudColour.getGlobeColID(rankNum);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rankMC.bgMC,_loc3_);
         this.rankMC._visible = true;
      }
      else
      {
         this.rankMC._visible = false;
      }
      var _loc6_ = 8;
      if(_loc2_)
      {
         this.importedBGMC._width = this.importedTF.textWidth + 2 * this.importedMargin;
         this.importedBGMC._x = 640 - this.importedTF.textWidth / 2 - this.importedMargin;
         this.importedBGMC._visible = false;
      }
      else
      {
         this.importedBGMC._visible = false;
      }
   }
}
