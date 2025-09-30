class com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BAIL";
   function BailOfficeSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bailOfficeSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.bailOfficeStyle == -1)
      {
         this.website.bailOfficeStyle = 0;
      }
      if(this.website.bailOfficeStaff1 == -1)
      {
         this.website.bailOfficeStaff1 = 0;
      }
      if(this.website.bailOfficeStaff2 == -1)
      {
         this.website.bailOfficeStaff2 = 0;
      }
      if(this.website.bailOfficeQuarters == -1)
      {
         this.website.bailOfficeQuarters = 0;
      }
      if(this.website.bailOfficeGunLocker == -1)
      {
         this.website.bailOfficeGunLocker = 0;
      }
      if(this.website.bailOfficeTransporter == -1)
      {
         this.website.bailOfficeTransporter = 0;
      }
      var _loc2_ = this.website.getSelectedBailOffice();
      if(this.website.purchasedBailOfficeTransporter != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_TRANSPORTER_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeGunLocker != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_GUN_LOCKER_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeQuarters != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_QUARTERS_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeStaff1 != 1 || this.website.purchasedBailOfficeStaff2 != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STAFF_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STYLE_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initBailOfficeProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"style_" + (this.website.bailOfficeStyle + 1),this.view.style);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"staff_1",this.view.staff1);
      this.view.staff1._alpha = this.website.bailOfficeStaff1 != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"staff_2",this.view.staff2);
      this.view.staff2._alpha = this.website.bailOfficeStaff2 != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"quarters",this.view.quarters);
      this.view.quarters._alpha = this.website.bailOfficeQuarters != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"gun_locker",this.view.gunLocker);
      this.view.gunLocker._alpha = this.website.bailOfficeGunLocker != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage.TXD,"transporter",this.view.transporter);
      this.view.transporter._alpha = this.website.bailOfficeTransporter != 1 ? 50 : 100;
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedBailOffice();
      if(_loc2_.isOwned && this.website.bailOfficeStyle == this.website.purchasedBailOfficeStyle && this.website.bailOfficeStaff1 == this.website.purchasedBailOfficeStaff1 && this.website.bailOfficeStaff2 == this.website.purchasedBailOfficeStaff2 && this.website.bailOfficeQuarters == this.website.purchasedBailOfficeQuarters && this.website.bailOfficeGunLocker == this.website.purchasedBailOfficeGunLocker && this.website.bailOfficeTransporter == this.website.purchasedBailOfficeTransporter)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedBailOffice();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getStyleBestCost(this.website.bailOfficeStyle,this.website.purchasedBailOfficeStyle);
      _loc2_ += _loc3_.getStaff1BestCost(this.website.bailOfficeStaff1,this.website.purchasedBailOfficeStaff1);
      _loc2_ += _loc3_.getStaff2BestCost(this.website.bailOfficeStaff2,this.website.purchasedBailOfficeStaff2);
      _loc2_ += _loc3_.getQuartersBestCost(this.website.bailOfficeQuarters,this.website.purchasedBailOfficeQuarters);
      _loc2_ += _loc3_.getGunLockerBestCost(this.website.bailOfficeGunLocker,this.website.purchasedBailOfficeGunLocker);
      _loc2_ += _loc3_.getTransporterBestCost(this.website.bailOfficeTransporter,this.website.purchasedBailOfficeTransporter);
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
            this.website.dispatchPlayerBailOfficeSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerBailOfficeSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
         default:
            return;
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
