class com.rockstargames.gtav.web.arena.pages.VehiclePurchasedPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   function VehiclePurchasedPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"vehiclePurchasedPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.view.title.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_PURCHASE_VEH_TITLE");
      this.view.title._x = 0.5 * (com.rockstargames.gtav.web.arena.Page.STAGE_WIDTH - this.view.title._width);
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
      this.view.titleGradientMask._x = this.view.title._x;
      this.view.titleGradient._x = this.view.title._x;
      this.view.titleGradient._width = this.view.title._width;
      this.view.message.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.message,"MBA_PURCHASE_VEH_MSG");
      this.view.homeButton.wrapper.label.textAutoSize = "shrink";
      this.view.homeButton.wrapper.label.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.homeButton.wrapper.label,"MBA_GO_HOME").toUpperCase();
      this.website.dataTextScope.push(this.view.homeButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(com.rockstargames.gtav.web.arena.Page.BASE_PAGE_HEIGHT);
   }
   function handleClick(type, id)
   {
      var _loc0_;
      if((_loc0_ = type) === "homeButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SPLASH_PAGE.name);
      }
   }
}
