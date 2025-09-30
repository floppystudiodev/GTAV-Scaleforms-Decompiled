class com.rockstargames.gtav.web.warstock.HackerPurchaseSuccessPage extends com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var view;
   var website;
   function HackerPurchaseSuccessPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.view.spinner._visible = false;
      this.view.message.autoSize = "left";
      this.setLocalisedText(this.view.title,"CANDC_HACKER_PURCHASE_COMPLETE",false);
      var _loc3_ = this.website.purchasedHackerTint != -1;
      if(_loc3_)
      {
         this.setLocalisedText(this.view.message,"CANDC_HACKER_RENOVATED",false);
      }
      else
      {
         this.setLocalisedText(this.view.message,"CANDC_HACKER_PURCHASED",false);
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
