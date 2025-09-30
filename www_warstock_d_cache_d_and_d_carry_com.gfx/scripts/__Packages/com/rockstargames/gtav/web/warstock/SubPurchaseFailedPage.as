class com.rockstargames.gtav.web.warstock.SubPurchaseFailedPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var view;
   var website;
   function SubPurchaseFailedPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.buttons = [];
   }
   function showMessage()
   {
      var _loc3_ = this.website.dataProviderUI[1][0];
      var _loc2_ = this.website.dataProviderUI[2][0];
      if(_loc3_ == undefined)
      {
         _loc3_ = this.setLocalisedText(this.view.title,"WEB_NOT_SOLD");
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = "";
      }
      this.view.spinner._visible = false;
      this.view.title.text = _loc3_;
      this.view.message.autoSize = "left";
      this.view.message.text = _loc2_;
   }
   function handleClick(id, attribute)
   {
   }
   function dispose()
   {
      super.dispose();
   }
}
