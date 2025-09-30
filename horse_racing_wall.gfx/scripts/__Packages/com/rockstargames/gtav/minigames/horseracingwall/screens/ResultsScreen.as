class com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var losers;
   var playerDisplayOffset;
   var view;
   var winners;
   static var MAX_PLAYERS_IN_LIST = 11;
   static var LIST_UPDATE_INTERVAL = 1;
   static var WINNERS_LIST_X = 100;
   static var WINNERS_LIST_Y = 200;
   static var LOSERS_LIST_X = 2405;
   static var LOSERS_LIST_Y = 200;
   static var LIST_ITEM_HEIGHT = 56;
   function ResultsScreen(app, viewContainer)
   {
      super(app,viewContainer,"resultsScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initText();
      this.initCards();
      this.initPlayerLists();
   }
   function initText()
   {
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.payouts,"HORSEGAME_PAYOUTS",5,true,false);
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.lost,"HORSEGAME_LOST",5,true,false);
      this.view.heading.label.autoSize = "left";
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setLocalisedText(this.view.heading.label,"HORSEGAME_RESULTS");
      this.view.heading.bgCentre._width = this.view.heading.label._width;
      this.view.heading.bgRight._x = this.view.heading.bgCentre._x + this.view.heading.bgCentre._width + this.view.heading.bgCentre._x;
      this.view.heading._x = 0.5 * (com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH - this.view.heading._width);
   }
   function initCards()
   {
      var _loc5_ = ["HORSEGAME_FIRST","HORSEGAME_SECOND","HORSEGAME_THIRD"];
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < 3)
      {
         _loc3_ = this.app.horses[this.app.winOrder[_loc4_]];
         _loc2_ = this.view["horseCard" + (_loc4_ + 1)];
         _loc3_.init(_loc2_.horse,true);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(_loc2_.diamond,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(_loc2_.ring,_loc3_.primaryColour);
         _loc2_.num.text = _loc3_.number;
         if(this.app.displayConfig.isAsian)
         {
            this.app.resizeAsianText(_loc2_.num);
         }
         _loc2_.name.textAutoSize = "shrink";
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(_loc2_.name,_loc3_.name,3,true,true);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(_loc2_.odds,_loc3_.odds,4,true,true);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(_loc2_.position,_loc5_[_loc4_],2.5,true,false);
         _loc3_.reset();
         _loc4_ = _loc4_ + 1;
      }
   }
   function initPlayerLists()
   {
      this.playerDisplayOffset = 0;
      this.winners = [];
      this.losers = [];
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < this.app.players.length)
      {
         _loc2_ = this.app.players[_loc3_];
         if(_loc2_.result != undefined)
         {
            if(_loc2_.result >= 0)
            {
               _loc4_ = this.view.attachMovie("playerListItem","won" + this.winners.length,this.view.getNextHighestDepth());
               _loc4_._x = com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.WINNERS_LIST_X;
               _loc4_._y = com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.WINNERS_LIST_Y + this.winners.length * com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.LIST_ITEM_HEIGHT;
               this.winners.push(_loc2_);
            }
            else
            {
               _loc4_ = this.view.attachMovie("playerListItem","lost" + this.losers.length,this.view.getNextHighestDepth());
               _loc4_._x = com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.LOSERS_LIST_X;
               _loc4_._y = com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.LOSERS_LIST_Y + this.losers.length * com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.LIST_ITEM_HEIGHT;
               this.losers.push(_loc2_);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.updatePlayerLists();
   }
   function updatePlayerLists()
   {
      var _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.MAX_PLAYERS_IN_LIST)
      {
         if(_loc2_ < this.winners.length)
         {
            _loc5_ = this.winners.length <= com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.MAX_PLAYERS_IN_LIST ? 0 : this.playerDisplayOffset;
            _loc3_ = this.view["won" + _loc2_];
            _loc4_ = this.winners[(_loc2_ + _loc5_) % this.winners.length];
            _loc3_.gotoAndStop("green");
            this.app.truncate(_loc3_.gamertag,_loc4_.gamertag);
            _loc3_.value.text = _loc4_.result;
            if(this.app.displayConfig.isAsian)
            {
               this.app.resizeAsianText(_loc3_.gamertag);
               this.app.resizeAsianText(_loc3_.value);
            }
         }
         if(_loc2_ < this.losers.length)
         {
            _loc5_ = this.losers.length <= com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.MAX_PLAYERS_IN_LIST ? 0 : this.playerDisplayOffset;
            _loc3_ = this.view["lost" + _loc2_];
            _loc4_ = this.losers[(_loc2_ + _loc5_) % this.losers.length];
            _loc3_.gotoAndStop("red");
            this.app.truncate(_loc3_.gamertag,_loc4_.gamertag);
            _loc3_.value.text = _loc4_.result;
            if(this.app.displayConfig.isAsian)
            {
               this.app.resizeAsianText(_loc3_.gamertag);
               this.app.resizeAsianText(_loc3_.value);
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.playerDisplayOffset = this.playerDisplayOffset + 1;
      if(this.winners.length > com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.MAX_PLAYERS_IN_LIST || this.losers.length > com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.MAX_PLAYERS_IN_LIST)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.minigames.horseracingwall.screens.ResultsScreen.LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updatePlayerLists});
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.winners = null;
      this.losers = null;
      super.dispose();
   }
}
