class com.rockstargames.gtav.levelDesign.DIGITAL_CAMERA extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var FILE_WIDTH;
   var FOUR_THREE_PADDING;
   var isHiDef;
   var isWideScreen;
   var photoFrame;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   var shutter;
   var ui;
   var shutterSpeed = 500;
   var overlap = 2;
   function DIGITAL_CAMERA()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc4_ = 640;
      var _loc3_ = 360;
      this.ui = this.CONTENT.attachMovie("uiOverlayMC","uiMC",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      this.photoFrame = this.CONTENT.attachMovie("photoFrameMC","photoFrameMC",this.CONTENT.getNextHighestDepth(),{_x:_loc4_,_y:_loc3_});
      this.shutter = this.CONTENT.attachMovie("shutterSlideMC","shutterMC",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      this.SHOW_FOCUS_LOCK(false,"");
      this.SHOW_PHOTO_FRAME(false);
      this.SET_REMAINING_PHOTOS(1);
      this.SHOW_PHOTO_BORDER(false);
      this.shutter.blade0.innerMC._height = 360 + this.overlap;
      this.shutter.blade1.innerMC._height = 360 + this.overlap;
   }
   function initScreenLayout()
   {
      this.ui.savedPhotos._x = this.safeRight;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      var _loc4_;
      var _loc3_;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         _loc4_ = 1.7777777777777777;
         _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function SHOW_REMAINING_PHOTOS(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.ui.savedPhotos._visible = vis;
   }
   function SET_REMAINING_PHOTOS(photosTaken, photosLeft)
   {
      var _loc2_;
      if(photosLeft == 1)
      {
         this.SHOW_REMAINING_PHOTOS(false);
      }
      else
      {
         _loc2_ = photosTaken + "/" + photosLeft;
         this.ui.savedPhotos.photosLeftTF.text = _loc2_;
         this.SHOW_REMAINING_PHOTOS(true);
      }
   }
   function SHOW_PHOTO_BORDER(vis, rotation, xpos, ypos, xscale, yscale)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      if(rotation != undefined)
      {
         this.photoFrame._rotation = rotation;
      }
      var _loc6_ = xpos == undefined ? 640 : 1280 * xpos;
      var _loc5_ = ypos == undefined ? 360 : 720 * ypos;
      var _loc4_ = xscale == undefined ? 100 : xscale;
      var _loc3_ = yscale == undefined ? 100 : yscale;
      this.photoFrame._x = _loc6_;
      this.photoFrame._y = _loc5_;
      this.photoFrame._visible = vis;
      this.photoFrame._xscale = _loc4_;
      this.photoFrame._yscale = _loc3_;
   }
   function SHOW_PHOTO_FRAME(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.ui.photoFrame._visible = vis;
      this.ui.focusLockDetail._visible = false;
   }
   function SHOW_FOCUS_LOCK(isVisible, str)
   {
      this.ui.focusLockDetail._visible = isVisible;
      this.ui.savedPhotos.FOCUS_LOCK._visible = isVisible;
      this.ui.savedPhotos.FOCUS_LOCK.focuslockTF.text = str;
   }
   function OPEN_SHUTTER(_shutterSpeed)
   {
      var _loc3_ = this.shutter.blade0;
      var _loc2_ = this.shutter.blade1;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_);
      if(_shutterSpeed == undefined)
      {
         _shutterSpeed = this.shutterSpeed;
      }
      _loc3_._y = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,_shutterSpeed / 1000,{_y:-360 - this.overlap,tween:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_._y = 720;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,_shutterSpeed / 1000,{_y:1080 + this.overlap,tween:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
   }
   function CLOSE_SHUTTER(_shutterSpeed)
   {
      var _loc3_ = this.shutter.blade0;
      var _loc2_ = this.shutter.blade1;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_);
      if(_shutterSpeed == undefined)
      {
         _shutterSpeed = this.shutterSpeed;
      }
      _loc3_._y = -360 - this.overlap;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,_shutterSpeed / 1000,{_y:0,tween:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_._y = 1080 + this.overlap;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,_shutterSpeed / 1000,{_y:720,tween:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
   }
   function CLOSE_THEN_OPEN_SHUTTER()
   {
      this.goTo("close_then_open");
   }
   function goTo(whichFrame)
   {
      if(this.shutter != undefined)
      {
         this.shutter.blade0.gotoAndPlay(whichFrame);
         this.shutter.blade1.gotoAndPlay(whichFrame);
      }
   }
}
