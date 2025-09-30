class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen
{
   var _buttons;
   var app;
   var cursor;
   var overlay;
   var prevTargetID;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, cursor, overlay, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      this.overlay = overlay;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function handleButtonInput(inputID)
   {
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function update()
   {
   }
   function get buttons()
   {
      return this._buttons;
   }
   function dispose()
   {
      this.app = null;
      this.cursor.setChangeListener(null);
      this.cursor.setTargetRects([]);
      this.cursor = null;
      this.overlay = null;
      this._buttons = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function init()
   {
      this.initSafeZone();
      this._buttons = [];
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
   function onTargetChange(targetID)
   {
      var _loc3_ = 0;
      var _loc4_ = this.overlay.buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.overlay.buttons[_loc3_];
         if(_loc2_.enabled)
         {
            _loc2_.view.gotoAndStop(_loc2_.id != targetID ? "off" : "on");
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.enabled)
         {
            _loc2_.view.gotoAndStop(_loc2_.id != targetID ? "off" : "on");
         }
         _loc3_ = _loc3_ + 1;
      }
      if(targetID != -1 && targetID != this.prevTargetID)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Mouse_Over_Mission","DLC_GR_MOC_Computer_Sounds");
      }
      this.prevTargetID = targetID;
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
