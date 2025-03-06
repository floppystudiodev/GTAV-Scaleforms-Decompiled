class com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Button extends com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Target
{
   var view;
   var _ul;
   var _bl;
   var _ur;
   var _br;
   var _ut;
   var _bt;
   var _ub;
   var _bb;
   var _cx;
   var _cy;
   function Button(id, view)
   {
      super();
      var _loc4_ = view.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
   }
   function setState(isOn)
   {
      this.view.highlight._visible = isOn;
   }
   function updatePosition()
   {
      var _loc3_ = this.view.getBounds(_root);
      this._ul = this._bl = _loc3_.xMin;
      this._ur = this._br = _loc3_.xMax;
      this._ut = this._bt = _loc3_.yMin;
      this._ub = this._bb = _loc3_.yMax;
      this._cx = 0.5 * (_loc3_.xMin + _loc3_.xMax);
      this._cy = 0.5 * (_loc3_.yMin + _loc3_.yMax);
   }
   function dispose()
   {
      this.view = null;
   }
}
