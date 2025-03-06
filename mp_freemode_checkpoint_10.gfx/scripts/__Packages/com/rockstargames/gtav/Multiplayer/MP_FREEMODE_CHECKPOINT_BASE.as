class com.rockstargames.gtav.Multiplayer.MP_FREEMODE_CHECKPOINT_BASE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   function MP_FREEMODE_CHECKPOINT_BASE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT._width = 1280;
   }
   function SET_CHECKPOINT_TEXT(str)
   {
      this.CONTENT.checkpointTF.htmlText = str;
      this.CONTENT.checkpointTF.autoSize = true;
   }
}
