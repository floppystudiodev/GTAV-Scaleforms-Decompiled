class com.rockstargames.gtav.web.foreclosures.SalvageYardWallSafePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_SALVAGE";
   function SalvageYardWallSafePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"salvageYardWallSafePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.salvageYardTint == -1)
      {
         this.website.salvageYardTint = 0;
      }
      if(this.website.salvageYardRepairBay == -1)
      {
         this.website.salvageYardRepairBay = 0;
      }
      if(this.website.salvageYardTowTruck == -1)
      {
         this.website.salvageYardTowTruck = 0;
      }
      if(this.website.salvageYardWallSafe == -1)
      {
         this.website.salvageYardWallSafe = 0;
      }
      var _loc2_ = this.website.getSelectedSalvageYard();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TOW_TRUCK_PAGE.name;
      if(this.website.purchasedSalvageYardStaff != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_STAFF_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initSalvageYardProgress(4);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCSALVAGE_SAFE_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.SalvageYardWallSafePage.TXD],["wall_safe"]);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_;
      _loc2_ = this.view.wallSafeButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCSALVAGE_SAFE",false);
      if(!this.website.getSelectedSalvageYard().isOwned || this.website.purchasedSalvageYardWallSafe == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "wallSafeButton":
            this.website.salvageYardWallSafe = this.website.salvageYardWallSafe != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.wallSafeButton.tick._visible = this.website.salvageYardWallSafe == 1;
      this.progressPanel.updateSalvageYardCosts();
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
