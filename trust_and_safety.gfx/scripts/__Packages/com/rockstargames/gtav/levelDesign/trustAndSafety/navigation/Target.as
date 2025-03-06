class com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Target
{
   var _id;
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
   var _enabled;
   function Target(id, left, right, top, bottom)
   {
      this.init(id,left,right,top,bottom);
   }
   function init(id, left, right, top, bottom)
   {
      this._id = id;
      this._ul = this._bl = left;
      this._ur = this._br = right;
      this._ut = this._bt = top;
      this._ub = this._bb = bottom;
      this._cx = 0.5 * (left + right);
      this._cy = 0.5 * (top + bottom);
      this._enabled = true;
   }
   function get id()
   {
      return this._id;
   }
   function get l()
   {
      return this._bl;
   }
   function get r()
   {
      return this._br;
   }
   function get t()
   {
      return this._bt;
   }
   function get b()
   {
      return this._bb;
   }
   function get cx()
   {
      return this._cx;
   }
   function get cy()
   {
      return this._cy;
   }
   function set enabled(_enabled)
   {
      this._enabled = _enabled;
   }
   function get enabled()
   {
      return this._enabled;
   }
   function applyBounds(bounds)
   {
      this._bl = this.clamp(this._ul,bounds.left,bounds.right);
      this._br = this.clamp(this._ur,bounds.left,bounds.right);
      this._bt = this.clamp(this._ut,bounds.top,bounds.bottom);
      this._bb = this.clamp(this._ub,bounds.top,bounds.bottom);
      this._cx = 0.5 * (this._bl + this._br);
      this._cy = 0.5 * (this._bt + this._bb);
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
}
