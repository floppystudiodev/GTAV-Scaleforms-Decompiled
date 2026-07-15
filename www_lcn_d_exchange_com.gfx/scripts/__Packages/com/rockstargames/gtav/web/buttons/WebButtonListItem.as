class com.rockstargames.gtav.web.buttons.WebButtonListItem extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   function WebButtonListItem()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.LIST_ITEM;
   }
   function buttonEvent()
   {
      this.browser.GO_TO_WEBPAGE(this.browser.currentWebsite.listPageURL);
   }
}
