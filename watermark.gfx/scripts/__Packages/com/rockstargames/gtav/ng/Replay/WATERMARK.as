class com.rockstargames.gtav.ng.Replay.WATERMARK
{
   var _isWideScreen;
   var _safeLeft;
   var _safeRight;
   var _safeTop;
   var _safeBottom;
   var TIMELINE;
   var _watermark;
   var _isAnimationPlaying;
   var _startFadeOutDelay;
   var _fadeOutCounter;
   var _startFadeOut;
   var _userMask;
   var _movieNameMask;
   var _animatedLogo;
   var _totalLogoFrames;
   var _userMaskEndX;
   var _userMaskPixelsPerFrame;
   var _movieNameMaskEndX;
   var _movieNameMaskPixelsPerFrame;
   var _shouldUpdate;
   var ref;
   static var LOGO_TYPE_ROCKSTAR = 0;
   static var LOGO_TYPE_SOCIAL_CLUB = 1;
   static var MASKS_START_X = 70;
   static var WATERMARK_ALPHA = 50;
   static var WATERMARK_SCALE = 80;
   static var FADE_OUT_DELAY = 150;
   function WATERMARK()
   {
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, isWideScreen, _isHiDef, _isAsian)
   {
      this._isWideScreen = isWideScreen;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      if(this._isWideScreen)
      {
         _loc2_ = 1280;
         _loc3_ = 720;
      }
      else
      {
         _loc2_ = 960;
         _loc3_ = 720;
      }
      this._safeLeft = Math.round(_loc2_ * _safeLeftPercent);
      this._safeRight = Math.round(_loc2_ * _safeRightPercent);
      this._safeTop = Math.round(_loc3_ * _safeTopPercent);
      this._safeBottom = Math.round(_loc3_ * _safeBottomPercent);
      if(!this._isWideScreen)
      {
         Stage.scaleMode = "noBorder";
      }
      _isHiDef;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this._watermark = this.TIMELINE.attachMovie("WatermarkMC","WatermarkMC",this.TIMELINE.getNextHighestDepth());
      this._watermark._alpha = com.rockstargames.gtav.ng.Replay.WATERMARK.WATERMARK_ALPHA;
      this._watermark._xscale = this._watermark._yscale = com.rockstargames.gtav.ng.Replay.WATERMARK.WATERMARK_SCALE;
      this._isAnimationPlaying = false;
      this._startFadeOutDelay = false;
      this._fadeOutCounter = 0;
      this._startFadeOut = false;
      this._userMask = this._watermark.userMask;
      this._movieNameMask = this._watermark.movieNameMask;
   }
   function SET_WATERMARK_TYPE(type, screenWidthPixels, screenHeightPixels)
   {
      if(this._animatedLogo == undefined)
      {
         this._animatedLogo = this._watermark.attachMovie("animatedLogo" + type,"animatedLogo" + type,this._watermark.getNextHighestDepth());
      }
      this._animatedLogo._visible = false;
      this._animatedLogo.stop();
      this._totalLogoFrames = this._animatedLogo._totalframes;
      if(screenWidthPixels == undefined && screenHeightPixels == undefined)
      {
         this._watermark._x = this._safeLeft;
         this._watermark._y = this._safeTop;
      }
      else
      {
         var _loc2_ = 0;
         _loc2_ = 720 * screenWidthPixels / screenHeightPixels;
         _loc2_ = Math.round((1280 - _loc2_) * 0.5);
         this._watermark._x = 15 + _loc2_;
         this._watermark._y = 15;
      }
   }
   function Is16to10(screenWidthPixels, screenHeightPixels)
   {
      return screenWidthPixels == screenHeightPixels * 1.6;
   }
   function SET_WATERMARK_LABELS(userLabel, movieNameLabel)
   {
      this._watermark.userLabel.text = userLabel;
      this._watermark.userLabelDropShadow.text = userLabel;
      this._userMaskEndX = this._watermark.userLabel.textWidth + com.rockstargames.gtav.ng.Replay.WATERMARK.MASKS_START_X;
      this._userMaskPixelsPerFrame = this._userMaskEndX / (this._totalLogoFrames * 0.5);
      this._watermark.movieNameLabel.text = movieNameLabel;
      this._watermark.movieNameLabelDropShadow.text = movieNameLabel;
      this._movieNameMaskEndX = this._watermark.movieNameLabel.textWidth + com.rockstargames.gtav.ng.Replay.WATERMARK.MASKS_START_X;
      this._movieNameMaskPixelsPerFrame = this._movieNameMaskEndX / (this._totalLogoFrames * 0.5);
   }
   function START_ANIMATION()
   {
      this.resetMasksAndCounter();
      this._shouldUpdate = true;
      this._isAnimationPlaying = true;
      this.TIMELINE.ref = this;
      this.TIMELINE.onEnterFrame = function()
      {
         this.ref.update();
      };
      this._animatedLogo._visible = true;
      this._animatedLogo.gotoAndPlay(2);
   }
   function RESUME_ANIMATION()
   {
      if(!this._shouldUpdate)
      {
         this._shouldUpdate = true;
         this._animatedLogo.play();
      }
   }
   function PAUSE_ANIMATION()
   {
      if(this._shouldUpdate)
      {
         this._shouldUpdate = false;
         this._animatedLogo.stop();
      }
   }
   function dispose()
   {
      delete this.TIMELINE.onEnterFrame;
   }
   function update()
   {
      if(this._shouldUpdate)
      {
         if(this._isAnimationPlaying)
         {
            if(this._userMask._x < this._userMaskEndX)
            {
               this._userMask._x += this._userMaskPixelsPerFrame;
            }
            else if(this._movieNameMask._x < this._movieNameMaskEndX)
            {
               this._movieNameMask._x += this._movieNameMaskPixelsPerFrame;
            }
            else
            {
               this._animatedLogo.stop();
               this._isAnimationPlaying = false;
               this._startFadeOutDelay = true;
            }
         }
         if(this._startFadeOutDelay)
         {
            this._fadeOutCounter = this._fadeOutCounter + 1;
            if(this._fadeOutCounter == com.rockstargames.gtav.ng.Replay.WATERMARK.FADE_OUT_DELAY)
            {
               this._startFadeOutDelay = false;
               this._startFadeOut = true;
            }
         }
         if(this._startFadeOut)
         {
            this._watermark._alpha -= 2;
            if(this._watermark._alpha == 0)
            {
               this._startFadeOut = false;
            }
         }
      }
   }
   function resetMasksAndCounter()
   {
      this._watermark._alpha = com.rockstargames.gtav.ng.Replay.WATERMARK.WATERMARK_ALPHA;
      this._startFadeOutDelay = false;
      this._fadeOutCounter = 0;
      this._startFadeOut = false;
      if(this._userMask != undefined)
      {
         this._userMask._x = com.rockstargames.gtav.ng.Replay.WATERMARK.MASKS_START_X;
      }
      if(this._movieNameMask != undefined)
      {
         this._movieNameMask._x = com.rockstargames.gtav.ng.Replay.WATERMARK.MASKS_START_X;
      }
   }
   function calculatePercentageDifference(valueA, valueB)
   {
      var _loc1_ = (valueA - valueB) / valueA * 0.5;
      return _loc1_ >= 0 ? _loc1_ : - _loc1_;
   }
}
