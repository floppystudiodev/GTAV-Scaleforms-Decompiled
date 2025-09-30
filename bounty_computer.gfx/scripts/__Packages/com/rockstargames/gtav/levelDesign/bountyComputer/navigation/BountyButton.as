class com.rockstargames.gtav.levelDesign.bountyComputer.navigation.BountyButton extends com.rockstargames.gtav.levelDesign.bountyComputer.navigation.Target
{
   var init;
   var view;
   function BountyButton(id, view)
   {
      super();
      var _loc4_ = view.hitArea.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
   }
   function setState(isOn)
   {
      this.view.focus._visible = isOn;
   }
   function dispose()
   {
      this.view = null;
   }
}
