class com.rockstargames.gtav.levelDesign.HANGAR_CARGO extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var bonusEarnings;
   var cargos;
   var currScreen;
   var currScreenID;
   var cursor;
   var deactivated;
   var displayConfig;
   var filledSpace;
   var inputReceived;
   var lastClickedButtonID;
   var launchTimestamp;
   var location;
   var organisationName;
   var organisations;
   var overlay;
   var rivalCratesStolen;
   var saleEarnings;
   var salesCompleted;
   var salesSuccessRate;
   var screenContainer;
   var sellAllPrice;
   var sellRemainingCooldown;
   var sellTotalCooldown;
   var stealCooldown;
   var stealSuccessRate;
   var stealsCompleted;
   var totalSpace;
   static var NUM_CARGO_TYPES = 8;
   static var DPAD_DOWN = 187;
   static var DPAD_UP = 188;
   static var DPAD_LEFT = 189;
   static var DPAD_RIGHT = 190;
   static var ACCEPT = 201;
   static var CANCEL = 202;
   static var X = 203;
   static var Y = 204;
   static var LB = 205;
   static var RB = 206;
   static var LT = 207;
   static var RT = 208;
   static var LEFT_MOUSE = 237;
   static var RIGHT_MOUSE = 238;
   static var SCROLL_UP_MOUSE = 241;
   static var SCROLL_DOWN_MOUSE = 242;
   static var KEY_DOWN = 300;
   static var KEY_UP = 301;
   static var OVERLAY_CANCEL = 0;
   static var OVERLAY_ACCEPT_AIR = 1;
   static var OVERLAY_ACCEPT_LAND = 38;
   static var STEAL_TYPE_0 = 2;
   static var STEAL_TYPE_1 = 3;
   static var STEAL_TYPE_2 = 4;
   static var STEAL_TYPE_3 = 5;
   static var STEAL_TYPE_4 = 6;
   static var STEAL_TYPE_5 = 7;
   static var STEAL_TYPE_6 = 8;
   static var STEAL_TYPE_7 = 9;
   static var STEAL_TYPE_8 = 10;
   static var SELL_CARGO = 11;
   static var STEAL_CARGO = 12;
   static var SELL_TYPE_0 = 13;
   static var SELL_TYPE_1 = 14;
   static var SELL_TYPE_2 = 15;
   static var SELL_TYPE_3 = 16;
   static var SELL_TYPE_4 = 17;
   static var SELL_TYPE_5 = 18;
   static var SELL_TYPE_6 = 19;
   static var SELL_TYPE_7 = 20;
   static var SELL_TYPE_8 = 21;
   static var GRAPH_BAR_1 = 22;
   static var GRAPH_BAR_2 = 23;
   static var GRAPH_BAR_3 = 24;
   static var GRAPH_BAR_4 = 25;
   static var GRAPH_BAR_5 = 26;
   static var GRAPH_BAR_6 = 27;
   static var GRAPH_BAR_7 = 28;
   static var GRAPH_BAR_8 = 29;
   static var ORGANISATION_0 = 30;
   static var ORGANISATION_1 = 31;
   static var ORGANISATION_2 = 32;
   static var ORGANISATION_3 = 33;
   static var ORGANISATION_4 = 34;
   static var OVERVIEW_TAB = 35;
   static var STEAL_TAB = 36;
   static var SELL_TAB = 37;
   var OVERVIEW_SCREEN = 0;
   var STEAL_SCREEN = 1;
   var SELL_SCREEN = 2;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.hangarCargo.OverviewScreen,com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen,com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen];
   static var fadeDirection = 1;
   function HANGAR_CARGO()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "HANGAR_CARGO";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.lastClickedButtonID = -1;
      this.currScreenID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.organisations = [];
      this.cargos = [];
      this.sellRemainingCooldown = 0;
      this.sellTotalCooldown = 0;
      this.stealCooldown = [0,0,0,0,0,0,0,0];
      this.launchTimestamp = getTimer();
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.hangarCargo.Overlay(_loc4_);
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.hangarCargo.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.showScreen(this.OVERVIEW_SCREEN);
   }
   function SET_STATS(organisationName, location, stealsCompleted, stealSuccessRate, salesCompleted, salesSuccessRate, rivalCratesStolen, saleEarnings, bonusEarnings, filledSpace, totalSpace, sellAllPrice)
   {
      this.organisationName = organisationName;
      this.location = location;
      this.stealsCompleted = stealsCompleted;
      this.stealSuccessRate = stealSuccessRate;
      this.salesCompleted = salesCompleted;
      this.salesSuccessRate = salesSuccessRate;
      this.rivalCratesStolen = rivalCratesStolen;
      this.saleEarnings = saleEarnings;
      this.bonusEarnings = bonusEarnings;
      this.filledSpace = filledSpace;
      this.totalSpace = totalSpace;
      this.sellAllPrice = sellAllPrice;
      this.currScreen.updateStats();
   }
   function ADD_CARGO(type, currentStockLevel, totalStockLevel, bonusPercent, sellPrice)
   {
      var _loc2_ = 0;
      var _loc3_ = this.cargos.length;
      while(_loc2_ < _loc3_)
      {
         if(this.cargos[_loc2_].type == type)
         {
            this.cargos.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.cargos.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Cargo(type,currentStockLevel,totalStockLevel,bonusPercent,sellPrice));
      this.currScreen.updateCargos();
   }
   function ADD_ACTIVE_ORGANISATION(name)
   {
      var _loc5_ = [];
      var _loc3_ = 1;
      var _loc4_;
      while(_loc3_ < arguments.length)
      {
         _loc4_ = arguments[_loc3_];
         if(_loc4_.length > 0)
         {
            _loc5_.push(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.organisations.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Organisation(name,_loc5_));
      this.currScreen.updateOrganisations();
   }
   function REMOVE_ACTIVE_ORGANISATION(name)
   {
      var _loc2_ = 0;
      var _loc3_ = this.organisations.length;
      while(_loc2_ < _loc3_)
      {
         if(this.organisations[_loc2_].name == name)
         {
            this.organisations.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.currScreen.updateOrganisations();
   }
   function UPDATE_STEAL_COOLDOWN(cargo1RemainingSeconds, cargo2RemainingSeconds, cargo3RemainingSeconds, cargo4RemainingSeconds, cargo5RemainingSeconds, cargo6RemainingSeconds, cargo7RemainingSeconds, cargo8RemainingSeconds)
   {
      this.stealCooldown[0] = cargo1RemainingSeconds;
      this.stealCooldown[1] = cargo2RemainingSeconds;
      this.stealCooldown[2] = cargo3RemainingSeconds;
      this.stealCooldown[3] = cargo4RemainingSeconds;
      this.stealCooldown[4] = cargo5RemainingSeconds;
      this.stealCooldown[5] = cargo6RemainingSeconds;
      this.stealCooldown[6] = cargo7RemainingSeconds;
      this.stealCooldown[7] = cargo8RemainingSeconds;
      this.currScreen.updateCooldown();
   }
   function UPDATE_SELL_COOLDOWN(remainingSeconds, totalSeconds)
   {
      this.sellRemainingCooldown = remainingSeconds;
      this.sellTotalCooldown = totalSeconds;
      this.currScreen.updateCooldown();
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function SHOW_OVERLAY(title, message, acceptAirButtonLabel, cancelButtonLabel, acceptLandButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(acceptLandButtonLabel == undefined)
      {
         acceptLandButtonLabel = "";
      }
      var _loc3_ = getTimer() - this.launchTimestamp < 500;
      this.overlay.show(title,message,acceptAirButtonLabel,acceptLandButtonLabel,cancelButtonLabel,_loc3_);
      this.updateButtons();
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.hide();
      this.updateButtons();
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.inputReceived)
      {
         return this.cursor.getTargetIDUnderCursor();
      }
      return this.lastClickedButtonID;
   }
   function GET_CURRENT_ROLLOVER()
   {
      return this.cursor.getTargetIDUnderCursor();
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.inputReceived = true;
      var _loc3_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.hangarCargo.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.hangarCargo.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.hangarCargo.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.hangarCargo.Cursor.LEFT:
            _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.HANGAR_CARGO.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function SET_INPUT_RELEASE_EVENT(inputID)
   {
      this.currScreen.handleButtonInputRelease(inputID);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this.cursor.moveBy(x,y);
      }
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_CURSOR_SPEED(speed)
   {
      this.cursor.setSpeed(speed);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this.cursor.moveTo(x,y,true);
      this.currScreen.handleMouseInput(x,y);
   }
   function showScreen(screenID)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.cursor.setState(com.rockstargames.gtav.levelDesign.hangarCargo.Cursor.STATE_ARROW);
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.overlay);
         this.currScreenID = screenID;
         this.inputReceived = false;
         this.updateButtons();
      }
   }
   function updateButtons()
   {
      if(this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.overlay.buttons);
      }
      else if(this.currScreen)
      {
         this.cursor.setTargetRects(this.currScreen.buttons);
      }
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function formatPercentage(value)
   {
      return int(value * 100) / 100 + "%";
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   static function formatTime(seconds)
   {
      var _loc1_ = seconds % 60;
      var _loc2_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc6_ = Math.floor((seconds - _loc1_ - _loc2_ * 60) / 3600);
      var _loc4_ = ("0" + _loc2_).substr(-2);
      var _loc5_ = ("0" + _loc1_).substr(-2);
      return _loc6_ + ":" + _loc4_ + ":" + _loc5_;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc3_;
      if(!isNaN(letterSpacing))
      {
         _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      var _loc6_;
      var _loc2_;
      if(tf.textWidth > tf._width)
      {
         _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "GTAO_SMG_Hangar_Computer_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
}
