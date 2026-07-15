class com.rockstargames.gtav.web.buttons.WebBrowserListItem extends com.rockstargames.gtav.web.buttons.WebButton
{
   var browser;
   var btnTxt;
   var browserListIndex = 0;
   function WebBrowserListItem()
   {
      super();
      this.buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.BROWSER_LIST_ITEM;
      this.isBrowserButton = true;
   }
   function buttonEvent()
   {
      this.browser.buttonActionSetBrowserList(this.browserListIndex);
   }
   function initButton(label, i)
   {
      this.btnTxt.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.btnTxt,label);
      this.browserListIndex = i;
   }
}
