class com.rockstargames.gtav.levelDesign.ARENA_CAREER_WALL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var currScreenID;
   var displayConfig;
   var imageManager;
   var navHistory;
   var prevScreenID;
   var screenContainer;
   var unlocks;
   var MAIN_SCREEN = 0;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen];
   var gamername = "";
   var rank = "";
   var totalArenaPoints = 0;
   var arenaPoints = 0;
   var currTier = 0;
   var currTierProgress = 0;
   var gamesPlayed = 0;
   var wins = 0;
   var losses = 0;
   var kills = 0;
   var deaths = 0;
   var spectatorKills = 0;
   var favouriteVehicle = "";
   var bestMode = "";
   var worstMode = "";
   var textureDictionary = "";
   var note1 = "";
   var note2 = "";
   var note3 = "";
   function ARENA_CAREER_WALL()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "ARENA_CAREER_WALL";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.prevScreenID = -1;
      this.navHistory = [-1];
      this.unlocks = [];
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.arenaCareerWall.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
   }
   function SET_STATS(gamername, rank, totalArenaPoints, noLongerUsed1, arenaPoints, currTier, currTierProgress, gamesPlayed, wins, losses, kills, deaths, spectatorKills, favouriteVehicle, noLongerUsed2, bestMode, worstMode)
   {
      this.gamername = gamername;
      this.rank = rank;
      this.totalArenaPoints = totalArenaPoints;
      this.arenaPoints = arenaPoints;
      this.currTier = currTier;
      this.currTierProgress = currTierProgress;
      this.gamesPlayed = gamesPlayed;
      this.wins = wins;
      this.losses = losses;
      this.kills = kills;
      this.deaths = deaths;
      this.spectatorKills = spectatorKills;
      this.favouriteVehicle = favouriteVehicle;
      this.bestMode = bestMode;
      this.worstMode = worstMode;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen(this.currScreen).updateStats();
      }
   }
   function SET_TEXTURES(textureDictionary, note1, note2, note3)
   {
      this.textureDictionary = textureDictionary;
      this.note1 = note1;
      this.note2 = note2;
      this.note3 = note3;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen(this.currScreen).updateTextures();
      }
   }
   function SHOW_SCREEN(screenID)
   {
      if(screenID == undefined)
      {
         screenID = this.MAIN_SCREEN;
      }
      this.showScreen(screenID);
   }
   function SHOW_UNLOCK(id)
   {
      this.unlocks[id] = true;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen(this.currScreen).updateUnlocks();
      }
   }
   function HIDE_UNLOCK(id)
   {
      this.unlocks[id] = false;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen(this.currScreen).updateUnlocks();
      }
   }
   function showScreen(screenID)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.navHistory.push(this.currScreenID);
            this.currScreen.dispose();
         }
         this.prevScreenID = this.currScreenID;
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer);
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
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "GTAO_SMG_Hangar_Computer_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   static function resizeAsianText(tf)
   {
      tf.verticalAlign = "center";
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      tf.setTextFormat(_loc1_);
   }
}
