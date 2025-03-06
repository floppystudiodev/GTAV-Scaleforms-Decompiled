class com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button extends com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Target
{
   var view;
   var highlight;
   function Button(id, view, highlight)
   {
      super();
      var _loc4_ = view.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
      this.highlight = highlight;
   }
   function setState(isOn)
   {
      this.highlight._visible = isOn;
   }
   function dispose()
   {
      this.view = null;
   }
   function show(name, value, txn, txd, imageManager)
   {
      this.view.vehicleName.text = name;
      this.view.vehicleValue.text = value;
      imageManager.addImage(txd,txn,this.view.vehicleImage);
      this.view._visible = true;
      this.enabled = true;
   }
   function updatePosition()
   {
      var _loc4_ = this.view.getBounds(_root);
      super.updatePosition(_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
   }
   function hide()
   {
      this.view._visible = false;
      this.enabled = false;
   }
}
