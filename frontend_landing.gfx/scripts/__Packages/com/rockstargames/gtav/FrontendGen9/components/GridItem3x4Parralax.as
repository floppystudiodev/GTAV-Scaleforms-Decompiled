class com.rockstargames.gtav.FrontendGen9.components.GridItem3x4Parralax extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _animInState;
   var _animOutState;
   var _description;
   var _descriptionAlphaCache;
   var _gradient;
   var _highlight;
   var _image;
   var _initialTitlePosition;
   var _isLit;
   var _logo;
   var _parallaxStack;
   var _spacerSize;
   var _spinner;
   var _textAnimationDistance;
   var _textScale;
   var _titleText;
   var attachMovie;
   var cover;
   var createEmptyMovieClip;
   var hitArea;
   var itemHeight;
   var itemWidth;
   var parallaxStackContainer;
   var _waitDuration = 2;
   var _fadeDuration = 0.5;
   var _currentIndex = 0;
   var _currentType = 0;
   var _type = 1;
   function GridItem3x4Parralax()
   {
      super();
      this._textAnimationDistance = 65;
      this._parallaxStack = [];
      this.itemWidth = 1152;
      this.itemHeight = 555;
      this.rearrangeContent();
      this._image._visible = false;
      this._spinner.removeMovieClip();
      this._highlight.removeMovieClip();
      this._titleText._alpha = 0;
      this._description._alpha = 0;
      this.parallaxStackContainer = this.createEmptyMovieClip("parallaxStackContainer",81);
      this.cover = this.createEmptyMovieClip("cover",160);
      this.cover.beginFill(0);
      this.cover.moveTo(-20,-500);
      this.cover.lineTo(this.itemWidth + 20,-500);
      this.cover.lineTo(this.itemWidth + 20,this.itemHeight + 20);
      this.cover.lineTo(-20,this.itemHeight + 20);
      this.cover.lineTo(-20,-500);
      this.cover.endFill();
   }
   function rearrangeContent()
   {
      super.rearrangeContent();
      if(com.rockstargames.gtav.FrontendGen9.components.Text.isAsian)
      {
         this._titleText.resizeAsianText();
      }
      this._initialTitlePosition.y = this.itemHeight - this._titleText.getTextHeight() / 100 * this._textScale + 2.666;
      this._titleText._x = this._spacerSize;
      this._titleText._y = this._initialTitlePosition.y - this._textAnimationDistance;
      this._titleText._alpha = 0;
      this._description._alpha = 0;
      this._description._y = this._titleText._y + this._titleText.getTextHeight() / 100 * this._textScale + 6;
   }
   function SET_GRID_ITEM_DETAILS(titleStr, descStr, tagTxd, tagTexture)
   {
      this._titleText._fontStyle = com.rockstargames.gtav.FrontendGen9.components.Text.FONT_STYLE_CONDENSED_NOT_GAMERNAME;
      this._titleText._pointSize = 36;
      this._titleText.SET_TEXT(titleStr,true);
      this._description.SET_TEXT(descStr,true);
      this._titleText._alpha = 0;
      this._textAnimationDistance = this._description.getTextHeight() + 9;
      this._description._alpha = 0;
      this.rearrangeContent();
      this.setupLogo(this._type,tagTxd,tagTexture);
      this.animateTextIn();
   }
   function ADD_PARALLAX_ITEM(bgImgTxd, bgImgTexture, fgImgTxd, fgImgTexture, type)
   {
      var _loc3_ = "parallaxImage" + this._parallaxStack.length;
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.ParallaxImage(this.parallaxStackContainer.attachMovie("parallaxImage",_loc3_,this._parallaxStack.length + 10));
      _loc2_.SET_IMAGE(bgImgTxd,bgImgTexture,fgImgTxd,fgImgTexture,type);
      _loc2_._alpha = 0;
      this._parallaxStack.push(_loc2_);
      this._type = type;
      this.setupGradient(this._type);
      var _loc4_ = _loc2_.GetBackgroundMovie();
      this.hitArea = _loc4_;
   }
   function PLAY_ANIMATION()
   {
      this._currentIndex = 0;
      this.fadeIn();
   }
   function RESET_ANIMATION()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.cover);
      this.cover._alpha = 100;
      this._parallaxStack[this._currentIndex].stopAnimation();
      this._parallaxStack[this._currentIndex]._alpha = 0;
      this._currentIndex = 0;
      this._titleText._alpha = 0;
      this._description._alpha = 0;
   }
   function RESET_PARALLAX()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.cover);
      this.cover._alpha = 100;
      this._parallaxStack[this._currentIndex].stopAnimation();
      this._currentIndex = 0;
      this._titleText._alpha = 0;
      this._description._alpha = 0;
   }
   function fadeIn()
   {
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.ParallaxImage(this._parallaxStack[this._currentIndex]);
      _loc2_.resetPosition();
      _loc2_.rearrangeContent();
      _loc2_._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.cover,this._fadeDuration,{_alpha:0,onComplete:this.wait,onCompleteScope:this});
      this._parallaxStack[this._currentIndex].animate();
   }
   function wait()
   {
      if(this._parallaxStack.length > 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.cover,this._waitDuration,{onComplete:this.fadeOut,onCompleteScope:this});
      }
   }
   function fadeOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.cover,this._fadeDuration,{_alpha:100,onComplete:this.cycleAnimation,onCompleteScope:this});
   }
   function cycleAnimation()
   {
      this._parallaxStack[this._currentIndex]._alpha = 0;
      this._currentIndex = this._currentIndex + 1;
      if(this._currentIndex >= this._parallaxStack.length)
      {
         this._currentIndex = 0;
      }
      this.fadeIn();
   }
   function setupLogo(type, txd, texture)
   {
      var _loc3_ = 94;
      var _loc2_ = 14;
      var _loc5_ = 356;
      var _loc4_ = 356;
      if(type == com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATION_MOTION_TYPE)
      {
         _loc3_ = 869.6666;
         _loc2_ = 341;
         _loc5_ = 146.6666;
         _loc4_ = 146.6666;
      }
      this._logo = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("logoImage","logo",85,{_x:_loc3_,_y:_loc2_,_height:_loc4_,_width:_loc5_,_visible:false}));
      this._logo.SET_IMAGE(txd,texture);
   }
   function setupGradient(type)
   {
      var _loc2_;
      switch(type)
      {
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.DEFAULT_MOTION_TYPE:
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.STORY_MOTION_TYPE:
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.ONLINE_MOTION_TYPE:
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.ERROR_MOTION_TYPE:
            this._gradient._visible = false;
            _loc2_ = this.attachMovie("itemGradientMotion","gradientMotion",99);
            _loc2_._y = 330;
            _loc2_._x = 0;
            _loc2_._height = 225;
            _loc2_._width = this.itemWidth;
            _loc2_._alpha = 100;
            break;
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.SUMMARY_MOTION_TYPE:
            this._gradient._visible = false;
            this._gradient = this.attachMovie("mainGradient","gradientMotion",99);
            this._gradient._y = this.parallaxStackContainer._y;
            this._gradient._x = 0;
            this._gradient._height = 720;
            this._gradient._width = 1280;
            this._gradient._alpha = 100;
            break;
         case com.rockstargames.gtav.FrontendGen9.components.ParallaxImage.MIGRATION_MOTION_TYPE:
            this._gradient._visible = false;
            this._gradient = this.attachMovie("mainGradient","gradientMotion",99);
            this._gradient._y = -80;
            this._gradient._x = -64;
            this._gradient._height = 720;
            this._gradient._width = 1280;
            this._gradient._alpha = 100;
      }
      this.cover._y = this._gradient._y;
      this.cover._x = this._gradient._x;
      this.cover._height = 1720;
      this.cover._width = 1500;
   }
   function setHighlight(isLit)
   {
      this._isLit = isLit;
      this._highlight._visible = isLit;
      if(isLit)
      {
         this.animateTextIn();
         this._description._visible = true;
      }
      else
      {
         this.animateTextOut();
      }
   }
   function animateTextIn()
   {
      this._descriptionAlphaCache = 100;
      var _loc2_ = this._initialTitlePosition.y - this._textAnimationDistance;
      this._titleText._y = _loc2_;
      switch(this._animInState)
      {
         case 1:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:100,onComplete:this.animateTextIn,onCompleteScope:this});
            this._animInState = 2;
            break;
         case 2:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._description,0.2,{_alpha:this._descriptionAlphaCache});
            this._animInState = 1;
         default:
            return;
      }
   }
   function animateTextOut()
   {
      this._descriptionAlphaCache = 0;
      switch(this._animOutState)
      {
         case 1:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._description,0.1,{_alpha:this._descriptionAlphaCache,onComplete:this.animateTextOut,onCompleteScope:this});
            this._animOutState = 2;
            break;
         case 2:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:100});
            this._animOutState = 1;
         default:
            return;
      }
   }
}
