class com.rockstargames.gtav.web.warstock.TruckPurchasePendingPage extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var view;
   function TruckPurchasePendingPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.view.spinner._visible = true;
      this.view.message.autoSize = "left";
      this.setLocalisedText(this.view.message,"CANDC_WAITING_TO_PURCHASE",false);
      this.buttons = [];
   }
}
