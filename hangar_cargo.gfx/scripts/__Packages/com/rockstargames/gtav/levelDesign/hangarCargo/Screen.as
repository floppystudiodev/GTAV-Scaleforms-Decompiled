class com.rockstargames.gtav.levelDesign.hangarCargo.Screen
{
   var _buttons;
   var app;
   var cursor;
   var overlay;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_HEIGHT;
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
   function handleJoystickInput(isLeftStick, x, y)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function onBusinessListChange()
   {
   }
   function update()
   {
   }
   function get buttons()
   {
      return this._buttons;
   }
   function updateStats()
   {
   }
   function updateCargos()
   {
   }
   function updateOrganisations()
   {
   }
   function updateCooldown()
   {
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
      this._buttons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERVIEW_TAB,this.view.overviewTab,"HC_OVERVIEW"));
      this._buttons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.STEAL_TAB,this.view.stealTab,"HC_STEAL"));
      this._buttons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.SELL_TAB,this.view.sellTab,"HC_SELL"));
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.hangarCargo.Screen.STAGE_HEIGHT - _loc2_;
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
