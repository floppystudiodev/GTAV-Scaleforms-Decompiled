class com.rockstargames.gtav.levelDesign.nasUpload.screens.Screen
{
   var app;
   var view;
   function Screen(app, viewContainer, viewLinkage)
   {
      this.app = app;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function updateProgress(percentage)
   {
   }
   function dispose()
   {
      this.app = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
