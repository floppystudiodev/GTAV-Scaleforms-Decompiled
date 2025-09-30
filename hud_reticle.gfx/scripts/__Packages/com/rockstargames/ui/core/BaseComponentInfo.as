class com.rockstargames.ui.core.BaseComponentInfo
{
   var _colour;
   var _displayList;
   var _displayListPriority;
   var _enumId;
   var _functionCache;
   var _hasGfx;
   var _intendedVisibleState;
   var _listener;
   var _mc;
   var _position;
   var _size;
   var _status;
   function BaseComponentInfo(newID)
   {
      this._enumId = newID;
      this._status = 0;
      this._listener = {};
      this._functionCache = [];
      this._intendedVisibleState = true;
      this._displayList = -1;
      this._displayListPriority = -1;
      this._mc = new MovieClip();
      this._hasGfx = true;
   }
   function sanitise()
   {
      this._mc = new MovieClip();
      this._status = 0;
      this._listener = {};
      this._displayList = -1;
      this._displayListPriority = -1;
      this._position = [];
      this._size = [];
      this._colour = [];
      this._functionCache = [];
      this._hasGfx = true;
   }
}
