class com.rockstargames.gtav.FrontendGen9.components.ScalableImage extends com.rockstargames.gtav.FrontendGen9.components.Image
{
   var _xscale;
   var _yscale;
   var baseHeight;
   var baseWidth;
   var centreWrapper;
   var createEmptyMovieClip;
   var getNextHighestDepth;
   var imgMask;
   var isImageLoaded;
   static var DEFAULT_SCALE = 104;
   static var TRANSITION_ON_SCALE = 102;
   static var HOLD_SCALE = 100;
   function ScalableImage()
   {
      super();
      this.imgMask = this.createEmptyMovieClip("imgMask",this.getNextHighestDepth());
      this.imgMask.beginFill(16711680,50);
      this.imgMask.lineTo(this.baseWidth,0);
      this.imgMask.lineTo(this.baseWidth,this.baseHeight);
      this.imgMask.lineTo(0,this.baseHeight);
      this.imgMask.lineTo(0,0);
      this.centreWrapper.setMask(this.imgMask);
      this.centreWrapper._xscale = com.rockstargames.gtav.FrontendGen9.components.ScalableImage.DEFAULT_SCALE;
      this.centreWrapper._yscale = com.rockstargames.gtav.FrontendGen9.components.ScalableImage.DEFAULT_SCALE;
   }
   function setHighlight(isHovering)
   {
      if(isHovering)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.centreWrapper,0.433,{_xscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.TRANSITION_ON_SCALE,_yscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.TRANSITION_ON_SCALE,onCompleteScope:this,onComplete:this.hoverHold});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.centreWrapper,0.133,{_xscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.DEFAULT_SCALE,_yscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.DEFAULT_SCALE});
      }
   }
   function hoverHold()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.centreWrapper,4,{_xscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.HOLD_SCALE,_yscale:com.rockstargames.gtav.FrontendGen9.components.ScalableImage.HOLD_SCALE});
   }
   function setSize(width, height)
   {
      this._xscale = 100 * width / this.imgMask._width;
      this._yscale = 100 * height / this.imgMask._height;
   }
   function loadCompleted(target_mc)
   {
      this.isImageLoaded = true;
      this.centreWrapper.imgContainer._width = this.baseWidth;
      this.centreWrapper.imgContainer._height = this.baseHeight;
   }
}
