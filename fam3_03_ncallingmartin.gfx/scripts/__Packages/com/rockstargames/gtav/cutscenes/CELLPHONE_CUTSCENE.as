class com.rockstargames.gtav.cutscenes.CELLPHONE_CUTSCENE extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   function CELLPHONE_CUTSCENE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.DISPLAY_VIEW(0);
   }
   function DISPLAY_VIEW(viewID)
   {
      if(viewID == undefined)
      {
         viewID = 0;
      }
      this.CONTENT.gotoAndStop(viewID + 1);
   }
}
