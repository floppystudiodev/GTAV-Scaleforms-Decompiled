class com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var app;
   var cursor;
   var view;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var safeZoneBottom;
   static var MAP_START_X = -734.7;
   static var MAP_START_Y = -2703.8;
   static var MAP_START_SCALE = 0.5;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, cursor, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
      this.view._visible = false;
      this.initSafeZone();
   }
   function handleButtonInput(inputID)
   {
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function get isReady()
   {
      return false;
   }
   function onBusinessListChange()
   {
   }
   function dispose()
   {
      this.app = null;
      this.cursor.setTargetRects([]);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
}
