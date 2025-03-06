class com.rockstargames.gtav.levelDesign.FEED_STATS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var contactImage;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   var colourRed;
   var stepVal = 0;
   function FEED_STATS()
   {
      super();
   }
   function SET_FEED_COMPONENT(statTitleStr, statBodyStr, iconEnum, stepVal, barValue, isImportant, txd, txn)
   {
      this.important = isImportant;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc5_ = undefined;
      switch(txd)
      {
         case "CHAR_MICHAEL":
            _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL;
            break;
         case "CHAR_FRANKLIN":
            _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN;
            break;
         case "CHAR_TREVOR":
            _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR;
            break;
         default:
            _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(_loc5_,_loc3_);
      if(this.CONTENT.barMC.yellowMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.barMC.yellowMC,_loc3_.r,_loc3_.g,_loc3_.b,100);
      }
      if(this.CONTENT.barMC.fadeMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.barMC.fadeMC,_loc3_.r,_loc3_.g,_loc3_.b,50);
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.barMC.modifiedMC);
      if(txd != undefined)
      {
         if(this.contactImage == undefined)
         {
            this.contactImage = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","iMC",1000));
         }
         this.contactImage.init(this.baseClassStrID,txd,txn,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
         var _loc7_ = String(this.contactImage).split(".");
         this.returnPath1 = _loc7_.slice(_loc7_.length - this.returnPathLvl).join(".");
         if(txd.substr(0,5) == "CHAR_")
         {
            this.contactImage.requestTxdRef(this.returnPath1,true,this.imgLoadedCallback,this.imgLoadedCallbackScope);
         }
         else
         {
            this.contactImage.addTxdRef(this.returnPath1,this.imgLoadedCallback,this.imgLoadedCallbackScope);
         }
      }
      if(statBodyStr == undefined || statBodyStr == "" || statBodyStr == statTitleStr)
      {
         statBodyStr = "";
      }
      this.CONTENT.titleTF.autoSize = true;
      this.CONTENT.titleTF.htmlText = this.parseForFonts(statTitleStr);
      this.CONTENT.bodyTF.autoSize = true;
      this.CONTENT.bodyTF.htmlText = this.parseForFonts(statBodyStr);
      if(this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height > 39)
      {
         var _loc0_ = null;
         this.CONTENT.maskMC._y = _loc0_ = this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height;
         this.CONTENT.barMC._y = _loc0_;
      }
      var _loc9_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(barValue + stepVal,34.2,2,5);
      barValue = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(barValue,34.2,2,5);
      stepVal = _loc9_ - barValue;
      if(barValue > 100)
      {
         barValue = 100;
      }
      if(barValue + stepVal > 100)
      {
         stepVal = 100 - barValue;
      }
      if(stepVal > 0)
      {
         this.CONTENT.barMC.yellowMC._xscale = barValue;
         this.CONTENT.barMC.modifiedMC._xscale = barValue + stepVal;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.barMC.modifiedMC,255,255,255,100);
         this.CONTENT.barMC.modifiedMC._visible = true;
         this.flashGlowOff(this.CONTENT.barMC.modifiedMC,0.25);
      }
      else if(stepVal < 0)
      {
         this.CONTENT.barMC.yellowMC._xscale = barValue + stepVal;
         this.CONTENT.barMC.modifiedMC._xscale = barValue;
         this.colourRed = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,this.colourRed);
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.barMC.modifiedMC,this.colourRed.r,this.colourRed.g,this.colourRed.b,100);
         this.CONTENT.barMC.modifiedMC._visible = true;
         this.flashGlowOff(this.CONTENT.barMC.modifiedMC,0.25);
      }
      else
      {
         this.CONTENT.barMC.modifiedMC._visible = false;
         this.CONTENT.barMC.yellowMC._xscale = barValue;
      }
      this.CONTENT.Background._height = this.CONTENT.barMC._y + this.CONTENT.barMC._height;
      this.CONTENT.BackgroundFlash._height = this.CONTENT.Background._height;
   }
   function flashGlowOn(targetMC, blinkSpeed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(targetMC,blinkSpeed,{_alpha:100,delay:blinkSpeed / 2,onCompleteScope:this,onComplete:this.flashGlowOff,onCompleteArgs:[targetMC,blinkSpeed]});
   }
   function flashGlowOff(targetMC, blinkSpeed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(targetMC,blinkSpeed,{_alpha:0,delay:blinkSpeed / 2,onCompleteScope:this,onComplete:this.flashGlowOn,onCompleteArgs:[targetMC,blinkSpeed]});
   }
   function hasPendingImage()
   {
      return !this.contactImage.isLoaded;
   }
   function STREAM_COMP_READY()
   {
      super.STREAM_COMP_READY();
   }
   function CLEAR_TXD()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.barMC.modifiedMC);
      if(this.contactImage.isLoaded)
      {
         this.contactImage.removeTxdRef();
      }
   }
   function onCleanup()
   {
      super.onCleanup();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.barMC.modifiedMC);
   }
}
