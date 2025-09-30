class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardplayerCardItem extends MovieClip
{
   var details;
   var imgLdr;
   var prevTxd = "";
   function MPHeistBoardplayerCardItem()
   {
      super();
   }
   function updatePedHead(_txd)
   {
      var _loc2_ = _txd;
      if(typeof _loc2_ != "string")
      {
         _loc2_;
      }
      var _loc6_ = _loc2_;
      var _loc8_;
      var _loc4_;
      var _loc9_;
      var _loc7_;
      var _loc3_;
      var _loc5_;
      if(_loc2_ != undefined && _loc2_ != "")
      {
         if(this.prevTxd != _loc2_)
         {
            this.prevTxd = _loc2_;
            if(this.imgLdr != undefined)
            {
               if(this.imgLdr.isLoaded && this.imgLdr.textureDict != _loc2_)
               {
                  this.imgLdr.removeTxdRef();
               }
               this.imgLdr.removeMovieClip();
            }
            this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.details.picMC.attachMovie("GenericImageLoader","imgLdr",this.details.picMC.getNextHighestDepth()));
            _loc8_ = true;
            _loc4_ = 0;
            if(_loc2_.substr(0,5) == "CHAR_")
            {
               _loc4_ = 1;
            }
            this.imgLdr._alpha = 0;
            _loc9_ = "HEIST_MP";
            this.imgLdr.init(_loc9_,_loc2_,_loc6_,63,64,0,0);
            _loc7_ = 6;
            _loc3_ = String(this.imgLdr).split(".");
            _loc5_ = _loc3_.slice(_loc3_.length - _loc7_).join(".");
            if(_loc4_ == 0)
            {
               this.imgLdr.addTxdRef(_loc5_,this.showPedHead,this);
            }
            else
            {
               this.imgLdr.requestTxdRef(_loc5_,_loc8_,this.showPedHead,this);
            }
         }
      }
      else
      {
         this.removePedHeadRef();
         this.prevTxd = "";
      }
   }
   function showPedHead()
   {
      this.imgLdr._alpha = 100;
   }
   function removePedHeadRef()
   {
      if(this.imgLdr != undefined)
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.removeTxdRef();
         }
         this.imgLdr.removeMovieClip();
      }
   }
}
