class com.rockstargames.gtav.levelDesign.celebration.steps.CashStep extends com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var startValue;
   var finalValue;
   var alignLeft;
   var initialised;
   var view;
   var sequence;
   var started;
   var counterStep;
   function CashStep(sequence, startValue, finalValue, alignLeft)
   {
      super(sequence,280,"CashStep");
      this.startValue = startValue;
      this.finalValue = finalValue;
      this.alignLeft = alignLeft;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("CashStep","content",0);
      _loc3_.value._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      this.displayMonospacedValue((this.startValue >= 0 ? "+$" : "-$") + this.startValue);
      _loc3_.icon._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      if(this.alignLeft)
      {
         this.view.content._x -= !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? 212 : 332;
      }
      else
      {
         var _loc5_ = Math.max(this.startValue.toString().length,this.finalValue.toString().length) + 2;
         var _loc6_ = !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? 5 : 7;
         if(_loc5_ > _loc6_)
         {
            var _loc4_ = 75 * (_loc5_ - _loc6_);
            _loc3_.value._x -= _loc4_;
            _loc3_.icon._x -= _loc4_;
         }
      }
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc2_ = - this.view._parent._y - this.view._y + 91;
      this.sequence.pushDownSteps(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      var _loc3_ = this.view.content._y;
      this.view.content._y = - this.view._parent._y - this.view._y - this.view.content._height;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.startCounter,onCompleteScope:this});
      this.sequence.playSound("Prep_Cash_Appear","DLC_HEISTS_PREP_SCREEN_SOUNDS");
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content);
   }
   function startCounter()
   {
      var _loc2_ = Math.ceil(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.FRAME_RATE * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POINTS_COUNT_DURATION);
      this.counterStep = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[this.startValue,this.finalValue - this.startValue,_loc2_]});
   }
   function updateCounter(startValue, delta, duration)
   {
      var _loc2_ = ++this.counterStep / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      var _loc3_ = Math.round(_loc2_ * delta + startValue);
      this.displayMonospacedValue((_loc3_ >= 0 ? "+$" : "-$") + _loc3_);
      if(delta != 0)
      {
         this.sequence.playSound("Prep_Cash_Counter","DLC_HEISTS_PREP_SCREEN_SOUNDS");
      }
      if(_loc2_ == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POST_POINTS_COUNT_PAUSE,{onCompleteScope:this,onComplete:this.stepComplete});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[startValue,delta,duration]});
      }
   }
   function stepComplete()
   {
      var _loc2_ = this.sequence.previousStep.view._y + 80;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.sequence.previousStep.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      this.sequence.currentStepComplete();
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
