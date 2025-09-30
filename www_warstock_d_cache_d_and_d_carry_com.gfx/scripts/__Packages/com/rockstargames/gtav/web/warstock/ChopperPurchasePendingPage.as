class com.rockstargames.gtav.web.warstock.ChopperPurchasePendingPage extends com.rockstargames.gtav.web.warstock.ChopperPage
{
   var buttons;
   var setLocalisedText;
   var view;
   function ChopperPurchasePendingPage(view, website, progressPanel)
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
   function handleClick(id, attribute)
   {
   }
   function dispose()
   {
      super.dispose();
   }
}
