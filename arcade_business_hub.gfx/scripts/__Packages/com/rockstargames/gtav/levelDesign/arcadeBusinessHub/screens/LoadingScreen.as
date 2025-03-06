class com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.LoadingScreen extends com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.Screen
{
   var view;
   function LoadingScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"loadingScreen");
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setLocalisedText(this.view.title,"ABH_LOADING");
   }
}
