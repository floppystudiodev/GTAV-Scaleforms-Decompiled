class com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB extends com.rockstargames.ui.core.BaseScreenLayout
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
   var businesses;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var overlay;
   var cursor;
   var gamerName;
   var mugshot;
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
   var MAIN_SCREEN = 0;
   var LOADING_SCREEN = 0;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen,com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.LoadingScreen];
   function ARCADE_BUSINESS_HUB()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "ARCADE_BUSINESS_HUB";
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
      this.businesses = [];
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay(_loc5_);
      var _loc3_ = this.CONTENT.attachMovie("scanlinesOverlay","scanlinesOverlay",this.CONTENT.getNextHighestDepth());
      _loc3_._alpha = 20;
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor(_loc4_,_loc2_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.STATE_ARROW);
   }
   function SET_PLAYER(gamerName, mugshot)
   {
      this.gamerName = gamerName;
      this.mugshot = mugshot;
   }
   function ADD_BUSINESS(id, title, texture, statLabel1, normStatLevel1, statLabel2, normStatLevel2, canResupply, isLocked)
   {
      var _loc3_ = this.getBusiness(id);
      _loc3_.title = title;
      _loc3_.texture = texture;
      _loc3_.statLabel1 = statLabel1;
      _loc3_.normStatLevel1 = normStatLevel1;
      _loc3_.statLabel2 = statLabel2;
      _loc3_.normStatLevel2 = normStatLevel2;
      _loc3_.canResupply = canResupply;
      _loc3_.isLocked = isLocked;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         var _loc2_ = 0;
         var _loc4_ = this.businesses.length;
         while(_loc2_ < _loc4_)
         {
            if(this.businesses[_loc2_] == _loc3_)
            {
               com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen(this.currScreen).updateBusiness(_loc3_,_loc2_);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function getBusiness(id)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      var _loc4_ = this.businesses.length;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.businesses[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ = new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Business(id);
      this.businesses.push(_loc3_);
      return _loc3_;
   }
   function SHOW_SCREEN(screenID)
   {
      if(screenID == undefined)
      {
         screenID = this.MAIN_SCREEN;
      }
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
   function SHOW_SPECIAL_CARGO_OVERLAY(title, message, button1Label, button2Label, button3Label, button4Label, button5Label)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      var _loc2_ = getTimer() - this.launchTimestamp < 500;
      this.overlay.showSpecialCargo(title,message,button1Label,button2Label,button3Label,button4Label,button5Label,_loc2_);
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
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.LEFT:
            var _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
            else if(!this.currScreen.customCancelResponse())
            {
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
         this.cursor.setState(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Cursor.STATE_ARROW);
         this.prevScreenID = this.currScreenID;
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.overlay);
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
         com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setLocalisedText(tf,label);
         if(forceUpperCase)
         {
            tf.text = tf.text.toUpperCase();
         }
      }
      var _loc3_ = tf.getTextFormat();
      _loc3_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc3_);
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
