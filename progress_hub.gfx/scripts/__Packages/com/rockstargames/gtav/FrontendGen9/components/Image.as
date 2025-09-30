class com.rockstargames.gtav.FrontendGen9.components.Image extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var _height;
   var _loader;
   var _visible;
   var _width;
   var baseHeight;
   var baseWidth;
   var centreWrapper;
   var isImageLoaded = false;
   var gfxFileName = "FRONTEND_LANDING";
   var storedTexture = "";
   var _isLit = false;
   function Image()
   {
      super();
      this.baseWidth = this._width;
      this.baseHeight = this._height;
      this._loader = new MovieClipLoader();
      var callback = this;
      var _loc3_ = {onLoadInit:function(target_mc)
      {
         callback.loadCompleted(target_mc);
      }};
      this._loader.addListener(_loc3_);
   }
   function SET_IMAGE(txd, texture)
   {
      this._visible = this.loadComponent(txd,texture);
   }
   function REMOVE_IMAGE()
   {
   }
   function loadComponent(txd, texture, isLocal)
   {
      var _loc2_ = false;
      this.storedTexture = texture;
      var _loc4_;
      if(this.isImageNameValid(txd) && this.isImageNameValid(texture))
      {
         if(this.isImageLoaded)
         {
            this.unloadComponent();
         }
         _loc4_ = !isLocal ? "img://" + txd + "/" + texture : texture;
         this._loader.loadClip(_loc4_,this.centreWrapper.imgContainer);
         _loc2_ = true;
      }
      return _loc2_;
   }
   function unloadComponent()
   {
      if(this.isImageLoaded)
      {
         this._loader.unloadClip(this.centreWrapper.imgContainer);
         flash.external.ExternalInterface.call("CLEAN_UP_TEXTURES",0,this.gfxFileName,this.storedTexture);
         flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
         this.storedTexture = "";
      }
      this.isImageLoaded = false;
   }
   function loadCompleted(target_mc)
   {
      this.isImageLoaded = true;
      this._width = this.baseWidth;
      this._height = this.baseHeight;
   }
   function isImageNameValid(str)
   {
      return str != undefined && str.length > 0;
   }
   function setSize(width, height)
   {
      this._width = width;
      this._height = height;
   }
   function setHighlight(isLit)
   {
      if(!isLit)
      {
      }
   }
}
