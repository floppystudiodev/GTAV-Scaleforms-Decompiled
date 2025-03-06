class com.rockstargames.ui.components.GUIMenuItem extends MovieClip
{
   var _data = new Array();
   var _highlighted = false;
   var _labels = new Array();
   function GUIMenuItem()
   {
      super();
      this._data = new Array();
      this._labels = new Array();
   }
   function set data(_d)
   {
      this._data = _d;
   }
   function get data()
   {
      return this._data;
   }
   function set labels(_l)
   {
      this._labels = _l;
   }
   function get labels()
   {
      return this._labels;
   }
   function set highlighted(_h)
   {
      if(!_h)
      {
         this.gotoAndStop(1);
      }
      else
      {
         this.gotoAndStop(2);
      }
      §§pop();
      this._highlighted = _h;
   }
   function get highlighted()
   {
      return this._highlighted;
   }
   function getHeight()
   {
      return this._height;
   }
}
