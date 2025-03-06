class com.rockstargames.gtav.web.buttons.WebBrowserHistory extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   function WebBrowserHistory()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.HISTORY_BUTTON;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.buttonActionSetHistory();
   }
}
