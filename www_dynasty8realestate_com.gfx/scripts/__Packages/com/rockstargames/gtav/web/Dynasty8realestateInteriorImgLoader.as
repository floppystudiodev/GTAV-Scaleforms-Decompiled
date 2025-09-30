class com.rockstargames.gtav.web.Dynasty8realestateInteriorImgLoader extends com.rockstargames.gtav.web.Dynasty8realestateImgLoader
{
   var _name;
   var attachMovie;
   var getNextHighestDepth;
   var loadedStatus;
   var photoMC;
   var txd;
   var txn;
   function Dynasty8realestateInteriorImgLoader()
   {
      super();
   }
   function updateImage(_txd)
   {
      var _loc2_;
      if(_txd != undefined && _txd != "default")
      {
         if(this.photoMC == undefined)
         {
            if(_txd.indexOf("_DYN_MP_INT_") > 0)
            {
               _loc2_ = _txd.toUpperCase().split("_DYN_MP_INT_");
               this.txn = "DYN_MP_INT_" + _loc2_[1];
            }
            else
            {
               _loc2_ = _txd.toUpperCase().split("_DYN_MP_GAR_");
               this.txn = "DYN_MP_GAR_" + _loc2_[1];
            }
            this.txd = _loc2_[0];
            this.photoMC = this.attachMovie("InteriorImageLoader","photoMC",this.getNextHighestDepth(),{_alpha:0,_y:0,_visible:false});
            this.loadedStatus = "pending";
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.txd,this._name,true);
         }
      }
   }
   function showImage()
   {
      if(this.photoMC.propertyTF != undefined)
      {
         this.loadedStatus = "displayed";
         this.photoMC.propertyTF.htmlText = "<img src=\'img://" + this.txd + "/" + this.txn + "\' vspace=\'0\' hspace=\'0\' width=\'512\' height=\'512\'/>";
         this.photoMC._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.photoMC,0.2,{_alpha:100,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.photoMC]});
      }
   }
}
