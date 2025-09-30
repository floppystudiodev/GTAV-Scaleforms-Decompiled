class com.rockstargames.gtav.minigames.horseracingconsole.screens.FinishScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var app;
   var cursor;
   var initTimestamp;
   var view;
   static var DURATION = 2500;
   function FinishScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"finishScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.initHorses();
      this.setPhotoFinish();
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.whiteFlash.label,"HORSEGAME_PHOTO",1.5,true,false);
      this.initTimestamp = getTimer();
      this.cursor.hide();
      this.app.playSound("race_finish");
   }
   function initHorses()
   {
      var _loc4_ = this.view.createEmptyMovieClip("horseContainer",this.view.getNextHighestDepth());
      _loc4_.attachMovie("finishingLine","finishingLine",_loc4_.getNextHighestDepth());
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.app.horses.length)
      {
         _loc3_ = _loc4_.attachMovie("horse","horse" + _loc2_,_loc4_.getNextHighestDepth());
         this.app.horses[_loc2_].init(_loc3_,false);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPhotoFinish()
   {
      this.setPhotoFinishElement(this.view.parallax,this.app.photoFinish.parallax);
      this.setPhotoFinishElement(this.view.horseContainer,this.app.photoFinish.horses);
      this.app.photoFinish = null;
      this.view.whiteFlash.swapDepths(this.view.getNextHighestDepth());
   }
   function setPhotoFinishElement(element, data)
   {
      element._x = data.x;
      element._y = data.y;
      element._xscale = data.xScale;
      element._yscale = data.yScale;
      element.gotoAndStop(data.frame);
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < data.children.length)
      {
         _loc3_ = data.children[_loc2_];
         this.setPhotoFinishElement(element[_loc3_.name],_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function isComplete()
   {
      return getTimer() - this.initTimestamp > com.rockstargames.gtav.minigames.horseracingconsole.screens.FinishScreen.DURATION;
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
