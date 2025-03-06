class com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var lastClickedButtonID;
   var currScreenID;
   var inputReceived;
   var deactivated;
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
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_HEIGHT;
   var HOME_SCREEN = 0;
   var AVENGER_OPERATIONS_SCREEN = 1;
   var SMUGGLING_OPERATIONS_SCREEN = 2;
   var IDLE_SCREEN = 3;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.HomeScreen,com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.AvengerOperationsScreen,com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.SmugglingOperationsScreen,com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.IdleScreen];
   function AVENGER_OPERATIONS_TERMINAL()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "AVENGER_OPERATIONS_TERMINAL";
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
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Cursor(_loc2_);
   }
   function SHOW_HOME_SCREEN()
   {
      this.showScreen(this.HOME_SCREEN,new Object());
   }
   function SHOW_AVENGER_OPERATIONS_SCREEN()
   {
      this.showScreen(this.AVENGER_OPERATIONS_SCREEN,new Object());
   }
   function UPDATE_AVENGER_OPERATION(index, status, title, description, image)
   {
      var _loc2_ = new Object();
      _loc2_.index = index;
      _loc2_.status = status;
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.image = image;
      if(this.currScreenID == this.AVENGER_OPERATIONS_SCREEN)
      {
         this.currScreen.UPDATE_OPERATION_DATA(_loc2_);
      }
   }
   function SHOW_SMUGGLING_OPERATIONS_SCREEN()
   {
      this.showScreen(this.SMUGGLING_OPERATIONS_SCREEN,new Object());
   }
   function UPDATE_SMUGGLING_OPERATION(index, title, description, reward, difficulty, image, status)
   {
      var _loc2_ = new Object();
      _loc2_.index = index;
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.reward = reward;
      _loc2_.difficulty = difficulty;
      _loc2_.image = image;
      if(status == undefined)
      {
         status = 0;
      }
      else
      {
         _loc2_.status = status;
      }
      if(this.currScreenID == this.SMUGGLING_OPERATIONS_SCREEN)
      {
         this.currScreen.UPDATE_OPERATION_DATA(_loc2_);
      }
   }
   function SHOW_IDLE_SCREEN()
   {
      this.showScreen(this.IDLE_SCREEN,new Object());
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
         case com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.ACCEPT:
            var _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function SET_CURRENT_SELECTION(buttonId)
   {
      this.cursor.snapToTargetId(buttonId);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      x *= com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_WIDTH;
      y *= com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_HEIGHT;
      this.cursor.snapTo(x,y);
      this.currScreen.handleMouseInput(x,y);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this.cursor.joystick(x,y);
      }
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function showScreen(screenID, dataObject)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.imageManager.clearImageQueue();
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,dataObject);
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
         var _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      if(tf.textWidth >= tf._width)
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
   static function resizeAsianText(tf)
   {
      if(!tf.hasResizedAsianText)
      {
         var _loc2_ = tf.getNewTextFormat();
         _loc2_.size *= 0.8;
         tf.setTextFormat(_loc2_);
         tf.setNewTextFormat(_loc2_);
         tf.hasResizedAsianText = true;
      }
   }
}
