class com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen
{
   var app;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, viewLinkage)
   {
      this.app = app;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function dispose()
   {
      this.app = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function init()
   {
      this.initSafeZone();
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
