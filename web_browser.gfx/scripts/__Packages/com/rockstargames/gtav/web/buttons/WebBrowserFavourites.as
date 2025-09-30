class com.rockstargames.gtav.web.buttons.WebBrowserFavourites extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   var buttonType;
   var isBrowserButton;
   function WebBrowserFavourites()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.FAVORITES_BUTTON;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.setCloseBrowserFlag();
   }
}
