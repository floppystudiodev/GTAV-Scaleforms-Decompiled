class com.rockstargames.gtav.pc.MousePointer extends MovieClip
{
   var mc;
   var currCursor = 0;
   static var ARROW = 0;
   static var HAND = 1;
   function MousePointer(_mc)
   {
      super();
      this.mc = _mc;
   }
   function changeCursor(id)
   {
      this.mc.gotoAndStop(id + 1);
      this.currCursor = id;
   }
   function moveCursor(xp, yp)
   {
      this.mc._x = xp;
      this.mc._y = yp;
   }
}
