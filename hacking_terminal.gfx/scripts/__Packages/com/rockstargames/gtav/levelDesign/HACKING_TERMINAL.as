class com.rockstargames.gtav.levelDesign.HACKING_TERMINAL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var currScreenID;
   var displayConfig;
   var screenContainer;
   var START_SCREEN = 0;
   var CODE_SCREEN = 1;
   var ACTIVATING_SCREEN = 2;
   var DEACTIVATING_SCREEN = 3;
   var DISARMED_SCREEN = 4;
   var READY_SCREEN = 5;
   var SELF_DESTRUCT_SCREEN = 6;
   var UNAVAILABLE_SCREEN = 7;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.hackingTerminal.screens.StartScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.CodeScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalActivatingScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalDeactivatingScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalDisarmedScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalReadyScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalSefDestructScreen,com.rockstargames.gtav.levelDesign.hackingTerminal.screens.OrbitalUnavailableScreen];
   function HACKING_TERMINAL()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "HACKING_TERMINAL";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
   }
   function SHOW_START_SCREEN()
   {
      this.showScreen(this.START_SCREEN);
   }
   function SHOW_CODE_SCREEN()
   {
      this.showScreen(this.CODE_SCREEN);
   }
   function SHOW_ACTIVATING_SCREEN()
   {
      this.showScreen(this.ACTIVATING_SCREEN);
   }
   function SHOW_DEACTIVATING_SCREEN()
   {
      this.showScreen(this.DEACTIVATING_SCREEN);
   }
   function SHOW_DISARMED_SCREEN()
   {
      this.showScreen(this.DISARMED_SCREEN);
   }
   function SHOW_READY_SCREEN()
   {
      this.showScreen(this.READY_SCREEN);
   }
   function SHOW_SELF_DESTRUCT_SCREEN()
   {
      this.showScreen(this.SELF_DESTRUCT_SCREEN);
   }
   function SHOW_UNAVAILABLE_SCREEN()
   {
      this.showScreen(this.UNAVAILABLE_SCREEN);
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function showScreen(screenID, dataObject)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer);
      }
   }
}
