class com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var app;
   var cursor;
   var _buttons;
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
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, cursor, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      this._buttons = [];
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
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
      var _loc2_ = undefined;
      switch(this.app.status)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_UNOWNED:
            _loc2_ = "UA_STATUS_UNOWNED";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_ACTIVE:
            _loc2_ = "UA_STATUS_ACTIVE";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_PENDING_RESTART:
            _loc2_ = "UA_STATUS_RESTART";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_SUSPENDED:
            _loc2_ = "UA_STATUS_SUSPENDED";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_NOT_SET_UP:
            _loc2_ = "UA_STATUS_NOT_SET_UP";
      }
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.status,_loc2_);
      this.view.status._x = this.view.statusLabel._x + this.view.statusLabel.textWidth + 10;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.stockMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.researchMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.suppliesMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ORANGE);
      this.view.stockMeter.bar._xscale = Math.max(0,Math.min(this.app.stockLevel,100));
      this.view.researchMeter.bar._xscale = Math.max(0,Math.min(this.app.researchProgress,100));
      this.view.suppliesMeter.bar._xscale = Math.max(0,Math.min(this.app.suppliesLevel,100));
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
   function init()
   {
      this.view.header.login.text = this.app.orgName;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.header.loginLabel,"UA_LOGGED_IN");
      this.view.header.loginLabel._x = this.view.header.login._x + this.view.header.login._width - this.view.header.login.textWidth - this.view.header.loginLabel.textWidth - 10;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.statusLabel,"UA_STATUS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.stockLabel,"UA_STOCK");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.researchProgressLabel,"UA_RESEARCH_PROGRESS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.suppliesLabel,"UA_SUPPLIES");
      this.updateStats();
   }
   function initSafeZone()
   {
      this.safeZoneLeft = this.app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_WIDTH;
      this.safeZoneRight = this.app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_WIDTH;
      this.safeZoneTop = this.app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_HEIGHT;
      this.safeZoneBottom = this.app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_HEIGHT;
      var _loc2_ = 10;
      if(this.safeZoneLeft < _loc2_)
      {
         this.safeZoneLeft = _loc2_;
      }
      if(this.safeZoneRight > com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_WIDTH - _loc2_)
      {
         this.safeZoneRight = com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_WIDTH - _loc2_;
      }
      if(this.safeZoneTop < _loc2_)
      {
         this.safeZoneTop = _loc2_;
      }
      if(this.safeZoneBottom > com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_HEIGHT - _loc2_)
      {
         this.safeZoneBottom = com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen.STAGE_HEIGHT - _loc2_;
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
