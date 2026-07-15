class com.rockstargames.gtav.levelDesign.robberyComputer.navigation.OverlayButton extends com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Target
{
   var _id;
   var view;
   function OverlayButton(id, view)
   {
      super();
      this._id = id;
      this.view = view;
      this.updatePosition();
   }
   function setState(isOn)
   {
      this.view.background.gotoAndStop(!isOn ? "off" : "on");
      this.view.label.textColor = !isOn ? 16777215 : 2572167;
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
   function updatePosition()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.init(this.id,_loc3_.xMin,_loc3_.xMax,_loc3_.yMin,_loc3_.yMax);
   }
}
