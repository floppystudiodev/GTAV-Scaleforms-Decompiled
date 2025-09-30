class com.rockstargames.gtav.web.casino.RolloverPoller
{
   var browser;
   var changeListener;
   var currRolloverIndex;
   var targets;
   var tickArgs;
   var tickMC;
   static var TICK_DURATION = 0.03333333333333333;
   function RolloverPoller(view, browser, changeListener)
   {
      this.browser = browser;
      this.changeListener = changeListener;
      this.tickMC = view.createEmptyMovieClip("tickMC",view.getNextHighestDepth());
      this.tickArgs = {onCompleteScope:this,onComplete:this.poll};
      this.currRolloverIndex = -1;
      this.targets = [];
      this.poll();
   }
   function addPollTarget(target)
   {
      this.targets.push(target);
   }
   function poll()
   {
      var _loc7_ = -1;
      var _loc5_ = {x:0,y:0};
      this.browser.CURSOR.localToGlobal(_loc5_);
      var _loc3_ = 0;
      var _loc6_ = this.targets.length;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < _loc6_)
      {
         _loc4_ = this.targets[_loc3_];
         _loc2_ = {x:0,y:0};
         _loc4_.localToGlobal(_loc2_);
         if(_loc5_.x > _loc2_.x && _loc5_.y > _loc2_.y && _loc5_.x < _loc2_.x + _loc4_._width && _loc5_.y < _loc2_.y + _loc4_._height)
         {
            _loc7_ = _loc3_;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.currRolloverIndex != _loc7_)
      {
         this.changeListener(_loc7_,this.targets[_loc7_]);
         this.currRolloverIndex = _loc7_;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.tickMC,com.rockstargames.gtav.web.casino.RolloverPoller.TICK_DURATION,this.tickArgs);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.tickMC);
      this.targets = null;
      this.changeListener = null;
      this.tickMC = null;
      this.tickArgs = null;
      this.browser = null;
   }
}
