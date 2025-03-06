class com.rockstargames.gtav.levelDesign.nasUpload.screens.UploadingScreen extends com.rockstargames.gtav.levelDesign.nasUpload.screens.Screen
{
   var app;
   var view;
   function UploadingScreen(app, viewContainer)
   {
      super(app,viewContainer,"uploadingScreen");
      this.init();
   }
   function init()
   {
      this.updateProgress(this.app.getCurrentProgress());
   }
   function updateProgress(percentage)
   {
      var _loc2_ = percentage * this.view.uploadingScreen.progressBar.background._width;
      if(_loc2_ > this.view.uploadingScreen.progressBar.background._width)
      {
         _loc2_ = this.view.uploadingScreen.progressBar.background._width;
         percentage = 1;
      }
      else if(_loc2_ < 0)
      {
         _loc2_ = 0;
         percentage = 0;
      }
      this.view.uploadingScreen.progressBar.bar._width = _loc2_;
      this.view.uploadingScreen.indicator.percentageText.text = Math.round(percentage * 100);
      this.view.uploadingScreen.indicator._x = this.view.uploadingScreen.progressBar.bar._x + this.view.uploadingScreen.progressBar.bar._width + 4;
   }
   function dispose()
   {
      super.dispose();
   }
}
