class com.rockstargames.gtav.levelDesign.droneCam.ZoomMeter
{
   var view;
   var steps;
   static var NUM_STEPS = 5;
   function ZoomMeter(view, visible)
   {
      this.view = view;
      this.visible = visible;
      this.init();
   }
   function init()
   {
      this.steps = new Array(com.rockstargames.gtav.levelDesign.droneCam.ZoomMeter.NUM_STEPS);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.droneCam.ZoomMeter.NUM_STEPS)
      {
         this.steps[_loc2_] = this.view["step" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this.zoomLevel = 0;
   }
   function set visible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function set zoomLevel(level)
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.droneCam.ZoomMeter.NUM_STEPS)
      {
         this.steps[_loc2_]._visible = _loc2_ == level;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setLabel(index, label)
   {
      this.view["label" + index].text = label;
   }
}
