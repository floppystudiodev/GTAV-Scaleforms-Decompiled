class com.rockstargames.gtav.levelDesign.FIXER_APP extends com.rockstargames.ui.core.BaseScreenLayout
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
   var launchTimestamp;
   var overlayOneButton;
   var overlayTwoButton;
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
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_HEIGHT;
   var LOGIN_SCREEN = 0;
   var HOME_SCREEN = 1;
   var DATA_LEAK_SELECTION_SCREEN = 2;
   var DATA_LEAK_SCREEN = 3;
   var SECURITY_CONTRACT_SELECTION_SCREEN = 4;
   var DATA_RECOVERY_SCREEN = 5;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.fixerApp.screens.LoginScreen,com.rockstargames.gtav.levelDesign.fixerApp.screens.HomeScreen,com.rockstargames.gtav.levelDesign.fixerApp.screens.DataLeakSelectionScreen,com.rockstargames.gtav.levelDesign.fixerApp.screens.DataLeakScreen,com.rockstargames.gtav.levelDesign.fixerApp.screens.SecurityContractSelectionScreen,com.rockstargames.gtav.levelDesign.fixerApp.screens.DataRecoveryScreen];
   var styleId = 1;
   function FIXER_APP()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "FIXER_APP";
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
      this.imageManager = new com.rockstargames.gtav.levelDesign.fixerApp.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_;
      _loc2_ = this.CONTENT.attachMovie("overlayOneButton","overlayOneButton",this.CONTENT.getNextHighestDepth());
      this.overlayOneButton = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Overlay(this,_loc2_,this.cursor);
      _loc2_ = this.CONTENT.attachMovie("overlayTwoButton","overlayTwoButton",this.CONTENT.getNextHighestDepth());
      this.overlayTwoButton = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Overlay(this,_loc2_,this.cursor);
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor(_loc3_);
   }
   function SHOW_LOGIN_SCREEN(gamerTag)
   {
      var _loc2_ = new Object();
      if(gamerTag)
      {
         _loc2_.gamerTag = gamerTag;
      }
      else
      {
         _loc2_.gamerTag = "USERNAME";
      }
      this.showScreen(this.LOGIN_SCREEN,_loc2_);
   }
   function SHOW_HOME_SCREEN(securityContractTitle, vipContractTitle, vipContractLocked, lockedMessage)
   {
      var _loc2_ = new Object();
      _loc2_.securityContractTitle = securityContractTitle;
      _loc2_.vipContractTitle = vipContractTitle;
      _loc2_.lockedMessage = lockedMessage;
      if(vipContractLocked)
      {
         _loc2_.vipContractLocked = vipContractLocked;
      }
      else
      {
         _loc2_.vipContractLocked = false;
      }
      this.showScreen(this.HOME_SCREEN,_loc2_);
   }
   function SHOW_DATA_RECOVERY_SCREEN(leakTitle, leakDescription, leakComplete, leakImage, earnings, investigatedLabel, startButtonLabel)
   {
      var _loc2_ = new Object();
      _loc2_.leakTitle = leakTitle;
      _loc2_.leakDescription = leakDescription;
      _loc2_.leakComplete = leakComplete;
      _loc2_.leakImage = leakImage;
      _loc2_.earnings = earnings;
      _loc2_.investigatedLabel = investigatedLabel;
      _loc2_.startButtonLabel = startButtonLabel;
      this.showScreen(this.DATA_RECOVERY_SCREEN,_loc2_);
   }
   function SHOW_DATA_LEAK_SCREEN(leak1Title, leak1Description, leak1Locked, leak1Complete, leak1Image, leak2Title, leak2Description, leak2Locked, leak2Complete, leak2Image, leak3Title, leak3Description, leak3Locked, leak3Complete, leak3Image, replay, introTitle, introDescription, intoImage, setupTitle, setupDescription, setupImage)
   {
      var _loc2_ = new Object();
      _loc2_.leak1Title = leak1Title;
      _loc2_.leak1Description = leak1Description;
      _loc2_.leak1Locked = leak1Locked;
      _loc2_.leak1Complete = leak1Complete;
      _loc2_.leak1Image = leak1Image;
      _loc2_.leak2Title = leak2Title;
      _loc2_.leak2Description = leak2Description;
      _loc2_.leak2Locked = leak2Locked;
      _loc2_.leak2Complete = leak2Complete;
      _loc2_.leak2Image = leak2Image;
      _loc2_.leak3Title = leak3Title;
      _loc2_.leak3Description = leak3Description;
      _loc2_.leak3Locked = leak3Locked;
      _loc2_.leak3Complete = leak3Complete;
      _loc2_.leak3Image = leak3Image;
      _loc2_.replay = replay;
      _loc2_.introTitle = introTitle;
      _loc2_.introDescription = introDescription;
      _loc2_.intoImage = intoImage;
      _loc2_.setupTitle = setupTitle;
      _loc2_.setupDescription = setupDescription;
      _loc2_.setupImage = setupImage;
      _loc2_.enableStartButton = true;
      this.showScreen(this.DATA_LEAK_SCREEN,_loc2_);
   }
   function UPDATE_DATA_LEAK_SCREEN(investigation1Title, investigation1Locked, investigation1Complete, investigation2Title, investigation2Locked, investigation2Complete, investigation3Title, investigation3Locked, investigation3Complete, payment, leaksFound)
   {
      var _loc2_ = new Object();
      _loc2_.investigation1Title = investigation1Title;
      _loc2_.investigation1Locked = investigation1Locked;
      _loc2_.investigation1Complete = investigation1Complete;
      _loc2_.investigation2Title = investigation2Title;
      _loc2_.investigation2Locked = investigation2Locked;
      _loc2_.investigation2Complete = investigation2Complete;
      _loc2_.investigation3Title = investigation3Title;
      _loc2_.investigation3Locked = investigation3Locked;
      _loc2_.investigation3Complete = investigation3Complete;
      _loc2_.payment = payment;
      _loc2_.leaksFound = leaksFound;
      if(this.currScreenID == this.DATA_LEAK_SCREEN)
      {
         this.currScreen.update(_loc2_);
      }
   }
   function UPDATE_START_BUTTON(startButtonLabel, enableStartButton)
   {
      var _loc2_ = new Object();
      _loc2_.startButtonLabel = startButtonLabel;
      _loc2_.enableStartButton = enableStartButton;
      if(this.currScreenID == this.DATA_LEAK_SCREEN || this.currScreenID == this.SECURITY_CONTRACT_SELECTION_SCREEN)
      {
         this.currScreen.updateStartButtonData(_loc2_);
      }
   }
   function UPDATE_TAB_DATA(investigationDescription, investigationImage, copyFoundLabel, copyFound, investigationComplete, copyFoundVisible, statusLabel)
   {
      var _loc2_ = new Object();
      _loc2_.investigationDescription = investigationDescription;
      _loc2_.investigationImage = investigationImage;
      _loc2_.copyFoundLabel = copyFoundLabel;
      _loc2_.copyFound = copyFound;
      _loc2_.investigationComplete = investigationComplete;
      _loc2_.copyFoundVisible = copyFoundVisible;
      if(statusLabel)
      {
         _loc2_.statusLabel = statusLabel;
      }
      else
      {
         _loc2_.statusLabel = "";
      }
      if(this.currScreenID == this.DATA_LEAK_SCREEN)
      {
         this.currScreen.updateTabsData(_loc2_);
      }
   }
   function ENABLE_TABS(enabled)
   {
      var _loc2_ = new Object();
      _loc2_.enabled = enabled;
      if(this.currScreenID == this.DATA_LEAK_SCREEN)
      {
         this.currScreen.updateTabs(_loc2_);
      }
   }
   function UPDATE_MENU_LOCKED_STATES(leak1Locked, leak2Locked, leak3Locked)
   {
      var _loc2_ = new Object();
      _loc2_.leak1Locked = leak1Locked;
      _loc2_.leak2Locked = leak2Locked;
      _loc2_.leak3Locked = leak3Locked;
      if(this.currScreenID == this.DATA_LEAK_SCREEN)
      {
         this.currScreen.updateMenu(_loc2_);
      }
   }
   function SHOW_SECURITY_CONTRACT_SELECTION_SCREEN(numberCompleted, earnings, title1, description1, difficulty1, image1, title2, description2, difficulty2, image2, title3, description3, difficulty3, image3, valuablesRecovered, payment1, payment2, payment3, vipContractLocked)
   {
      var _loc2_ = new Object();
      _loc2_.numberCompleted = numberCompleted;
      _loc2_.earnings = earnings;
      _loc2_.title1 = title1;
      _loc2_.description1 = description1;
      _loc2_.difficulty1 = difficulty1;
      _loc2_.image1 = image1;
      _loc2_.title2 = title2;
      _loc2_.description2 = description2;
      _loc2_.difficulty2 = difficulty2;
      _loc2_.image2 = image2;
      _loc2_.title3 = title3;
      _loc2_.description3 = description3;
      _loc2_.difficulty3 = difficulty3;
      _loc2_.image3 = image3;
      _loc2_.valuablesRecovered = valuablesRecovered;
      _loc2_.payment1 = payment1;
      _loc2_.payment2 = payment2;
      _loc2_.payment3 = payment3;
      _loc2_.vipContractLocked = vipContractLocked;
      _loc2_.enableStartButton = true;
      this.showScreen(this.SECURITY_CONTRACT_SELECTION_SCREEN,_loc2_);
   }
   function UPDATE_SECURITY_CONTRACT_SELECTION_TAB(title, description, difficulty, image, payment)
   {
      var _loc2_ = new Object();
      _loc2_.title = title;
      _loc2_.description = description;
      _loc2_.difficulty = difficulty;
      _loc2_.image = image;
      _loc2_.payment = payment;
      if(this.currScreenID == this.SECURITY_CONTRACT_SELECTION_SCREEN)
      {
         this.currScreen.updateTabs(_loc2_);
      }
   }
   function UPDATE_SECURITY_CONTRACT_SELECTION_SCREEN(statLabel1, statText1, statVisible1, statLabel2, statText2, statVisible2, statLabel3, statText3, statVisible3)
   {
      var _loc2_ = new Object();
      _loc2_.statLabel1 = statLabel1;
      _loc2_.statText1 = statText1;
      _loc2_.statVisible1 = statVisible1;
      _loc2_.statLabel2 = statLabel2;
      _loc2_.statText2 = statText2;
      _loc2_.statVisible2 = statVisible2;
      _loc2_.statLabel3 = statLabel3;
      _loc2_.statText3 = statText3;
      _loc2_.statVisible3 = statVisible3;
      if(this.currScreenID == this.SECURITY_CONTRACT_SELECTION_SCREEN)
      {
         this.currScreen.update(_loc2_);
      }
   }
   function SHOW_OVERLAY_ONE_BUTTON(title, message, buttonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      var _loc2_ = getTimer() - this.launchTimestamp < 500;
      this.overlayOneButton.show(title,message,buttonLabel,"",_loc2_);
      this.updateButtons();
   }
   function HIDE_OVERLAY_ONE_BUTTON()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlayOneButton.hide();
      this.updateButtons();
   }
   function SHOW_OVERLAY_TWO_BUTTON(title, message, acceptButtonLabel, cancelButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      var _loc2_ = getTimer() - this.launchTimestamp < 500;
      this.overlayTwoButton.show(title,message,acceptButtonLabel,cancelButtonLabel,_loc2_);
      this.updateButtons();
   }
   function HIDE_OVERLAY_TWO_BUTTON()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlayTwoButton.hide();
      this.updateButtons();
   }
   function SHOW_SPEAKER(isVisible)
   {
      this.currScreen.showSpeaker(isVisible);
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
      var _loc2_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.FIXER_APP.ACCEPT:
            _loc2_ = this.cursor.getTargetUnderCursor();
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
      x *= com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_WIDTH;
      y *= com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_HEIGHT;
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
   function updateButtons()
   {
      if(this.overlayOneButton.isShowing)
      {
         this.cursor.setTargets(this.overlayOneButton.buttons);
      }
      else if(this.overlayTwoButton.isShowing)
      {
         this.cursor.setTargets(this.overlayTwoButton.buttons);
      }
      else if(this.currScreen)
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
      var _loc3_;
      if(!isNaN(letterSpacing))
      {
         _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      var _loc6_;
      var _loc2_;
      if(tf.textWidth >= tf._width)
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
         soundSet = "DLC_Fixer_Agency_Computer_Soundset";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
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
