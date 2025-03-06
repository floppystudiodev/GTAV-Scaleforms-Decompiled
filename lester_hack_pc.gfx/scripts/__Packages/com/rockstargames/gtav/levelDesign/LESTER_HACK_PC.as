class com.rockstargames.gtav.levelDesign.LESTER_HACK_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var isFinished = false;
   function LESTER_HACK_PC()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.HIDE_IFINDER_POPUP();
   }
   function SHOW_IFINDER_POPUP()
   {
      this.CONTENT.EyeFinderMC._visible = true;
   }
   function HIDE_IFINDER_POPUP()
   {
      this.CONTENT.EyeFinderMC._visible = false;
   }
}
