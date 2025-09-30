class com.rockstargames.gtav.ng.Replay.TIMECODE_MC extends MovieClip
{
   var TIMECODE;
   var TIMECODE_BG;
   var animatedTimecodeLine;
   var hudColourBlack;
   var trimmingArrows;
   var BLACK_ALPHA = 70;
   function TIMECODE_MC()
   {
      super();
      this._visible = false;
      this.hudColourBlack = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.hudColourBlack);
      com.rockstargames.ui.utils.Colour.Colourise(this.TIMECODE_BG,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
   }
   function SET_TIMECODE(str)
   {
      if(str != "")
      {
         this._visible = true;
         this.TIMECODE.autoSize = true;
         this.TIMECODE.htmlText = str;
         this.TIMECODE_BG._width = this.TIMECODE.textWidth + 16;
      }
   }
   function SET_RADIO_TRIMMING_LINE_VISIBILITY(isLineVisible, isIconVisible)
   {
      var _loc2_ = this.TIMECODE_BG.LINE;
      if(isLineVisible)
      {
         this.gotoAndStop(2);
         this.animatedTimecodeLine.animatedTimecodeLine.play();
         this.trimmingArrows._visible = isIconVisible;
      }
      else
      {
         this.trimmingArrows._visible = false;
         this.animatedTimecodeLine.animatedTimecodeLine.gotoAndStop(1);
         this.gotoAndStop(1);
      }
   }
}
