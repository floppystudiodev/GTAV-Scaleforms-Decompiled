class com.rockstargames.gtav.FrontendGen9.components.ParallaxImage extends MovieClip
{
   var _componentHeight;
   var _componentWidth;
   var _imageBG;
   var _imageFG;
   var _left;
   var _maskBG;
   var _maskFG;
   var _top;
   static var DEFAULT_MOTION_TYPE = 0;
   static var STORY_MOTION_TYPE = 1;
   static var ONLINE_MOTION_TYPE = 2;
   static var SUMMARY_MOTION_TYPE = 3;
   static var MIGRATION_MOTION_TYPE = 4;
   static var ERROR_MOTION_TYPE = 5;
   static var IMAGE_WIDTH = 1280;
   static var IMAGE_HEIGHT = 720;
   static var BACKGROUND_SLIDE_OFFSET = 4;
   static var FOREGROUND_SLIDE_OFFSET = 10;
   static var MIGRATIONS_SUMMARY_BORDER = 35;
   static var MIGRATIONS_FOOTER_BORDER = 42;
   static var MIGRATION_X_OFFSET = -64;
   var animate = com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.prototype.noAnimate;
   function ParallaxImage()
   {
      super();
      this._imageBG = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("gridImage","imageBG",this.getNextHighestDepth()));
      this._imageFG = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("gridImage","imageFG",this.getNextHighestDepth()));
      this._maskBG = this.createEmptyMovieClip("maskBG",this.getNextHighestDepth());
      this._maskFG = this.createEmptyMovieClip("maskFG",this.getNextHighestDepth());
      var _loc3_ = {x:0,y:0};
      this.globalToLocal(_loc3_);
      this._left = - this._x - this._parent._x;
      this._top = _loc3_.y;
   }
   function GetBackgroundMovie()
   {
      return this._imageBG;
   }
   function setComponentSize(width, height)
   {
      this._componentWidth = width;
      this._componentHeight = height;
   }
   function drawMask(x, y, width, height, mask, image)
   {
      mask.clear();
      mask.beginFill(0);
      mask.moveTo(x,y);
      mask.lineTo(x + width,y);
      mask.lineTo(x + width,y + height);
      mask.lineTo(x,y + height);
      mask.lineTo(x,y);
      mask.endFill();
      image.setMask(mask);
   }
   function SET_IMAGE(bgImgTxd, bgImgTexture, fgImgTxd, fgImgTexture, type)
   {
      this._x = 0;
      switch(type)
      {
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.DEFAULT_MOTION_TYPE:
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.STORY_MOTION_TYPE:
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.ONLINE_MOTION_TYPE:
            this.setComponentSize(1152,555);
            this._imageBG.SET_IMAGE(bgImgTxd,bgImgTexture,false);
            this._imageFG.SET_IMAGE(fgImgTxd,fgImgTexture,false);
            this.animate = this.slideAnimate;
            this.drawMask(0,0,this._componentWidth,this._componentHeight,this._maskBG,this._imageBG);
            this.drawMask(0,this._top,this._componentWidth,this._componentHeight - this._top,this._maskFG,this._imageFG);
            break;
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.SUMMARY_MOTION_TYPE:
            this.setComponentSize(1280,604);
            this._imageBG.SET_IMAGE(bgImgTxd,bgImgTexture,false);
            this._imageFG.SET_IMAGE(fgImgTxd,fgImgTexture,false);
            this.animate = this.zoomAnimate;
            this.drawMask(this._left,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATIONS_SUMMARY_BORDER,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_WIDTH,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_HEIGHT - com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATIONS_SUMMARY_BORDER,this._maskBG,this._imageBG);
            this.drawMask(this._left,this._top,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_WIDTH,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_HEIGHT,this._maskFG,this._imageFG);
            break;
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATION_MOTION_TYPE:
            this._x = com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATION_X_OFFSET;
            this.setComponentSize(1280,555);
            this._imageBG.SET_IMAGE(bgImgTxd,bgImgTexture,false);
            this._imageFG.SET_IMAGE(fgImgTxd,fgImgTexture,false);
            this.animate = this.zoomAnimate;
            this.drawMask(this._left,0,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_WIDTH,this._componentHeight,this._maskBG,this._imageBG);
            this.drawMask(0,this._top,this._componentWidth,this._componentHeight - this._top,this._maskFG,this._imageFG);
            break;
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.ERROR_MOTION_TYPE:
         default:
            this.setComponentSize(1152,555);
            this._imageBG.SET_IMAGE(bgImgTxd,bgImgTexture,false);
            this._imageFG.SET_IMAGE(fgImgTxd,fgImgTexture,false);
            this.animate = this.noAnimate;
            this.drawMask(0,0,this._componentWidth,this._componentHeight,this._maskBG,this._imageBG);
            this.drawMask(0,this._top,this._componentWidth,this._componentHeight - this._top,this._maskFG,this._imageFG);
      }
      this.rearrangeContent();
      this.resetPosition();
   }
   function rearrangeContent()
   {
      this._imageBG.setSize(com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_WIDTH,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_HEIGHT);
      this._imageFG.setSize(com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_WIDTH,com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.IMAGE_HEIGHT);
   }
   function resetPosition()
   {
      this._imageBG._x = this._left;
      this._imageBG._y = this._top;
      this._imageFG._x = this._left;
      this._imageFG._y = this._top;
   }
   function slideAnimate()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._imageBG,2.467,{_x:this._imageBG._x - com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.BACKGROUND_SLIDE_OFFSET,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._imageFG,3,{_x:this._imageFG._x - com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.FOREGROUND_SLIDE_OFFSET,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function zoomAnimate()
   {
      var _loc2_ = 1.01;
      var _loc5_ = this._imageBG._x + 0.5 * this._imageBG._width;
      var _loc3_ = this._imageBG._y + 0.5 * this._imageBG._height;
      var _loc12_ = _loc5_ - (_loc5_ - this._imageBG._x) * _loc2_;
      var _loc10_ = _loc3_ - (_loc3_ - this._imageBG._y) * _loc2_;
      var _loc13_ = this._imageBG._width * _loc2_;
      var _loc11_ = this._imageBG._height * _loc2_;
      var _loc4_ = 1.02;
      var _loc8_ = _loc5_ - (_loc5_ - this._imageFG._x) * _loc4_;
      var _loc6_ = _loc3_ - (_loc3_ - this._imageFG._y) * _loc4_;
      var _loc9_ = this._imageFG._width * _loc4_;
      var _loc7_ = this._imageFG._height * _loc4_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._imageBG,3,{_x:_loc12_,_y:_loc10_,_width:_loc13_,_height:_loc11_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,delay:0.067});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._imageFG,3,{_x:_loc8_,_y:_loc6_,_width:_loc9_,_height:_loc7_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,delay:0.067});
   }
   function noAnimate()
   {
   }
   function stopAnimation()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._imageBG);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._imageFG);
   }
}
