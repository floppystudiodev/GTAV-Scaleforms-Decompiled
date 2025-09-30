class com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var currScreenID;
   var cursor;
   var deactivated;
   var displayConfig;
   var imageManager;
   var inputReceived;
   var navigationPanel;
   var overlay;
   var screenContainer;
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
   static var OVERLAY_ACCEPT = 1;
   static var NAV_SETUP = 2;
   static var NAV_RESUPPLY = 3;
   static var NAV_RESEARCH = 4;
   static var NAV_STAFF = 5;
   static var NAV_UPGRADES = 6;
   static var NAV_SHUT_DOWN = 7;
   static var NAV_RESTART = 8;
   static var SELL_STOCK_BC = 9;
   static var SELL_STOCK_LS = 10;
   static var BUY_SUPPLIES = 11;
   static var STEAL_SUPPLIES = 12;
   static var UPGRADE_1 = 13;
   static var UPGRADE_2 = 14;
   static var UPGRADE_3 = 15;
   static var STAFF_MANUFACTURING = 16;
   static var STAFF_RESEARCH = 17;
   static var STAFF_BOTH = 18;
   static var RESEARCH = 19;
   static var VIEW_UNLOCKS = 20;
   static var NAV_SELL = 21;
   static var UNLOCK_BASE = 22;
   static var TAB_ALL = 1000;
   static var TAB_UNLOCKED = 1001;
   static var TAB_LOCKED = 1002;
   static var RESEARCH_TOOLTIP = 1003;
   static var STATUS_UNOWNED = 0;
   static var STATUS_ACTIVE = 1;
   static var STATUS_PENDING_RESTART = 2;
   static var STATUS_SUSPENDED = 3;
   static var STATUS_NOT_SET_UP = 4;
   var LOGIN_SCREEN = 0;
   var STATS_SCREEN = 1;
   var RESUPPLY_SCREEN = 2;
   var RESEARCH_SCREEN = 3;
   var STAFF_SCREEN = 4;
   var UPGRADES_SCREEN = 5;
   var UNLOCKS_SCREEN = 6;
   var SELL_SCREEN = 7;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.disruptionLogistics.LoginScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResupplyScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.StaffScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen,com.rockstargames.gtav.levelDesign.disruptionLogistics.SellScreen];
   var userName = "";
   var orgName = "";
   var txd = "";
   var bunkerName = "";
   var bunkerLocation = "";
   var status = 0;
   var stockLevel = 0;
   var researchProgress = 0;
   var suppliesLevel = 0;
   var totalEarnings = 0;
   var totalSales = 0;
   var resupplySuccessRate = 0;
   var sellSuccessRateBC = 0;
   var sellSuccessRateLS = 0;
   var numUnitsManufactured = 0;
   var numResearchUnlocked = 0;
   var numResearchTotal = 0;
   var staffDistribution = 0;
   var sellState = 0;
   var sellLSValue = 0;
   var sellBCValue = 0;
   var resupplyCost = 0;
   var resupplySaleCost = -1;
   var resupplyButtonState = 0;
   var stealButtonState = 0;
   var upgrade1Cost = 0;
   var upgrade1ButtonState = 0;
   var upgrade2Cost = 0;
   var upgrade2ButtonState = 0;
   var upgrade3Cost = 0;
   var upgrade3ButtonState = 0;
   var upgrade1SaleCost = -1;
   var upgrade2SaleCost = -1;
   var upgrade3SaleCost = -1;
   var fastTrackCost = 0;
   var fastTrackSaleCost = -1;
   var fastTrackState = 0;
   var researchTexture = "";
   var researchState = 0;
   var researchDescription = "";
   var researchHeading = "";
   var researchUnlockStates = [];
   var researchUnlockTextures = [];
   var researchUnlockTitles = [];
   var researchUnlockDescriptions = [];
   function DISRUPTION_LOGISTICS()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DISRUPTION_LOGISTICS";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.disruptionLogistics.ImageManager();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.attachMovie("navigationPanel","navigationPanel",this.CONTENT.getNextHighestDepth());
      this.navigationPanel = new com.rockstargames.gtav.levelDesign.disruptionLogistics.NavigationPanel(_loc5_);
      var _loc4_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay(_loc4_);
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor(_loc3_,_loc2_,this.displayConfig);
   }
   function ACTIVATE()
   {
      this.deactivated = false;
   }
   function DEACTIVATE()
   {
      this.deactivated = true;
   }
   function APP_IS_DEACTIVATED()
   {
      return this.deactivated;
   }
   function SET_STATS(userName, orgName, txd, bunkerName, bunkerLocation, status, stockLevel, researchProgress, suppliesLevel, totalEarnings, totalSales, resupplySuccessRate, sellSuccessRateBC, sellSuccessRateLS, numUnitsManufactured, numResearchUnlocked, numResearchTotal, staffDistribution)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.userName = userName;
      this.orgName = orgName;
      this.txd = txd;
      this.bunkerName = bunkerName;
      this.bunkerLocation = bunkerLocation;
      this.status = status;
      this.stockLevel = stockLevel;
      this.researchProgress = researchProgress;
      this.suppliesLevel = suppliesLevel;
      this.totalEarnings = totalEarnings;
      this.totalSales = totalSales;
      this.resupplySuccessRate = resupplySuccessRate;
      this.sellSuccessRateBC = sellSuccessRateBC;
      this.sellSuccessRateLS = sellSuccessRateLS;
      this.numUnitsManufactured = numUnitsManufactured;
      this.numResearchUnlocked = numResearchUnlocked;
      this.numResearchTotal = numResearchTotal;
      this.staffDistribution = staffDistribution;
      if(this.currScreenID != -1)
      {
         this.currScreen.updateStats();
      }
      this.navigationPanel.setInfo(this);
   }
   function SET_RESUPPLIES(resupplyCost, resupplyButtonState, stealButtonState, resupplySaleCost)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.resupplyCost = resupplyCost;
      this.resupplyButtonState = resupplyButtonState;
      this.stealButtonState = stealButtonState;
      this.resupplySaleCost = resupplySaleCost != undefined ? resupplySaleCost : -1;
      if(this.currScreenID == this.RESUPPLY_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function SET_UPGRADES(upgrade1Cost, upgrade1ButtonState, upgrade2Cost, upgrade2ButtonState, upgrade3Cost, upgrade3ButtonState, upgrade1SaleCost, upgrade2SaleCost, upgrade3SaleCost)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.upgrade1Cost = upgrade1Cost;
      this.upgrade1ButtonState = upgrade1ButtonState;
      this.upgrade2Cost = upgrade2Cost;
      this.upgrade2ButtonState = upgrade2ButtonState;
      this.upgrade3Cost = upgrade3Cost;
      this.upgrade3ButtonState = upgrade3ButtonState;
      this.upgrade1SaleCost = upgrade1SaleCost != undefined ? upgrade1SaleCost : -1;
      this.upgrade2SaleCost = upgrade2SaleCost != undefined ? upgrade2SaleCost : -1;
      this.upgrade3SaleCost = upgrade3SaleCost != undefined ? upgrade3SaleCost : -1;
      if(this.currScreenID == this.UPGRADES_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function SET_RESEARCH(fastTrackCost, researchProgress, texture, state, description, heading, fastTrackSaleCost)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.fastTrackCost = fastTrackCost;
      this.researchProgress = researchProgress;
      this.researchTexture = texture;
      this.researchState = state;
      this.researchDescription = description;
      this.researchHeading = heading;
      this.fastTrackSaleCost = fastTrackSaleCost != undefined ? fastTrackSaleCost : -1;
      this.currScreen.updateStats();
      if(this.currScreenID == this.RESEARCH_SCREEN || this.currScreenID == this.UNLOCKS_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function ADD_RESEARCH_UNLOCKABLE(state, texture, title, description, index)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(index == undefined || index < 0)
      {
         index = this.researchUnlockStates.length;
      }
      this.researchUnlockStates[index] = state;
      this.researchUnlockTextures[index] = texture;
      this.researchUnlockTitles[index] = title;
      this.researchUnlockDescriptions[index] = description;
      if(this.currScreenID == this.UNLOCKS_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function ACTIVATE_FAST_TRACK()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.researchState = 2;
      this.researchProgress = 100;
      if(this.currScreenID == this.RESEARCH_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen(this.currScreen).activateFastTrack();
      }
      else
      {
         this.currScreen.updateStats();
      }
   }
   function SET_SELL_PRICES(sellLSValue, sellBCValue)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.sellLSValue = sellLSValue;
      this.sellBCValue = sellBCValue;
      if(this.currScreenID == this.SELL_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function SET_BUTTON_STATES(setup, resupply, research, staff, upgrades, shutDown, restart, sell, fastTrack, purchaseSupplies)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.sellState = sell;
      this.fastTrackState = fastTrack;
      this.resupplyButtonState = purchaseSupplies;
      this.navigationPanel.setButtonStates(setup,resupply,research,staff,upgrades,shutDown,restart,sell);
      this.updateButtons();
      if(this.currScreenID == -1)
      {
         this.showScreen(this.LOGIN_SCREEN);
      }
      else if(this.currScreenID == this.RESEARCH_SCREEN || this.currScreenID == this.RESUPPLY_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function SHOW_SCREEN(screenID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.showScreen(screenID);
   }
   function SHOW_OVERLAY(message, accept, cancel, image, title)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.show(message,accept,cancel,title,image,this.imageManager);
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
      return -1;
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
         case com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.LEFT:
            _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
               break;
            }
            if(this.currScreenID == this.UNLOCKS_SCREEN)
            {
               this.SHOW_SCREEN(this.RESEARCH_SCREEN);
               break;
            }
            this.SHOW_SCREEN(this.STATS_SCREEN);
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
      if(this.currScreen)
      {
         if(this.currScreenID != this.LOGIN_SCREEN)
         {
            this.imageManager.clearImageQueue();
         }
         this.currScreen.dispose();
         this.navigationPanel.show();
      }
      this.cursor.setState(com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.STATE_ARROW);
      this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
      this.currScreenID = screenID;
      this.inputReceived = false;
      this.updateButtons();
   }
   function updateButtons()
   {
      if(this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.overlay.buttons);
      }
      else if(this.currScreen)
      {
         this.cursor.setTargetRects(this.currScreen.buttons.concat(this.navigationPanel.buttons));
      }
      else
      {
         this.cursor.setTargetRects(this.navigationPanel.buttons);
      }
   }
   function disableAllButtons()
   {
      this.DEACTIVATE();
      this.cursor.setState(com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.STATE_BUSY);
   }
   function enableAllButtons()
   {
      this.ACTIVATE();
      this.cursor.setState(com.rockstargames.gtav.levelDesign.disruptionLogistics.Cursor.STATE_ARROW);
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
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
         soundSet = "DLC_Biker_Computer_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
}
