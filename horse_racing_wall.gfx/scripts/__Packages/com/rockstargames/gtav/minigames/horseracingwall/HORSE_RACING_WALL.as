class com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var countdownSecondsRemaining;
   var currScreen;
   var currScreenID;
   var displayConfig;
   var errorMessage;
   var errorTitle;
   var horses;
   var imageManager;
   var navigation;
   var navigationEnabled;
   var players;
   var screenContainer;
   var winOrder;
   static var randomSeed = getTimer();
   var ACCEPT = 201;
   var CANCEL = 202;
   var COUNTDOWN_SCREEN = 0;
   var DETAILS_SCREEN = 1;
   var RACE_SCREEN = 2;
   var FINISH_SCREEN = 3;
   var RESULTS_SCREEN = 4;
   var ERROR_SCREEN = 5;
   var SCREEN_CLASSES = [com.rockstargames.gtav.minigames.horseracingwall.screens.CountdownScreen,com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen,com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen,com.rockstargames.gtav.minigames.horseracingwall.screens.FinishScreen,com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen,com.rockstargames.gtav.minigames.horseracingwall.screens.ErrorScreen];
   function HORSE_RACING_WALL()
   {
      super();
   }
   function HORSE_RACING()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "HORSE_RACING_WALL";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.imageManager = new com.rockstargames.gtav.minigames.horseracingwall.ImageManager();
      this.navigation = new com.rockstargames.gtav.minigames.horseracingwall.Navigation();
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.horses = [];
      this.players = [];
      this.winOrder = [];
      this.navigationEnabled = true;
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
   }
   function SHOW_SCREEN(screenID)
   {
      if(screenID == this.FINISH_SCREEN)
      {
         screenID = this.RACE_SCREEN;
      }
      this.showScreen(screenID);
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function SET_HORSE(number, name, odds, primaryColour, secondaryColour, horseColour, maneColour)
   {
      var _loc3_ = number - 1;
      var _loc2_ = this.horses[_loc3_] || (this.horses[_loc3_] = new com.rockstargames.gtav.minigames.horseracingwall.Horse());
      _loc2_.name = name;
      _loc2_.odds = odds;
      _loc2_.number = number;
      _loc2_.primaryColour = primaryColour;
      _loc2_.secondaryColour = secondaryColour;
      _loc2_.horseColour = horseColour;
      _loc2_.maneColour = maneColour;
      if(this.currScreenID == this.COUNTDOWN_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingwall.screens.CountdownScreen(this.currScreen).updateHorses();
      }
   }
   function SET_DETAIL_HORSE(number)
   {
      com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.currHorseIndex = number - 1;
   }
   function SET_COUNTDOWN(secondsRemaining)
   {
      if(this.currScreenID == this.COUNTDOWN_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingwall.screens.CountdownScreen(this.currScreen).setCountdown(secondsRemaining);
      }
      else if(this.currScreenID == this.DETAILS_SCREEN)
      {
         com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen(this.currScreen).setCountdown(secondsRemaining);
      }
      this.countdownSecondsRemaining = secondsRemaining;
   }
   function ADD_PLAYER(gamertag, horse, bet)
   {
      var _loc3_ = this.getPlayerIndex(gamertag);
      var _loc2_ = this.players[_loc3_] || (this.players[_loc3_] = new com.rockstargames.gtav.minigames.horseracingwall.Player());
      _loc2_.gamertag = gamertag;
      _loc2_.horse = horse;
      _loc2_.bet = bet;
   }
   function REMOVE_PLAYER(gamertag)
   {
      var _loc2_ = this.getPlayerIndex(gamertag);
      this.players.splice(_loc2_,1);
   }
   function SET_PLAYER_RESULT(gamertag, result)
   {
      var _loc3_ = this.getPlayerIndex(gamertag);
      var _loc2_ = this.players[_loc3_];
      if(!_loc2_)
      {
         this.players[_loc3_] = new com.rockstargames.gtav.minigames.horseracingwall.Player();
         _loc2_ = this.players[_loc3_];
         _loc2_.gamertag = gamertag;
      }
      _loc2_.result = result;
   }
   function CLEAR_ALL_PLAYERS()
   {
      this.players.length = 0;
   }
   function START_RACE(duration, seed, firstHorse, secondHorse, thirdHorse, fourthHorse, fifthHorse, sixthHorse, offset, sync)
   {
      this.showScreen(this.RACE_SCREEN);
      com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen(this.currScreen).startRace(duration,seed,firstHorse,secondHorse,thirdHorse,fourthHorse,fifthHorse,sixthHorse,offset,sync);
   }
   function GET_RACE_IS_COMPLETE()
   {
      if(this.currScreenID == this.RACE_SCREEN)
      {
         return com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen(this.currScreen).isComplete();
      }
      if(this.currScreenID == this.FINISH_SCREEN)
      {
         return com.rockstargames.gtav.minigames.horseracingwall.screens.FinishScreen(this.currScreen).isComplete();
      }
      return false;
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
         return com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen(this.currScreen).getHorsePositions();
      }
      return -1;
   }
   function getPlayerIndex(gamertag)
   {
      var _loc2_ = 0;
      var _loc3_ = this.players.length;
      while(_loc2_ < _loc3_)
      {
         if(this.players[_loc2_].gamertag == gamertag)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
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
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.navigation);
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
   static function setSpacedText(tf, label, letterSpacing, forceUpperCase, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setLocalisedText(tf,label);
      }
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc2_);
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
   function resizeAsianText(tf)
   {
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 0;
      tf.setTextFormat(_loc1_);
   }
   function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   static function rnd()
   {
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.randomSeed = com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.randomSeed * 16807 % 2147483647;
      return com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.randomSeed / 2147483647;
   }
   static function setRandomSeed(seed)
   {
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.randomSeed = Math.abs(Math.floor(seed)) % 2147483647;
   }
}
