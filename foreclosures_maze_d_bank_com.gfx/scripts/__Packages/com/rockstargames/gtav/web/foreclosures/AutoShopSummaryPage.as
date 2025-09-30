class com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_AUTO";
   function AutoShopSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"autoShopSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.autoShopStyle == -1)
      {
         this.website.autoShopStyle = 0;
      }
      if(this.website.autoShopTint == -1)
      {
         this.website.autoShopTint = 0;
      }
      if(this.website.autoShopEmblem == -1)
      {
         this.website.autoShopEmblem = this.website.autoShopCrewEmblem != "" ? 0 : 1;
      }
      if(this.website.autoShopName == -1)
      {
         this.website.autoShopName = 0;
      }
      if(this.website.autoShopStaff1 == -1)
      {
         this.website.autoShopStaff1 = 0;
      }
      if(this.website.autoShopStaff2 == -1)
      {
         this.website.autoShopStaff2 = 0;
      }
      if(this.website.autoShopCarLift == -1)
      {
         this.website.autoShopCarLift = 0;
      }
      if(this.website.autoShopQuarters == -1)
      {
         this.website.autoShopQuarters = 0;
      }
      if(this.website.autoShopMembership == -1)
      {
         this.website.autoShopMembership = 0;
      }
      var _loc2_ = this.website.getSelectedAutoShop();
      if(this.website.purchasedAutoShopMembership != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_MEMBERSHIP_PAGE.name;
      }
      if(this.website.purchasedAutoShopQuarters != 1 || this.website.purchasedAutoShopCarLift != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EXTRAS_PAGE.name;
      }
      else if(this.website.purchasedAutoShopStaff1 != 1 || this.website.purchasedAutoShopStaff2 != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STAFF_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EMBLEM_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initAutoShopProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"style_" + (this.website.autoShopStyle + 1),this.view.style);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"tint_" + (this.website.autoShopTint + 1),this.view.tint);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"emblem_" + (this.website.autoShopEmblem + 1),this.view.emblem);
      if(this.website.autoShopEmblem == 0)
      {
         this.website.imageManager.addImage(this.website.autoShopCrewEmblem,this.website.autoShopCrewEmblem,this.view.scEmblem);
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"staff_1",this.view.staff1);
      this.view.staff1._alpha = this.website.autoShopStaff1 != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"staff_2",this.view.staff2);
      this.view.staff2._alpha = this.website.autoShopStaff2 != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"carlift",this.view.carLift);
      this.view.carLift._alpha = this.website.autoShopCarLift != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"quarters",this.view.quarters);
      this.view.quarters._alpha = this.website.autoShopQuarters != 1 ? 50 : 100;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopSummaryPage.TXD,"membership",this.view.membership);
      this.view.membership._alpha = this.website.autoShopMembership != 1 ? 50 : 100;
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedAutoShop();
      if(_loc2_.isOwned && this.website.autoShopStyle == this.website.purchasedAutoShopStyle && this.website.autoShopTint == this.website.purchasedAutoShopTint && this.website.autoShopEmblem == this.website.purchasedAutoShopEmblem && this.website.autoShopName == this.website.purchasedAutoShopName && this.website.autoShopStaff1 == this.website.purchasedAutoShopStaff1 && this.website.autoShopStaff2 == this.website.purchasedAutoShopStaff2 && this.website.autoShopMembership == this.website.purchasedAutoShopMembership && this.website.autoShopQuarters == this.website.purchasedAutoShopQuarters && this.website.autoShopCarLift == this.website.purchasedAutoShopCarLift)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedAutoShop();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getStyleBestCost(this.website.autoShopStyle,this.website.purchasedAutoShopStyle);
      _loc2_ += _loc3_.getTintBestCost(this.website.autoShopTint,this.website.purchasedAutoShopTint);
      _loc2_ += _loc3_.getEmblemBestCost(this.website.autoShopEmblem,this.website.purchasedAutoShopEmblem);
      _loc2_ += _loc3_.getNameBestCost(this.website.autoShopName,this.website.purchasedAutoShopName);
      _loc2_ += _loc3_.getStaff1BestCost(this.website.autoShopStaff1,this.website.purchasedAutoShopStaff1);
      _loc2_ += _loc3_.getStaff2BestCost(this.website.autoShopStaff2,this.website.purchasedAutoShopStaff2);
      _loc2_ += _loc3_.getQuartersBestCost(this.website.autoShopQuarters,this.website.purchasedAutoShopQuarters);
      _loc2_ += _loc3_.getCarLiftBestCost(this.website.autoShopCarLift,this.website.purchasedAutoShopCarLift);
      _loc2_ += _loc3_.getMembershipBestCost(this.website.autoShopMembership,this.website.purchasedAutoShopMembership);
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
            this.website.dispatchPlayerAutoShopSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerAutoShopSelections();
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
