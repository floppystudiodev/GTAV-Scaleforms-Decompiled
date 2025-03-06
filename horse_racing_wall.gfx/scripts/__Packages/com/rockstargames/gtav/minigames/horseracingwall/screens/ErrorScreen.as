class com.rockstargames.gtav.minigames.horseracingwall.screens.ErrorScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var view;
   function ErrorScreen(app, viewContainer, navigation)
   {
      super(app,viewContainer,"errorScreen",navigation);
      this.init();
   }
   function init()
   {
      super.init();
      if(this.app.errorTitle != undefined)
      {
         this.view.messageBox.label.autoSize = "left";
         this.view.messageBox.label.text = this.app.errorTitle;
         this.view.messageBox.bgCentre._width = this.view.messageBox.label._width;
         this.view.messageBox.bgRight._x = this.view.messageBox.bgCentre._x + this.view.messageBox.bgCentre._width + this.view.messageBox.bgCentre._x;
      }
      else
      {
         this.view.messageBox._visible = false;
      }
      if(this.app.errorMessage != undefined)
      {
         this.view.message.autoSize = "center";
         this.view.message.text = this.app.errorMessage;
      }
   }
}
