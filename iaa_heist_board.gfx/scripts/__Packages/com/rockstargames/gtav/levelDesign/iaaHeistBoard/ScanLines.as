class com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines
{
   var view;
   var lines;
   static var NUM_LINES = 4;
   static var SCREEN_HEIGHT = 178;
   function ScanLines(view)
   {
      this.view = view;
      this.init();
   }
   function init(screenHeight)
   {
      this.lines = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines.NUM_LINES)
      {
         this.lines[_loc2_] = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLine(this.view,com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines.SCREEN_HEIGHT);
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines.NUM_LINES)
      {
         var _loc3_ = this.lines[_loc2_];
         _loc3_.update();
         _loc2_ = _loc2_ + 1;
      }
   }
}
