class com.rockstargames.gtav.levelDesign.securoserv.Marker extends com.rockstargames.gtav.levelDesign.securoserv.Button
{
   var view;
   var previousMeterScale;
   var left;
   var right;
   var top;
   var bottom;
   var currState;
   function Marker(id, view)
   {
      super(id,view);
   }
   function updatePosition(x, y)
   {
      this.view._x = x;
      this.view._y = y;
      this.previousMeterScale = 1;
      this.updateBounds();
   }
   function getView()
   {
      return this.view;
   }
   function isOnStage(stageLeft, stageRight, stageTop, stageBottom)
   {
      return this.left < stageRight - com.rockstargames.gtav.levelDesign.securoserv.Cursor.RIGHT_MARGIN && this.right > stageLeft + com.rockstargames.gtav.levelDesign.securoserv.Cursor.LEFT_MARGIN && this.top < stageBottom - com.rockstargames.gtav.levelDesign.securoserv.Cursor.BOTTOM_MARGIN && this.bottom > stageTop + com.rockstargames.gtav.levelDesign.securoserv.Cursor.TOP_MARGIN;
   }
   function bringToFront()
   {
      this.view.swapDepths(this.view._parent.getNextHighestDepth());
   }
   function updateBounds()
   {
      var _loc3_ = this.view.getBounds(_root);
      var _loc4_ = 0.25 * (_loc3_.xMax - _loc3_.xMin);
      this.left = _loc3_.xMin + _loc4_;
      this.right = _loc3_.xMax - _loc4_;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
   }
   function initMeter(ratio, reset)
   {
      var _loc2_ = 100 * ratio;
      var _loc3_ = 500;
      if(reset)
      {
         this.view.marker.meter.bar._xscale = 1;
         this.view.marker.percentage.label.text = "";
      }
      else
      {
         this.view.marker.meter.bar._xscale = this.previousMeterScale;
         this.view.marker.percentage.label.text = Math.round(this.previousMeterScale) + "%";
         _loc3_ *= Math.abs(_loc2_ - this.previousMeterScale) / _loc2_;
      }
      if(_loc2_ != 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.marker,0.2,{onCompleteScope:this,onComplete:this.updatePercentage,onCompleteArgs:[getTimer(),_loc3_,_loc2_]});
      }
      else
      {
         this.view.marker.percentage.label.text = "0%";
         this.view.marker.meter.bar._xscale = 1;
      }
   }
   function updatePercentage(startTime, duration, goal)
   {
      var _loc3_ = getTimer() - startTime;
      var _loc2_ = Math.round(Math.min(goal,goal * _loc3_ / duration));
      if(this.currState == "ownedSelected" || this.view.marker._currentframe == this.view.marker._totalframes)
      {
         this.view.marker.percentage.label.text = _loc2_ + "%";
      }
      this.view.marker.meter.bar._xscale = _loc2_;
      if(_loc2_ < Math.round(goal))
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Mouseover_Counter");
      }
      if(_loc3_ < duration)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.marker,0.03,{onCompleteScope:this,onComplete:this.updatePercentage,onCompleteArgs:[startTime,duration,goal]});
      }
   }
   function setState(state)
   {
      this.previousMeterScale = this.view.marker.meter.bar._xscale;
      if(state != "ownedSelected")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.marker);
      }
      super.setState(state);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.marker);
   }
}
