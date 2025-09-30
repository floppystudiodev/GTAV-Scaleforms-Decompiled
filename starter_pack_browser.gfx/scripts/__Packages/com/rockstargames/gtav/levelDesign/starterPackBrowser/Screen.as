class com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen
{
   var app;
   var cursor;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT;
   static var SCROLL_SPEED = 450;
   static var STICK_SCROLL_SPEED = 20;
   function Screen(app, cursor, viewContainer, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function handleAccept(activeElementID)
   {
   }
   function handleCancel()
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
   }
   function dispose()
   {
      this.app = null;
      this.cursor.setChangeListener(null);
      this.cursor.setTargetRects([]);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
}
