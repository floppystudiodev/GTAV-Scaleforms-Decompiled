class com.rockstargames.gtav.minigames.horseracingconsole.screens.SelectionScreenMain extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var currActiveElementID;
   var view;
   var app;
   var countdown;
   var horseCards;
   var buttons;
   var cursor;
   function SelectionScreenMain(app, viewContainer, cursor)
   {
      super(app,viewContainer,"selectionScreenMain",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.currActiveElementID = -1;
      var _loc3_ = 405;
      this.view.panel._x = Math.max(this.app.displayConfig.screenWidth * this.app.displayConfig.safeLeft,20);
      if(this.app.displayConfig.isWideScreen)
      {
         var _loc5_ = 0.5 * (this.app.displayConfig.screenWidth - this.view.panel._x - _loc3_) + this.view.panel._x + _loc3_;
         this.view.content._x = _loc5_ - 0.5 * this.view.content._width;
      }
      else
      {
         this.view.content._x = this.view.panel._x + _loc3_ + 20;
      }
      this.initText();
      this.initButtons();
      this.updateEventInProgress();
      this.setHorseView(this.app.horses[0]);
      this.countdown = new com.rockstargames.gtav.minigames.horseracingconsole.Countdown(this.view.content.countdown);
      if(this.app.countdownSecondsRemaining != undefined)
      {
         this.setCountdown(this.app.countdownSecondsRemaining);
      }
      if(!this.app.displayConfig.isWideScreen)
      {
         this.view.content.horse._xscale = 80;
         this.view.content.horse._yscale = 80;
         var _loc4_ = this.view.content.countdown._x + 0.5 * this.view.content.countdown._width;
         this.view.content.horse._x = _loc4_ - 0.5 * this.view.content.horse._width;
      }
   }
   function initText()
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.content.cancelButton.label,"HORSEGAME_CANCEL",3,true,false);
   }
   function initButtons()
   {
      this.horseCards = [];
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         var _loc3_ = this.initHorseCard(this.view.panel["horseCard" + _loc2_],_loc2_);
         this.horseCards.push(_loc3_);
         this.buttons.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.buttons.push(new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.content.cancelButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON));
      this.cursor.setChangeListener(this.delegate(this,this.onActiveElementChange));
      this.cursor.show();
   }
   function initHorseCard(cardView, index)
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
      return new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(cardView,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs["HORSE_" + index + "_BUTTON"]);
   }
   function setCountdown(secondsRemaining)
   {
      this.countdown.setTime(secondsRemaining,false);
   }
   function updateEventInProgress()
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.content.countdown.label,!this.app.mainEventInProgress ? "HORSEGAME_STARTS" : "HORSEGAME_UNDERWAY");
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
      _loc2_ = 0;
      while(_loc2_ < this.horseCards.length)
      {
         if(this.horseCards[_loc2_].id == activeElementID)
         {
            this.setHorseView(this.app.horses[_loc2_]);
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
            this.app.playSound("nav_generic");
            break;
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON:
            this.app.playSound("nav_back");
      }
   }
   function setHorseView(horse)
   {
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         this.view.content.horse["number" + _loc2_]._visible = _loc2_ == horse.number;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(this.view.content.horse.body,horse.primaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(this.view.content.horse.arms,horse.secondaryColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(this.view.content.horse.horse,horse.horseColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(this.view.content.horse.mane,horse.maneColour);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(this.view.content.horse.tail,horse.maneColour);
   }
   function dispose()
   {
      this.countdown.dispose();
      this.countdown = null;
      super.dispose();
   }
}
