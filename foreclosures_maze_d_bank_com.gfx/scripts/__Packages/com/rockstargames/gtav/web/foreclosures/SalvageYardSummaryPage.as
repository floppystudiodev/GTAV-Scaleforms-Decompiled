class com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var progressPanel;
   var view;
   var buttonsHiddenByAlert;
   var tradeInAlert;
   static var TXD = "FORECLOSURES_SALVAGE";
   function SalvageYardSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"salvageYardSummaryPage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.salvageYardStaff == -1)
      {
         this.website.salvageYardStaff = 0;
      }
      var _loc2_ = this.website.getSelectedSalvageYard();
      if(this.website.purchasedSalvageYardStaff != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_STAFF_PAGE.name;
      }
      else if(this.website.purchasedSalvageYardWallSafe != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_WALL_SAFE_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TOW_TRUCK_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initSalvageYardProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage.TXD,"tint_" + (this.website.salvageYardTint + 1),this.view.tint);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage.TXD,"repair_bay",this.view.repairBay);
      this.view.repairBay._alpha = this.website.salvageYardRepairBay != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage.TXD,this.website.salvageYardTowTruck != 2 ? "tow_truck" : "tow_truck_b",this.view.towTruck);
      this.view.towTruck._alpha = !(this.website.salvageYardTowTruck == 1 || this.website.salvageYardTowTruck == 2) ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage.TXD,"wall_safe",this.view.wallSafe);
      this.view.wallSafe._alpha = this.website.salvageYardWallSafe != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage.TXD,"staff",this.view.staff);
      this.view.staff._alpha = this.website.salvageYardStaff != 1 ? 50 : 100;
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedSalvageYard();
      if(_loc2_.isOwned && this.website.salvageYardTint == this.website.purchasedSalvageYardTint && this.website.salvageYardRepairBay == this.website.purchasedSalvageYardRepairBay && this.website.salvageYardTowTruck == this.website.purchasedSalvageYardTowTruck && this.website.salvageYardWallSafe == this.website.purchasedSalvageYardWallSafe && this.website.salvageYardStaff == this.website.purchasedSalvageYardStaff)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedSalvageYard();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getTintBestCost(this.website.salvageYardTint,this.website.purchasedSalvageYardTint);
      _loc2_ += _loc3_.getRepairBayBestCost(this.website.salvageYardRepairBay,this.website.purchasedSalvageYardRepairBay);
      _loc2_ += _loc3_.getTowTruckBestCost(this.website.salvageYardTowTruck,this.website.purchasedSalvageYardTowTruck);
      _loc2_ += _loc3_.getWallSafeBestCost(this.website.salvageYardWallSafe,this.website.purchasedSalvageYardWallSafe);
      _loc2_ += _loc3_.getStaffBestCost(this.website.salvageYardStaff,this.website.purchasedSalvageYardStaff);
      if(this.view.purchaseButton.disabled)
      {
         this.view.cost.text = "";
      }
      else if(_loc2_ == 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.cost,"FCFREE");
      }
      else
      {
         this.view.cost.text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            this.website.dispatchPlayerSalvageYardSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerSalvageYardSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
      }
   }
   function handleLB()
   {
      this.hideTradeInAlert();
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function showTradeInAlert()
   {
      this.tradeInAlert = this.website.showTradeInAlert();
      this.tradeInAlert.okButton.onColour = 16777215;
      this.tradeInAlert.okButton.offColour = 16777215;
      this.tradeInAlert.cancelButton.onColour = 16777215;
      this.tradeInAlert.cancelButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.cancelButton.btnTxt,"FORECLOSURES_CANCEL");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.okButton.btnTxt,"FORECLOSURES_OK");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.message,"FCCLUB_TRADEIN");
      this.buttonsHiddenByAlert = [].concat(this.website.dataTextScope);
      this.website.dataTextScope = [];
      this.website.dataTextScope.push(this.tradeInAlert.cancelButton.btnTxt);
      this.website.dataTextScope.push(this.tradeInAlert.okButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function hideTradeInAlert()
   {
      if(this.tradeInAlert)
      {
         this.tradeInAlert.removeMovieClip();
         this.tradeInAlert = null;
      }
      this.buttonsHiddenByAlert = null;
   }
}
