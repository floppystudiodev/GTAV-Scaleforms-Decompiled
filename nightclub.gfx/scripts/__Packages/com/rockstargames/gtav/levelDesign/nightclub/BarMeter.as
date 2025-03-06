class com.rockstargames.gtav.levelDesign.nightclub.BarMeter
{
   var view;
   var xMin;
   var tweenArgs;
   static var TWEEN_DURATION = 3;
   function BarMeter(view, label, forceLabelUpperCase, delay)
   {
      this.view = view;
      this.xMin = - view.bar._width;
      view.bar._x = this.xMin;
      if(forceLabelUpperCase)
      {
         view.label.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(view.label,label).toUpperCase();
      }
      else
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(view.label,label);
      }
      this.tweenArgs = {_x:this.xMin,delay:delay,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT};
   }
   function setValue(value, min, max, showImmediately)
   {
      if(value < min)
      {
         value = min;
      }
      else if(value > max)
      {
         value = max;
      }
      var _loc2_ = this.xMin * (1 - (value - min) / (max - min));
      if(showImmediately)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bar);
         this.tweenArgs._x = _loc2_;
         this.view.bar._x = _loc2_;
      }
      else if(this.tweenArgs._x != _loc2_)
      {
         this.tweenArgs._x = _loc2_;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.bar,com.rockstargames.gtav.levelDesign.nightclub.BarMeter.TWEEN_DURATION,this.tweenArgs);
      }
   }
   function setVisible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bar);
   }
}
