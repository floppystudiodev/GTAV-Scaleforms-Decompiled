class com.rockstargames.gtav.web.buttons.WebButtonTextBox extends com.rockstargames.gtav.web.buttons.WebButton
{
   var CARET;
   var browser;
   var btnTxt;
   function WebButtonTextBox()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.TEXT_BOX;
      this.CARET = this.CARET;
      this.CARET._visible = false;
   }
   function buttonEvent()
   {
      this.browser.setKeyboard(this.browser._currentSelectedButton);
   }
   function onEnterFrame()
   {
      if(this.browser.keyboardField == this.btnTxt)
      {
         this.CARET._visible = true;
      }
      else
      {
         this.CARET._visible = false;
      }
      this.CARET._x = this.btnTxt._x + this.btnTxt.textWidth;
   }
}
