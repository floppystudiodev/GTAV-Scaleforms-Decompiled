class com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var lastClickedButtonID;
   var inputReceived;
   var deactivated;
   var launchTimestamp;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var overlay;
   var cursor;
   var screen;
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
   function CASINO_HEIST_BOARD_SETUP()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "CASINO_HEIST_BOARD_SETUP";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.lastClickedButtonID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.launchTimestamp = getTimer();
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay(_loc4_);
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.cursor.setVisibility(false);
      this.showScreen();
   }
   function ADD_TODO_LIST_ITEM(itemText, isComplete)
   {
      this.screen.addTodoListItem(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.TODO_LIST_INDEX,itemText,isComplete);
   }
   function CLEAR_TODO_LIST()
   {
      this.screen.clearTodoList(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.TODO_LIST_INDEX);
   }
   function ADD_OPTIONAL_LIST_ITEM(itemText, isComplete)
   {
      this.screen.addTodoListItem(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.OPTIONAL_LIST_INDEX,itemText,isComplete);
   }
   function CLEAR_OPTIONAL_LIST()
   {
      this.screen.clearTodoList(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.OPTIONAL_LIST_INDEX);
   }
   function SET_POI_IMAGES()
   {
      this.screen.addPhotos(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.POI_PHOTO_GROUP_INDEX,arguments);
   }
   function SET_PADLOCK(buttonID, isLocked)
   {
      this.screen.setPadlock(buttonID,isLocked);
   }
   function SET_EXTREME(buttonID, isExtreme)
   {
      this.screen.setExtreme(buttonID,isExtreme);
   }
   function SET_STAR(buttonID, isVisible)
   {
      this.screen.setStarVisible(buttonID,isVisible);
   }
   function SET_BUTTON_VISIBLE(buttonID, isVisible)
   {
      this.screen.setButtonVisible(buttonID,isVisible);
   }
   function SET_BUTTON_ENABLED(buttonID, isEnabled)
   {
      this.screen.setButtonEnabled(buttonID,isEnabled);
   }
   function SET_BUTTON_IMAGE(buttonID, imageID)
   {
      this.screen.setButtonImage(buttonID,imageID);
   }
   function SET_BUTTON_GREYED_OUT(buttonID, isGreyedOut)
   {
      this.screen.setButtonGreyedOut(buttonID,isGreyedOut);
   }
   function SET_TICK(buttonID, isTicked)
   {
      this.screen.setTick(buttonID,isTicked);
   }
   function SET_ACCESS_POINT_COMPLETION(buttonID, numAvailable, numComplete, isOptional)
   {
      this.screen.setAccessPointCompletion(buttonID,numAvailable,numComplete,isOptional);
   }
   function SET_SELECTION_ARROWS_VISIBLE(buttonID, visibleState)
   {
      this.screen.setSelectionArrowsVisible(buttonID,visibleState);
   }
   function SET_BLUEPRINT_VISIBLE(isVisible)
   {
      this.screen.setBlueprintVisible(isVisible);
   }
   function SET_TARGET_TYPE(targetType)
   {
      this.screen.setTargetType(targetType);
   }
   function SET_GRAPHICS_VISIBLE(isVisible)
   {
      this.screen.setGraphicsVisible(isVisible);
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
   function SET_CURRENT_SELECTION(buttonID)
   {
      var _loc3_ = 0;
      var _loc4_ = this.screen.buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.screen.buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            var _loc6_ = 0.5 * (_loc2_.left + _loc2_.right);
            var _loc5_ = 0.5 * (_loc2_.top + _loc2_.bottom);
            this.cursor.moveTo(_loc6_,_loc5_,true,true);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function GET_CURRENT_ROLLOVER()
   {
      return this.cursor.getTargetIDUnderCursor();
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
         case com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor.LEFT:
            var _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
            else if(!this.screen.customCancelResponse())
            {
            }
      }
      this.screen.handleButtonInput(inputID);
   }
   function SET_INPUT_RELEASE_EVENT(inputID)
   {
      this.screen.handleButtonInputRelease(inputID);
   }
   function showScreen()
   {
      if(this.screen == undefined)
      {
         this.cursor.setState(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Cursor.STATE_ARROW);
         this.screen = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen(this,this.screenContainer,this.cursor,this.overlay);
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
      else if(this.screen)
      {
         this.cursor.setTargetRects(this.screen.buttons);
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
      }
   }
}
