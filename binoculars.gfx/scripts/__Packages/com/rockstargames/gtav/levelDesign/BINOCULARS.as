class com.rockstargames.gtav.levelDesign.BINOCULARS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var positionToScreenLayout;
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
