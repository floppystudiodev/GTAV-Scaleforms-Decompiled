class com.rockstargames.gtav.Multiplayer.SAVING_FOOTER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var spinnerMC;
   var isSpinning = false;
   function SAVING_FOOTER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_TEXT()
   {
      var _loc3_ = arguments[0];
      this.setSaveText(_loc3_);
   }
   function SET_WAITING_TEXT()
   {
      var _loc4_ = arguments[0];
      var _loc5_ = arguments[1];
      var _loc3_ = arguments[2];
      this.setSaveText(_loc3_ + " (" + _loc4_ + "/" + _loc5_ + ")");
   }
   function setSaveText(str)
   {
      this.CONTENT.saveTF.text = str;
      this.CONTENT.saveTF.autoSize = "left";
      this.CONTENT.saveTF.multiline = false;
      this.CONTENT.saveTF.wordWrap = false;
      this.CONTENT.bgMC._width = 58 + this.CONTENT.saveTF._width;
      this.setDropShadow();
      if(!this.isSpinning)
      {
         this.spinnerMC = this.CONTENT.attachMovie("spinner","spinnerMC",1,{_x:24,_y:20});
         this.isSpinning = true;
      }
   }
   function setDropShadow()
   {
      var _loc2_ = new flash.filters.DropShadowFilter(1.2,45,0,1,1,1,100,1);
      this.CONTENT.saveTF.filters = [_loc2_];
   }
}
