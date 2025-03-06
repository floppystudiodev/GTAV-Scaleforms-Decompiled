class com.rockstargames.gtav.ng.Replay.ReplayBaseItemIMG extends com.rockstargames.gtav.ng.Replay.ReplayBaseItem
{
   var loaderObject;
   var SPINNER;
   var imgContainer;
   var VIDEO_CLIP_MASK;
   var imgContainer_dupe;
   var thisObj;
   var loadedObject;
   var dynamic_mask;
   var isImageLoaded = false;
   var gfxFileName = "NEW_EDITOR";
   var storedTexture = "";
   function ReplayBaseItemIMG()
   {
      super();
      this.loaderObject = new Object();
      this.SPINNER._visible = false;
   }
   function loadComponent(txd, texture, isLocal)
   {
      var _loc3_ = false;
      this.storedTexture = texture;
      var thisObj = this;
      this.loaderObject._depth = 100;
      if(this.isImageNameValid(txd) && this.isImageNameValid(texture))
      {
         if(typeof this.imgContainer == "movieclip")
         {
            var _loc4_ = undefined;
            var _loc2_ = this.imgContainer;
            var _loc6_ = this.VIDEO_CLIP_MASK;
            _loc2_._visible = false;
            _loc6_._visible = false;
            if(typeof this.imgContainer_dupe == "movieclip")
            {
               this.unloadComponent();
            }
            this.loaderObject._mc = _loc2_.duplicateMovieClip("imgContainer_dupe",_loc2_._parent.getNextHighestDepth(),{_x:_loc2_._x,_y:_loc2_._y,_alpha:0});
            this.loaderObject._height = this.imgContainer._height;
            this.loaderObject._width = this.imgContainer._width;
            this.loaderObject._loader = new MovieClipLoader();
            this.loaderObject._listener = new Object();
            this.loaderObject._loader.addListener(this.loaderObject._listener);
            this.loaderObject._listener.thisObj = thisObj;
            this.loaderObject._listener.onLoadInit = function(target_mc)
            {
               target_mc._width = this.thisObj.loaderObject._width;
               target_mc._height = this.thisObj.loaderObject._height;
               this.thisObj.loadCompleted(target_mc);
            };
            if(isLocal)
            {
               _loc4_ = texture;
            }
            else
            {
               _loc4_ = "img://" + txd + "/" + texture;
            }
            this.loaderObject._loader.loadClip(_loc4_,this.loaderObject._mc);
            _loc3_ = true;
         }
      }
      return _loc3_;
   }
   function unloadComponent()
   {
      if(typeof this.imgContainer_dupe == "movieclip")
      {
         this.loaderObject._loader.unloadClip(this.loadedObject);
         this.loaderObject._loader.removeListener(this.loaderObject._listener);
         this.loaderObject._loader = null;
         this.loaderObject._mc.removeMovieClip();
         this.loaderObject._mc = null;
         this.loaderObject._listener.thisObj = null;
         this.loaderObject._listener.onLoadInit = null;
         this.loaderObject._listener = null;
         this.imgContainer_dupe.removeMovieClip();
         this.dynamic_mask.removeMovieClip();
         this.isImageLoaded = false;
         flash.external.ExternalInterface.call("CLEAN_UP_TEXTURES",0,this.gfxFileName,this.storedTexture);
         flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgContainer_dupe);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.dynamic_mask);
      }
   }
   function loadCompleted(target_mc)
   {
      this.isImageLoaded = true;
      this.loadedObject = target_mc;
      if(typeof this.VIDEO_CLIP_MASK == "movieclip")
      {
         this.dynamic_mask = this.attachMovie("VIDEO_CLIP_MASK","dynamic_mask",20,{_x:this.VIDEO_CLIP_MASK._x,_y:this.VIDEO_CLIP_MASK._y,_width:this.VIDEO_CLIP_MASK._width,_height:this.VIDEO_CLIP_MASK._height,_alpha:0});
         this.imgContainer_dupe.setMask(this.dynamic_mask);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.dynamic_mask,0.2,{_alpha:100});
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgContainer_dupe,0.2,{_alpha:100});
   }
   function isImageNameValid(str)
   {
      if(str == "" || str == undefined)
      {
         return false;
      }
      return true;
   }
}
