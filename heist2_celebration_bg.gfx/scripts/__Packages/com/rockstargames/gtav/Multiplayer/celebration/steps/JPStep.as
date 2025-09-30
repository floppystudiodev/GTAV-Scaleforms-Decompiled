class com.rockstargames.gtav.Multiplayer.celebration.steps.JPStep extends com.rockstargames.gtav.Multiplayer.celebration.steps.Step
{
   var alignLeft;
   var counterStep;
   var height;
   var initialised;
   var points;
   var sequence;
   var started;
   var view;
   function JPStep(sequence, points, alignLeft)
   {
      super(sequence,390,"JPStep");
      this.points = points;
      this.alignLeft = alignLeft;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      if(this.sequence.previousStep.type == "SmallDollarsStep")
      {
         this.height = 380;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("JPStep","content",0);
      _loc3_.value._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      this.displayMonospacedValue(this.points >= 0 ? "+0" : "-0");
      var _loc5_;
      var _loc6_;
      var _loc4_;
      if(this.alignLeft)
      {
         this.view.content._x -= !com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN ? 460 : 580;
      }
      else
      {
         _loc5_ = this.points.toString().length + 1;
         _loc6_ = !com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN ? 2 : 4;
         if(_loc5_ > _loc6_)
         {
            _loc4_ = 75 * (_loc5_ - _loc6_);
            if(!com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN)
            {
               _loc4_ += 20;
            }
            _loc3_.value._x -= _loc4_;
            _loc3_.icon._x -= _loc4_;
         }
      }
      _loc3_.icon._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc3_ = 91;
      var _loc2_ = 0;
      if(this.sequence.previousStep.type == "BigDollarsStep")
      {
         _loc3_ = 51;
         _loc2_ = 20;
      }
      if(this.sequence.previousStep.type == "CashStep")
      {
         _loc3_ = 31;
         _loc2_ = 20;
      }
      var _loc4_ = - this.view._parent._y - this.view._y + _loc3_;
      this.sequence.pushDownSteps(_loc4_,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      var _loc5_ = this.view.content._y + _loc2_;
      this.view.content._y = - this.view._parent._y - this.view._y - this.view.content._height;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.startCounter,onCompleteScope:this});
      this.sequence.playSound("JP_Appear",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content);
   }
   function startCounter()
   {
      var _loc2_ = Math.ceil(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.FRAME_RATE * com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POINTS_COUNT_DURATION);
      this.counterStep = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[0,this.points,_loc2_]});
   }
   function updateCounter(startValue, delta, duration)
   {
      var _loc2_ = ++this.counterStep / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      var _loc3_ = Math.round(_loc2_ * delta + startValue);
      this.displayMonospacedValue((_loc3_ >= 0 ? "+" : "-") + _loc3_);
      if(delta != 0)
      {
         this.sequence.playSound("JP_Counter",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
      }
      if(_loc2_ == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POST_POINTS_COUNT_PAUSE,{onCompleteScope:this.sequence,onComplete:this.sequence.currentStepComplete});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[startValue,delta,duration]});
      }
   }
   function createDelegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
   function displayMonospacedValue(digits)
   {
      var _loc3_ = digits.length;
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         this.view.content.value["digit" + _loc2_].text = _loc2_ >= _loc3_ ? "" : digits.charAt(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
}
