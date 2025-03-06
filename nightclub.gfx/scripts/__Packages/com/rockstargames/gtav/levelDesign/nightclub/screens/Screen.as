class com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var app;
   var cursor;
   var persistentContent;
   var overlay;
   var view;
   var _buttons;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var safeZoneBottom;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, cursor, persistentContent, overlay, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      this.persistentContent = persistentContent;
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
   function customCancelResponse()
   {
      return false;
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
      this.persistentContent = null;
      this._buttons = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function init()
   {
      this.initSafeZone();
      this._buttons = [].concat(this.persistentContent.navButtons);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.nightclub.screens.Screen.STAGE_HEIGHT - _loc2_;
      }
   }
   function checkNavigationButtons(id)
   {
      var _loc2_ = true;
      switch(id)
      {
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.HOME_SCREEN:
            this.app.showScreen(this.app.HOME_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.NIGHTCLUB_SCREEN:
            this.app.showScreen(this.app.NIGHTCLUB_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.DJ_SCREEN:
            this.app.showScreen(this.app.DJ_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.WAREHOUSE_SCREEN:
            this.app.showScreen(this.app.WAREHOUSE_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.UPGRADES_SCREEN:
            this.app.showScreen(this.app.UPGRADES_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.SELL_SCREEN:
            this.app.showScreen(this.app.SELL_SCREEN);
            break;
         default:
            _loc2_ = false;
      }
      return false;
   }
   function onTargetChange(targetID)
   {
      if(this.overlay.isShowing)
      {
         this.overlay.updateSelectedButton(targetID);
      }
      else
      {
         var _loc3_ = 0;
         var _loc4_ = this._buttons.length;
         while(_loc3_ < _loc4_)
         {
            var _loc2_ = this._buttons[_loc3_];
            if(_loc2_.enabled)
            {
               _loc2_.view.gotoAndStop(_loc2_.id != targetID ? "off" : "on");
            }
            _loc3_ = _loc3_ + 1;
         }
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
