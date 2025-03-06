class com.rockstargames.gtav.levelDesign.BINOCULARS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   function BINOCULARS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function initScreenLayout()
   {
      this.positionToScreenLayout(this.CONTENT.binocularsMC,"CC",true);
   }
}
