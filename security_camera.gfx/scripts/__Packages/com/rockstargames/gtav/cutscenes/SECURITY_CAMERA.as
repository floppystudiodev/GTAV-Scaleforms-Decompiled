class com.rockstargames.gtav.cutscenes.SECURITY_CAMERA extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var overlayMC;
   var staticMC;
   function SECURITY_CAMERA()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.SHOW_CAMERA_OVERLAY();
   }
   function SHOW_CAMERA_OVERLAY()
   {
      var _loc3_ = arguments;
      if(this.overlayMC == undefined)
      {
         this.overlayMC = this.CONTENT.attachMovie("camera_overlay","camera_overlay",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
      }
      if(_loc3_[0] != undefined)
      {
         this.overlayMC.TF1.text = _loc3_[0];
      }
      if(_loc3_[1] != undefined)
      {
         this.overlayMC.TF2.text = _loc3_[1];
      }
      if(_loc3_[2] != undefined)
      {
         this.overlayMC.TF3.text = _loc3_[2];
      }
      if(_loc3_[3] != undefined)
      {
         this.overlayMC.TF4.text = _loc3_[3];
      }
   }
   function SHOW_STATIC()
   {
      if(this.staticMC == undefined)
      {
         this.staticMC = this.CONTENT.attachMovie("noise_animation","noise_animation",this.CONTENT.getNextHighestDepth(),{_x:0,_y:0});
         this.overlayMC.removeMovieClip();
      }
   }
}
