class com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen extends com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.Screen
{
   var view;
   var app;
   static var METER_TINT = new flash.geom.ColorTransform(0,0,0,1,229,91,201,0);
   static var METER_NO_TINT = new flash.geom.ColorTransform();
   static var NUM_UNLOCKS = 13;
   function MainScreen(app, viewContainer)
   {
      super(app,viewContainer,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.currTier.textAutoSize = "shrink";
      this.view.nextTier.textAutoSize = "shrink";
      this.initLabel(this.view.tierLabel,"ACW_TIER");
      this.initLabel(this.view.totalArenaPointsLabel,"ACW_TOTAL_AP");
      this.initLabel(this.view.arenaPointsLabel,"ACW_NEXT_TIER");
      this.initLabel(this.view.rankLabel,"ACW_RANK");
      this.initLabel(this.view.gamesPlayedLabel,"ACW_GAMES");
      this.initLabel(this.view.winsLabel,"ACW_WINS");
      this.initLabel(this.view.lossesLabel,"ACW_LOSSES");
      this.initLabel(this.view.killsLabel,"ACW_KILLS");
      this.initLabel(this.view.deathsLabel,"ACW_DEATHS");
      this.initLabel(this.view.spectatorKillsLabel,"ACW_SPEC_KILLS");
      this.initLabel(this.view.favouriteVehicleLabel,"ACW_FAV_VEH");
      this.initLabel(this.view.bestModeLabel,"ACW_BEST_MODE");
      this.initLabel(this.view.worstModeLabel,"ACW_WORST_MODE");
      this.initLabel(this.view.unlock13.label,"ACW_MED_BILLS");
      this.updateStats();
      this.updateTextures();
      this.updateUnlocks();
   }
   function initLabel(textfield, label)
   {
      textfield.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.ARENA_CAREER_WALL.setLocalisedText(textfield,label);
   }
   function updateStats()
   {
      this.view.gamername.text = this.app.gamername;
      this.view.tier.text = this.app.currTier;
      this.view.totalArenaPoints.text = this.app.totalArenaPoints;
      this.view.arenaPoints.text = this.app.arenaPoints;
      this.view.currTier.text = this.app.currTier;
      this.view.nextTier.text = this.app.currTier + 1;
      this.view.rank.text = this.app.rank.toUpperCase();
      this.view.gamesPlayed.text = this.app.gamesPlayed;
      this.view.wins.text = this.app.wins;
      this.view.losses.text = this.app.losses;
      this.view.kills.text = this.app.kills;
      this.view.deaths.text = this.app.deaths;
      this.view.spectatorKills.text = this.app.spectatorKills;
      this.view.favouriteVehicle.text = this.app.favouriteVehicle.toUpperCase();
      this.view.bestMode.text = this.app.bestMode.toUpperCase();
      this.view.worstMode.text = this.app.worstMode.toUpperCase();
      var _loc3_ = 6 * this.app.currTierProgress / 100;
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         this.view["meterBar" + _loc2_].transform.colorTransform = _loc2_ > _loc3_ ? com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen.METER_NO_TINT : com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen.METER_TINT;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateTextures()
   {
      this.view.postit1.label.text = this.app.note1;
      this.view.postit2.label.text = this.app.note2;
      this.view.postit3.label.text = this.app.note3;
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.ARENA_CAREER_WALL.resizeAsianText(this.view.postit1.label);
         com.rockstargames.gtav.levelDesign.ARENA_CAREER_WALL.resizeAsianText(this.view.postit2.label);
         com.rockstargames.gtav.levelDesign.ARENA_CAREER_WALL.resizeAsianText(this.view.postit3.label);
      }
      if(this.app.textureDictionary == "APOC_01_01")
      {
         this.app.textureDictionary = "APOC_ARCADE_RACE";
      }
      this.app.imageManager.addImage(this.app.textureDictionary,this.app.textureDictionary + "_MAP",this.view.image1.img);
      this.app.imageManager.addImage(this.app.textureDictionary,this.app.textureDictionary + "_PHOTO1",this.view.image2.img);
      this.app.imageManager.addImage(this.app.textureDictionary,this.app.textureDictionary + "_PHOTO2",this.view.image3.img);
      this.view.postit1._visible = this.app.note1.length > 0;
      this.view.postit2._visible = this.app.note2.length > 0;
      this.view.postit3._visible = this.app.note3.length > 0;
      var _loc2_ = this.app.textureDictionary.length > 0;
      this.view.tape1._visible = _loc2_;
      this.view.tape2._visible = _loc2_;
      this.view.tape3._visible = _loc2_;
      this.view.tape4._visible = _loc2_;
      this.view.arrow._visible = _loc2_;
   }
   function updateUnlocks()
   {
      var _loc2_ = 1;
      while(_loc2_ <= com.rockstargames.gtav.levelDesign.arenaCareerWall.screens.MainScreen.NUM_UNLOCKS)
      {
         this.view["unlock" + _loc2_]._visible = this.app.unlocks[_loc2_] === true;
         _loc2_ = _loc2_ + 1;
      }
   }
}
