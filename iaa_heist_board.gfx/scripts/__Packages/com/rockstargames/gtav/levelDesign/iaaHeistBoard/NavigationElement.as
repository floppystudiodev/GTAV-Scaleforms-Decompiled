class com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement
{
   var _enabled;
   var _id;
   var _view;
   var bottom;
   var cx;
   var cy;
   var left;
   var right;
   var top;
   function NavigationElement(_view, _id)
   {
      this._view = _view;
      this._id = _id;
      this._enabled = false;
      _view._visible = false;
      this.updateBounds();
   }
   function get id()
   {
      return this._id;
   }
   function get view()
   {
      return this._view;
   }
   function updateBounds()
   {
      var _loc3_ = this._view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.cx = 0.5 * (this.left + this.right);
      this.cy = 0.5 * (this.top + this.bottom);
   }
   function deltaX(x)
   {
      if(x < this.left)
      {
         return this.left - x;
      }
      if(x > this.right)
      {
         return this.right - x;
      }
      return 0;
   }
   function deltaY(y)
   {
      if(y < this.top)
      {
         return this.top - y;
      }
      if(y > this.bottom)
      {
         return this.bottom - y;
      }
      return 0;
   }
   function get x()
   {
      return this.cx;
   }
   function get y()
   {
      return this.cy;
   }
   function set visible(isVisible)
   {
      this._view._visible = isVisible;
   }
   function set enabled(isEnabled)
   {
      this._enabled = isEnabled;
      if(!isEnabled && this._view._visible)
      {
         this._view._visible = false;
      }
   }
   function get enabled()
   {
      return this._enabled;
   }
}
