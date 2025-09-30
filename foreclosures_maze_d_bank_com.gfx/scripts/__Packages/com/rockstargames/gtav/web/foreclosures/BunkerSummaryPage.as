class com.rockstargames.gtav.web.foreclosures.BunkerSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var tradeInAlert;
   var view;
   var website;
   function BunkerSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bunkerSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.bunkerStyle == -1)
      {
         this.website.bunkerStyle = 0;
      }
      if(this.website.quarters == -1)
      {
         this.website.quarters = 0;
      }
      if(this.website.firingRange == -1)
      {
         this.website.firingRange = 0;
      }
      if(this.website.bunkerGunLocker == -1)
      {
         this.website.bunkerGunLocker = 0;
      }
      if(this.website.transportation == -1)
      {
         this.website.transportation = 0;
      }
      var _loc2_ = this.website.getSelectedBunker();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_TRANSPORTATION_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initBunkerProgress(5);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initSlideshow();
      this.initSummary();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = [];
      var _loc4_ = [];
      var _loc6_ = [];
      var _loc5_ = [];
      var _loc7_ = [];
      _loc3_.push("FORECLOSURES_BUNKER");
      _loc2_.push("STYLE_" + Math.max(1,this.website.bunkerStyle + 1) + "B");
      if(this.website.quarters == 1)
      {
         _loc3_.push("FORECLOSURES_BUNKER");
         _loc2_.push("QUARTERS");
      }
      if(this.website.firingRange != 0)
      {
         _loc3_.push("FORECLOSURES_BUNKER");
         _loc2_.push("SHOOTINGB_" + Math.max(1,this.website.firingRange));
      }
      if(this.website.bunkerGunLocker == 1)
      {
         _loc3_.push("FORECLOSURES_BUNKER");
         _loc2_.push("GUN_LOCKER");
      }
      if(this.website.transportation != 0)
      {
         _loc3_.push("FORECLOSURES_BUNKER");
         _loc2_.push("TRANSPORTATIONB_" + Math.max(1,this.website.transportation));
      }
      this.slideshow.show(_loc3_,_loc2_,0,_loc5_,_loc6_,_loc4_,_loc7_);
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedBunker();
      if(_loc2_.isOwned && this.website.bunkerStyle == this.website.purchasedBunkerStyle && this.website.quarters == this.website.purchasedQuarters && this.website.firingRange == this.website.purchasedFiringRange && this.website.bunkerGunLocker == this.website.purchasedBunkerGunLocker && this.website.transportation == this.website.purchasedTransportation)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initSummary()
   {
      var _loc2_ = "";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_BUNKER_STYLE");
      var _loc3_ = "FORECLOSURES_BUNKER_STYLE_" + (this.website.bunkerStyle + 1);
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,_loc3_) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_QUARTERS");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,!this.website.quarters ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_FIRING_RANGE");
      _loc3_ = "FORECLOSURES_NO";
      switch(this.website.firingRange)
      {
         case 1:
            _loc3_ = "FORECLOSURES_SHOOTING_1";
            break;
         case 2:
            _loc3_ = "FORECLOSURES_SHOOTING_2";
      }
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,_loc3_) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_GUN_LOCKER");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,!this.website.bunkerGunLocker ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_TRANSPORTATION");
      _loc3_ = "FORECLOSURES_NO";
      switch(this.website.transportation)
      {
         case 1:
            _loc3_ = "FORECLOSURES_TRANSPORTATION_1";
            break;
         case 2:
            _loc3_ = "FORECLOSURES_TRANSPORTATION_2";
      }
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,_loc3_) + "</font><br>";
      this.view.summary.htmlText = _loc2_;
   }
   function initTotalCost()
   {
      var _loc2_ = this.website.getSelectedBunker();
      var _loc3_ = !_loc2_.isOwned ? _loc2_.getBaseBestCost() : 0;
      _loc3_ += _loc2_.getStyleBestCost(this.website.bunkerStyle,this.website.purchasedBunkerStyle);
      if(this.website.quarters == 1 && !(_loc2_.isOwned && this.website.purchasedQuarters == 1))
      {
         _loc3_ += _loc2_.getQuartersBestCost();
      }
      _loc3_ += _loc2_.getFiringRangeBestCost(this.website.firingRange,this.website.purchasedFiringRange);
      if(this.website.bunkerGunLocker == 1 && !(_loc2_.isOwned && this.website.purchasedBunkerGunLocker == 1))
      {
         _loc3_ += _loc2_.getGunLockerBestCost();
      }
      _loc3_ += _loc2_.getTransportationBestCost(this.website.transportation,this.website.purchasedTransportation);
      if(this.view.purchaseButton.disabled)
      {
         this.view.cost.text = "";
      }
      else if(_loc3_ == 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.cost,"FCFREE");
      }
      else
      {
         this.view.cost.text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc3_);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            if(this.website.purchasedBunkerID != -1 && this.website.purchasedBunkerID != this.website.selectedBunkerID)
            {
               this.showTradeInAlert();
            }
            else
            {
               this.website.dispatchPlayerBunkerSelections();
               this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            }
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerBunkerSelections();
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
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
   function showTradeInAlert()
   {
      this.tradeInAlert = this.website.showTradeInAlert();
      this.tradeInAlert.okButton.onColour = 16777215;
      this.tradeInAlert.okButton.offColour = 16777215;
      this.tradeInAlert.cancelButton.onColour = 16777215;
      this.tradeInAlert.cancelButton.offColour = 16777215;
      this.tradeInAlert.message.verticalAutoSize = "center";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.cancelButton.btnTxt,"FORECLOSURES_CANCEL");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.okButton.btnTxt,"FORECLOSURES_OK");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.tradeInAlert.message,"FORECLOSURES_TRADEIN");
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
