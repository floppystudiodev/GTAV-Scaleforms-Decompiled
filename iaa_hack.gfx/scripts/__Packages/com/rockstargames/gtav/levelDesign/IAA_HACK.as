class com.rockstargames.gtav.levelDesign.IAA_HACK extends com.rockstargames.ui.core.BaseScreenLayout
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
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.IAA_HACK.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.IAA_HACK.STAGE_HEIGHT;
   var START_SCREEN = 0;
   var CODE_SCREEN = 1;
   var END_SCREEN = 2;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.iaaHack.screens.StartScreen,com.rockstargames.gtav.levelDesign.iaaHack.screens.CodeScreen,com.rockstargames.gtav.levelDesign.iaaHack.screens.EndScreen];
   function IAA_HACK()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "IAA_HACK";
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
   function SHOW_END_SCREEN()
   {
      this.showScreen(this.END_SCREEN);
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
