class com.rockstargames.gtav.web.Dynasty8realestateImgLoader extends MovieClip
{
   var dlcText;
   var onUnload;
   var txd = undefined;
   var txn = undefined;
   var loadedStatus = "";
   var photoMC = undefined;
   function Dynasty8realestateImgLoader()
   {
      super();
      this.onUnload = function()
      {
         this.removeImage();
      };
   }
   function updateImage(_txd)
   {
      if(_txd != undefined && _txd != "default")
      {
         if(this.photoMC == undefined)
         {
            this.txd = _txd;
            this.txn = _txd;
            this.photoMC = this.attachMovie("GenericImageLoader","photoMC",this.getNextHighestDepth(),{_alpha:0,_y:0,_visible:false});
            this.loadedStatus = "pending";
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.txd,this._name,true);
         }
      }
   }
   function showImage()
   {
      var _loc2_;
      if(this.photoMC.propertyTF != undefined)
      {
         this.loadedStatus = "displayed";
         this.photoMC.propertyTF.htmlText = "<img src=\'img://" + this.txd + "/" + this.txn + "\' vspace=\'0\' hspace=\'0\' width=\'256\' height=\'128\'/>";
         this.photoMC._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.photoMC,0.2,{_alpha:100,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.photoMC]});
         if(this.dlcText != undefined && this.dlcText != "")
         {
            _loc2_ = this.photoMC.attachMovie("propertyDLC","propertyDLC",this.photoMC.getNextHighestDepth(),{_x:0,_y:0});
            _loc2_.dlcTF.htmlText = this.dlcText;
            _loc2_.UPDATED_BANNER._alpha = 70;
         }
      }
   }
   function removeImage()
   {
      if(this.photoMC != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.photoMC);
         this.photoMC.propertyTF.text = "";
         this.photoMC.removeMovieClip();
         this.photoMC = undefined;
         if(this.txd != undefined)
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.txd);
            this.txd = undefined;
         }
      }
      this.loadedStatus = "";
   }
}
