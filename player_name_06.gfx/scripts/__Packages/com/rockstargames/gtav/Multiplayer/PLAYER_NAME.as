class com.rockstargames.gtav.Multiplayer.PLAYER_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var TIMELINE;
   function PLAYER_NAME()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
   }
   function SET_PLAYER_NAME(str)
   {
      this.CONTENT.playerNameTF.htmlText = str;
      this.CONTENT.playerNameOutlineTF.htmlText = str;
   }
   function debug()
   {
      this.SET_PLAYER_NAME("cheesewhisk");
   }
}
