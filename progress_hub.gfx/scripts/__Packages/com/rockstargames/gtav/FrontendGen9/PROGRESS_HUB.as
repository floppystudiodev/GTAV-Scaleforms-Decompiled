class com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB extends com.rockstargames.ui.core.BaseScreenLayout
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
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_HEIGHT;
   static var IS_PC = false;
   var CATEGORY_SCREEN = 0;
   var CONTENT_TYPE_SCREEN = 1;
   var REWARDS_SCREEN = 2;
   var TIER_PROGRESS_SCREEN = 3;
   var SCREEN_CLASSES = [com.rockstargames.gtav.FrontendGen9.progressHub.screens.CategoryScreen,com.rockstargames.gtav.FrontendGen9.progressHub.screens.ContentTypeScreen,com.rockstargames.gtav.FrontendGen9.progressHub.screens.RewardsScreen,com.rockstargames.gtav.FrontendGen9.progressHub.screens.TierProgressScreen];
   function PROGRESS_HUB()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "PROGRESS_HUB";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.TIMELINE.isPC = false;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.getIsPC();
      this.lastClickedButtonID = -1;
      this.currScreenID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.FrontendGen9.progressHub.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursor",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.FrontendGen9.progressHub.ui.Cursor(_loc2_);
   }
   function getIsPC()
   {
      com.rockstargames.ui.game.GameInterface.call("IS_PC_BUILD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.TIMELINE);
   }
   function get isPC()
   {
      return this.TIMELINE.isPC || com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.IS_PC;
   }
   function SHOW_CATEGORY_SCREEN(screenTitle, startingIndex)
   {
      var _loc2_ = new Object();
      _loc2_.screenTitle = screenTitle;
      _loc2_.startingIndex = startingIndex;
      this.showScreen(this.CATEGORY_SCREEN,_loc2_);
   }
   function ADD_CATEGORY_ITEM(title, description, backgroundImage, itemImage, backgroundTXD, itemTXD, meterValue)
   {
      var _loc2_ = new Object();
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.backgroundImage = backgroundImage;
      _loc2_.itemImage = itemImage;
      _loc2_.backgroundTXD = this.validateTXD(backgroundTXD);
      _loc2_.itemTXD = this.validateTXD(itemTXD);
      _loc2_.meterValue = meterValue;
      if(this.currScreenID == this.CATEGORY_SCREEN)
      {
         this.currScreen.ADD_CAROUSEL_ITEM(_loc2_);
      }
   }
   function SHOW_CONTENT_TYPE_SCREEN(screenTitle, message, startingIndex)
   {
      var _loc2_ = new Object();
      _loc2_.screenTitle = screenTitle;
      _loc2_.message = message;
      _loc2_.startingIndex = startingIndex;
      this.showScreen(this.CONTENT_TYPE_SCREEN,_loc2_);
   }
   function ADD_CONTENT_TYPE_ITEM(title, description, backgroundImage, itemImage, backgroundTXD, itemTXD, meterValue)
   {
      var _loc2_ = new Object();
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.backgroundImage = backgroundImage;
      _loc2_.itemImage = itemImage;
      _loc2_.backgroundTXD = this.validateTXD(backgroundTXD);
      _loc2_.itemTXD = this.validateTXD(itemTXD);
      _loc2_.meterValue = meterValue;
      if(this.currScreenID == this.CONTENT_TYPE_SCREEN)
      {
         this.currScreen.ADD_CAROUSEL_ITEM(_loc2_);
      }
   }
   function SHOW_TIER_PROGRESS_SCREEN(screenTitle, message, startingIndex)
   {
      var _loc2_ = new Object();
      _loc2_.screenTitle = screenTitle;
      _loc2_.message = message;
      _loc2_.startingIndex = startingIndex;
      this.showScreen(this.TIER_PROGRESS_SCREEN,_loc2_);
   }
   function ADD_TIER_PROGRESS_ITEM(title, backgroundImage, itemImage, status, reward, backgroundTXD, itemTXD, meterValue)
   {
      var _loc2_ = new Object();
      _loc2_.title = title;
      _loc2_.backgroundImage = backgroundImage;
      _loc2_.itemImage = itemImage;
      _loc2_.status = status;
      _loc2_.reward = reward;
      _loc2_.backgroundTXD = this.validateTXD(backgroundTXD);
      _loc2_.itemTXD = this.validateTXD(itemTXD);
      _loc2_.meterValue = meterValue;
      if(this.currScreenID == this.TIER_PROGRESS_SCREEN)
      {
         this.currScreen.ADD_CAROUSEL_ITEM(_loc2_);
      }
   }
   function ADD_TIER_PROGRESS_INFORMATION_ITEM(index, informationText, status, isSubItem)
   {
      var _loc2_ = new Object();
      _loc2_.index = index;
      _loc2_.informationText = informationText;
      _loc2_.status = status;
      _loc2_.isSubItem = isSubItem === true;
      if(this.currScreenID == this.TIER_PROGRESS_SCREEN)
      {
         this.currScreen.addInformation(_loc2_);
      }
   }
   function CLEAR_INFORMATION(index)
   {
      if(this.currScreenID == this.TIER_PROGRESS_SCREEN)
      {
         this.currScreen.clearInformation(index);
      }
   }
   function SHOW_REWARDS_SCREEN(screenTitle, showTabs, startingIndex)
   {
      var _loc2_ = new Object();
      _loc2_.screenTitle = screenTitle;
      _loc2_.showTabs = showTabs;
      _loc2_.startingIndex = startingIndex;
      this.showScreen(this.REWARDS_SCREEN,_loc2_);
   }
   function ADD_REWARDS_ITEM(title, description, backgroundImage, itemImage, status, message, speed, acceleration, braking, traction, backgroundTXD, itemTXD, statLabel1, statLabel2, statLabel3, statLabel4, meterValue)
   {
      var _loc2_ = new Object();
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.backgroundImage = backgroundImage;
      _loc2_.itemImage = itemImage;
      _loc2_.status = status;
      _loc2_.message = message;
      _loc2_.speed = speed;
      _loc2_.acceleration = acceleration;
      _loc2_.braking = braking;
      _loc2_.traction = traction;
      _loc2_.backgroundTXD = this.validateTXD(backgroundTXD);
      _loc2_.itemTXD = this.validateTXD(itemTXD);
      _loc2_.statLabel1 = statLabel1;
      _loc2_.statLabel2 = statLabel2;
      _loc2_.statLabel3 = statLabel3;
      _loc2_.statLabel4 = statLabel4;
      _loc2_.meterValue = meterValue;
      if(this.currScreenID == this.REWARDS_SCREEN)
      {
         this.currScreen.ADD_CAROUSEL_ITEM(_loc2_);
      }
   }
   function ADD_REWARDS_TAG(index, tagText, icon)
   {
      var _loc2_ = new Object();
      _loc2_.index = index;
      _loc2_.tagText = tagText;
      _loc2_.icon = icon;
      if(this.currScreenID == this.REWARDS_SCREEN)
      {
         this.currScreen.addTag(_loc2_);
      }
   }
   function UPDATE_SCREEN()
   {
      this.currScreen.updateScreen(this.currScreen._carousel.GET_INDEX());
   }
   function GET_CURRENT_SELECTION(isMouseClick)
   {
      return this.currScreen.GET_CURRENT_SELECTION(isMouseClick);
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function SCROLLBAR_IS_SHOWING()
   {
      return this.currScreenID == this.TIER_PROGRESS_SCREEN && com.rockstargames.gtav.FrontendGen9.progressHub.screens.TierProgressScreen(this.currScreen).scrollbarIsShowing();
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
         case com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.DPAD_UP:
            this.currScreen.NAV_UP();
            break;
         case com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.DPAD_DOWN:
            this.currScreen.NAV_DOWN();
            break;
         case com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.DPAD_LEFT:
            if(this.currScreenID != -1)
            {
               this.currScreen.NAV_LEFT();
               this.currScreen.updateScreen(this.currScreen._carousel.GET_INDEX());
            }
            break;
         case com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.DPAD_RIGHT:
            if(this.currScreenID != -1)
            {
               this.currScreen.NAV_RIGHT();
               this.currScreen.updateScreen(this.currScreen._carousel.GET_INDEX());
            }
            break;
         case com.rockstargames.gtav.FrontendGen9.progressHub.ui.Cursor.UP:
         case com.rockstargames.gtav.FrontendGen9.progressHub.ui.Cursor.RIGHT:
         case com.rockstargames.gtav.FrontendGen9.progressHub.ui.Cursor.DOWN:
         case com.rockstargames.gtav.FrontendGen9.progressHub.ui.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.ACCEPT:
            _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
         default:
            return;
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      x *= com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_WIDTH;
      y *= com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_HEIGHT;
      this.cursor.snapTo(x,y);
      this.currScreen.handleMouseInput(x,y);
   }
   function SET_IS_PC(isPC)
   {
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.IS_PC = isPC;
   }
   function validateTXD(TXD)
   {
      if(TXD == undefined)
      {
         TXD = "PROGRESS_HUB_IMG";
      }
      return TXD;
   }
   function updateButtons()
   {
      if(this.currScreen)
      {
         this.cursor.setTargets(this.currScreen.buttons);
      }
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
         this.imageManager.dispose();
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
   function UNHIGHLIGHT_ALL_CAROUSEL_ITEMS()
   {
      if(this.currScreenID != -1)
      {
         this.currScreen._carousel.UNHIGHLIGHT_ALL_CAROUSEL_ITEMS();
      }
   }
   function SET_CAROUSEL_ITEM_STATE(whichItem, state, enabled)
   {
      if(this.currScreenID != -1)
      {
         this.currScreen._carousel.SET_CAROUSEL_ITEM_STATE(whichItem,state,false);
         this.currScreen._carousel.SET_CAROUSEL_ITEM_ENABLED(whichItem,enabled);
      }
   }
   function NAV_RIGHT()
   {
      if(this.currScreenID != -1)
      {
         this.currScreen.NAV_RIGHT();
      }
   }
   function NAV_LEFT()
   {
      if(this.currScreenID != -1)
      {
         this.currScreen.NAV_LEFT();
      }
   }
   function CLEAR_ALL_ITEMS()
   {
      if(this.currScreenID != -1)
      {
         this.currScreen._carousel.CLEAR_ALL_ITEMS();
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
      else if(!tf.multiline && tf.textWidth > tf._width)
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
      var _loc2_;
      if(!tf.hasResizedAsianText)
      {
         _loc2_ = tf.getNewTextFormat();
         _loc2_.size *= 0.8;
         tf.setTextFormat(_loc2_);
         tf.setNewTextFormat(_loc2_);
         tf.hasResizedAsianText = true;
      }
   }
}
