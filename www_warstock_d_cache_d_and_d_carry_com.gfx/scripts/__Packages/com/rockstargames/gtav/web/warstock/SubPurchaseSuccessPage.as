class com.rockstargames.gtav.web.warstock.SubPurchaseSuccessPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var setLocalisedText;
   var view;
   var website;
   function SubPurchaseSuccessPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.view.spinner._visible = false;
      this.view.message.autoSize = "left";
      this.setLocalisedText(this.view.title,"CANDC_SUB_PURCHASE_COMPLETE",false);
      var _loc3_ = this.website.purchasedSubColour != -1;
      if(_loc3_)
      {
         this.setLocalisedText(this.view.message,"CANDC_SUB_RENOVATED",false);
      }
      else
      {
         this.setLocalisedText(this.view.message,"CANDC_SUB_PURCHASED",false);
      }
      this.buttons = [];
   }
   function handleClick(id, attribute)
   {
   }
   function dispose()
   {
      super.dispose();
   }
}
