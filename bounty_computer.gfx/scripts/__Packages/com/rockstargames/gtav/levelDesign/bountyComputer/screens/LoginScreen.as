class com.rockstargames.gtav.levelDesign.bountyComputer.screens.LoginScreen extends com.rockstargames.gtav.levelDesign.bountyComputer.screens.Screen
{
   var loginButton;
   var view;
   var cursor;
   var animationCounter;
   var password;
   var app;
   function LoginScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"loginScreen");
      this.init();
   }
   function init()
   {
      this.loginButton = new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Button(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.LOGIN,this.view.loginButton);
      this.cursor.addTarget(this.loginButton);
      this.cursor.snapToTarget(this.loginButton);
      this.onTargetChange(this.cursor.getTargetUnderCursor());
      this.view.user.heading.verticalAlign = "center";
      this.view.pass.heading.verticalAlign = "center";
      this.animationCounter = 0;
      this.password = "******************";
      this.updateAnimation();
   }
   function handleButtonInput(inputID)
   {
      if(inputID == com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.ACCEPT && this.cursor.getTargetUnderCursor().id == com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.LOGIN)
      {
         this.app.showScreen(this.app.MAIN_SCREEN);
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.cursor.removeTarget(this.loginButton);
      this.loginButton.dispose();
      this.loginButton = null;
      super.dispose();
   }
   function updateAnimation()
   {
      if(++this.animationCounter <= this.app.gamerName.length)
      {
         this.view.user.text = this.app.gamerName.substring(0,this.animationCounter);
      }
      else
      {
         this.view.pass.text = this.password.substring(0,this.animationCounter - this.app.gamerName.length);
      }
      if(this.animationCounter == this.app.gamerName.length + this.password.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.5,{onComplete:this.app.SHOW_SCREEN,onCompleteScope:this.app,onCompleteArgs:[this.app.MAIN_SCREEN]});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.05,{onComplete:this.updateAnimation,onCompleteScope:this});
      }
   }
}
