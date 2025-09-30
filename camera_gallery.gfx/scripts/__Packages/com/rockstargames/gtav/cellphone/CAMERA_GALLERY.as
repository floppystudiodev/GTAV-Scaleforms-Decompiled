class com.rockstargames.gtav.cellphone.CAMERA_GALLERY extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var shutter;
   var _tfOriginalXPosition = 0;
   function CAMERA_GALLERY()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.savedPhotos.FOCUS_LOCK._visible = false;
      this.CONTENT.savedPhotos.FOCUS_LOCK.focusLockIcon._visible = false;
      this.shutter = this.CONTENT.attachMovie("shutterSlideMC","shutter",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      this._tfOriginalXPosition = this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF._x;
      this.SHOW_PHOTO_FRAME(false);
      this.SHOW_REMAINING_PHOTOS(false);
      this.getDisplayConfig();
   }
   function getDisplayConfig()
   {
      var _loc2_ = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_);
      if(!_loc2_.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
      }
      var _loc3_ = _loc2_.screenWidth;
      var _loc6_ = _loc2_.screenHeight;
      if(!_loc2_.isWideScreen)
      {
         _loc3_ = Math.round(_loc3_ / 1.3);
      }
      var _loc4_ = Math.round(_loc3_ * _loc2_.safeRight);
      var _loc5_ = Math.round(_loc6_ * _loc2_.safeTop);
      this.CONTENT.savedPhotos._x = _loc4_;
      this.CONTENT.savedPhotos._y = _loc5_;
   }
   function DISPLAY_VIEW(viewIndex)
   {
   }
   function SHOW_PHOTO_FRAME(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.CONTENT.photoFrame._visible = vis;
   }
   function SHOW_REMAINING_PHOTOS(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.CONTENT.savedPhotos._visible = vis;
   }
   function FLASH_PHOTO_FRAME()
   {
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
         this.CONTENT.savedPhotos.photosLeftTF.text = _loc2_;
         this.CONTENT.savedPhotos.photosLeftTFOutline.text = _loc2_;
         this.SHOW_REMAINING_PHOTOS(true);
      }
   }
   function SET_FOCUS_LOCK(isVisible, str, iconVisible)
   {
      this.CONTENT.savedPhotos.FOCUS_LOCK._visible = isVisible;
      this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF.text = str;
      this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTFOutline.text = str;
      this.CONTENT.savedPhotos.FOCUS_LOCK.focusLockIcon._visible = iconVisible;
      if(iconVisible)
      {
         this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF._x = this._tfOriginalXPosition;
         this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTFOutline._x = this._tfOriginalXPosition;
      }
      else
      {
         this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF._x = - this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF._width;
         this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTFOutline._x = - this.CONTENT.savedPhotos.FOCUS_LOCK.focuslockTF._width;
      }
   }
   function OPEN_SHUTTER()
   {
      this.goTo("openShutter");
   }
   function CLOSE_SHUTTER()
   {
      this.goTo("closeShutter");
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
