class com.rockstargames.gtav.web.foreclosures.BaseSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BASE";
   function BaseSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"baseSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.baseStyle == -1)
      {
         this.website.baseStyle = 0;
      }
      if(this.website.baseGraphics == -1)
      {
         this.website.baseGraphics = 0;
      }
      if(this.website.baseWeapon == -1)
      {
         this.website.baseWeapon = 0;
      }
      if(this.website.baseSecurity == -1)
      {
         this.website.baseSecurity = 0;
      }
      if(this.website.baseLounge == -1)
      {
         this.website.baseLounge = 0;
      }
      if(this.website.baseQuarters == -1)
      {
         this.website.baseQuarters = 0;
      }
      if(this.website.baseWindow == -1)
      {
         this.website.baseWindow = 0;
      }
      var _loc2_ = this.website.getSelectedBase();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_QUARTERS_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initBaseProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"style" + (this.website.baseStyle + 1),this.view.style);
      var _loc2_ = this.website.baseGraphics * this.website.numBaseStyles + this.website.baseStyle + 1;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"graphic" + _loc2_,this.view.graphics);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"weapon",this.view.weapon);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"security",this.view.security);
      _loc2_ = this.website.baseLounge + 1;
      if(this.website.baseWindow == 1)
      {
         _loc2_ += this.website.numBaseLounges;
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"lounge" + _loc2_,this.view.lounge);
      _loc2_ = Math.max(1,this.website.baseQuarters);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BaseSummaryPage.TXD,"quarters" + _loc2_,this.view.quarters);
      if(this.website.baseWeapon == 0)
      {
         this.view.weapon._alpha = 50;
      }
      if(this.website.baseSecurity == 0)
      {
         this.view.security._alpha = 50;
      }
      if(this.website.baseQuarters == 0)
      {
         this.view.quarters._alpha = 50;
      }
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedBase();
      if(_loc2_.isOwned && this.website.baseStyle == this.website.purchasedBaseStyle && this.website.baseGraphics == this.website.purchasedBaseGraphics && this.website.baseWeapon == this.website.purchasedBaseWeapon && this.website.baseSecurity == this.website.purchasedBaseSecurity && this.website.baseLounge == this.website.purchasedBaseLounge && this.website.baseQuarters == this.website.purchasedBaseQuarters && this.website.baseWindow == this.website.purchasedBaseWindow)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedBase();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getStyleBestCost(this.website.baseStyle,this.website.purchasedBaseStyle);
      _loc2_ += _loc3_.getGraphicsBestCost(this.website.baseGraphics,this.website.purchasedBaseGraphics);
      _loc2_ += _loc3_.getWeaponBestCost(this.website.baseWeapon,this.website.purchasedBaseWeapon);
      _loc2_ += _loc3_.getSecurityBestCost(this.website.baseSecurity,this.website.purchasedBaseSecurity);
      _loc2_ += _loc3_.getLoungeBestCost(this.website.baseLounge,this.website.purchasedBaseLounge);
      _loc2_ += _loc3_.getQuartersBestCost(this.website.baseQuarters,this.website.purchasedBaseQuarters);
      _loc2_ += _loc3_.getWindowBestCost(this.website.baseWindow,this.website.purchasedBaseWindow);
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
            this.website.dispatchPlayerBaseSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerBaseSelections();
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
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.message,"FCHNGR_TRADEIN");
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
