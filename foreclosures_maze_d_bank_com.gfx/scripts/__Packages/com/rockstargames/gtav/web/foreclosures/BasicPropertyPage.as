class com.rockstargames.gtav.web.foreclosures.BasicPropertyPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var tradeInAlert;
   var view;
   var website;
   function BasicPropertyPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"basicPropertyPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      var _loc2_;
      if(this.website.isInGarmentFactoryFlow)
      {
         _loc2_ = this.website.getSelectedGarmentFactory();
      }
      else if(this.website.isInMcKenzieHangarFlow)
      {
         _loc2_ = this.website.getSelectedMcKenzieHangar();
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.initPurchaseButton();
      this.initThumbnails(_loc2_);
      this.initTotalCost(_loc2_);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails(property)
   {
      this.website.imageManager.addImage(property.txd,property.txd + "_INT",this.view.img);
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
   }
   function initTotalCost(property)
   {
      var _loc2_ = !property.isOwned ? property.getBaseBestCost() : 0;
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
