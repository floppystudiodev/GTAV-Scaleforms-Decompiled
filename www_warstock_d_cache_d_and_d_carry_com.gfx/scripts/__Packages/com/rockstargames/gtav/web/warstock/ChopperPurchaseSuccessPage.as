class com.rockstargames.gtav.web.warstock.ChopperPurchaseSuccessPage extends com.rockstargames.gtav.web.warstock.ChopperPage
{
   var buttons;
   var setLocalisedText;
   var view;
   var website;
   function ChopperPurchaseSuccessPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.view.spinner._visible = false;
      this.view.message.autoSize = "left";
      this.setLocalisedText(this.view.title,"CANDC_CHOPPER_PURCHASE_COMPLETE",false);
      var _loc3_ = this.website.purchasedChopperInterior != -1;
      if(_loc3_)
      {
         this.setLocalisedText(this.view.message,"CANDC_CHOPPER_RENOVATED",false);
      }
      else
      {
         this.setLocalisedText(this.view.message,"CANDC_CHOPPER_PURCHASED",false);
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
