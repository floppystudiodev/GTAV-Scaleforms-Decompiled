class com.rockstargames.ui.utils.DisplayConfig
{
   var isHiDef;
   var isWideScreen;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   var screenHeight;
   var screenWidth;
   function DisplayConfig()
   {
      this.screenWidth = -1;
      this.screenHeight = -1;
      this.safeTop = -1;
      this.safeBottom = -1;
      this.safeLeft = -1;
      this.safeRight = -1;
      this.isWideScreen = false;
      this.isHiDef = false;
   }
}
