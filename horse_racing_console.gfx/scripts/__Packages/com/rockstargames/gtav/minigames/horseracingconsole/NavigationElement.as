class com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement extends com.rockstargames.gtav.minigames.horseracingconsole.Rect
{
   var _enabled;
   var _view;
   var bottom;
   var cx;
   var cy;
   var depth;
   var id;
   var left;
   var right;
   var top;
   function NavigationElement(_view, id, label)
   {
      super();
      this._view = _view;
      this.id = id;
      this.depth = id;
      if(label)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(_view.label,label);
      }
      this._enabled = true;
      this.updateBounds();
   }
   function get view()
   {
      return this._view;
   }
   function updateBounds()
   {
      var _loc3_ = !this._view.bounds ? this._view.getBounds(_root) : this._view.bounds.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.cx = 0.5 * (this.left + this.right);
      this.cy = 0.5 * (this.top + this.bottom);
   }
   function set active(isActive)
   {
      this._view.gotoAndStop(!isActive ? "off" : "on");
   }
   function set enabled(isEnabled)
   {
      this._enabled = isEnabled;
      if(isEnabled)
      {
         this._view._alpha = 100;
      }
      else
      {
         this._view.gotoAndStop("off");
         this._view._alpha = 50;
      }
   }
   function get enabled()
   {
      return this._enabled;
   }
}
