class com.rockstargames.gtav.levelDesign.FEED_AWARD extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var imgMC;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   function FEED_AWARD()
   {
      super();
   }
   function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, bgColor)
   {
      super.INITIALISE(bgR,bgG,bgB,_flashAlpha,_flashRate,_bIsWideScreen,_bIsAsianLanguage,bgColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.rpIconMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
   }
   function SET_FEED_COMPONENT(awardName, txd, txn, xp, colourEnum, titleStr)
   {
      this.CONTENT.nameTF.textAutoSize = "shrink";
      this.CONTENT.nameTF.text = awardName.split("<br/>").join("");
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.titleTF.text = titleStr;
      if(xp == "0" || xp == 0)
      {
         this.CONTENT.xpTF._visible = false;
         this.CONTENT.rpIconMC._visible = false;
      }
      else
      {
         this.CONTENT.xpTF.text = xp;
      }
      if(this.imgMC == undefined)
      {
         this.imgMC = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","iMC",this.CONTENT.getNextHighestDepth()));
      }
      this.imgMC.init(this.baseClassStrID,txd,txn,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
      this.imgMC.addTxdRefWithPath(String(this.imgMC),this.returnPathLvl,this.imgLoadedCallback,this.imgLoadedCallbackScope);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.imgMC,colourEnum);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.nameTF,colourEnum);
   }
   function hasPendingImage()
   {
      return !this.imgMC.isLoaded;
   }
   function CLEAR_TXD()
   {
      if(this.imgMC.isLoaded)
      {
         this.imgMC.removeTxdRef();
      }
   }
}
