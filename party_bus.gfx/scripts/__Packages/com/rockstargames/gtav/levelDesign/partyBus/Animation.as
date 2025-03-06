class com.rockstargames.gtav.levelDesign.partyBus.Animation
{
   var width;
   var height;
   var beatStep;
   var view;
   static var FADE_TIME = 0.25;
   function Animation(container, width, height, viewLinkage)
   {
      this.width = width;
      this.height = height;
      this.beatStep = 0;
      var _loc2_ = container.getNextHighestDepth();
      this.view = container.attachMovie(viewLinkage,"animation" + _loc2_,_loc2_);
      this.view._visible = false;
   }
   function show(showImmediately)
   {
      if(showImmediately)
      {
         this.view._alpha = 100;
      }
      else
      {
         this.view._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.partyBus.Animation.FADE_TIME,{_alpha:100});
      }
      this.view._visible = true;
   }
   function hide(hideImmediately, callbackScope, callbackMethod, callbackArgs)
   {
      if(hideImmediately)
      {
         this.deactivate();
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.partyBus.Animation.FADE_TIME,{_alpha:0,onCompleteScope:callbackScope,onComplete:callbackMethod,onCompleteArgs:callbackArgs});
      }
   }
   function deactivate()
   {
      this.view._alpha = 0;
      this.view._visible = false;
   }
   function update()
   {
   }
   function beat()
   {
   }
}
