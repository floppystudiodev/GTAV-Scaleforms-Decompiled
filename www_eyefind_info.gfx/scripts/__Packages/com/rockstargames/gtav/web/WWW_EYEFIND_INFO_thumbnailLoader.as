class com.rockstargames.gtav.web.WWW_EYEFIND_INFO_thumbnailLoader extends com.rockstargames.gtav.web.buttons.WebButton
{
   var txd;
   var browser;
   var thumbnailTF;
   function WWW_EYEFIND_INFO_thumbnailLoader()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.WEB_BUTTON;
      this.txd = undefined;
   }
   function buttonEvent()
   {
      this.browser.GO_TO_WEBPAGE(this.browser._currentSelectedButton);
   }
   function DISPLAY_THUMBNAIL(textureDict, mcName)
   {
      if(textureDict != this.txd)
      {
         if(textureDict != "" && textureDict != undefined)
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",textureDict,mcName,true);
         }
      }
   }
   function REMOVE_THUMBNAIL()
   {
      this.thumbnailTF.htmlText = "";
      if(this.txd != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.txd);
         this.txd = undefined;
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success)
      {
         this.txd = textureDict;
         this._alpha = 0;
         this.thumbnailTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'160\' height=\'80\'/>";
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this,0.15,{_alpha:100,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this]});
      }
      else
      {
         this.txd = undefined;
      }
   }
}
