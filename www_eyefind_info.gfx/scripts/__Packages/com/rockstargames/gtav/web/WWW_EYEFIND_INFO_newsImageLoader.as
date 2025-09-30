class com.rockstargames.gtav.web.WWW_EYEFIND_INFO_newsImageLoader extends MovieClip
{
   var newsThumbnailTF;
   var txd;
   function WWW_EYEFIND_INFO_newsImageLoader()
   {
      super();
      this.txd = undefined;
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
      this.newsThumbnailTF.htmlText = "";
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
         this.newsThumbnailTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'256\' height=\'128\'/>";
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this,0.15,{_alpha:100,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this]});
      }
      else
      {
         this.txd = undefined;
      }
   }
}
