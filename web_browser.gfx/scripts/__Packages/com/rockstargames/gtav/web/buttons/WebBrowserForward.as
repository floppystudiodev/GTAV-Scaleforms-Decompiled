class com.rockstargames.gtav.web.buttons.WebBrowserForward extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   function WebBrowserForward()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.FORWARD_BUTTON;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.GO_FORWARD();
   }
}
