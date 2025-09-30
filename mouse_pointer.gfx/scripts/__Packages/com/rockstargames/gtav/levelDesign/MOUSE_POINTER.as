class com.rockstargames.gtav.levelDesign.MOUSE_POINTER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var TIMELINE;
   var mouseMC;
   function MOUSE_POINTER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc3_ = this.TIMELINE.getNextHighestDepth();
      this.mouseMC = this.TIMELINE.attachMovie("mousePointer","mousePointerMC",_loc3_);
   }
}
