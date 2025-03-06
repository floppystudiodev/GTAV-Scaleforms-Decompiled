class com.rockstargames.gtav.minigames.horseracingconsole.Countdown
{
   var view;
   var digits;
   var firstRun;
   static var MIN = 0;
   static var MAX = 3599;
   static var NUM_DIGITS = 4;
   function Countdown(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.digits = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.minigames.horseracingconsole.Countdown.NUM_DIGITS)
      {
         this.digits[_loc2_] = new com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit(this.view["digit" + _loc2_]);
         this.digits[_loc2_].value = 0;
         this.digits[_loc2_].update(true);
         _loc2_ = _loc2_ + 1;
      }
      this.firstRun = true;
   }
   function setTime(seconds, setImmediately)
   {
      if(seconds < com.rockstargames.gtav.minigames.horseracingconsole.Countdown.MIN)
      {
         seconds = com.rockstargames.gtav.minigames.horseracingconsole.Countdown.MIN;
      }
      else if(seconds > com.rockstargames.gtav.minigames.horseracingconsole.Countdown.MAX)
      {
         seconds = com.rockstargames.gtav.minigames.horseracingconsole.Countdown.MAX;
      }
      this.digits[0].value = Math.floor(seconds % 10);
      this.digits[1].value = Math.floor(0.1 * (seconds % 60));
      this.digits[2].value = Math.floor(seconds / 60) % 10;
      this.digits[3].value = Math.floor(seconds / 600) % 10;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.minigames.horseracingconsole.Countdown.NUM_DIGITS)
      {
         this.digits[_loc2_].update(setImmediately || this.firstRun);
         _loc2_ = _loc2_ + 1;
      }
      this.firstRun = false;
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.minigames.horseracingconsole.Countdown.NUM_DIGITS)
      {
         this.digits[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.digits = null;
      this.view = null;
   }
}
