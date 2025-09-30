class com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoardItem extends MovieClip
{
   var imgLdr;
   var picMC;
   var placeholder;
   var prevTxn = "nothing";
   function MPPlanningBoardItem()
   {
      super();
   }
   function updateImage(_txd, _texture)
   {
      var _loc2_ = _txd;
      if(typeof _loc2_ != "string")
      {
         _loc2_;
      }
      var _loc3_ = _texture;
      var _loc13_ = 150;
      var _loc14_ = 84;
      var _loc12_ = 0;
      var _loc10_ = 0;
      var _loc9_ = false;
      var _loc5_;
      var _loc7_ = _loc3_.substr(0,8);
      if(_loc7_ == "MPHEIST_")
      {
         _loc5_ = 1;
      }
      else
      {
         _loc5_ = 0;
         _loc2_ = _loc3_;
      }
      var _loc11_;
      var _loc8_;
      var _loc4_;
      var _loc6_;
      if(_loc2_ != undefined && _loc2_ != "" && _loc2_ != null)
      {
         if(this.prevTxn != _loc3_)
         {
            this.prevTxn = _loc3_;
            if(this.imgLdr == undefined)
            {
               this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.picMC.attachMovie("GenericImageLoader","imgLdr",this.picMC.getNextHighestDepth()));
            }
            else if(this.imgLdr.textureDict != _loc2_)
            {
               this.imgLdr.removeTxdRef();
               this.imgLdr.removeMovieClip();
               this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.picMC.attachMovie("GenericImageLoader","imgLdr",this.picMC.getNextHighestDepth()));
            }
            this.imgLdr._alpha = 0;
            _loc11_ = "HEIST_MP";
            this.imgLdr.init(_loc11_,_loc2_,_loc3_,_loc13_,_loc14_,_loc12_,_loc10_);
            _loc8_ = 5;
            _loc4_ = String(this.imgLdr).split(".");
            _loc6_ = _loc4_.slice(_loc4_.length - _loc8_).join(".");
            if(_loc5_ == 0)
            {
               this.imgLdr.addTxdRef(_loc6_,this.showImage,this);
            }
            else
            {
               this.imgLdr.requestTxdRef(_loc6_,_loc9_,this.showImage,this);
            }
         }
      }
      else
      {
         this.removeImage();
         this.prevTxn = "nothing";
      }
   }
   function showImage()
   {
      this.imgLdr._alpha = 100;
      this.placeholder._alpha = 0;
   }
   function removeImage()
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
