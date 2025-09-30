class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardPreviewItem extends MovieClip
{
   var defaultImageMC;
   var imgLdr;
   var picMC;
   var thisScope;
   var txd;
   var txdDummy2;
   var txdListener;
   var txdLoader;
   var txn;
   var returnpath = "HEIST_MP";
   var prevTxd = "nothing";
   var prevTxn = "nothing";
   var isLoaded = false;
   var iW = 200;
   var iH = 100;
   var iX = 0;
   var iY = 0;
   function MPHeistBoardPreviewItem()
   {
      super();
   }
   function updateImage(_txd, _texture)
   {
      this.txd = _txd;
      this.txn = _texture;
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(this.txd != undefined && this.txd != "" && this.txd != null)
      {
         if(this.picMC.ldr == undefined)
         {
            this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.picMC.attachMovie("GenericImageLoader","ldr",1));
         }
         if(this.prevTxd != this.txd)
         {
            this.prevTxd = this.txd;
            if(this.txdDummy2 != undefined)
            {
               this.txdDummy2.removeMovieClip();
            }
            this.isLoaded = false;
            this.imgLdr.init(this.returnpath,this.txd,this.txn,this.iW,this.iH,this.iX,this.iY);
            _loc3_ = 5;
            _loc2_ = String(this.imgLdr).split(".");
            _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
            this.imgLdr.requestTxdRef(_loc4_,true,this.showImage,this);
         }
         else if(this.isLoaded == true)
         {
            this.displayTexture();
         }
      }
      else
      {
         this.removeImage();
         this.prevTxn = "nothing";
         this.prevTxd = "nothing";
      }
   }
   function displayTexture()
   {
      this.txdLoader = new MovieClipLoader();
      if(this.txdListener == undefined || this.txdListener == null)
      {
         this.txdListener = new Object();
      }
      this.txdListener.thisScope = this;
      this.txdListener.onLoadInit = function(target_mc)
      {
         this.thisScope.onLoadInit();
      };
      this.txdListener.onLoadError = function(target_mc)
      {
         this.thisScope.onLoadError();
      };
      this.txdLoader.addListener(this.txdListener);
      this.defaultImageMC._visible = false;
      if(this.picMC.txdDummy2 == undefined)
      {
         this.txdDummy2 = this.picMC.createEmptyMovieClip("txdDummy2",2,{_x:this.iX,_y:this.iY});
      }
      var _loc2_ = "img://" + this.txd + "/" + this.txn;
      this.txdLoader.loadClip(_loc2_,this.txdDummy2);
   }
   function onLoadInit(targetMC)
   {
      this.txdDummy2._width = this.iW;
      this.txdDummy2._height = this.iH;
      this.txdLoader.removeListener(this.txdListener);
      this.txdListener = null;
      this.imgLdr.clearTxd();
   }
   function onLoadError(targetMC)
   {
      this.isLoaded = true;
      this.txdLoader.removeListener(this.txdListener);
      this.txdLoader = null;
      this.txdListener = null;
      this.defaultImageMC._visible = true;
   }
   function showImage()
   {
      this.isLoaded = true;
      this.imgLdr._alpha = 100;
   }
   function removeImage()
   {
      this.txdLoader.removeListener(this.txdListener);
      this.txdLoader = null;
      this.txdListener = null;
      this.txdDummy2.removeMovieClip();
      this.imgLdr.removeTxdRef();
      this.imgLdr.removeMovieClip();
      this.imgLdr = undefined;
   }
}
