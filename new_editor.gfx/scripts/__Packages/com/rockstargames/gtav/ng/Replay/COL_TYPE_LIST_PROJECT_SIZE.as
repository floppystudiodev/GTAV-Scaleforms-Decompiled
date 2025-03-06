class com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE extends MovieClip
{
   var _textUtil;
   var _hudColourGreen;
   var _hudColourOrange;
   var _hudColourRed;
   var bgMC;
   var helpTop;
   var barBg;
   var barMc;
   var _data;
   var titleTF;
   var _blipLayer;
   static var ALPHA_BG = 30;
   static var ALPHA_BAR = 100;
   function COL_TYPE_LIST_PROJECT_SIZE()
   {
      super();
      this._textUtil = new com.rockstargames.ui.utils.Text();
      this.clearBlipLayer();
   }
   function initColors(receivedColours)
   {
      this._hudColourGreen = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourGreen.r = receivedColours[2][0];
      this._hudColourGreen.g = receivedColours[2][1];
      this._hudColourGreen.b = receivedColours[2][2];
      this._hudColourOrange = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourOrange.r = receivedColours[3][0];
      this._hudColourOrange.g = receivedColours[3][1];
      this._hudColourOrange.b = receivedColours[3][2];
      this._hudColourRed = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourRed.r = receivedColours[4][0];
      this._hudColourRed.g = receivedColours[4][1];
      this._hudColourRed.b = receivedColours[4][2];
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
      com.rockstargames.ui.utils.Colour.Colourise(this.helpTop,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
      com.rockstargames.ui.utils.Colour.Colourise(this.barBg,this._hudColourGreen.r,this._hudColourGreen.g,this._hudColourGreen.b,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE.ALPHA_BG);
      com.rockstargames.ui.utils.Colour.Colourise(this.barMc,this._hudColourGreen.r,this._hudColourGreen.g,this._hudColourGreen.b,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE.ALPHA_BAR);
   }
   function set data(value)
   {
      this._data = value;
      this.clearBlipLayer();
      this.titleTF.autoSize = true;
      this.titleTF.wordWrap = true;
      this._textUtil.setTextWithIcons(this._data,this._blipLayer,this.titleTF,0,14.4,2.65,false);
      this.bgMC._height = this.titleTF.textHeight + 12;
   }
   function setBar(value)
   {
      if(value < 0)
      {
         value = 0;
      }
      if(value > 100)
      {
         value = 100;
      }
      var _loc2_ = undefined;
      if(value < 51)
      {
         _loc2_ = this._hudColourGreen;
      }
      else if(value < 76)
      {
         _loc2_ = this._hudColourOrange;
      }
      else
      {
         _loc2_ = this._hudColourRed;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.barBg,_loc2_.r,_loc2_.g,_loc2_.b,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE.ALPHA_BG);
      com.rockstargames.ui.utils.Colour.Colourise(this.barMc,_loc2_.r,_loc2_.g,_loc2_.b,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE.ALPHA_BAR);
      this.barMc.gotoAndStop(value + 1);
   }
   function setHelpTopVisibility(isVisible)
   {
      this.helpTop._visible = isVisible;
   }
   function clearBlipLayer()
   {
      if(this._blipLayer != undefined)
      {
         this._blipLayer.removeMovieClip();
      }
      this._blipLayer = this.createEmptyMovieClip("blipLayer",1000);
   }
}
