class com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT extends com.rockstargames.ui.core.BaseScreenLayout
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
   var cabinets;
   var upgrades;
   var displayConfig;
   var imageManager;
   var persistentContent;
   var screenContainer;
   var arcadeImage;
   var overlay;
   var cursor;
   var gamername;
   var mugshot;
   var location;
   var totalEarnings;
   var currScreen;
   var selectedCabinet;
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
   var CABINETS_SCREEN = 0;
   var UPGRADES_SCREEN = 1;
   var DETAILS_SCREEN = 2;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen,com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen,com.rockstargames.gtav.levelDesign.arcadeManagement.screens.DetailsScreen];
   function ARCADE_MANAGEMENT()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "ARCADE_MANAGEMENT";
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
      this.cabinets = [];
      this.upgrades = [];
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.arcadeManagement.ImageManager(this._name);
      var _loc6_ = this.CONTENT.attachMovie("persistentContent","persistentContent",this.CONTENT.getNextHighestDepth());
      this.persistentContent = new com.rockstargames.gtav.levelDesign.arcadeManagement.PersistentContent(this,_loc6_);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      this.arcadeImage = this.CONTENT.attachMovie("arcadeImage","arcadeImage",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.arcadeManagement.Overlay(_loc5_);
      var _loc3_ = this.CONTENT.attachMovie("scanlineOverlay","scanlineOverlay",this.CONTENT.getNextHighestDepth());
      _loc3_._alpha = 30;
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor(_loc4_,_loc2_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.STATE_ARROW);
   }
   function SET_PLAYER_DATA(gamername, mugshot, location, arcadeTexture, totalEarnings)
   {
      this.gamername = gamername;
      this.mugshot = mugshot;
      this.location = location;
      this.totalEarnings = totalEarnings;
      this.currScreen.updateInfoPanel();
      this.imageManager.addImage(arcadeTexture,arcadeTexture + "_EXT",this.arcadeImage.image);
   }
   function ADD_CABINET(id, name, description, texture, price, salePrice, owned)
   {
      var _loc2_ = this.getCabinet(id);
      _loc2_.name = name;
      _loc2_.description = description;
      _loc2_.texture = texture;
      _loc2_.price = price;
      _loc2_.salePrice = salePrice;
      _loc2_.owned = owned;
      _loc2_.isDirty = true;
      if(this.currScreenID == this.CABINETS_SCREEN || this.currScreenID == this.DETAILS_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function getCabinet(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.cabinets.length;
      while(_loc2_ < _loc3_)
      {
         if(this.cabinets[_loc2_].id == id)
         {
            return this.cabinets[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = new com.rockstargames.gtav.levelDesign.arcadeManagement.Cabinet(id);
      this.cabinets.push(_loc5_);
      return _loc5_;
   }
   function ADD_UPGRADE(id, title, description, texture, price, salePrice, owned)
   {
      var _loc2_ = this.getUpgrade(id);
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.texture = texture;
      _loc2_.price = price;
      _loc2_.salePrice = salePrice;
      _loc2_.owned = owned;
      _loc2_.isDirty = true;
      this.upgrades.push(_loc2_);
      if(this.currScreenID == this.UPGRADES_SCREEN)
      {
         this.currScreen.update();
      }
   }
   function getUpgrade(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.upgrades.length;
      while(_loc2_ < _loc3_)
      {
         if(this.upgrades[_loc2_].id == id)
         {
            return this.upgrades[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return new com.rockstargames.gtav.levelDesign.arcadeManagement.Upgrade(id);
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
      this.overlay.show(title,message,acceptButtonLabel,cancelButtonLabel,_loc2_,this.displayConfig.isAsian);
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
         case com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.LEFT:
            var _loc4_ = this.cursor.setTarget(inputID);
            if(_loc4_)
            {
               com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            if(this.currScreenID == this.CABINETS_SCREEN)
            {
               this.setSelectedCabinet(this.lastClickedButtonID);
            }
            break;
         case com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.CANCEL:
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
      if(!this.overlay.isShowing)
      {
         this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
      }
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
            if(this.navHistory.length < 2)
            {
               this.navHistory.push(this.currScreenID);
            }
            this.currScreen.dispose();
         }
         this.cursor.setState(com.rockstargames.gtav.levelDesign.arcadeManagement.Cursor.STATE_ARROW);
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
   function setArcadeImageVisibility(isVisible)
   {
      this.arcadeImage._visible = isVisible;
   }
   function setArcadeImageScrollPosition(y)
   {
      this.arcadeImage._y = y;
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
   function setSelectedCabinet(cabinetID)
   {
      var _loc2_ = 0;
      var _loc3_ = this.cabinets.length;
      while(_loc2_ < _loc3_)
      {
         if(this.cabinets[_loc2_].id == cabinetID)
         {
            this.selectedCabinet = this.cabinets[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, letterSpacing, forceUpperCase, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         if(tf.html)
         {
            tf.htmlText = !forceUpperCase ? label : label.toUpperCase();
         }
         else
         {
            tf.text = !forceUpperCase ? label : label.toUpperCase();
         }
      }
      else
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(tf,label);
         if(forceUpperCase)
         {
            tf.text = tf.text.toUpperCase();
         }
      }
      var _loc3_ = tf.getTextFormat();
      _loc3_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc3_);
   }
   static function resizeAsianText(tf)
   {
      if(!tf.multiline)
      {
         tf.verticalAlign = "center";
      }
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 0;
      tf.setTextFormat(_loc1_);
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
      }
   }
}
