class com.rockstargames.gtav.levelDesign.FEED_TICKER extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var iconLayerMC;
   var CONTENT;
   static var ICON_FLASH_DURATION = 1;
   function FEED_TICKER()
   {
      super();
   }
   function SET_FEED_COMPONENT(sBody, bIsImportant, bHasTokens, numIconFlashes)
   {
      this.important = bIsImportant;
      if(bHasTokens)
      {
         if(this.iconLayerMC)
         {
            this.iconLayerMC.removeMovieClip();
         }
         this.iconLayerMC = this.CONTENT.createEmptyMovieClip("iconLayerMC",1000);
         var _loc2_ = new com.rockstargames.ui.utils.Text();
         _loc2_.setTextWithIcons(sBody,this.iconLayerMC,this.CONTENT.bodyTF,0,12,1,false);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this,com.rockstargames.gtav.levelDesign.FEED_TICKER.ICON_FLASH_DURATION / 2,{onComplete:this.toggleIconVisibility,onCompleteScope:this,onCompleteArgs:[numIconFlashes]});
      }
      else
      {
         this.CONTENT.bodyTF.htmlText = this.parseForFonts(sBody);
      }
      this.CONTENT.bodyTF.autoSize = true;
      this.CONTENT.Background._height = this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height + 5;
      this.CONTENT.BackgroundFlash._height = this.CONTENT.Background._height;
   }
   function toggleIconVisibility(numFlashesLeft)
   {
      if(numFlashesLeft > 0)
      {
         this.iconLayerMC._visible = !this.iconLayerMC._visible;
         if(this.iconLayerMC._visible)
         {
            numFlashesLeft = numFlashesLeft - 1;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this,com.rockstargames.gtav.levelDesign.FEED_TICKER.ICON_FLASH_DURATION / 2,{onComplete:this.toggleIconVisibility,onCompleteScope:this,onCompleteArgs:[numFlashesLeft]});
      }
   }
}
