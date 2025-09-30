class com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var countdown;
   var horse;
   var playerDisplayOffset;
   var players;
   var view;
   static var MAX_PLAYERS_IN_LIST = 12;
   static var LIST_UPDATE_INTERVAL = 1;
   static var currHorseIndex = 0;
   function DetailsScreen(app, viewContainer, navigation)
   {
      super(app,viewContainer,"detailsScreen",navigation);
      this.init();
   }
   function init()
   {
      super.init();
      this.initCountdown();
      this.initMessage();
      this.initPlayerList();
      this.initHorseDetails();
   }
   function initCountdown()
   {
      this.countdown = new com.rockstargames.gtav.minigames.horseracingwall.Countdown(this.view.countdown);
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setLocalisedText(this.view.countdown.label,"HORSEGAME_STARTS");
      if(this.app.countdownSecondsRemaining != undefined)
      {
         this.setCountdown(this.app.countdownSecondsRemaining);
      }
   }
   function initMessage()
   {
      this.view.placeBetPanel.label.autoSize = "left";
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.placeBetPanel.label,"HORSEGAME_MAIN_SUB2",3,true,false);
      this.view.placeBetPanel.bgCentre._width = this.view.placeBetPanel.label._width + 4;
      this.view.placeBetPanel.bgRight._x = this.view.placeBetPanel.bgCentre._x + this.view.placeBetPanel.label._width + this.view.placeBetPanel.bgRight._width;
      this.view.placeBetPanel._x = 0.5 * (com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH - this.view.placeBetPanel._width);
   }
   function initPlayerList()
   {
      var _loc3_ = com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.currHorseIndex % this.app.horses.length;
      this.players = [];
      this.playerDisplayOffset = 0;
      var _loc2_;
      for(var _loc4_ in this.app.players)
      {
         _loc2_ = this.app.players[_loc4_];
         if(_loc2_.horse - 1 == _loc3_)
         {
            this.players.push(_loc2_);
         }
      }
      this.updatePlayerList();
   }
   function initHorseDetails()
   {
      this.horse = this.app.horses[com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.currHorseIndex % this.app.horses.length];
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         this.view.horse["number" + _loc2_]._visible = _loc2_ == this.horse.number;
         _loc2_ = _loc2_ + 1;
      }
      this.horse.init(this.view.horseCard.horse,true);
      this.horse.init(this.view.horse,true);
      this.horse.reset();
      this.view.horseCard.num.text = this.horse.number;
      if(this.app.displayConfig.isAsian)
      {
         this.app.resizeAsianText(this.view.horseCard.num);
      }
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.horseCard.nameWrapper.label,this.horse.name,3,true,true);
      var _loc3_;
      if(this.app.displayConfig.isAsian)
      {
         _loc3_ = 386;
         this.view.horseCard.nameWrapper.label.autoSize = "left";
         this.view.horseCard.nameWrapper._xscale = this.view.horseCard.nameWrapper._yscale = Math.min(100,this.view.horseCard.nameWrapper._xscale * _loc3_ / this.view.horseCard.nameWrapper._width);
         this.view.horseCard.nameWrapper._x = 0.5 * (_loc3_ - this.view.horseCard.nameWrapper._width);
      }
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.horseCard.odds,this.horse.odds,5,true,true);
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(this.view.horseCard.diamond,this.horse.primaryColour);
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(this.view.horseCard.ring,this.horse.primaryColour);
   }
   function setCountdown(secondsRemaining)
   {
      this.countdown.setTime(secondsRemaining);
   }
   function updatePlayerList()
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.MAX_PLAYERS_IN_LIST)
      {
         _loc3_ = this.view["player" + _loc2_];
         if(_loc2_ < this.players.length)
         {
            _loc4_ = this.players[(_loc2_ + this.playerDisplayOffset) % this.players.length];
            _loc3_.gamertag.text = _loc4_.gamertag;
            _loc3_.value.text = _loc4_.bet;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.playerDisplayOffset = this.playerDisplayOffset + 1;
      if(this.players.length > com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.MAX_PLAYERS_IN_LIST)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.minigames.horseracingwall.screens.DetailsScreen.LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updatePlayerList});
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.players = null;
      this.countdown.dispose();
      this.countdown = null;
      this.horse.reset();
      this.horse = null;
      super.dispose();
   }
}
