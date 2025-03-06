class com.rockstargames.gtav.levelDesign.securoserv.PieChart
{
   var view;
   var fillComplete;
   var goalRotation;
   static var BG_IN_DURATION = 0.4;
   static var FILL_RATE = 180;
   function PieChart(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.dispose();
      this.view.redFill0._rotation = -180;
      this.view.redFill1._rotation = 0;
      this.view.bg._width = this.view.blackCircle._width;
      this.view.bg._height = this.view.blackCircle._height;
      this.view.logo._alpha = 0;
      this.view.logo._visible = false;
      this.view.lines._visible = false;
      this.view.blackCircle._alpha = 0;
      this.view.blackCircle._visible = false;
      this.view.bg._alpha = 0;
      this.view.bg._visible = false;
      this.fillComplete = false;
   }
   function animateTo(percentage)
   {
      this.view.logo._visible = true;
      this.view.blackCircle._visible = true;
      this.view.bg._visible = true;
      this.view.lines._visible = true;
      this.fillComplete = false;
      this.goalRotation = 3.6 * Math.max(0,Math.min(100,percentage));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.logo,com.rockstargames.gtav.levelDesign.securoserv.PieChart.BG_IN_DURATION,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.blackCircle,com.rockstargames.gtav.levelDesign.securoserv.PieChart.BG_IN_DURATION,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.bg,com.rockstargames.gtav.levelDesign.securoserv.PieChart.BG_IN_DURATION,{_xscale:99.5,_yscale:99.5,_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onCompleteScope:this,onComplete:this.initFillAnimation});
      com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Summary_Total_Stock_Holding_Free_Appear");
   }
   function initFillAnimation()
   {
      var _loc2_ = this.goalRotation / com.rockstargames.gtav.levelDesign.securoserv.PieChart.FILL_RATE;
      var _loc6_ = 180 / com.rockstargames.gtav.levelDesign.securoserv.PieChart.FILL_RATE;
      this.view.redFill0._rotation = -180;
      if(this.goalRotation > 180)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.redFill0,_loc6_,{_rotation:0});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.redFill1,_loc2_ - _loc6_,{_rotation:this.goalRotation - 180,delay:_loc6_,onCompleteScope:this,onComplete:this.endFillAnimation});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.redFill0,_loc2_,{_rotation:this.goalRotation - 180,onCompleteScope:this,onComplete:this.endFillAnimation});
      }
      if(this.goalRotation > 0)
      {
         this.playFillSound();
      }
   }
   function playFillSound()
   {
      com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Summary_Total_Stock_Holding_Counter");
      if(!this.fillComplete)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.bg,0.033,{onCompleteScope:this,onComplete:this.playFillSound});
      }
   }
   function endFillAnimation()
   {
      this.fillComplete = true;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.logo);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.blackCircle);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bg);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.redFill0);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.redFill1);
   }
}
