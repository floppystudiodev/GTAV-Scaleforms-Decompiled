class com.rockstargames.gtav.levelDesign.FEED_MESSAGE_TEXT extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var baseClassStrID;
   var contactImage;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   var important;
   var parseForFonts;
   var parseForGamerTagTitleFonts;
   var returnPath1;
   var returnPathLvl;
   function FEED_MESSAGE_TEXT()
   {
      super();
   }
   function SET_FEED_COMPONENT(bodyStr, txd, txn, isImportant, iconEnum, nameStr, subtitleStr, crewPackedStr, icon2Enum, bTrimBody, iTextColor)
   {
      this.important = isImportant;
      if(iconEnum == undefined)
      {
         iconEnum = 0;
      }
      this.CONTENT.iconMC.gotoAndStop(iconEnum + 1);
      this.CONTENT.nameTF._width = iconEnum != 0 ? 120 : 138;
      if(icon2Enum == undefined)
      {
         icon2Enum = 0;
      }
      if(icon2Enum != 0)
      {
         this.CONTENT.iconMC._y = 3;
      }
      this.CONTENT.icon2MC.gotoAndStop(icon2Enum + 1);
      var _loc3_;
      if(nameStr != undefined)
      {
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(iTextColor,_loc3_);
         this.CONTENT.nameTF.textAutoSize = "shrink";
         this.CONTENT.subtitleTF.textAutoSize = "shrink";
         this.CONTENT.nameTF.htmlText = this.parseForGamerTagTitleFonts(this.CONTENT.nameTF,nameStr,13);
         this.CONTENT.nameTF.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
         if(subtitleStr != undefined && subtitleStr != "" && typeof subtitleStr == "string")
         {
            this.CONTENT.subtitleTF.htmlText = this.parseForGamerTagTitleFonts(this.CONTENT.subtitleTF,subtitleStr,12);
         }
         else
         {
            this.CONTENT.nameTF._y = 8;
         }
         if(crewPackedStr && crewPackedStr != "")
         {
            if(!this.CONTENT.crewTagMC)
            {
               this.CONTENT.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.CONTENT.getNextHighestDepth(),{_y:this.CONTENT.nameTF._y + 4,_xscale:55,_yscale:55});
            }
            this.CONTENT.nameTF._width -= 35;
            this.CONTENT.crewTagMC._x = this.CONTENT.nameTF._x + this.CONTENT.nameTF.textWidth + 7;
            this.CONTENT.crewTagMC.UNPACK_CREW_TAG(crewPackedStr);
         }
      }
      this.CONTENT.bodyTF.autoSize = "left";
      if(bTrimBody)
      {
         this.CONTENT.bodyTF.htmlText = com.rockstargames.gtav.utils.GTAVUIUtils.trimTextToFitNumLines(this.parseForFonts(bodyStr),this.CONTENT.bodyTF,6,true);
      }
      else
      {
         this.CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
      }
      this.CONTENT.bodyTF.multiline = true;
      this.CONTENT.bodyTF.wordWrap = true;
      var _loc2_;
      if(bodyStr != undefined && bodyStr != "")
      {
         _loc2_ = this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height + 4;
      }
      else
      {
         _loc2_ = this.CONTENT.nameTF._y + this.CONTENT.nameTF._height + 4;
      }
      if(_loc2_ > com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE)
      {
         this.CONTENT.Background._height = _loc2_;
         this.CONTENT.BackgroundHighlight._height = _loc2_;
      }
      if(this.contactImage == undefined)
      {
         this.contactImage = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.attachMovie("imageLoader","iMC",this.CONTENT.getNextHighestDepth()));
      }
      this.contactImage.init(this.baseClassStrID,txd,txn,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE,com.rockstargames.gtav.levelDesign.BaseGameStreamComponent.IMG_SIZE);
      var _loc4_ = String(this.contactImage).split(".");
      this.returnPath1 = _loc4_.slice(_loc4_.length - this.returnPathLvl).join(".");
      if(txd.substr(0,5) == "CHAR_" || txd.substr(0,5) == "HC_N_")
      {
         this.contactImage.requestTxdRef(this.returnPath1,true,this.imgLoadedCallback,this.imgLoadedCallbackScope);
      }
      else
      {
         this.contactImage.addTxdRef(this.returnPath1,this.imgLoadedCallback,this.imgLoadedCallbackScope);
      }
   }
   function hasPendingImage()
   {
      return !this.contactImage.isLoaded;
   }
   function flashOn()
   {
      super.altFlashOn();
   }
   function flashOff()
   {
      super.altFlashOff();
   }
   function CLEAR_TXD()
   {
      if(this.contactImage.isLoaded)
      {
         this.contactImage.removeTxdRef();
      }
   }
   function getContentLength()
   {
      return this.CONTENT.bodyTF.text.length;
   }
}
