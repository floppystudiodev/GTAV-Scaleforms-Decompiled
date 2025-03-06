class com.rockstargames.gtav.levelDesign.FEED_CREW_RANKUP extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var emblemImg;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   function FEED_CREW_RANKUP()
   {
      super();
   }
   function SET_FEED_COMPONENT(chTitle, chSubitle, chTXD, chTXN, bIsImportant)
   {
      this.CONTENT.titleTF.text = chTitle;
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.subtitleTF.text = chSubitle;
      this.CONTENT.subtitleTF.textAutoSize = "shrink";
      if(this.emblemImg == undefined)
      {
         this.emblemImg = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","iMC",this.CONTENT.getNextHighestDepth()));
      }
      this.emblemImg.init(this.baseClassStrID,chTXD,chTXN,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
      this.emblemImg.addTxdRefWithPath(String(this.emblemImg),2,this.imgLoadedCallback,this.imgLoadedCallbackScope);
      this.CONTENT.Background._height = Math.max(com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,this.CONTENT.subtitleTF._y + this.CONTENT.subtitleTF.textHeight + 4);
   }
   function hasPendingImage()
   {
      return !this.emblemImg.isLoaded;
   }
}
