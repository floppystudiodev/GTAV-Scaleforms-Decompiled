class com.rockstargames.gtav.levelDesign.hangarCargo.PieChart
{
   var currAngle;
   var goalAngle;
   var view;
   static var ANIMATION_SPEED = 10;
   static var FRAME_DURATION = 0.03333333333333333;
   function PieChart(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.currAngle = 0;
      this.goalAngle = 0;
      this.update(this.goalAngle);
   }
   function setAngle(angle, immediate)
   {
      this.goalAngle = angle;
      if(immediate)
      {
         this.update(this.goalAngle);
      }
      else
      {
         this.update(this.currAngle);
      }
   }
   function getAngle()
   {
      return this.goalAngle;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view = null;
   }
   function update(angle)
   {
      this.currAngle = angle;
      if(angle > 180)
      {
         this.view.rightMask._rotation = 0;
         this.view.leftMask._rotation = angle - 360;
         this.view.rightRemainderMask._rotation = 180;
         this.view.leftRemainderMask._rotation = angle - 180;
      }
      else
      {
         this.view.rightMask._rotation = angle - 180;
         this.view.leftMask._rotation = -180;
         this.view.rightRemainderMask._rotation = angle;
         this.view.leftRemainderMask._rotation = 0;
      }
      var _loc3_ = this.goalAngle - angle;
      if(_loc3_ < - com.rockstargames.gtav.levelDesign.hangarCargo.PieChart.ANIMATION_SPEED)
      {
         angle -= com.rockstargames.gtav.levelDesign.hangarCargo.PieChart.ANIMATION_SPEED;
      }
      else if(_loc3_ > com.rockstargames.gtav.levelDesign.hangarCargo.PieChart.ANIMATION_SPEED)
      {
         angle += com.rockstargames.gtav.levelDesign.hangarCargo.PieChart.ANIMATION_SPEED;
      }
      else
      {
         angle = this.goalAngle;
      }
      if(this.currAngle != this.goalAngle)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.PieChart.FRAME_DURATION,{onCompleteScope:this,onComplete:this.update,onCompleteArgs:[angle]});
      }
   }
}
