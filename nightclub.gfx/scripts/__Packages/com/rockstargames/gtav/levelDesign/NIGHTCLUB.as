class com.rockstargames.gtav.levelDesign.NIGHTCLUB extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var lastClickedButtonID;
   var currScreenID;
   var prevScreenID;
   var inputReceived;
   var deactivated;
   var launchTimestamp;
   var navHistory;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var persistentContent;
   var overlay;
   var cursor;
   var gamerName;
   var popularity;
   var propertyDictionary;
   var propertyTexture;
   var propertyLocation;
   var organizationType;
   var organizationName;
   var mugshotTexture;
   var stock;
   var jobsCompleted;
   var nightclubEarnings;
   var salesCompleted;
   var warehouseEarnings;
   var totalEarnings;
   var totalStockValue;
   var currentCustomers;
   var averageCustomers;
   var dailyIncome;
   var safeCurrent;
   var safeCapacity;
   var vipAppearances;
   var dayGraphValues;
   var dayGraphMax;
   var managementCooldown;
   var djs;
   var unitsAccrued;
   var unitsSold;
   var unitsAvailable;
   var technicians;
   var assignments;
   var upgrades;
   var clubStyle;
   var buyers;
   var sellCooldown;
   var clubNameID;
   var currScreen;
   static var NUM_DJS = 4;
   static var NUM_STOCK_TYPES = 7;
   static var NUM_UPGRADES = 3;
   static var NUM_TECHNICIANS = 5;
   static var NUM_BUYERS = 3;
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
   var HOME_SCREEN = 0;
   var NIGHTCLUB_SCREEN = 1;
   var DJ_SCREEN = 2;
   var WAREHOUSE_SCREEN = 3;
   var UPGRADES_SCREEN = 4;
   var SELL_SCREEN = 5;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.nightclub.screens.HomeScreen,com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen,com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen,com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen,com.rockstargames.gtav.levelDesign.nightclub.screens.UpgradesScreen,com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen];
   function NIGHTCLUB()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "NIGHTCLUB";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.lastClickedButtonID = -1;
      this.currScreenID = -1;
      this.prevScreenID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.launchTimestamp = getTimer();
      this.navHistory = [-1];
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.nightclub.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc6_ = this.CONTENT.attachMovie("persistentContent","persistentContent",this.CONTENT.getNextHighestDepth());
      this.persistentContent = new com.rockstargames.gtav.levelDesign.nightclub.PersistentContent(this,_loc6_);
      var _loc5_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.nightclub.Overlay(_loc5_);
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.nightclub.Cursor(_loc4_,_loc3_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_ARROW);
      this.gamerName = "";
      this.popularity = 0;
      this.propertyDictionary = "";
      this.propertyTexture = "";
      this.propertyLocation = "";
      this.organizationType = "";
      this.organizationName = "";
      this.mugshotTexture = "";
      this.stock = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         this.stock.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.Stock());
         _loc2_ = _loc2_ + 1;
      }
      this.jobsCompleted = 0;
      this.nightclubEarnings = 0;
      this.salesCompleted = 0;
      this.warehouseEarnings = 0;
      this.totalEarnings = 0;
      this.totalStockValue = 0;
      this.currentCustomers = 0;
      this.averageCustomers = 0;
      this.dailyIncome = 0;
      this.safeCurrent = 0;
      this.safeCapacity = 0;
      this.vipAppearances = 0;
      this.dayGraphValues = [0,0,0,0,0,0,0];
      this.dayGraphMax = 0;
      this.managementCooldown = 0;
      this.djs = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         this.djs.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.DJ());
         _loc2_ = _loc2_ + 1;
      }
      this.unitsAccrued = 0;
      this.unitsSold = 0;
      this.unitsAvailable = 0;
      this.technicians = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_TECHNICIANS)
      {
         this.technicians.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.Technician());
         _loc2_ = _loc2_ + 1;
      }
      this.assignments = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         this.assignments.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.Assignment());
         _loc2_ = _loc2_ + 1;
      }
      this.upgrades = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_UPGRADES)
      {
         this.upgrades.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade());
         _loc2_ = _loc2_ + 1;
      }
      this.clubStyle = 0;
      this.buyers = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_BUYERS)
      {
         this.buyers.push(new com.rockstargames.gtav.levelDesign.nightclub.structs.Buyer());
         _loc2_ = _loc2_ + 1;
      }
      this.sellCooldown = 0;
   }
   function SET_GENERAL_STATS(gamerName, propertyDictionary, propertyTexture, clubNameID, propertyLocation, organizationType, organizationName, popularity, totalStockValue, mugshotTexture, clubStyle)
   {
      this.gamerName = gamerName;
      this.propertyDictionary = propertyDictionary;
      this.propertyTexture = propertyTexture;
      this.clubNameID = clubNameID;
      this.propertyLocation = propertyLocation;
      this.organizationType = organizationType;
      this.organizationName = organizationName;
      this.popularity = popularity;
      this.totalStockValue = totalStockValue;
      this.mugshotTexture = mugshotTexture;
      this.clubStyle = clubStyle != undefined ? clubStyle : 0;
      this.persistentContent.update();
   }
   function SET_HOMEPAGE_STATS(jobsCompleted, nightclubEarnings, salesCompleted, warehouseEarnings, totalEarnings)
   {
      this.jobsCompleted = jobsCompleted;
      this.nightclubEarnings = nightclubEarnings;
      this.salesCompleted = salesCompleted;
      this.warehouseEarnings = warehouseEarnings;
      this.totalEarnings = totalEarnings;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.HomeScreen || this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen)
      {
         this.currScreen.update();
      }
   }
   function SET_NIGHTCLUB_STATS(currentCustomers, averageCustomers, dailyIncome, safeCurrent, safeCapacity, vipAppearances, dayGraphMon, dayGraphTue, dayGraphWed, dayGraphThu, dayGraphFri, dayGraphSat, dayGraphSun, dayGraphMax)
   {
      this.currentCustomers = currentCustomers;
      this.averageCustomers = averageCustomers;
      this.dailyIncome = dailyIncome;
      this.safeCurrent = safeCurrent;
      this.safeCapacity = safeCapacity;
      this.vipAppearances = vipAppearances;
      this.dayGraphValues = [dayGraphMon,dayGraphTue,dayGraphWed,dayGraphThu,dayGraphFri,dayGraphSat,dayGraphSun];
      this.dayGraphMax = dayGraphMax;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_MANAGEMENT_COOLDOWN(managementCooldown)
   {
      this.managementCooldown = managementCooldown;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen)
      {
         this.currScreen.update();
      }
   }
   function SET_WAREHOUSE_STATS(unitsAccrued, unitsSold, unitsAvailable)
   {
      this.unitsAccrued = unitsAccrued;
      this.unitsSold = unitsSold;
      this.unitsAvailable = unitsAvailable != undefined ? unitsAvailable : 0;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_DJ(index, state, dummy, name, unused, cost, saleCost, textureDictionary, texture, isMale, isSolo)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         return undefined;
      }
      var _loc2_ = this.djs[index];
      _loc2_.state = state;
      _loc2_.name = name;
      _loc2_.cost = cost;
      _loc2_.saleCost = saleCost;
      _loc2_.textureDictionary = textureDictionary;
      _loc2_.texture = texture;
      _loc2_.isMale = isMale !== false;
      _loc2_.isSolo = isSolo !== false;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_STOCK(index, currLevel, maxLevel, sellPrice)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         return undefined;
      }
      this.stock[index].currLevel = currLevel;
      this.stock[index].maxLevel = maxLevel;
      this.stock[index].sellPrice = sellPrice;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.HomeScreen || this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_TECHNICIAN(index, assignmentIndex, isAvailable, isOnSale)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_TECHNICIANS)
      {
         return undefined;
      }
      this.technicians[index].assignmentIndex = assignmentIndex;
      this.technicians[index].isAvailable = isAvailable;
      this.technicians[index].isOnSale = isOnSale;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen)
      {
         this.currScreen.update();
      }
   }
   function SELECT_TECHNICIAN(index)
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen)
      {
         com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen(this.currScreen).selectTechnician(index);
      }
   }
   function UPDATE_ASSIGNMENT(index, available, isAtCapacity)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         return undefined;
      }
      this.assignments[index].available = available;
      this.assignments[index].isAtCapacity = isAtCapacity;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_UPGRADE(index, cost, saleCost, availability)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_UPGRADES)
      {
         return undefined;
      }
      this.upgrades[index].cost = cost;
      this.upgrades[index].saleCost = saleCost;
      this.upgrades[index].availability = availability;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.UpgradesScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_BUYER(index, name, price, cargoType0, cargoAmount0, cargoType1, cargoAmount1, cargoType2, cargoAmount2)
   {
      if(index < 0 || index >= com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_BUYERS)
      {
         return undefined;
      }
      this.buyers[index].name = name;
      this.buyers[index].price = price;
      this.buyers[index].cargoType0 = cargoType0;
      this.buyers[index].cargoAmount0 = cargoAmount0;
      this.buyers[index].cargoType1 = cargoType1;
      this.buyers[index].cargoAmount1 = cargoAmount1;
      this.buyers[index].cargoType2 = cargoType2;
      this.buyers[index].cargoAmount2 = cargoAmount2;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen)
      {
         this.currScreen.update();
      }
   }
   function UPDATE_SELL_COOLDOWN(sellCooldown)
   {
      this.sellCooldown = sellCooldown;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen)
      {
         this.currScreen.update();
      }
   }
   function SET_AUDIO_BUTTON(index, isPlaying)
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen)
      {
         com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen(this.currScreen).updateAudioButton(index,isPlaying);
      }
   }
   function RESET_AUDIO_BUTTONS()
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen)
      {
         com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen(this.currScreen).resetAudioButtons();
      }
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function SHOW_OVERLAY(title, message, acceptButtonLabel, cancelButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      var _loc2_ = getTimer() - this.launchTimestamp < 500;
      this.overlay.show(title,message,acceptButtonLabel,cancelButtonLabel,_loc2_);
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
   function IS_HISTORY_EMPTY()
   {
      return this.navHistory.length == 0;
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.inputReceived = true;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.nightclub.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.nightclub.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.nightclub.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.nightclub.Cursor.LEFT:
            var _loc4_ = this.cursor.setTarget(inputID);
            if(_loc4_)
            {
               com.rockstargames.gtav.levelDesign.NIGHTCLUB.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
            else if(!this.currScreen.customCancelResponse())
            {
               if(this.navHistory.length > 0)
               {
                  var _loc2_ = Number(this.navHistory.pop());
                  if(_loc2_ != -1)
                  {
                     this.showScreen(_loc2_);
                     this.navHistory.pop();
                  }
               }
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
            this.navHistory.push(this.currScreenID);
            this.currScreen.dispose();
         }
         this.cursor.setState(com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_ARROW);
         this.prevScreenID = this.currScreenID;
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.persistentContent,this.overlay);
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
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
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
      var _loc3_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc5_ = Math.floor((seconds - _loc1_ - _loc3_ * 60) / 3600);
      var _loc2_ = ("0" + _loc3_).substr(-2);
      var _loc4_ = ("0" + _loc1_).substr(-2);
      return _loc5_ != 0 ? _loc5_ + ":" + _loc2_ + ":" + _loc4_ : _loc2_ + ":" + _loc4_;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      if(!isNaN(letterSpacing))
      {
         var _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      if(tf.textWidth > tf._width)
      {
         var _loc6_ = tf._width;
         tf.autoSize = autoSize;
         var _loc2_ = txt.length;
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
