class com.rockstargames.gtav.FrontendGen9.components.MainImage extends MovieClip
{
   var _gradient;
   var _image;
   var _imageMask;
   var itemHeight = 390;
   var itemWidth = 1280;
   function MainImage()
   {
      super();
      this._image = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("gridImage","image",this.getNextHighestDepth()));
      this._gradient = this.attachMovie("mainGradient","gradient",this.getNextHighestDepth());
      this._imageMask = this.createEmptyMovieClip("imageMask",this.getNextHighestDepth());
      this._imageMask.clear();
      this._imageMask.beginFill(0);
      this._imageMask.lineTo(this.itemWidth,0);
      this._imageMask.lineTo(this.itemWidth,this.itemHeight);
      this._imageMask.lineTo(0,this.itemHeight);
      this._imageMask.lineTo(0,0);
      this._imageMask.endFill();
      this._imageMask._visible = false;
   }
   function SET_IMAGE(mainImgTxd, mainImgTexture)
   {
      this._image.SET_IMAGE(mainImgTxd,mainImgTexture,false);
      this.rearrangeContent();
   }
   function rearrangeContent()
   {
      this._image._x = 0;
      this._image._y = 0;
      this._image.setSize(this.itemWidth,this.itemHeight);
      this._image.setMask(this._imageMask);
      this._gradient._height = this.itemHeight;
      this._gradient._width = this.itemWidth;
      var _loc2_ = 1.04;
      var _loc4_ = this._image._x + 0.5 * this._image._width;
      var _loc3_ = this._image._y + 0.5 * this._image._height;
      var _loc7_ = _loc4_ - (_loc4_ - this._image._x) * _loc2_;
      var _loc5_ = _loc3_ - (_loc3_ - this._image._y) * _loc2_;
      var _loc8_ = this._image._width * _loc2_;
      var _loc6_ = this._image._height * _loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._image,2,{_x:_loc7_,_y:_loc5_,_width:_loc8_,_height:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,delay:0.067});
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
   function ANIMATE_OUT(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:0,delay:_loc3_});
   }
}
