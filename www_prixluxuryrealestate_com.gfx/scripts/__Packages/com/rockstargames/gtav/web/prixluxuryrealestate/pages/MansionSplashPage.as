class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSplashPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var view;
   var website;
   function MansionSplashPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionSplashPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      this.view.heading.autoSize = "left";
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.heading,"PLRE_CTAHEAD");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.body,"PLRE_CTABODY");
      this.initDynamicWidthButton(this.view.nextButton,"PLRE_ENTER");
      this.view.nextButton._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * this.view.nextButton._width;
      this.website.dataTextScope.push(this.view.nextButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view._height);
   }
   function handleClick(type, id)
   {
      var _loc0_;
      if((_loc0_ = type) === "nextButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_MAP_PAGE.name);
      }
   }
   function handleRB()
   {
      if(this.website.mansions.length > 0)
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_MAP_PAGE.name);
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
