class com.rockstargames.ui.utils.DisplayConfig
{
   var screenWidth;
   var screenHeight;
   var safeTop;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var isWideScreen;
   var isCircleAccept;
   var isHiDef;
   var isAsian;
   var actualWidth;
   var actualHeight;
   function DisplayConfig()
   {
      this.screenWidth = 1280;
      this.screenHeight = 720;
      this.safeTop = 0.5;
      this.safeBottom = 0.95;
      this.safeLeft = 0.05;
      this.safeRight = 0.95;
      this.isWideScreen = true;
      this.isCircleAccept = false;
      this.isHiDef = true;
      this.isAsian = false;
      this.actualWidth = 1280;
      this.actualHeight = 720;
   }
}
