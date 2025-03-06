class com.rockstargames.gtav.levelDesign.MOUSE_POINTER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var TIMELINE;
   var mouseMC;
   var iMouseWidth;
   function MOUSE_POINTER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc3_ = this.TIMELINE.getNextHighestDepth();
      this.mouseMC = this.TIMELINE.attachMovie("mousePointer","mousePointerMC",_loc3_,{_visible:false});
      this.iMouseWidth = this.mouseMC._width;
   }
   function SET_SCREEN_ASPECT(fPhysicalDifference, fLogicalDifference)
   {
      this.mouseMC._width = this.iMouseWidth * fPhysicalDifference;
   }
}
