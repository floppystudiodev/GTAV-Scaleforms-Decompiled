class com.rockstargames.gtav.web.buttons.WebButtonWWW extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   function WebButtonWWW()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.WEB_BUTTON;
   }
   function buttonEvent()
   {
      this.browser.GO_TO_WEBPAGE(this.browser._currentSelectedButton);
   }
}
