class com.rockstargames.gtav.minigames.horseracingconsole.screens.MainScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var app;
   var buttons;
   var countdown;
   var currActiveElementID;
   var cursor;
   var mainButton;
   var rulesButton;
   var singleButton;
   var view;
   function MainScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"mainScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.currActiveElementID = -1;
      if(!this.app.displayConfig.isWideScreen)
      {
         this.view.gotoAndStop("narrow");
      }
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.mainTitle,"HORSEGAME_MAIN",5,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.mainSubheading,"HORSEGAME_MAIN_SUB");
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.singleTitle,"HORSEGAME_SINGLE",5,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.singleSubheading,"HORSEGAME_SINGLE_SUB");
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.mainTitle);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.mainTitle);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.singleTitle);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.resizeAsianText(this.view.singleTitle);
      }
      this.countdown = new com.rockstargames.gtav.minigames.horseracingconsole.Countdown(this.view.countdown);
      if(this.app.countdownSecondsRemaining != undefined)
      {
         this.setCountdown(this.app.countdownSecondsRemaining);
      }
      this.updateEventInProgress();
      if(this.app.mainSelectedHorseIndex == -1)
      {
         this.mainButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.mainEventButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.MAIN_EVENT_BUTTON);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.mainEventButton.label,"HORSEGAME_CTA",3,true,false);
      }
      else
      {
         this.mainButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.mainEventButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.VIEW_MAIN_BET_BUTTON);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.mainEventButton.label,"HORSEGAME_VIEWBET",3,true,false);
      }
      this.buttons.push(this.mainButton);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.singleEventButton.label,"HORSEGAME_CTA",3,true,false);
      this.singleButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.singleEventButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.SINGLE_EVENT_BUTTON);
      this.buttons.push(this.singleButton);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.rulesButton.label,"HORSEGAME_RULES",3,true,false);
      this.rulesButton = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.rulesButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.RULES_BUTTON);
      this.buttons.push(this.rulesButton);
      this.cursor.setChangeListener(this.delegate(this,this.onActiveElementChange));
      this.cursor.show();
      this.updateBettingEnabled();
      this.updateEventInProgress();
   }
   function updateBettingEnabled()
   {
      if(!this.app.bettingEnabled && this.app.mainSelectedHorseIndex == -1 || this.app.mainEventInProgress)
      {
         this.mainButton.view._visible = false;
         this.mainButton.enabled = false;
      }
      else
      {
         this.mainButton.view._visible = true;
         this.mainButton.enabled = true;
      }
      this.cursor.setTargetRects(this.buttons);
   }
   function updateEventInProgress()
   {
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.countdown.label,!this.app.mainEventInProgress ? "HORSEGAME_STARTS" : "HORSEGAME_UNDERWAY");
      this.mainButton.enabled = !this.app.mainEventInProgress;
      this.mainButton.view._visible = !this.app.mainEventInProgress;
      this.cursor.setTargetRects(this.buttons);
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
   }
   function handleAccept()
   {
      switch(this.cursor.getTargetIDUnderCursor())
      {
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.MAIN_EVENT_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.SINGLE_EVENT_BUTTON:
         case com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.RULES_BUTTON:
            this.app.playSound("nav_generic");
      }
      if(this.cursor.getTargetIDUnderCursor() == com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.RULES_BUTTON)
      {
         this.app.showScreen(this.app.RULES_SCREEN);
      }
   }
   function setCountdown(secondsRemaining)
   {
      this.countdown.setTime(secondsRemaining,false);
   }
   function dispose()
   {
      this.countdown.dispose();
      this.countdown = null;
      super.dispose();
   }
}
