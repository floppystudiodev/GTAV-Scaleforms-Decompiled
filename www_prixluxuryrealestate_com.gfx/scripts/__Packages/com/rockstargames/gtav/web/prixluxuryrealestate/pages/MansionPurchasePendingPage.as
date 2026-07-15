class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePendingPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var view;
   var website;
   function MansionPurchasePendingPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionPurchasePendingPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.heading,"PLRE_PEND_HEADING");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.subheading,"PLRE_PEND_SUBHEADING");
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
   }
   function dispose()
   {
      super.dispose();
   }
}
