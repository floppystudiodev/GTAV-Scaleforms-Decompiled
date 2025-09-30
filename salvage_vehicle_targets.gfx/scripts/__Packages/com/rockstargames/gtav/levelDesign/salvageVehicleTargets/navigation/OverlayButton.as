class com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.OverlayButton extends com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Target
{
   var __set__enabled;
   var init;
   var view;
   function OverlayButton(id, view)
   {
      super();
      var _loc4_ = view.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
   }
   function setState(isOn)
   {
      this.view.background.gotoAndStop(!isOn ? "off" : "on");
      this.view.label.textColor = !isOn ? 0 : 16777215;
   }
   function dispose()
   {
      this.view = null;
   }
   function show()
   {
      this.view._visible = true;
      this.enabled = true;
   }
   function hide()
   {
      this.view._visible = false;
      this.enabled = false;
   }
}
