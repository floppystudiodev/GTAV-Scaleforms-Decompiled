class com.rockstargames.gtav.web.buttons.WebBrowserHome extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   function WebBrowserHome()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.HOME_BUTTON;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WEB_BROWSER_PARENT.homeWebsite);
   }
}
