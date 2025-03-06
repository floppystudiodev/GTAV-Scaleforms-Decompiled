class com.rockstargames.gtav.levelDesign.FEED_CREW_TAG extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var crewTagMC;
   var emblemImg;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   function FEED_CREW_TAG()
   {
      super();
   }
   function SET_FEED_COMPONENT(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, rank, hasFounderStatus, bodyStr, isImportant, txd, imgStr, gamerStr, crewPackedStr)
   {
      if(this.CONTENT.crewTagMC == undefined)
      {
         this.crewTagMC = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(this.CONTENT.attachMovie("CREW_TAG_MOVIECLIP","CREW_TAG",this.CONTENT.getNextHighestDepth(),{_x:43,_y:7,_xscale:105,_yscale:105}));
      }
      this.important = isImportant;
      if(txd != undefined && txd != "" && imgStr != undefined && imgStr != "")
      {
         if(this.emblemImg == undefined)
         {
            this.emblemImg = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","iMC",this.CONTENT.getNextHighestDepth()));
         }
         this.emblemImg.init(this.baseClassStrID,txd,imgStr,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
         this.emblemImg.addTxdRefWithPath(String(this.emblemImg),this.returnPathLvl,this.imgLoadedCallback,this.imgLoadedCallbackScope);
      }
      else
      {
         this.CONTENT.imageMC.imageTF._visible = false;
         this.crewTagMC._x = 11;
      }
      var _loc3_ = undefined;
      if(gamerStr == undefined || gamerStr == "")
      {
         gamerStr = "";
         _loc3_ = bodyStr;
      }
      else
      {
         _loc3_ = gamerStr + "<BR>" + bodyStr;
      }
      this.CONTENT.bodyTF.htmlText = this.parseForFonts(_loc3_);
      this.CONTENT.bodyTF.autoSize = "left";
      this.CONTENT.bodyTF.multiline = true;
      this.CONTENT.bodyTF.wordWrap = true;
      var _loc4_ = 0;
      if(rank > 5)
      {
         rank = 5;
      }
      if(rank > 0)
      {
         rank = rank + 1;
      }
      if(hasFounderStatus == true)
      {
         rank = 1;
      }
      _loc4_ = rank;
      if(crewPackedStr != undefined && crewPackedStr != "")
      {
         this.crewTagMC.UNPACK_CREW_TAG(crewPackedStr);
      }
      else
      {
         this.crewTagMC.SET_CREW_TAG(crewTypeIsPrivate,crewTagContainsRockstar,crewTag,_loc4_);
      }
      var _loc6_ = Math.max(com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height + 4);
      this.CONTENT.Background._height = _loc6_;
      this.CONTENT.BackgroundFlash._height = _loc6_;
   }
   function hasPendingImage()
   {
      return !this.emblemImg.isLoaded;
   }
   function CLEAR_TXD()
   {
      if(this.emblemImg.isLoaded)
      {
         this.emblemImg.removeTxdRef();
      }
   }
}
