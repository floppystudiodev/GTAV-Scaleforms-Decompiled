class com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD extends com.rockstargames.ui.core.BaseScreenLayout
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
   static var STAGE_WIDTH = 2048;
   static var STAGE_HEIGHT = 1493;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_HEIGHT;
   var SELECTION_SCREEN = 0;
   var MAIN_SCREEN = 1;
   var BLANK_SCREEN = 2;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen,com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen,com.rockstargames.gtav.levelDesign.autoShopBoard.screens.BlankScreen];
   var styleId = 1;
   function AUTO_SHOP_BOARD()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "AUTO_SHOP_BOARD";
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
      this.imageManager = new com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursor",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Cursor(_loc2_);
   }
   function SHOW_SELECTION_SCREEN(image1, name1, description1, reward1, image2, name2, description2, reward2, image3, name3, description3, reward3, numCompleted, totalEarnings, robbery1Available, robbery2Available, robbery3Available, robbery1Navigable, robbery2Navigable, robbery3Navigable)
   {
      var _loc2_ = new Object();
      _loc2_.image1 = image1;
      _loc2_.name1 = name1;
      _loc2_.description1 = description1;
      _loc2_.reward1 = reward1;
      _loc2_.image2 = image2;
      _loc2_.name2 = name2;
      _loc2_.description2 = description2;
      _loc2_.reward2 = reward2;
      _loc2_.image3 = image3;
      _loc2_.name3 = name3;
      _loc2_.description3 = description3;
      _loc2_.reward3 = reward3;
      _loc2_.numCompleted = numCompleted;
      _loc2_.totalEarnings = totalEarnings;
      _loc2_.robbery1Available = robbery1Available;
      _loc2_.robbery2Available = robbery2Available;
      _loc2_.robbery3Available = robbery3Available;
      _loc2_.robbery1Navigable = robbery1Navigable;
      _loc2_.robbery2Navigable = robbery2Navigable;
      _loc2_.robbery3Navigable = robbery3Navigable;
      _loc2_.styleId = this.styleId;
      this.showScreen(this.SELECTION_SCREEN,_loc2_);
   }
   function SHOW_MAIN_SCREEN(name, description, reward, loadout1Image, loadout2Image, prep1Name, prep1Image, prep1State, prep2Name, prep2Image, prep2State, finaleImage, finaleState, prep1Navigable, prep2Navigable, finaleNavigable, finaleName, prep1Description, prep2Description, finaleDescription)
   {
      var _loc2_ = new Object();
      _loc2_.name = name;
      _loc2_.description = description;
      _loc2_.reward = reward;
      _loc2_.loadout1Image = loadout1Image;
      _loc2_.loadout2Image = loadout2Image;
      _loc2_.prep1Name = prep1Name;
      _loc2_.prep1Image = prep1Image;
      _loc2_.prep1State = prep1State;
      _loc2_.prep2Name = prep2Name;
      _loc2_.prep2Image = prep2Image;
      _loc2_.prep2State = prep2State;
      _loc2_.finaleImage = finaleImage;
      _loc2_.finaleState = finaleState;
      _loc2_.prep1Navigable = prep1Navigable;
      _loc2_.prep2Navigable = prep2Navigable;
      _loc2_.finaleNavigable = finaleNavigable;
      _loc2_.finaleName = finaleName || "";
      _loc2_.prep1Description = prep1Description || "";
      _loc2_.prep2Description = prep2Description || "";
      _loc2_.finaleDescription = finaleDescription || "";
      _loc2_.styleId = this.styleId;
      this.showScreen(this.MAIN_SCREEN,_loc2_);
   }
   function SHOW_BLANK_SCREEN()
   {
      var _loc2_ = new Object();
      _loc2_.styleId = this.styleId;
      this.showScreen(this.BLANK_SCREEN,_loc2_);
   }
   function SET_STYLE(value)
   {
      this.styleId = value;
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
         case com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.ACCEPT:
            var _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function SET_CURRENT_SELECTION(buttonId)
   {
      this.cursor.snapToTargetId(buttonId);
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
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      tf.setTextFormat(_loc1_);
   }
}
