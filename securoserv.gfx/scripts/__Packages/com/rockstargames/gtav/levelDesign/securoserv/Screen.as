class com.rockstargames.gtav.levelDesign.securoserv.Screen
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
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT;
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
   function onWarehouseListChange()
   {
   }
   function updateCooldown(remainingSeconds)
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
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
   function flashElementIn(element, preDelay, appearSFX)
   {
      element.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,0,255,255,255,0);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(element,preDelay,{onCompleteScope:this,onComplete:this.updateFlashFadeIn,onCompleteArgs:[element,0,appearSFX]});
   }
   function updateFlashFadeIn(element, step, appearSFX)
   {
      var _loc2_ = element.transform.colorTransform;
      var _loc4_ = false;
      if(appearSFX != undefined)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound(appearSFX);
      }
      if(step == 0)
      {
         _loc2_.alphaOffset = Math.min(255,_loc2_.alphaOffset + 50);
         if(_loc2_.alphaOffset == 255)
         {
            _loc2_.alphaMultiplier = 1;
            step = 1;
         }
      }
      else if(_loc2_.redOffset > 0)
      {
         _loc2_.redOffset = _loc2_.greenOffset = _loc2_.blueOffset = _loc2_.alphaOffset = Math.max(0,_loc2_.redOffset - 25);
      }
      else
      {
         _loc2_ = new flash.geom.ColorTransform();
         _loc4_ = true;
      }
      element.transform.colorTransform = _loc2_;
      if(!_loc4_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(element,0.02,{onCompleteScope:this,onComplete:this.updateFlashFadeIn,onCompleteArgs:[element,step]});
      }
   }
}
