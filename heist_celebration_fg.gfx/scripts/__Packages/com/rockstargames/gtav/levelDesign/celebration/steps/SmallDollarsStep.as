class com.rockstargames.gtav.levelDesign.celebration.steps.SmallDollarsStep extends com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var counterStep;
   var description;
   var initialised;
   var sequence;
   var started;
   var title;
   var value;
   var view;
   function SmallDollarsStep(sequence, title, description, value)
   {
      super(sequence,260,"SmallDollarsStep");
      this.title = title;
      this.description = description;
      this.value = value;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("SmallDollarsStep","content",0);
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc3_.title._x = 200;
         _loc3_.description._x = 200;
      }
      _loc3_.title.autoSize = "left";
      _loc3_.title.text = this.title.toUpperCase();
      _loc3_.description.autoSize = "left";
      _loc3_.description.text = this.description;
      this.displayMonospacedValue("$0");
      var _loc8_ = this.value.toString().length + 1;
      _loc3_.value._x = (!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? 1090 : 1170) - 27 * _loc8_;
      var _loc5_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * _loc3_.title._x;
      var _loc6_ = _loc5_ / _loc3_.title._width;
      _loc5_ = _loc3_.value._x - _loc3_.description._x - 20;
      var _loc7_ = _loc5_ / _loc3_.description._width;
      var _loc4_ = Math.min(_loc6_,_loc7_);
      if(_loc4_ < 1)
      {
         _loc4_ *= 100;
         _loc3_.title._xscale = _loc3_.title._yscale = _loc4_;
         _loc3_.description._xscale = _loc3_.description._yscale = _loc4_;
         _loc3_.value._xscale = _loc3_.value._yscale = _loc4_;
      }
      _loc3_.title._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.description._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.value._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc2_ = - this.view._parent._y - this.view._y + 65;
      this.sequence.pushDownSteps(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.startCashCounter,onCompleteScope:this});
      this.sequence.playSound("Text_String_Appear","DLC_HEISTS_PREP_SCREEN_SOUNDS");
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function startCashCounter()
   {
      var _loc2_ = Math.ceil(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.FRAME_RATE * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POINTS_COUNT_DURATION);
      this.counterStep = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCashCounter,onCompleteArgs:[0,this.value,_loc2_]});
   }
   function updateCashCounter(startValue, delta, duration)
   {
      var _loc2_ = ++this.counterStep / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      this.displayMonospacedValue("$" + Math.round(_loc2_ * delta + startValue));
      if(delta != 0)
      {
         this.sequence.playSound("Text_String_Counter","DLC_HEISTS_PREP_SCREEN_SOUNDS");
      }
      if(_loc2_ == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POST_POINTS_COUNT_PAUSE,{onComplete:this.sequence.currentStepComplete,onCompleteScope:this.sequence});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCashCounter,onCompleteArgs:[startValue,delta,duration]});
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
