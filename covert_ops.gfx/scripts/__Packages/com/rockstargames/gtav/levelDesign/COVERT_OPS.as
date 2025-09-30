class com.rockstargames.gtav.levelDesign.COVERT_OPS extends com.rockstargames.ui.core.BaseScreenLayout
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
   var gamerTag;
   var imageManager;
   var inputReceived;
   var lastClickedButtonID;
   var missions;
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
   var LOGIN_SCREEN = 0;
   var MAIN_SCREEN = 1;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.covertOps.LoginScreen,com.rockstargames.gtav.levelDesign.covertOps.MainScreen];
   function COVERT_OPS()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "COVERT_OPS";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.covertOps.ImageManager();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.covertOps.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.missions = [];
      this.lastClickedButtonID = -1;
      this.showScreen(this.LOGIN_SCREEN);
   }
   function ACTIVATE()
   {
      this.deactivated = false;
   }
   function DEACTIVATE()
   {
      this.deactivated = true;
   }
   function SET_PLAYER_DATA(gamerTag)
   {
      this.gamerTag = gamerTag;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.covertOps.LoginScreen)
      {
         com.rockstargames.gtav.levelDesign.covertOps.LoginScreen(this.currScreen).userName = gamerTag;
      }
   }
   function ADD_MISSION(id, name, description, txd, lockNum, enabled, cashBonus, rpBonus)
   {
      var _loc4_ = new com.rockstargames.gtav.levelDesign.covertOps.Mission(id,name,description,txd,lockNum,enabled,cashBonus,rpBonus);
      var _loc5_ = false;
      var _loc2_ = 0;
      var _loc3_ = this.missions.length;
      while(_loc2_ < _loc3_)
      {
         if(this.missions[_loc2_].id == id)
         {
            this.missions.splice(_loc2_,1,_loc4_);
            _loc5_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc5_)
      {
         this.missions.push(_loc4_);
      }
   }
   function UPDATE_COOLDOWN(remainingSeconds)
   {
      if(this.currScreen)
      {
         this.currScreen.updateCooldown(remainingSeconds);
      }
   }
   function SHOW_OVERLAY(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(typeof this.currScreen.showOverlay == "function")
      {
         this.currScreen.showOverlay(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel);
      }
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(typeof this.currScreen.hideOverlay == "function")
      {
         this.currScreen.hideOverlay();
      }
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.inputReceived)
      {
         return this.cursor.getTargetIDUnderCursor();
      }
      return this.lastClickedButtonID;
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
         case com.rockstargames.gtav.levelDesign.covertOps.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.covertOps.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.covertOps.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.covertOps.Cursor.LEFT:
            this.cursor.setTarget(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.COVERT_OPS.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
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
      this.cursor.setState(com.rockstargames.gtav.levelDesign.covertOps.Cursor.STATE_ARROW);
      this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
      this.currScreenID = screenID;
      this.inputReceived = false;
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(tf,label);
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = 2;
      tf.setTextFormat(_loc2_);
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
         soundSet = "DLC_GR_MOC_Computer_Sounds";
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
