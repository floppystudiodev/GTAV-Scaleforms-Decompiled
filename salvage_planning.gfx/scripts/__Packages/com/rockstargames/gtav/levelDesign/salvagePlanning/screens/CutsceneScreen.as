class com.rockstargames.gtav.levelDesign.salvagePlanning.screens.CutsceneScreen extends com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen
{
   var app;
   var view;
   static var TINT = new flash.geom.ColorTransform(0,0,0,1,120,174,255,0);
   function CutsceneScreen(app, viewContainer, cursor)
   {
      super();
      this.app = app;
      var _loc3_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie("cutsceneScreen","cutsceneScreen",_loc3_);
      this.view.heading.textAutoSize = "shrink";
      this.view.subheading.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.heading,"SLV_CUT_HEADING");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.subheading,"SLV_CUT_SUBHEADING");
      this.view.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
   }
   function dispose()
   {
      this.app = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
