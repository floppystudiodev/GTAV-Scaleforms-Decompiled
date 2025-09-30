class com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY extends com.rockstargames.ui.core.BaseScreenLayout
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
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.STAGE_HEIGHT;
   var MAIN_SCREEN = 0;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.trustAndSafety.screens.MainScreen];
   function TRUST_AND_SAFETY()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "TRUST_AND_SAFETY";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.deactivated = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursor",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor(_loc2_);
      this.showScreen(this.MAIN_SCREEN);
   }
   function ADD_ITEM(heading, body)
   {
      var _loc3_ = new com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Item(String(arguments.shift()),arguments);
      com.rockstargames.gtav.levelDesign.trustAndSafety.screens.MainScreen(this.currScreen).addItem(_loc3_);
   }
   function GET_CURRENT_SELECTION()
   {
      var _loc2_ = this.cursor.getTargetUnderCursor();
      return !_loc2_ ? -1 : _loc2_.id;
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
      var _loc3_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.LEFT:
            this.cursor.moveInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.ACCEPT:
            _loc3_ = this.cursor.getTargetUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.CANCEL:
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function SET_INPUT_RELEASE_EVENT(inputID)
   {
      this.currScreen.handleButtonInputRelease(inputID);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      x *= com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.STAGE_WIDTH;
      y *= com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.STAGE_HEIGHT;
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
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
      }
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc5_;
      if(!isNaN(letterSpacing))
      {
         _loc5_ = tf.getTextFormat();
         _loc5_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc5_);
      }
      var _loc2_;
      var _loc6_;
      if(tf.multiline && tf.maxscroll > 1)
      {
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
            if(tf.maxscroll == 1)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      else if(!tf.multiline && tf.textWidth > tf._width - 4)
      {
         _loc6_ = tf._width;
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
