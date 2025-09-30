class com.rockstargames.gtav.levelDesign.starterPackBrowser.ImageManager
{
   var imageQueue;
   var movieName;
   var txdRefs;
   static var USE_REFERENCE_COUNTING = false;
   function ImageManager(movieName)
   {
      this.movieName = movieName;
      this.txdRefs = [];
      this.imageQueue = [];
   }
   function addImage(txd, id, imageMovieClip)
   {
      imageMovieClip._visible = false;
      if(com.rockstargames.gtav.levelDesign.starterPackBrowser.ImageManager.USE_REFERENCE_COUNTING && this.txdRefs[txd] == "loaded")
      {
         this.displayImage(txd,id,imageMovieClip);
      }
      else
      {
         if(this.txdRefs[txd] != "loading")
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.movieName,txd,id,true);
            this.txdRefs[txd] = "loading";
         }
         this.imageQueue.push({txd:txd,id:id,path:String(imageMovieClip)});
      }
   }
   function textureLoaded(txd)
   {
      this.txdRefs[txd] = "loaded";
      var _loc6_ = this.imageQueue.length - 1;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      while(_loc6_ >= 0)
      {
         _loc7_ = this.imageQueue[_loc6_];
         if(_loc7_.txd == txd)
         {
            _loc5_ = _loc7_.path.split(".");
            _loc4_ = _root;
            _loc3_ = 1;
            while(_loc3_ < _loc5_.length)
            {
               _loc4_ = _loc4_[_loc5_[_loc3_]];
               _loc3_ = _loc3_ + 1;
            }
            if(_loc4_)
            {
               this.displayImage(txd,_loc7_.id,_loc4_);
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
   function displayImage(txd, id, imageMovieClip)
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
      loader.loadClip("img://" + txd + "/" + id,imageMovieClip);
   }
   function dispose()
   {
      for(var _loc2_ in this.txdRefs)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COVERT_OPS",_loc2_);
      }
   }
}
