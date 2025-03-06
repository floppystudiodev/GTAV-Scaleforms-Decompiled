class com.rockstargames.gtav.web.foreclosures.SalvageYardTowTruckPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_SALVAGE";
   function SalvageYardTowTruckPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"salvageYardTowTruckPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedSalvageYard();
      if(this.website.purchasedSalvageYardRepairBay != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_REPAIR_BAY_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TINT_PAGE.name;
      }
      if(this.website.purchasedSalvageYardWallSafe != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_WALL_SAFE_PAGE.name;
      }
      else if(this.website.purchasedSalvageYardStaff != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_STAFF_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initSalvageYardProgress(3);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCSALVAGE_TOW_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.SalvageYardTowTruckPage.TXD],["tow_truck"]);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_ = undefined;
      _loc2_ = this.view.towTruckButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCSALVAGE_TOW",false);
      this.website.dataTextScope.push(_loc2_.btnTxt);
      _loc2_ = this.view.towTruckBeaterButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.towTruckButton._y + this.view.towTruckButton._height + 10;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCSALVAGE_TOWB",false);
      this.website.dataTextScope.push(_loc2_.btnTxt);
   }
   function handleClick(type, id)
   {
      var _loc2_ = this.website.getSelectedSalvageYard();
      switch(type)
      {
         case "towTruckButton":
            if(_loc2_.isOwned && this.website.purchasedSalvageYardTowTruck > 0)
            {
               this.website.salvageYardTowTruck = 1;
            }
            else
            {
               this.website.salvageYardTowTruck = this.website.salvageYardTowTruck == 1 ? 0 : 1;
            }
            this.updateSelectedItem(true);
            break;
         case "towTruckBeaterButton":
            if(_loc2_.isOwned && this.website.purchasedSalvageYardTowTruck > 0)
            {
               this.website.salvageYardTowTruck = 2;
            }
            else
            {
               this.website.salvageYardTowTruck = this.website.salvageYardTowTruck == 2 ? 0 : 2;
            }
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.towTruckButton.tick._visible = this.website.salvageYardTowTruck == 1;
      this.view.towTruckBeaterButton.tick._visible = this.website.salvageYardTowTruck == 2;
      this.progressPanel.updateSalvageYardCosts();
      var _loc2_ = this.website.salvageYardTowTruck != 2 ? "tow_truck" : "tow_truck_b";
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.SalvageYardTowTruckPage.TXD],[_loc2_]);
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
