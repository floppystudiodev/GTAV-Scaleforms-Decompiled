class com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement extends com.rockstargames.gtav.levelDesign.starterPackBrowser.Rect
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
   static var Y_MIN = 2;
   static var Y_MAX = 700;
   function NavigationElement(_view, id)
   {
      super();
      this._view = _view;
      this.id = id;
      this.depth = id;
      this._enabled = true;
      _view._visible = false;
      this.updateBounds();
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
      if(this.top < com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MIN)
      {
         this.top = com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MIN;
      }
      if(this.top > com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MAX)
      {
         this.top = com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MAX;
      }
      if(this.bottom < com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MIN)
      {
         this.bottom = com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MIN;
      }
      if(this.bottom > com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MAX)
      {
         this.bottom = com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement.Y_MAX;
      }
      this.cx = 0.5 * (this.left + this.right);
      this.cy = 0.5 * (this.top + this.bottom);
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
