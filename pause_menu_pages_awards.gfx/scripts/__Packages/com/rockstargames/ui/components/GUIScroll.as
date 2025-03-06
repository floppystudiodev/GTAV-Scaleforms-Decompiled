class com.rockstargames.ui.components.GUIScroll extends MovieClip
{
   var gutter;
   var scrubber;
   var _scrollpercent = 0;
   var Height = 0;
   function GUIScroll()
   {
      super();
   }
   function init(newX, newY, height)
   {
      this._x = newX;
      this._y = newY;
      this.Height = height;
      if(this.Height != undefined)
      {
         this.gutter._height = this.Height;
      }
   }
   function setGutterHeight(_visibleItems, _maxlItems)
   {
      this.scrubber._height = _visibleItems * (this.Height / _maxlItems);
   }
   function set scrollpercent(_s)
   {
      this._scrollpercent = Math.max(0,Math.min(_s,100));
      this.scrubber._y = this.Height / 100 * this._scrollpercent;
   }
   function get scrollpercent()
   {
      return this._scrollpercent;
   }
}
