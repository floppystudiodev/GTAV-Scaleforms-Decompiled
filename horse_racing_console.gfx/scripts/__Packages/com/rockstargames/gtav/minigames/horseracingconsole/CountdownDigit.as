class com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit
{
   var view;
   var isAnimating;
   var currValue;
   var nextValue;
   var topFlipArgs;
   var bottomFlipArgs;
   var shadowFlipArgs;
   static var TOP_FLIP_DURATION = 0.12;
   static var BOTTOM_FLIP_DURATION = 0.5 * com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.TOP_FLIP_DURATION;
   static var SHADOW_FLIP_DELAY = 0.5 * com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.TOP_FLIP_DURATION;
   static var SHADOW_FLIP_DURATION = 0.5 * com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.TOP_FLIP_DURATION + com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.BOTTOM_FLIP_DURATION;
   function CountdownDigit(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.isAnimating = false;
      this.currValue = 0;
      this.nextValue = 0;
      this.topFlipArgs = {_yscale:0};
      this.bottomFlipArgs = {_yscale:100,delay:com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.TOP_FLIP_DURATION,onCompleteScope:this,onComplete:this.startFlipAnimation};
      this.shadowFlipArgs = {_yscale:100,delay:com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.SHADOW_FLIP_DELAY,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
      this.update(true);
   }
   function set value(n)
   {
      this.nextValue = n;
   }
   function update(immediate)
   {
      if(immediate)
      {
         this.setImmediateView();
      }
      else if(!this.isAnimating)
      {
         this.startFlipAnimation();
      }
   }
   function setImmediateView()
   {
      this.view.topFront.label.text = this.nextValue;
      this.view.topFront._yscale = 100;
      this.view.bottomFront.label.text = this.nextValue;
      this.view.bottomFront._yscale = 100;
      this.currValue = this.nextValue;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.topFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bottomFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.shadow);
      this.isAnimating = false;
   }
   function startFlipAnimation()
   {
      if(this.currValue != this.nextValue)
      {
         this.view.topBack.label.text = this.nextValue;
         this.view.bottomBack.label.text = this.currValue;
         this.view.topFront.label.text = this.currValue;
         this.view.topFront._yscale = 100;
         this.view.bottomFront.label.text = this.nextValue;
         this.view.bottomFront._yscale = 0;
         this.view.shadow._yscale = 0;
         this.currValue = this.nextValue;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.topFront,com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.TOP_FLIP_DURATION,this.topFlipArgs);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.bottomFront,com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.BOTTOM_FLIP_DURATION,this.bottomFlipArgs);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.shadow,com.rockstargames.gtav.minigames.horseracingconsole.CountdownDigit.SHADOW_FLIP_DURATION,this.shadowFlipArgs);
         this.isAnimating = true;
      }
      else
      {
         this.isAnimating = false;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.topFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bottomFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.shadow);
      this.currValue = this.nextValue;
      this.topFlipArgs = null;
      this.bottomFlipArgs = null;
      this.shadowFlipArgs = null;
      this.view = null;
   }
}
