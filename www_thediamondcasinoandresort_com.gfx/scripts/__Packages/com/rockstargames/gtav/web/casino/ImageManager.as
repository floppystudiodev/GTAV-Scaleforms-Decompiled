class com.rockstargames.gtav.web.casino.ImageManager
{
   var gfxName;
   var txdRefs;
   var imageQueue;
   static var FADE_IN_DURATION = 0.15;
   static var TXD_LOADING = 1;
   static var TXD_LOADED = 2;
   static var USE_REFERENCE_COUNTING = false;
   function ImageManager(gfxName)
   {
      this.gfxName = gfxName;
      this.txdRefs = [];
      this.imageQueue = [];
   }
   function addImage(txd, id, imageMovieClip, fadeInWhenLoaded)
   {
      if(com.rockstargames.gtav.web.casino.ImageManager.USE_REFERENCE_COUNTING && this.txdRefs[txd] == com.rockstargames.gtav.web.casino.ImageManager.TXD_LOADED)
      {
         this.displayImage(txd,id,imageMovieClip,fadeInWhenLoaded);
      }
      else
      {
         if(this.txdRefs[txd] != com.rockstargames.gtav.web.casino.ImageManager.TXD_LOADING)
         {
            this.txdRefs[txd] = com.rockstargames.gtav.web.casino.ImageManager.TXD_LOADING;
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,txd,id,true);
         }
         this.imageQueue.push({txd:txd,id:id,path:String(imageMovieClip),fadeInWhenLoaded:fadeInWhenLoaded === true});
      }
   }
   function textureLoaded(txd)
   {
      this.txdRefs[txd] = com.rockstargames.gtav.web.casino.ImageManager.TXD_LOADED;
      var _loc7_ = this.imageQueue.length - 1;
      while(_loc7_ >= 0)
      {
         var _loc6_ = this.imageQueue[_loc7_];
         if(_loc6_.txd == txd)
         {
            var _loc5_ = _loc6_.path.split(".");
            var _loc4_ = _root;
            var _loc3_ = 1;
            while(_loc3_ < _loc5_.length)
            {
               _loc4_ = _loc4_[_loc5_[_loc3_]];
               _loc3_ = _loc3_ + 1;
            }
            if(_loc4_)
            {
               this.displayImage(txd,_loc6_.id,_loc4_,_loc6_.fadeInWhenLoaded);
            }
            this.imageQueue.splice(_loc7_,1);
         }
         _loc7_ = _loc7_ - 1;
      }
   }
   function clearImageQueue()
   {
      this.imageQueue.length = 0;
   }
   function displayImage(txd, id, imageMovieClip, fadeIn)
   {
      var _loc3_ = Math.round(imageMovieClip.tf._width - 4);
      var _loc2_ = Math.round(imageMovieClip.tf._height - 4);
      imageMovieClip.tf.htmlText = "<img src=\'img://" + txd + "/" + id + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3_ + "\' height=\'" + _loc2_ + "\'/>";
      imageMovieClip.onDisplayImage();
      if(fadeIn)
      {
         imageMovieClip._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(imageMovieClip,com.rockstargames.gtav.web.casino.ImageManager.FADE_IN_DURATION,{_alpha:100});
      }
   }
   function dispose()
   {
      for(var _loc2_ in this.txdRefs)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,_loc2_);
      }
   }
}
