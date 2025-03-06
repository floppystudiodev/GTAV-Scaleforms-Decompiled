class com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var selectedBusinessID;
   var currScreenID;
   var businesses;
   var userName;
   var inputReceived;
   var deactivated;
   var startProductionEnabled;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var cursor;
   var currScreen;
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
   var SPLASH_SCREEN = 0;
   var BUSINESSES_SCREEN = 1;
   var SUMMARY_SCREEN = 2;
   var DETAILS_SCREEN = 3;
   var MANAGEMENT_SCREEN = 4;
   var LOGIN_SCREEN = 5;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.bikerBusinesses.SplashScreen,com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen,com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen,com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen,com.rockstargames.gtav.levelDesign.bikerBusinesses.LoginScreen];
   function BIKER_BUSINESSES()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "BIKER_BUSINESSES";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.selectedBusinessID = -1;
      this.currScreenID = -1;
      this.businesses = [];
      this.userName = "";
      this.inputReceived = false;
      this.deactivated = false;
      this.startProductionEnabled = true;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.bikerBusinesses.ImageManager();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor(_loc3_,_loc2_,this.displayConfig);
   }
   function ACTIVATE()
   {
      this.deactivated = false;
   }
   function DEACTIVATE()
   {
      this.deactivated = true;
   }
   function SET_PLAYER_DATA(userName, isAdmin)
   {
      this.userName = userName;
      if(this.currScreenID == -1)
      {
         this.showScreen(!isAdmin ? this.SPLASH_SCREEN : this.LOGIN_SCREEN);
      }
   }
   function ADD_BUSINESS(id, type, txd, location, description, status, price, salePrice, stockLevel, stockValue, suppliesLevel, canResupply, totalSales, timesRaided, successfulSales, resupplyButtonEnabled, resupplyCost, resupplySaleCost, isInStarterPack)
   {
      var _loc5_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Business(id,type,txd,location,description,status,price,salePrice,stockLevel,stockValue,suppliesLevel,canResupply,totalSales,timesRaided,successfulSales,resupplyButtonEnabled,resupplyCost,resupplySaleCost,isInStarterPack);
      var _loc4_ = false;
      var _loc2_ = 0;
      var _loc3_ = this.businesses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.businesses[_loc2_].id == id)
         {
            this.businesses.splice(_loc2_,1,_loc5_);
            _loc4_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc4_)
      {
         this.businesses.push(_loc5_);
      }
      if(this.currScreen)
      {
         this.currScreen.onBusinessListChange();
      }
   }
   function ADD_BUSINESS_STATS(id, resupplySuccess, sellSuccessLS, sellSuccessBC, ceasedSupplies, ceasedCapacity)
   {
      var _loc2_ = 0;
      var _loc3_ = this.businesses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.businesses[_loc2_].id == id)
         {
            this.businesses[_loc2_].setStats(resupplySuccess,sellSuccessLS,sellSuccessBC,ceasedSupplies,ceasedCapacity);
            if(this.currScreen)
            {
               this.currScreen.onBusinessListChange();
            }
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function ADD_BUSINESS_UPGRADE(id, index, description, price, txd, salePrice)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.addUpgrade(index,description,price,txd,salePrice);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).addUpgrade(index,description,price,txd,salePrice);
         }
      }
   }
   function REMOVE_BUSINESS_UPGRADE(id, index)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.removeUpgrade(index);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).removeUpgrade(index);
         }
      }
   }
   function SET_BUSINESS_UPGRADE_STATUS(id, index, isEnabled)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.setUpgradeStatus(index,isEnabled);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).setUpgradeStatus(index,isEnabled);
         }
      }
   }
   function ADD_BUSINESS_BUYER(id, index, buyerName, amount, price)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.addBuyer(index,buyerName,amount,price);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).addBuyer(index,buyerName,amount,price);
         }
      }
   }
   function REMOVE_BUSINESS_BUYER(id, index)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.removeBuyer(index);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).removeBuyer(index);
         }
      }
   }
   function SET_BUSINESS_BUYER_STATUS(id, index, isEnabled)
   {
      var _loc2_ = this.getBusinessByID(id);
      if(_loc2_)
      {
         _loc2_.setBuyerStatus(index,isEnabled);
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen && id == this.selectedBusinessID)
         {
            com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).setBuyerStatus(index,isEnabled);
         }
      }
   }
   function SET_START_PRODUCTION_STATUS(isEnabled)
   {
      this.startProductionEnabled = isEnabled;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen)
      {
         com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).setStartProductionStatus(isEnabled);
      }
   }
   function SHOW_OVERLAY(messageLabel, acceptButtonLabel, cancelButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen)
      {
         com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen(this.currScreen).showOverlay(messageLabel,acceptButtonLabel,cancelButtonLabel);
      }
      else if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen)
      {
         com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).showOverlay(messageLabel,acceptButtonLabel,cancelButtonLabel);
      }
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen)
      {
         com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen(this.currScreen).hideOverlay();
      }
      else if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen)
      {
         com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen(this.currScreen).hideOverlay();
      }
   }
   function SHOW_HOMEPAGE()
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen || this.currScreen instanceof com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen)
      {
         this.showScreen(this.BUSINESSES_SCREEN);
      }
   }
   function GET_SELECTED_BUSINESS_ID()
   {
      return this.selectedBusinessID;
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
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor.LEFT:
            var _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Mouse_Move_Cursor");
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
      if(this.currScreen)
      {
         this.imageManager.clearImageQueue();
         this.currScreen.dispose();
      }
      this.cursor.setState(com.rockstargames.gtav.levelDesign.bikerBusinesses.Cursor.STATE_ARROW);
      this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
      this.currScreenID = screenID;
      this.inputReceived = false;
   }
   function getBusinessByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.businesses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.businesses[_loc2_].id == id)
         {
            return this.businesses[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function quit()
   {
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
