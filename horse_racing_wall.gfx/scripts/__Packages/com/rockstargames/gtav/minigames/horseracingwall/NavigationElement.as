class com.rockstargames.gtav.minigames.horseracingwall.NavigationElement
{
   var _view;
   var _id;
   var _enabled;
   var left;
   var right;
   var top;
   var bottom;
   var cx;
   var cy;
   function NavigationElement(_view, _id, label)
   {
      this._view = _view;
      this._id = _id;
      if(label)
      {
         com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setLocalisedText(_view.label,label);
      }
      this._enabled = true;
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
   function set active(isActive)
   {
      this._view.gotoAndStop(!isActive ? "off" : "on");
   }
   function set enabled(isEnabled)
   {
      this._enabled = isEnabled;
      if(!isEnabled)
      {
         this._view.gotoAndStop("off");
      }
   }
   function get enabled()
   {
      return this._enabled;
   }
}
