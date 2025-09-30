class com.rockstargames.gtav.levelDesign.robberyComputer.screens.LoginScreen extends com.rockstargames.gtav.levelDesign.robberyComputer.screens.Screen
{
   var animationCounter;
   var animationPaused;
   var app;
   var password;
   var view;
   function LoginScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"loginScreen");
      this.init();
   }
   function init()
   {
      this.view.user.heading.verticalAlign = "center";
      this.view.user.verticalAlign = "center";
      this.view.pass.heading.verticalAlign = "center";
      this.view.pass.verticalAlign = "center";
      this.animationCounter = 0;
      this.password = "******************";
      this.animationPaused = false;
      this.updateAnimation();
   }
   function setAnimationPaused(animationPaused)
   {
      if(this.animationPaused != animationPaused)
      {
         this.animationPaused = animationPaused;
         this.updateAnimation();
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      super.dispose();
   }
   function updateAnimation()
   {
      if(this.animationPaused)
      {
         return undefined;
      }
      if(this.animationCounter <= this.app.gamerName.length)
      {
         this.view.user.text = this.app.gamerName.substring(0,this.animationCounter);
      }
      else
      {
         this.view.pass.text = this.password.substring(0,this.animationCounter - this.app.gamerName.length);
      }
      var _loc2_;
      if(this.animationCounter == this.app.gamerName.length + this.password.length)
      {
         _loc2_ = this.app.activeRobberyIndex < 0 ? this.app.MAIN_SCREEN : this.app.MISSION_SCREEN;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.5,{onComplete:this.app.SHOW_SCREEN,onCompleteScope:this.app,onCompleteArgs:[_loc2_]});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.05,{onComplete:this.updateAnimation,onCompleteScope:this});
      }
      this.animationCounter = this.animationCounter + 1;
   }
}
