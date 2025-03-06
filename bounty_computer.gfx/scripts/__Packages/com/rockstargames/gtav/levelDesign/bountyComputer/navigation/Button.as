class com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Button extends com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Target
{
   var view;
   function Button(id, view)
   {
      super();
      var _loc4_ = view.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
   }
   function setState(isOn)
   {
      this.view._alpha = !isOn ? 50 : 100;
   }
   function dispose()
   {
      this.view = null;
   }
}
