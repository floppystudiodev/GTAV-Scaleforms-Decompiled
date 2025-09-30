class com.rockstargames.gtav.web.warstock.TruckPurchaseSuccessPage extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var setLocalisedText;
   var view;
   var website;
   function TruckPurchaseSuccessPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.view.spinner._visible = false;
      this.view.message.autoSize = "left";
      this.setLocalisedText(this.view.title,"CANDC_TRUCK_PURCHASE_COMPLETE",false);
      var _loc3_ = this.website.purchasedTruckCab != -1;
      if(_loc3_)
      {
         this.setLocalisedText(this.view.message,"CANDC_TRUCK_RENOVATED",false);
      }
      else
      {
         this.setLocalisedText(this.view.message,"CANDC_TRUCK_PURCHASED",false);
      }
      this.buttons = [];
   }
}
