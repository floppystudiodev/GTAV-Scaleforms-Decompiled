class com.rockstargames.gtav.web.buttons.WebBrowserHistory extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   var buttonType;
   var isBrowserButton;
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
