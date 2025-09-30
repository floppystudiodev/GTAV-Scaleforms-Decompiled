class com.rockstargames.gtav.web.foreclosures.NightclubDryIcePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubDryIcePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubDryIcePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      if(this.website.nightclubLighting == -1)
      {
         this.website.nightclubLighting = 0;
      }
      if(this.website.nightclubName == -1)
      {
         this.website.nightclubName = 0;
      }
      if(this.website.nightclubStorage == -1)
      {
         this.website.nightclubStorage = 0;
      }
      if(this.website.nightclubGarage == -1)
      {
         this.website.nightclubGarage = 0;
      }
      if(this.website.nightclubDancers == -1)
      {
         this.website.nightclubDancers = 0;
      }
      if(this.website.nightclubDryIce == -1)
      {
         this.website.nightclubDryIce = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DANCERS_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(6);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCCLUB_ICE_DESC",false);
      this.initSlideshow();
      this.initDryIceButton(this.view.dryIceButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubDryIcePage.TXD],["dry_ice"]);
   }
   function initDryIceButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCCLUB_ICE",false);
      if(!this.website.getSelectedNightclub().isOwned || this.website.purchasedNightclubDryIce == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "dryIceButton":
            this.website.nightclubDryIce = this.website.nightclubDryIce != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.view.dryIceButton.tick._visible = this.website.nightclubDryIce != 0;
      this.progressPanel.updateNightclubCosts();
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
