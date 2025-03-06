class com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP extends com.rockstargames.ui.core.BaseScreenLayout
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
   var displayConfig;
   var imageManager;
   var screenContainer;
   var overlay;
   var cursor;
   var missionStates;
   var missionCooldowns;
   var jobs;
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
   static var MAX_JOBS = 9;
   var LOGIN_SCREEN = 0;
   var MAIN_SCREEN = 1;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.hackerTruckDesktop.LoginScreen,com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen];
   function HACKER_TRUCK_DESKTOP()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "HACKER_TRUCK_DESKTOP";
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
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay(_loc5_);
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor(_loc4_,_loc3_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.STATE_ARROW);
      this.missionStates = [false,false,false,false,false,false];
      this.missionCooldowns = [0,0,0,0,0,0];
      this.jobs = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.MAX_JOBS)
      {
         this.jobs.push(new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job());
         _loc2_ = _loc2_ + 1;
      }
   }
   function UPDATE_MISSION(index, isAvailable, cooldown)
   {
      this.missionStates[index] = isAvailable;
      this.missionCooldowns[index] = cooldown != undefined ? cooldown : 0;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen)
      {
         this.currScreen.update();
      }
   }
   function CLEAR_JOBS()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.MAX_JOBS)
      {
         this.jobs[_loc2_].reset();
         _loc2_ = _loc2_ + 1;
      }
   }
   function ADD_JOB(index, title, value, valueType, tooltip, isAvailable, salePrice)
   {
      if(index >= 0 && index < com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.MAX_JOBS)
      {
         var _loc2_ = this.jobs[index];
         _loc2_.title = title;
         _loc2_.value = value;
         _loc2_.valueType = valueType;
         _loc2_.tooltip = tooltip;
         _loc2_.isAvailable = isAvailable;
         _loc2_.salePrice = !(salePrice != undefined && salePrice >= 0) ? -1 : salePrice;
      }
   }
   function SHOW_JOB_OVERLAY(missionIndex, title)
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen)
      {
         com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen(this.currScreen).showJobOverlay(missionIndex,title,this.jobs);
      }
   }
   function HIDE_JOB_OVERLAY()
   {
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen)
      {
         com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen(this.currScreen).hideJobOverlay();
      }
   }
   function UPDATE_COOLDOWN(index, value)
   {
      var _loc2_ = this.jobs[index];
      if(_loc2_.valueType == com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_SECONDS)
      {
         _loc2_.value = value;
         if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen)
         {
            com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen(this.currScreen).updateCooldown(index);
         }
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
      return !this.inputReceived ? this.lastClickedButtonID : this.cursor.getTargetIDUnderCursor();
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
         case com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.LEFT:
            this.cursor.setTarget(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
            else if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen)
            {
               com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen(this.currScreen).hideJobOverlay();
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
         this.cursor.setState(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Cursor.STATE_ARROW);
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
}
