class com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter
{
   var currValue;
   var goalValue;
   var maxWidth;
   var startValue;
   var tweenStartTimestamp;
   var view;
   static var MIN_WIDTH = 26;
   static var MAX_WIDTH = 300;
   static var TWEEN_DURATION = 1;
   function CapacityMeter(view, maxWidth)
   {
      this.view = view;
      this.maxWidth = maxWidth != undefined ? maxWidth : com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.MAX_WIDTH;
      this.startValue = 0;
      this.currValue = 0;
      this.goalValue = 0;
      view.bar._width = com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.MIN_WIDTH;
      view.label.text = "0%";
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bar);
   }
   function set percentage(value)
   {
      this.startValue = this.currValue;
      this.goalValue = Math.round(Math.max(0,Math.min(100,value)));
      var _loc2_;
      if(this.goalValue != this.startValue)
      {
         this.tweenStartTimestamp = getTimer();
         _loc2_ = Math.max(com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.MIN_WIDTH,0.01 * this.goalValue * this.maxWidth);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.bar,com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.TWEEN_DURATION,{_width:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
         this.updateLabel();
      }
   }
   function updateLabel()
   {
      var _loc3_ = getTimer() - this.tweenStartTimestamp;
      var _loc2_ = 0.001 * _loc3_ / com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.TWEEN_DURATION;
      if(_loc2_ > 1)
      {
         _loc2_ = 1;
      }
      this.currValue = _loc2_ * (this.goalValue - this.startValue) + this.startValue;
      this.view.label.text = Math.round(this.currValue) + "%";
      this.view.label._width = this.view.bar._width;
      if(_loc3_ < com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter.TWEEN_DURATION * 1000)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Inventory_Counter");
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.033,{onCompleteScope:this,onComplete:this.updateLabel});
      }
   }
}
