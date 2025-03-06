class com.rockstargames.gtav.web.buttons.WebBrowserAddress extends com.rockstargames.gtav.web.buttons.WebButton
{
   var CARET;
   var browser;
   var addressText;
   function WebBrowserAddress()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.ADDRESS_BOX;
      this.isBrowserButton = true;
      this.CARET = this.CARET;
      this.CARET._visible = false;
   }
   function buttonEvent()
   {
      this.browser.setKeyboard("address_box");
   }
   function onEnterFrame()
   {
      if(this.browser.keyboardField == this.addressText)
      {
         this.CARET._visible = true;
      }
      else
      {
         this.CARET._visible = false;
      }
      this.CARET._x = this.addressText._x + this.addressText.textWidth;
   }
}
