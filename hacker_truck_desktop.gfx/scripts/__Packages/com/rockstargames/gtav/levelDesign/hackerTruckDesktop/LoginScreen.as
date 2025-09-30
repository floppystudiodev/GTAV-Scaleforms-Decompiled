class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.LoginScreen extends com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen
{
   var app;
   var view;
   static var ANIMATION_DURATION = 1.8;
   function LoginScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"loginScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.title.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(this.view.title,"HTD_LOGIN_TITLE");
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Hand_Scanner","DLC_BTL_Hacker_Truck_Computer_Sounds");
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.hackerTruckDesktop.LoginScreen.ANIMATION_DURATION,{onCompleteScope:this,onComplete:this.onAnimationComplete});
   }
   function onAnimationComplete()
   {
      this.app.SHOW_SCREEN(this.app.MAIN_SCREEN);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      super.dispose();
   }
}
