class com.rockstargames.gtav.minigames.horseracingconsole.screens.ErrorScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var view;
   var app;
   function ErrorScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"errorScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.mainTitle,"HORSEGAME_MAIN",5,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.mainSubheading,"HORSEGAME_MAIN_SUB");
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.singleTitle,"HORSEGAME_SINGLE",5,true,false);
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(this.view.singleSubheading,"HORSEGAME_SINGLE_SUB");
      this.view.leftErrorTitle.textAutoSize = "shrink";
      this.view.rightErrorTitle.textAutoSize = "shrink";
      this.view.leftErrorMessage.textAutoSize = "shrink";
      this.view.rightErrorMessage.textAutoSize = "shrink";
      if(this.app.errorTitle != undefined)
      {
         this.view.leftErrorTitle.text = this.app.errorTitle;
         this.view.rightErrorTitle.text = this.app.errorTitle;
      }
      if(this.app.errorMessage != undefined)
      {
         this.view.leftErrorMessage.text = this.app.errorMessage;
         this.view.rightErrorMessage.text = this.app.errorMessage;
      }
   }
}
