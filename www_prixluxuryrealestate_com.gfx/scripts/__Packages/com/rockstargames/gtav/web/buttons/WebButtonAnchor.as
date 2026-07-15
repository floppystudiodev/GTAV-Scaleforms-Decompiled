class com.rockstargames.gtav.web.buttons.WebButtonAnchor extends com.rockstargames.gtav.web.buttons.WebButton
{
   var _name;
   var browser;
   var buttonType;
   function WebButtonAnchor()
   {
      super();
      this.buttonType = 16;
   }
   function buttonEvent()
   {
      var _loc2_ = this._name;
      this.browser.currentWebsite.goToAnchor(_loc2_);
   }
}
