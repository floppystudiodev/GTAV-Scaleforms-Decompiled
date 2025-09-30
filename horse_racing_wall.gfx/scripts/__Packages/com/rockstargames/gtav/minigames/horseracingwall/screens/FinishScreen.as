class com.rockstargames.gtav.minigames.horseracingwall.screens.FinishScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var initTimestamp;
   static var DURATION = 2500;
   function FinishScreen(app, viewContainer, navigation)
   {
      super(app,viewContainer,"finishScreen",navigation);
      this.init();
   }
   function init()
   {
      super.init();
      this.initTimestamp = getTimer();
   }
   function isComplete()
   {
      return getTimer() - this.initTimestamp > com.rockstargames.gtav.minigames.horseracingwall.screens.FinishScreen.DURATION;
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.app.horses.length)
      {
         this.app.horses[_loc3_].reset();
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
}
