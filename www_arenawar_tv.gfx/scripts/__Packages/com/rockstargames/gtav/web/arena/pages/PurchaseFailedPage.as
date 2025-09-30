class com.rockstargames.gtav.web.arena.pages.PurchaseFailedPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   function PurchaseFailedPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"purchaseFailedPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.update();
      this.view.homeButton.wrapper.label.textAutoSize = "shrink";
      this.view.homeButton.wrapper.label.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.homeButton.wrapper.label,"MBA_GO_HOME").toUpperCase();
      this.website.dataTextScope.push(this.view.homeButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(com.rockstargames.gtav.web.arena.Page.BASE_PAGE_HEIGHT);
      if(this.website.propertyIsOwned)
      {
         this.website.styleOption = this.website.purchasedStyleOption;
         this.website.graphicsOption = this.website.purchasedGraphicsOption;
         this.website.colourOption = this.website.purchasedColourOption;
         this.website.expansionFloorB1Option = this.website.purchasedExpansionFloorB1Option;
         this.website.expansionFloorB2Option = this.website.purchasedExpansionFloorB2Option;
         this.website.mechanicA = this.website.purchasedMechanicA;
         this.website.mechanicB = this.website.purchasedMechanicB;
         this.website.personalQuarters = this.website.purchasedPersonalQuarters;
      }
      else
      {
         this.website.styleOption = -1;
         this.website.graphicsOption = -1;
         this.website.colourOption = -1;
         this.website.expansionFloorB1Option = -1;
         this.website.expansionFloorB2Option = -1;
         this.website.mechanicA = -1;
         this.website.mechanicB = -1;
         this.website.personalQuarters = -1;
      }
   }
   function update()
   {
      this.view.title.autoSize = "left";
      if(this.website.dataProviderUI[1][0] != undefined)
      {
         this.view.title.text = this.website.dataProviderUI[1][0].toUpperCase();
      }
      this.view.title._x = 0.5 * (com.rockstargames.gtav.web.arena.Page.STAGE_WIDTH - this.view.title._width);
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
      this.view.titleGradientMask._x = this.view.title._x;
      this.view.titleGradient._x = this.view.title._x;
      this.view.titleGradient._width = this.view.title._width;
      this.view.message.autoSize = "left";
      if(this.website.dataProviderUI[2][0] != undefined)
      {
         this.view.message.text = this.website.dataProviderUI[2][0];
      }
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
