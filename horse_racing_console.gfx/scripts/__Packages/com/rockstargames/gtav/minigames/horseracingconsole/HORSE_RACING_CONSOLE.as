class com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var bettingEnabled;
   var chips;
   var countdownSecondsRemaining;
   var currScreen;
   var currScreenID;
   var cursor;
   var displayConfig;
   var errorMessage;
   var errorTitle;
   var horses;
   var imageManager;
   var inputReceived;
   var isSingleRace;
   var lastClickedButtonID;
   var mainBetAmount;
   var mainEventInProgress;
   var mainPayout;
   var mainSelectedHorseIndex;
   var navigationEnabled;
   var players;
   var screenContainer;
   var singleBetAmount;
   var singlePayout;
   var singleSelectedHorseIndex;
   var singleWinningHorseIndex;
   var winOrder;
   static var randomSeed = getTimer();
   var ACCEPT = 201;
   var CANCEL = 202;
   var MAIN_SCREEN = 0;
   var SELECTION_SCREEN_SINGLE = 1;
   var SELECTION_SCREEN_MAIN = 2;
   var BETTING_SCREEN_SINGLE = 3;
   var BETTING_SCREEN_MAIN = 4;
   var RACE_SCREEN = 5;
   var FINISH_SCREEN = 6;
   var RESULTS_SCREEN = 7;
   var ERROR_SCREEN = 8;
   var RULES_SCREEN = 9;
   var SCREEN_CLASSES = [com.rockstargames.gtav.minigames.horseracingconsole.screens.MainScreen,com.rockstargames.gtav.minigames.horseracingconsole.screens.SelectionScreenSingle,com.rockstargames.gtav.minigames.horseracingconsole.screens.SelectionScreenMain,com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenSingle,com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenMain,com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen,com.rockstargames.gtav.minigames.horseracingconsole.screens.FinishScreen,com.rockstargames.gtav.minigames.horseracingconsole.screens.ResultsScreen,com.rockstargames.gtav.minigames.horseracingconsole.screens.ErrorScreen,com.rockstargames.gtav.minigames.horseracingconsole.screens.RulesScreen];
   function HORSE_RACING_CONSOLE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "HORSE_RACING_CONSOLE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.imageManager = new com.rockstargames.gtav.minigames.horseracingconsole.ImageManager();
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.horses = [];
      this.players = [];
      this.winOrder = [];
      this.mainEventInProgress = false;
      this.bettingEnabled = true;
      this.isSingleRace = true;
      this.mainSelectedHorseIndex = -1;
      this.singleSelectedHorseIndex = -1;
      this.mainBetAmount = 0;
      this.singleBetAmount = 0;
      this.mainPayout = 0;
      this.singlePayout = 0;
      this.chips = 0;
      this.navigationEnabled = true;
      this.lastClickedButtonID = -1;
      this.inputReceived = false;
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.minigames.horseracingconsole.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.minigames.horseracingconsole.Cursor.STATE_ARROW);
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.navigationEnabled)
      {
         this.inputReceived = true;
         if(inputID == com.rockstargames.gtav.minigames.horseracingconsole.Cursor.LEFT || inputID == com.rockstargames.gtav.minigames.horseracingconsole.Cursor.RIGHT || inputID == com.rockstargames.gtav.minigames.horseracingconsole.Cursor.UP || inputID == com.rockstargames.gtav.minigames.horseracingconsole.Cursor.DOWN)
         {
            this.cursor.setTarget(inputID);
         }
         else if(inputID == this.ACCEPT)
         {
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            this.currScreen.handleAccept();
         }
         else if(inputID == this.CANCEL)
         {
            this.currScreen.handleCancel();
         }
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this.cursor.moveBy(x,y);
      }
   }
   function SET_CURSOR_SPEED(speed)
   {
      this.cursor.setSpeed(speed);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this.cursor.moveTo(x,y,true);
   }
   function ENABLE_NAVIGATION()
   {
      this.navigationEnabled = true;
   }
   function DISABLE_NAVIGATION()
   {
      this.navigationEnabled = false;
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.inputReceived)
      {
         return this.cursor.getTargetIDUnderCursor();
      }
      return this.lastClickedButtonID;
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function SET_RACE_TYPE(isSingleRace)
   {
      this.isSingleRace = isSingleRace;
   }
   function SET_HORSE(number, name, odds, primaryColour, secondaryColour, horseColour, maneColour)
   {
      var _loc3_ = number - 1;
      var _loc2_ = this.horses[_loc3_] || (this.horses[_loc3_] = new com.rockstargames.gtav.minigames.horseracingconsole.Horse());
      _loc2_.name = name;
      _loc2_.odds = odds;
      _loc2_.number = number;
      _loc2_.primaryColour = primaryColour;
      _loc2_.secondaryColour = secondaryColour;
      _loc2_.horseColour = horseColour;
      _loc2_.maneColour = maneColour;
   }
   function SET_COUNTDOWN(secondsRemaining)
   {
      if(secondsRemaining < 0)
      {
         secondsRemaining = 0;
      }
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.MainScreen(this.currScreen).setCountdown(secondsRemaining);
      }
      else if(this.currScreenID == this.SELECTION_SCREEN_MAIN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.SelectionScreenMain(this.currScreen).setCountdown(secondsRemaining);
      }
      else if(this.currScreenID == this.BETTING_SCREEN_MAIN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenMain(this.currScreen).setCountdown(secondsRemaining);
      }
      this.countdownSecondsRemaining = secondsRemaining;
   }
   function SET_BETTING_VALUES(selectedHorse, betAmount, chips, payout, isMain)
   {
      if(isMain === true)
      {
         this.mainSelectedHorseIndex = Math.max(-1,Math.min(selectedHorse - 1,this.horses.length));
         this.mainBetAmount = betAmount;
         this.mainPayout = payout;
      }
      else if(isMain === false)
      {
         this.singleSelectedHorseIndex = Math.max(-1,Math.min(selectedHorse - 1,this.horses.length));
         this.singleBetAmount = betAmount;
         this.singlePayout = payout;
      }
      else
      {
         this.mainSelectedHorseIndex = this.singleSelectedHorseIndex = Math.max(-1,Math.min(selectedHorse - 1,this.horses.length));
         this.mainBetAmount = this.singleBetAmount = betAmount;
         this.mainPayout = this.singlePayout = payout;
      }
      this.chips = chips;
      if(this.currScreenID == this.BETTING_SCREEN_MAIN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenMain(this.currScreen).updateBettingValues();
      }
      else if(this.currScreenID == this.BETTING_SCREEN_SINGLE)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenSingle(this.currScreen).updateBettingValues();
      }
   }
   function SET_BETTING_ENABLED(isEnabled)
   {
      this.bettingEnabled = isEnabled;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.MainScreen(this.currScreen).updateBettingEnabled();
      }
   }
   function SET_MAIN_EVENT_IN_PROGRESS(isInProgress)
   {
      this.mainEventInProgress = isInProgress;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.MainScreen(this.currScreen).updateEventInProgress();
      }
      else if(this.currScreenID == this.SELECTION_SCREEN_MAIN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.SelectionScreenMain(this.currScreen).updateEventInProgress();
      }
      else if(this.currScreenID == this.BETTING_SCREEN_MAIN)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenMain(this.currScreen).updateEventInProgress();
      }
   }
   function START_RACE(duration, seed, firstHorse, secondHorse, thirdHorse, fourthHorse, fifthHorse, sixthHorse, offset)
   {
      this.singleWinningHorseIndex = firstHorse - 1;
      this.showScreen(this.RACE_SCREEN);
      com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen(this.currScreen).startRace(duration,seed,firstHorse,secondHorse,thirdHorse,fourthHorse,fifthHorse,sixthHorse,offset);
   }
   function GET_RACE_IS_COMPLETE()
   {
      return this.currScreenID == this.FINISH_SCREEN && com.rockstargames.gtav.minigames.horseracingconsole.screens.FinishScreen(this.currScreen).isComplete();
   }
   function SHOW_ERROR(title, message)
   {
      this.errorTitle = title;
      this.errorMessage = message;
      this.showScreen(this.ERROR_SCREEN);
   }
   function GET_HORSE_POSITIONS()
   {
      if(this.currScreenID == this.RACE_SCREEN)
      {
         return com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen(this.currScreen).getHorsePositions();
      }
      return -1;
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
         this.inputReceived = false;
         this.updateButtons();
      }
   }
   function updateButtons()
   {
      this.cursor.setTargetRects(this.currScreen.buttons);
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
   static function setSpacedText(tf, label, letterSpacing, forceUpperCase, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(tf,label);
      }
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc2_);
   }
   static function resizeAsianText(tf)
   {
      tf.verticalAlign = "center";
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      tf.setTextFormat(_loc1_);
   }
   static function colourise(item, colour)
   {
      var _loc2_ = (colour >> 16 & 0xFF) / 255;
      var _loc4_ = (colour >> 8 & 0xFF) / 255;
      var _loc1_ = (colour & 0xFF) / 255;
      item.transform.colorTransform = new flash.geom.ColorTransform(_loc2_,_loc4_,_loc1_,1,0,0,0,0);
   }
   function formatPercentage(value)
   {
      return int(value * 100) / 100 + "%";
   }
   function formatNumber(value)
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
   function formatTime(seconds)
   {
      var _loc1_ = seconds % 60;
      var _loc3_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc5_ = Math.floor((seconds - _loc1_ - _loc3_ * 60) / 3600);
      var _loc2_ = ("0" + _loc3_).substr(-2);
      var _loc4_ = ("0" + _loc1_).substr(-2);
      return _loc5_ != 0 ? _loc5_ + ":" + _loc2_ + ":" + _loc4_ : _loc2_ + ":" + _loc4_;
   }
   function truncate(tf, txt, autoSize, letterSpacing)
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
   function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "dlc_vw_casino_inside_track_betting_single_event_sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   static function rnd()
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.randomSeed = com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.randomSeed * 16807 % 2147483647;
      return com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.randomSeed / 2147483647;
   }
   static function setRandomSeed(seed)
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.randomSeed = Math.abs(Math.floor(seed)) % 2147483647;
   }
}
