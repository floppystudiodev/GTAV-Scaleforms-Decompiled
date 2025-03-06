class com.rockstargames.gtav.minigames.horseracingconsole.screens.ResultsScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var currActiveElementID;
   var app;
   var view;
   var buttons;
   var cursor;
   var winningHorses;
   function ResultsScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"resultsScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.currActiveElementID = -1;
      if(!this.app.displayConfig.isWideScreen)
      {
         this.view.cards._xscale = 88;
         this.view.cards._yscale = 88;
      }
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.heading,"HORSEGAME_RESULTS",4,true,false);
      this.initHorseCards();
      this.buttons.push(new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.playAgainButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.PLAY_AGAIN_BUTTON,this.app.chips <= 0 ? "HORSEGAME_CLOSE" : "HORSEGAME_REPLAY"));
      var _loc3_ = !this.app.isSingleRace ? this.app.mainPayout : this.app.singlePayout;
      if(_loc3_ > 0 && this.app.singleSelectedHorseIndex == this.app.singleWinningHorseIndex)
      {
         this.view.cards.horseCard1.payout.autoSize = "left";
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.cards.horseCard1.payout,this.app.formatNumber(_loc3_),2.5,true,true);
         this.view.cards.horseCard1.plus.text = "+";
         this.view.cards.horseCard1.payout._x = 330 - this.view.cards.horseCard1.payout._width;
         this.view.cards.horseCard1.chip._x = this.view.cards.horseCard1.payout._x - 30;
         this.view.cards.horseCard1.plus._x = this.view.cards.horseCard1.chip._x - 22;
      }
      else
      {
         this.view.cards.horseCard1.chip._visible = false;
      }
      this.cursor.setChangeListener(this.delegate(this,this.onActiveElementChange));
      this.cursor.show();
   }
   function initHorseCards()
   {
      this.winningHorses = [];
      var _loc5_ = ["HORSEGAME_FIRST","HORSEGAME_SECOND","HORSEGAME_THIRD"];
      var _loc4_ = 0;
      while(_loc4_ < 3)
      {
         var _loc3_ = this.app.horses[this.app.winOrder[_loc4_]];
         var _loc2_ = this.view.cards["horseCard" + (_loc4_ + 1)];
         _loc3_.init(_loc2_.horse,true);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.diamond,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.ring,_loc3_.primaryColour);
         _loc2_.num.text = _loc3_.number;
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(_loc2_.name,_loc3_.name,2.5,true,true);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(_loc2_.odds,_loc3_.odds,2.5,true,true);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(_loc2_.position,_loc5_[_loc4_],2.5,true,false);
         this.winningHorses.push(_loc3_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function onActiveElementChange(activeElementID)
   {
      if(activeElementID != -1 && activeElementID != this.currActiveElementID)
      {
         this.app.playSound("nav_hover");
      }
      this.currActiveElementID = activeElementID;
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         var _loc3_ = this.buttons[_loc2_];
         _loc3_.view.gotoAndStop(_loc3_.id != activeElementID ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleAccept()
   {
      var _loc0_ = null;
      if((_loc0_ = this.cursor.getTargetIDUnderCursor()) === com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.PLAY_AGAIN_BUTTON)
      {
         this.app.playSound("nav_generic");
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.winningHorses.length)
      {
         this.winningHorses[_loc3_].reset();
         _loc3_ = _loc3_ + 1;
      }
      this.winningHorses = null;
      super.dispose();
   }
}
