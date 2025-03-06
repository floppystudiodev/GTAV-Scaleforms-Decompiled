class com.rockstargames.gtav.levelDesign.LETTER_SCRAPS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var displayText;
   var CONTENT;
   function LETTER_SCRAPS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.displayText = "";
   }
   function SET_LETTER_TEXT(str)
   {
      this.displayText = "";
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         this.displayText = this.displayText.concat(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.letterTF.htmlText = this.displayText;
   }
   function ADD_TO_LETTER_TEXT(str)
   {
      var _loc3_ = [this.displayText];
      this.SET_LETTER_TEXT.apply(this,_loc3_.concat(arguments));
   }
   function SET_BG_VISIBILITY(value)
   {
      this.CONTENT.bgMC._visible = value;
   }
}
