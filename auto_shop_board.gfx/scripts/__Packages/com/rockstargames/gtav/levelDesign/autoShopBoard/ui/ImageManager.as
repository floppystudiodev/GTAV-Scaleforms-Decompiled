class com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager
{
   var gfxName;
   var txdRefs;
   var imageQueue;
   static var TXD_LOADING = 1;
   static var TXD_LOADED = 2;
   static var USE_REFERENCE_COUNTING = false;
   function ImageManager(gfxName)
   {
      this.gfxName = gfxName;
      this.txdRefs = [];
      this.imageQueue = [];
   }
   function addImage(txd, texture, imageMovieClip)
   {
      if(txd.length <= 0 || texture.length <= 0 || imageMovieClip == undefined)
      {
         return undefined;
      }
      imageMovieClip._visible = false;
      if(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager.USE_REFERENCE_COUNTING && this.txdRefs[txd] == com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager.TXD_LOADED)
      {
         this.displayImage(txd,texture,imageMovieClip);
      }
      else
      {
         if(this.txdRefs[txd] != com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager.TXD_LOADING)
         {
            this.txdRefs[txd] = com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager.TXD_LOADING;
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,txd,texture,true);
         }
         this.imageQueue.push({txd:txd,texture:texture,path:String(imageMovieClip)});
      }
   }
   function textureLoaded(txd)
   {
      this.txdRefs[txd] = com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager.TXD_LOADED;
      var _loc6_ = this.imageQueue.length - 1;
      while(_loc6_ >= 0)
      {
         var _loc7_ = this.imageQueue[_loc6_];
         if(_loc7_.txd == txd)
         {
            var _loc5_ = _loc7_.path.split(".");
            var _loc4_ = _root;
            var _loc3_ = 1;
            while(_loc3_ < _loc5_.length)
            {
               _loc4_ = _loc4_[_loc5_[_loc3_]];
               _loc3_ = _loc3_ + 1;
            }
            if(_loc4_)
            {
               this.displayImage(txd,_loc7_.texture,_loc4_);
            }
            this.imageQueue.splice(_loc6_,1);
         }
         _loc6_ = _loc6_ - 1;
      }
   }
   function clearImageQueue()
   {
      this.imageQueue.length = 0;
   }
   function displayImage(txd, texture, imageMovieClip)
   {
      var loader = new MovieClipLoader();
      var displayWidth = imageMovieClip._width;
      var displayHeight = imageMovieClip._height;
      var _loc3_ = {onLoadInit:function(imageMovieClip)
      {
         imageMovieClip._width = displayWidth;
         imageMovieClip._height = displayHeight;
         loader.removeListener(this);
         delete loader;
      }};
      loader.addListener(_loc3_);
      loader.loadClip("img://" + txd + "/" + texture,imageMovieClip);
   }
   function dispose()
   {
      for(var _loc2_ in this.txdRefs)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,_loc2_);
      }
   }
}
