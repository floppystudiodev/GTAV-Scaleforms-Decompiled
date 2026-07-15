class com.rockstargames.gtav.web.prixluxuryrealestate.pages.UnderConstructionPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var view;
   var website;
   function UnderConstructionPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"underConstructionPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.underConstruction,"PLRE_CONSTRUCTION");
      var _loc3_ = this.view.cross._width + this.view.underConstruction.textWidth + 8;
      this.view.cross._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * _loc3_;
      this.view.underConstruction._x = this.view.cross._x + this.view.cross._width + 8;
      this.website.setPageHeight(this.view.background._height);
   }
}
