class com.rockstargames.gtav.levelDesign.securoserv.Screensaver
{
   var view;
   var activeStripes;
   var inactiveStripes;
   static var MAX_STRIPES = 5;
   static var STATE = [];
   function Screensaver(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.activeStripes = [];
      this.inactiveStripes = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.securoserv.Screensaver.MAX_STRIPES)
      {
         var _loc4_ = this.view.attachMovie("screensaverStripe","stripe" + _loc2_,_loc2_,{_visible:false});
         var _loc3_ = new com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe(_loc4_);
         _loc3_.init();
         this.activeStripes.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.restoreState();
      this.update();
   }
   function update()
   {
      if(this.inactiveStripes.length > 0 && (Math.random() < 0.025 || this.activeStripes.length == 0))
      {
         var _loc4_ = com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe(this.inactiveStripes.pop());
         _loc4_.init();
         this.activeStripes.push(_loc4_);
      }
      var _loc2_ = this.activeStripes.length - 1;
      while(_loc2_ >= 0)
      {
         var _loc3_ = this.activeStripes[_loc2_].update();
         if(_loc3_)
         {
            this.inactiveStripes.push(this.activeStripes.splice(_loc2_,1)[0]);
         }
         _loc2_ = _loc2_ - 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.025,{onCompleteScope:this,onComplete:this.update});
   }
   function saveState()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.activeStripes.length)
      {
         com.rockstargames.gtav.levelDesign.securoserv.Screensaver.STATE.push(this.activeStripes[_loc2_].getState());
         _loc2_ = _loc2_ + 1;
      }
   }
   function restoreState()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.securoserv.Screensaver.STATE.length)
      {
         var _loc3_ = this.activeStripes[_loc2_];
         if(_loc3_)
         {
            _loc3_.setState(com.rockstargames.gtav.levelDesign.securoserv.Screensaver.STATE[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   static function clearState()
   {
      com.rockstargames.gtav.levelDesign.securoserv.Screensaver.STATE = [];
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
