class com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var lastClickedButtonID;
   var currScreenID;
   var inputReceived;
   var deactivated;
   var launchTimestamp;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var cursor;
   var overlay;
   var bountyTargets;
   var gamerName;
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
   static var STAGE_WIDTH = 1920;
   static var STAGE_HEIGHT = 1080;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.STAGE_HEIGHT;
   static var MAX_BOUNTY_TARGETS = 4;
   var LOGIN_SCREEN = 0;
   var MAIN_SCREEN = 1;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.bountyComputer.screens.LoginScreen,com.rockstargames.gtav.levelDesign.bountyComputer.screens.MainScreen];
   function BOUNTY_COMPUTER()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "BOUNTY_COMPUTER";
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
      this.launchTimestamp = getTimer();
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.bountyComputer.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Cursor(_loc3_);
      this.overlay = new com.rockstargames.gtav.levelDesign.bountyComputer.ui.Overlay(this,_loc4_,this.cursor);
      this.bountyTargets = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.MAX_BOUNTY_TARGETS)
      {
         this.bountyTargets[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
      this.gamerName = "";
   }
   function ADD_BOUNTY_TARGET(index, name, reward, textureName, textureDictionary, isHighValue, completionState, available, isMale)
   {
      if(index >= 0 && index < com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.MAX_BOUNTY_TARGETS)
      {
         var _loc2_ = this.bountyTargets[index] || new com.rockstargames.gtav.levelDesign.bountyComputer.data.BountyTarget();
         _loc2_.textureChanged = _loc2_.textureDictionary != textureDictionary || _loc2_.textureName != textureName;
         _loc2_.index = index;
         _loc2_.isHighValue = isHighValue;
         _loc2_.name = name;
         _loc2_.reward = reward;
         _loc2_.textureName = textureName;
         _loc2_.textureDictionary = textureDictionary;
         _loc2_.completionState = completionState;
         _loc2_.available = available != undefined ? available : true;
         _loc2_.isMale = isMale != undefined ? isMale : true;
         this.bountyTargets[index] = _loc2_;
         if(this.currScreenID == this.MAIN_SCREEN)
         {
            com.rockstargames.gtav.levelDesign.bountyComputer.screens.MainScreen(this.currScreen).updateBountyTargets();
         }
      }
   }
   function REMOVE_BOUNTY_TARGET(index)
   {
      if(index >= 0 && index < com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.MAX_BOUNTY_TARGETS)
      {
         this.bountyTargets[index] = null;
         if(this.currScreenID == this.MAIN_SCREEN)
         {
            com.rockstargames.gtav.levelDesign.bountyComputer.screens.MainScreen(this.currScreen).updateBountyTargets();
         }
      }
   }
   function SET_GAMERNAME(gamerName)
   {
      this.gamerName = gamerName;
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function SHOW_OVERLAY(message, showCancelButton, isWarning, leftButtonText, rightButtonText)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.show(message,showCancelButton,isWarning,leftButtonText,rightButtonText);
      this.currScreen.setButtonsEnabled(false);
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.hide();
      this.currScreen.setButtonsEnabled(true);
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.inputReceived)
      {
         var _loc2_ = this.cursor.getTargetUnderCursor();
         return !_loc2_ ? -1 : _loc2_.id;
      }
      return this.lastClickedButtonID;
   }
   function GET_CURRENT_ROLLOVER()
   {
      var _loc2_ = this.cursor.getTargetUnderCursor();
      return !_loc2_ ? -1 : _loc2_.id;
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
         case com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.ACCEPT:
            var _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
            break;
         case com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.CANCEL:
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
         this.cursor.joystick(x,y);
      }
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      x *= com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.STAGE_WIDTH;
      y *= com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.STAGE_HEIGHT;
      this.cursor.snapTo(x,y);
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
         this.imageManager.clearImageQueue();
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.overlay);
         this.inputReceived = false;
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
         var _loc5_ = tf.getTextFormat();
         _loc5_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc5_);
      }
      if(tf.multiline && tf.maxscroll > 1)
      {
         var _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc5_ = tf.getTextFormat();
               _loc5_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc5_);
            }
            if(tf.maxscroll == 1)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      else if(!tf.multiline && tf.textWidth > tf._width)
      {
         var _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc5_ = tf.getTextFormat();
               _loc5_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc5_);
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
   static function resizeAsianText(tf)
   {
      var _loc1_ = tf.getNewTextFormat();
      _loc1_.size = 30;
      _loc1_.letterSpacing = -1;
      tf.setNewTextFormat(_loc1_);
      tf.setTextFormat(_loc1_);
   }
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
