class com.rockstargames.gtav.levelDesign.FEED_VERSUS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var baseClassStrID;
   var img1MC;
   var img2MC;
   var returnPathLvl;
   function FEED_VERSUS()
   {
      super();
   }
   function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, bgColor)
   {
      super.INITIALISE(bgR,bgG,bgB,_flashAlpha,_flashRate,_bIsWideScreen,_bIsAsianLanguage,bgColor);
      this.CONTENT.val1TF.textAutoSize = "shrink";
      this.CONTENT.vsTF.textAutoSize = "shrink";
      this.CONTENT.val2TF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.val1TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ENEMY);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vsTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.val2TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRIENDLY);
   }
   function SET_FEED_COMPONENT(ch1TXD, ch1TXN, val1, ch2TXD, ch2TXN, val2, vsStr, color1, color2)
   {
      if(!this.img1MC)
      {
         this.img1MC = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","chImg1",this.CONTENT.getNextHighestDepth()));
      }
      this.loadImg(ch1TXD,ch1TXN,this.img1MC);
      this.CONTENT.val1TF.text = val1;
      this.CONTENT.vsTF.text = vsStr;
      this.CONTENT.val2TF.text = val2;
      if(!this.img2MC)
      {
         this.img2MC = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","chImg2",this.CONTENT.getNextHighestDepth(),{_x:143}));
      }
      this.loadImg(ch2TXD,ch2TXN,this.img2MC);
      if(color1 != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.val1TF,color1);
      }
      if(color1 != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.val2TF,color2);
      }
   }
   function loadImg(sTXD, sTXN, imgMC)
   {
      imgMC.init(this.baseClassStrID,sTXD,sTXN,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
      imgMC.addTxdRefWithPath(String(imgMC),this.returnPathLvl);
   }
}
