class com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.LoadingScreen extends com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.Screen
{
   var app;
   var init;
   var view;
   var ANIMATION_DURATION = 3.8333333333333335;
   function LoadingScreen(app, viewContainer, cursor, overlay, heistData, colourScheme)
   {
      super(app,viewContainer,cursor,overlay,heistData,colourScheme,"loadingScreen");
      this.init();
      this.view.background.transform.colorTransform = colourScheme.dark;
      this.view.content.reveal.transform.colorTransform = colourScheme.dark;
      this.view.content.cursor.transform.colorTransform = colourScheme.light;
      this.view.content.code.transform.colorTransform = colourScheme.light;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,this.ANIMATION_DURATION,{onCompleteScope:this,onComplete:this.onComplete});
   }
   function onComplete()
   {
      this.app.SHOW_SCREEN(this.app.MAIN_SCREEN);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      super.dispose();
   }
}
