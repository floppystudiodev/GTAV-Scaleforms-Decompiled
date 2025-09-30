class com.rockstargames.gtav.web.foreclosures.CarWashSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_CARWASH";
   function CarWashSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"carWashSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.carWashTint == -1)
      {
         this.website.carWashTint = 0;
      }
      var _loc2_ = this.website.getSelectedCarWash();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.CAR_WASH_TINT_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initCarWashProgress(2);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.CarWashSummaryPage.TXD],["tint_" + (this.website.carWashTint + 1)]);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.CarWashSummaryPage.TXD,"tint_" + (this.website.carWashTint + 1),this.view.tint);
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedCarWash();
      if(_loc2_.isOwned && this.website.carWashTint == this.website.purchasedCarWashTint)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedCarWash();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getTintBestCost(this.website.carWashTint,this.website.purchasedCarWashTint);
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
            this.website.dispatchPlayerCarWashSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerCarWashSelections();
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
