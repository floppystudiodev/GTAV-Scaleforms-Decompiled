class com.rockstargames.gtav.pc.applications.App_Base extends MovieClip
{
   var _desktopRef;
   var screenWidthPixels = 1280;
   var screenHeightPixels = 720;
   var safeTop = 54;
   var safeBottom = 666;
   var safeLeft = 96;
   var safeRight = 1184;
   function App_Base()
   {
      super();
      var _loc4_ = Math.round(this.screenWidthPixels * 0.15 / 2);
      var _loc3_ = Math.round(this.screenHeightPixels * 0.15 / 2);
      this.safeLeft = _loc4_;
      this.safeRight = this.screenWidthPixels - _loc4_;
      this.safeTop = _loc3_;
      this.safeBottom = this.screenHeightPixels - _loc3_;
   }
   function ready()
   {
   }
   function set desktopRef(d)
   {
      this._desktopRef = d;
   }
   function get desktopRef()
   {
      return this._desktopRef;
   }
}
