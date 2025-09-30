class com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING extends com.rockstargames.ui.core.BaseScreenLayout
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
   var lastClickedButtonID;
   var lightsOffContent;
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
   static var STAGE_WIDTH = 2648;
   static var STAGE_HEIGHT = 2048;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_HEIGHT;
   var MAIN_SCREEN = 0;
   var CUTSCENE_SCREEN = 1;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen,com.rockstargames.gtav.levelDesign.salvagePlanning.screens.CutsceneScreen];
   function SALVAGE_PLANNING()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "SALVAGE_PLANNING";
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
      this.imageManager = new com.rockstargames.gtav.levelDesign.salvagePlanning.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursor",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Cursor(_loc2_);
      this.showScreen(this.MAIN_SCREEN);
      this.currScreen.setButtonsEnabled(!this.deactivated);
      this.lightsOffContent = new com.rockstargames.gtav.levelDesign.salvagePlanning.ui.LightsOffContent(this,this.screenContainer);
      this.lightsOffContent.setViewVisible(false);
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function ENABLE()
   {
      this.deactivated = false;
      this.currScreen.setButtonStates(true);
   }
   function DISABLE()
   {
      this.deactivated = true;
      this.currScreen.setButtonStates(false);
   }
   function SET_HEADING(heading)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setHeading(heading);
      }
   }
   function SET_TARGET_VEHICLE(name, paymentValue, salvageValue)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setTargetVehicle(name,paymentValue,salvageValue);
      }
   }
   function SET_TASK(heading, state, texture)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setTask(heading,state,texture);
         this.lightsOffContent.setTask(heading,state,texture);
      }
   }
   function ADD_TODO_LIST_ITEM(label, state)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).addTodoListItem(label,state);
      }
   }
   function ADD_OPTIONAL_LIST_ITEM(label, state)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).addOptionalListItem(label,state);
      }
   }
   function SET_PREP(index, heading, state, texture)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setPrep(index,heading,state,texture);
         this.lightsOffContent.setPrep(index,heading,state,texture);
      }
   }
   function SET_START_BUTTON(state)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setStartButton(state);
      }
   }
   function SET_LIGHTS(lightsOn)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         this.lightsOffContent.setViewVisible(!lightsOn);
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setViewVisible(lightsOn);
      }
   }
   function SET_OPTIONAL_FAILED(hasFailed)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).setOptionalFailed(hasFailed);
      }
   }
   function RESET()
   {
      this.SET_HEADING("");
      this.SET_TARGET_VEHICLE("");
      this.SET_TASK("",-1);
      this.SET_PREP(0,"");
      this.SET_PREP(1,"");
      this.SET_PREP(2,"");
      this.SET_START_BUTTON(-1);
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).hidePreps();
         this.lightsOffContent.hidePreps();
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).clearTodoList();
         com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen(this.currScreen).clearOptionalList();
      }
   }
   function GET_CURRENT_SELECTION()
   {
      var _loc2_;
      if(this.inputReceived)
      {
         _loc2_ = this.cursor.getTargetUnderCursor();
         return !_loc2_ ? -1 : _loc2_.id;
      }
      return this.lastClickedButtonID;
   }
   function SET_CURRENT_SELECTION(id)
   {
      this.cursor.snapToTargetID(id);
   }
   function GET_CURRENT_ROLLOVER()
   {
      var _loc2_ = this.cursor.getTargetUnderCursor();
      return !_loc2_ ? -1 : _loc2_.id;
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.inputReceived = true;
      var _loc2_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.ACCEPT:
            _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
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
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
         this.inputReceived = false;
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
      else if(tf.textWidth > tf._width)
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
