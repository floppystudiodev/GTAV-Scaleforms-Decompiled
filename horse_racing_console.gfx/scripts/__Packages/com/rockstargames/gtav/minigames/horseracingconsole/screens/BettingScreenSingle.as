class com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenSingle extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var app;
   var buttons;
   var cancelButton;
   var currActiveElementID;
   var cursor;
   var decreaseBetButton;
   var horseCards;
   var increaseBetButton;
   var placeBetButton;
   var view;
   static var MIN_BET = 100;
   function BettingScreenSingle(app, viewContainer, cursor)
   {
      super(app,viewContainer,"bettingScreenSingle",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.currActiveElementID = -1;
      var _loc3_ = 405;
      this.view.panel._x = Math.max(this.app.displayConfig.screenWidth * this.app.displayConfig.safeLeft,20);
      var _loc4_;
      var _loc5_;
      if(this.app.displayConfig.isWideScreen)
      {
         _loc4_ = 0.5 * (this.app.displayConfig.screenWidth - this.view.panel._x - _loc3_) + this.view.panel._x + _loc3_;
         _loc5_ = 422;
         this.view.content._x = _loc4_ - 0.5 * _loc5_;
      }
      else
      {
         this.view.content._x = this.view.panel._x + _loc3_ + 20;
      }
      this.initText();
      this.initButtons();
      this.updateBettingValues();
   }
   function initText()
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.heading,"HORSEGAME_SINGLE",4,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.subheading,"HORSEGAME_SINGLE_SUB2",2,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.numChipsLabel,"HORSEGAME_BALANCE",2,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.payoutLabel,"HORSEGAME_PAYOUT",5,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.placeBetButton.label,"HORSEGAME_CTA",3,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.cancelButton.label,"HORSEGAME_CANCEL",3,true,false);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.content.heading);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.content.payoutLabel);
         this.view.content.numChipsLabel.verticalAlign = "top";
         this.view.content.numChipsLabel._height *= 1.5;
         this.view.content.numChips.verticalAlign = "top";
         this.view.content.numChips._height *= 1.5;
      }
   }
   function initButtons()
   {
      this.increaseBetButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.content.increaseBetButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.INCREASE_BET_BUTTON);
      this.decreaseBetButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.content.decreaseBetButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.DECREASE_BET_BUTTON);
      this.placeBetButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.content.placeBetButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.PLACE_BET_BUTTON);
      this.cancelButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.content.cancelButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON);
      this.buttons = [this.increaseBetButton,this.decreaseBetButton,this.placeBetButton,this.cancelButton];
      this.horseCards = [];
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 6)
      {
         _loc3_ = this.initHorseCard(this.view.panel["horseCard" + _loc2_],_loc2_);
         this.horseCards.push(_loc3_);
         this.buttons.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setChangeListener(this.delegate(this,this.onActiveElementChange));
      this.cursor.show();
      this.updateBettingEnabled();
   }
   function initHorseCard(cardView, index)
   {
      this.initHorseCardView(cardView,index);
      return new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(cardView,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs["HORSE_" + index + "_BUTTON"]);
   }
   function initHorseCardView(cardView, index)
   {
      var _loc3_ = this.app.horses[index - 1];
      cardView.horseName.textAutoSize = "shrink";
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(cardView.horseName,_loc3_.name,2,true,true);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(cardView.odds,_loc3_.odds,2,true,true);
      cardView.horseNumber.text = _loc3_.number;
      cardView.highlight._visible = false;
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.diamond,_loc3_.primaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.ring,_loc3_.primaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.horse.body,_loc3_.primaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.horse.arms,_loc3_.secondaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.horse.mane,_loc3_.maneColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(cardView.horse.horse,_loc3_.horseColour);
   }
   function onActiveElementChange(activeElementID)
   {
      if(activeElementID != -1 && activeElementID != this.currActiveElementID)
      {
         this.app.playSound("nav_hover");
      }
      this.currActiveElementID = activeElementID;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         _loc3_.view.gotoAndStop(_loc3_.id != activeElementID ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.horseCards.length)
      {
         if(this.horseCards[_loc2_].id == this.app.singleSelectedHorseIndex + 2)
         {
            this.horseCards[_loc2_].view.gotoAndStop("on");
            this.horseCards[_loc2_].view.odds.textColor = 16703232;
            this.horseCards[_loc2_].view.highlight._visible = true;
         }
         else if(this.horseCards[_loc2_].id == activeElementID)
         {
            this.horseCards[_loc2_].view.odds.textColor = 16703232;
            this.horseCards[_loc2_].view.highlight._visible = true;
         }
         else
         {
            this.horseCards[_loc2_].view.odds.textColor = 6710886;
            this.horseCards[_loc2_].view.highlight._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleAccept()
   {
      switch(this.cursor.getTargetIDUnderCursor())
      {
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_1_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_2_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_3_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_4_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_5_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.HORSE_6_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.INCREASE_BET_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.DECREASE_BET_BUTTON:
            this.app.playSound("nav_generic");
            break;
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.PLACE_BET_BUTTON:
            this.app.playSound("nav_place_bet");
            break;
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON:
            this.app.playSound("nav_back");
         default:
            return;
      }
   }
   function updateBettingValues()
   {
      var _loc4_ = this.view.panel["horseCard" + (this.app.singleSelectedHorseIndex + 1)];
      _loc4_.gotoAndStop("on");
      _loc4_.odds.textColor = 16703232;
      _loc4_ = this.view.content.horseCardSelected;
      _loc4_.gotoAndStop("on");
      _loc4_.odds.textColor = 16703232;
      this.initHorseCardView(_loc4_,this.app.singleSelectedHorseIndex + 1);
      this.onActiveElementChange(this.app.singleSelectedHorseIndex + 2);
      this.view.content.numChips.text = this.app.chips;
      this.view.content.bet.text = this.app.singleBetAmount;
      this.view.content.payout.text = this.app.singlePayout;
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.payoutLabel,"HORSEGAME_PAYOUT",5,true,false);
      var _loc2_;
      if(this.app.displayConfig.isAsian)
      {
         _loc2_ = 0;
         while(_loc2_ < 2)
         {
            com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.content.bet);
            com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.content.payout);
            com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.content.payoutLabel);
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc5_ = this.view.content.heading._x + 0.5 * this.view.content.heading._width;
      var _loc7_;
      var _loc6_;
      var _loc3_ = 8;
      _loc7_ = this.view.content.numChipsLabel.textWidth + _loc3_ + this.view.content.chip1._width + _loc3_ + this.view.content.numChips.textWidth;
      _loc6_ = _loc5_ - 0.5 * _loc7_;
      this.view.content.numChipsLabel._x = _loc6_ + this.view.content.numChipsLabel.textWidth - this.view.content.numChipsLabel._width;
      this.view.content.chip1._x = this.view.content.numChipsLabel._x + this.view.content.numChipsLabel._width + _loc3_;
      this.view.content.numChips._x = this.view.content.chip1._x + this.view.content.chip1._width + _loc3_;
      this.view.content.chip2._x = _loc5_ - this.view.content.chip2._width - _loc3_;
      this.view.content.bet._x = _loc5_ + _loc3_;
      _loc7_ = this.view.content.payoutLabel.textWidth + _loc3_ + this.view.content.chip3._width + _loc3_ + this.view.content.payout.textWidth;
      _loc6_ = _loc5_ - 0.5 * _loc7_;
      this.view.content.payoutLabel._x = _loc6_ + this.view.content.payoutLabel.textWidth - this.view.content.payoutLabel._width;
      this.view.content.chip3._x = this.view.content.payoutLabel._x + this.view.content.payoutLabel._width + _loc3_;
      this.view.content.payout._x = this.view.content.chip3._x + this.view.content.chip3._width + _loc3_;
   }
   function updateBettingEnabled()
   {
      var _loc2_ = this.app.chips >= com.rockstargames.gtav.minigames.horseracingconsole.screens.BettingScreenSingle.MIN_BET;
      this.increaseBetButton.enabled = this.increaseBetButton.view._visible = _loc2_;
      this.decreaseBetButton.enabled = this.decreaseBetButton.view._visible = _loc2_;
      this.placeBetButton.enabled = this.placeBetButton.view._visible = _loc2_;
      this.cancelButton.view._y = !_loc2_ ? 471 : 551;
      this.cancelButton.updateBounds();
      this.cursor.setTargetRects(this.buttons);
   }
}
