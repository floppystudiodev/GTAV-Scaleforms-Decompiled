class com.rockstargames.gtav.levelDesign.FEED_UNLOCK extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   function FEED_UNLOCK()
   {
      super();
   }
   function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, bgColor)
   {
      super.INITIALISE(bgR,bgG,bgB,_flashAlpha,_flashRate,_bIsWideScreen,_bIsAsianLanguage,bgColor);
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.bodyTF.textAutoSize = "shrink";
   }
   function SET_FEED_COMPONENT(chTitle, chSubtitle, iIconType, bIsImportant, eTitleColour)
   {
      this.important = bIsImportant;
      if(eTitleColour)
      {
         var _loc2_ = this.CONTENT.titleTF.getTextFormat();
         _loc2_.font = com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT;
         _loc2_.size = 19;
         this.CONTENT.titleTF.setNewTextFormat(_loc2_);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleTF,eTitleColour);
         this.flashDuration = 0.6;
      }
      this.CONTENT.titleTF.text = chTitle;
      this.CONTENT.bodyTF.htmlText = chSubtitle;
      this.CONTENT.iconMC.gotoAndStop(iIconType + 1);
      this.CONTENT.Background._height = this.CONTENT.BackgroundHighlight._height = Math.max(com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,this.CONTENT.bodyTF._y + this.CONTENT.bodyTF.textHeight + 8);
   }
   function flashOn()
   {
      super.altFlashOn();
   }
   function flashOff()
   {
      super.altFlashOff();
   }
}
