class com.rockstargames.gtav.levelDesign.fixerApp.ui.Button extends com.rockstargames.gtav.levelDesign.fixerApp.ui.Target
{
   var init;
   var view;
   function Button(id, view)
   {
      super();
      var _loc4_ = view.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
      this.setState(false);
   }
   function setState(isOn)
   {
      this.view._visible = isOn;
   }
   function dispose()
   {
      this.view = null;
   }
}
