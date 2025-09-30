class com.rockstargames.gtav.levelDesign.RADAR_CONTROL_PANEL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var currScreenID;
   var displayConfig;
   var screenContainer;
   static var STAGE_WIDTH = 2048;
   static var STAGE_HEIGHT = 1152;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.RADAR_CONTROL_PANEL.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.RADAR_CONTROL_PANEL.STAGE_HEIGHT;
   var START_SCREEN = 0;
   var CODE_SCREEN = 1;
   var STRIKE_INCOMING_SCREEN = 2;
   var STRIKE_ACTIVATING_SCREEN = 3;
   var STRIKE_DISARMED_SCREEN = 4;
   var STRIKE_DISARMING_SCREEN = 5;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.radarControlPanel.screens.StartScreen,com.rockstargames.gtav.levelDesign.radarControlPanel.screens.CodeScreen,com.rockstargames.gtav.levelDesign.radarControlPanel.screens.StrikeIncomingScreen,com.rockstargames.gtav.levelDesign.radarControlPanel.screens.StrikeActivatingScreen,com.rockstargames.gtav.levelDesign.radarControlPanel.screens.StrikeDisarmedScreen,com.rockstargames.gtav.levelDesign.radarControlPanel.screens.StrikeDisarmingScreen];
   function RADAR_CONTROL_PANEL()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "RADAR_CONTROL_PANEL";
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
   function SHOW_STRIKE_INCOMING_SCREEN()
   {
      this.showScreen(this.STRIKE_INCOMING_SCREEN);
   }
   function SHOW_STRIKE_ACTIVATING_SCREEN()
   {
      this.showScreen(this.STRIKE_ACTIVATING_SCREEN);
   }
   function SHOW_STRIKE_DISARMED_SCREEN()
   {
      this.showScreen(this.STRIKE_DISARMED_SCREEN);
   }
   function SHOW_STRIKE_DISARMING_SCREEN()
   {
      this.showScreen(this.STRIKE_DISARMING_SCREEN);
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
