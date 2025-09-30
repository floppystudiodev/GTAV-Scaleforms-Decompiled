class com.rockstargames.gtav.levelDesign.strengthTestScore.Score
{
   var animationDuration;
   var animationStartTimestamp;
   var animationState;
   var countDownDuration;
   var countUpDuration;
   var currValue;
   var goalValue;
   var holdDuration;
   var startValue;
   var tweenArgs;
   var view;
   static var ANIMATE_IDLE = 0;
   static var ANIMATE_COUNT_UP = 1;
   static var ANIMATE_HOLD = 2;
   static var ANIMATE_COUNT_DOWN = 3;
   static var FRAME_DURATION = 0.03333333333333333;
   static var DEFAULT_COUNT_UP_DURATION = 2000;
   static var DEFAULT_HOLD_DURATION = 2000;
   static var DEFAULT_COUNT_DOWN_DURATION = 4000;
   function Score(view)
   {
      this.view = view;
      this.tweenArgs = {onCompleteScope:this,onComplete:this.updateAnimation};
   }
   function setScore(score, countUpDuration, holdDuration, countDownDuration)
   {
      this.goalValue = score;
      this.startValue = this.currValue;
      this.countUpDuration = countUpDuration == undefined ? com.rockstargames.gtav.levelDesign.strengthTestScore.Score.DEFAULT_COUNT_UP_DURATION : countUpDuration * 1000;
      this.holdDuration = holdDuration == undefined ? com.rockstargames.gtav.levelDesign.strengthTestScore.Score.DEFAULT_HOLD_DURATION : holdDuration * 1000;
      this.countDownDuration = countDownDuration == undefined ? com.rockstargames.gtav.levelDesign.strengthTestScore.Score.DEFAULT_COUNT_DOWN_DURATION : countDownDuration * 1000;
      this.animationStartTimestamp = getTimer();
      this.animationDuration = this.countUpDuration;
      this.animationState = com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_COUNT_UP;
      this.updateAnimation();
   }
   function setInstantScore(score)
   {
      this.goalValue = score;
      this.startValue = score;
      this.currValue = score;
      this.animationState = com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_IDLE;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.displayValue(this.currValue);
   }
   function updateAnimation()
   {
      var _loc2_ = (getTimer() - this.animationStartTimestamp) / this.animationDuration;
      if(_loc2_ < 1)
      {
         this.currValue = Math.round(_loc2_ * (this.goalValue - this.startValue) + this.startValue);
      }
      else
      {
         this.currValue = this.goalValue;
         this.nextState();
      }
      this.displayValue(this.currValue);
      if(this.animationState != com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_IDLE)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.strengthTestScore.Score.FRAME_DURATION,this.tweenArgs);
      }
   }
   function displayValue(value)
   {
      var _loc2_ = ("0000" + value).substr(-4);
      this.view.thousands.digit.text = _loc2_.charAt(0);
      this.view.hundreds.digit.text = _loc2_.charAt(1);
      this.view.tens.digit.text = _loc2_.charAt(2);
      this.view.units.digit.text = _loc2_.charAt(3);
   }
   function nextState()
   {
      this.animationStartTimestamp = getTimer();
      this.startValue = this.currValue;
      switch(this.animationState)
      {
         case com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_COUNT_UP:
            this.animationState = com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_HOLD;
            this.animationDuration = this.holdDuration;
            return;
         case com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_HOLD:
            this.animationState = com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_COUNT_DOWN;
            this.animationDuration = this.countDownDuration;
            this.goalValue = 0;
            return;
         default:
            this.animationState = com.rockstargames.gtav.levelDesign.strengthTestScore.Score.ANIMATE_IDLE;
            return;
      }
   }
}
