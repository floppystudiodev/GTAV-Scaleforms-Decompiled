class com.rockstargames.gtav.minigames.horseracingwall.screens.CountdownScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var countdown;
   var view;
   function CountdownScreen(app, viewContainer, navigation)
   {
      super(app,viewContainer,"countdownScreen",navigation);
      this.init();
   }
   function init()
   {
      super.init();
      this.view.placeBetPanel.label.autoSize = "left";
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.placeBetPanel.label,"HORSEGAME_MAIN_SUB2",3,true,false);
      this.view.placeBetPanel.bgCentre._width = this.view.placeBetPanel.label._width + 4;
      this.view.placeBetPanel.bgRight._x = this.view.placeBetPanel.bgCentre._x + this.view.placeBetPanel.label._width + this.view.placeBetPanel.bgRight._width;
      this.view.placeBetPanel._x = 0.5 * (com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH - this.view.placeBetPanel._width);
      this.countdown = new com.rockstargames.gtav.minigames.horseracingwall.Countdown(this.view.countdown);
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setLocalisedText(this.view.countdown.label,"HORSEGAME_STARTS");
      if(this.app.countdownSecondsRemaining != undefined)
      {
         this.setCountdown(this.app.countdownSecondsRemaining);
      }
      this.updateHorses();
   }
   function setCountdown(secondsRemaining)
   {
      this.countdown.setTime(secondsRemaining,false);
   }
   function updateHorses()
   {
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      var _loc5_;
      while(_loc4_ < this.app.horses.length)
      {
         _loc3_ = this.app.horses[_loc4_];
         _loc2_ = this.view["horseCard" + _loc4_];
         _loc3_.init(_loc2_.horse,true);
         _loc2_.num.text = _loc3_.number;
         if(this.app.displayConfig.isAsian)
         {
            this.app.resizeAsianText(_loc2_.num);
         }
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(_loc2_.nameWrapper.label,_loc3_.name,3,true,true);
         if(this.app.displayConfig.isAsian)
         {
            _loc5_ = 386;
            _loc2_.nameWrapper.label.autoSize = "left";
            _loc2_.nameWrapper._xscale = _loc2_.nameWrapper._yscale = Math.min(100,_loc2_.nameWrapper._xscale * _loc5_ / _loc2_.nameWrapper._width);
            _loc2_.nameWrapper._x = 0.5 * (_loc5_ - _loc2_.nameWrapper._width);
         }
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(_loc2_.odds,_loc3_.odds,5,true,true);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(_loc2_.diamond,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.colourise(_loc2_.ring,_loc3_.primaryColour);
         _loc4_ = _loc4_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.app.horses.length)
      {
         this.app.horses[_loc3_].reset();
         _loc3_ = _loc3_ + 1;
      }
      this.countdown.dispose();
      this.countdown = null;
      super.dispose();
   }
}
