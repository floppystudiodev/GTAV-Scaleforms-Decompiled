class com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_ARC";
   function ArcadeSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"arcadeSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.arcadeMural == -1)
      {
         this.website.arcadeMural = 0;
      }
      if(this.website.arcadeStyle == -1)
      {
         this.website.arcadeStyle = 0;
      }
      if(this.website.arcadeFloor == -1)
      {
         this.website.arcadeFloor = 0;
      }
      if(this.website.arcadeNeon == -1)
      {
         this.website.arcadeNeon = 0;
      }
      if(this.website.arcadeQuarters == -1)
      {
         this.website.arcadeQuarters = 0;
      }
      if(this.website.arcadeHighScores == -1)
      {
         this.website.arcadeHighScores = 0;
      }
      if(this.website.arcadeGarage == -1)
      {
         this.website.arcadeGarage = 0;
      }
      var _loc2_ = this.website.getSelectedArcade();
      if(this.website.purchasedArcadeGarage != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_GARAGE_PAGE.name;
      }
      else if(this.website.purchasedArcadeQuarters != 1 || this.website.purchasedArcadeHighScores != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_EXTRAS_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_NEONS_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initArcadeProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"style_" + (this.website.arcadeStyle + 1),this.view.style);
      var _loc2_ = "mural_" + (this.website.arcadeMural + 1);
      if(this.website.arcadeMural == 0)
      {
         _loc2_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,_loc2_,this.view.mural);
      _loc2_ = "floor_" + (this.website.arcadeFloor + 1);
      if(this.website.arcadeFloor == 0)
      {
         _loc2_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,_loc2_,this.view.floor);
      _loc2_ = "neon_" + (this.website.arcadeNeon + 1);
      if(this.website.arcadeNeon == 0)
      {
         _loc2_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,_loc2_,this.view.neon);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"garage",this.view.garage);
      if(this.website.arcadeHighScores == 1 && this.website.arcadeQuarters == 1)
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"extras_1",this.view.extras);
      }
      else if(this.website.arcadeHighScores == 1)
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"extras_2",this.view.extras);
      }
      else if(this.website.arcadeQuarters == 1)
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"extras_3",this.view.extras);
      }
      else
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage.TXD,"extras_1",this.view.extras);
      }
      this.view.extras._alpha = !(this.website.arcadeHighScores == 1 || this.website.arcadeQuarters == 1) ? 50 : 100;
      this.view.garage._alpha = this.website.arcadeGarage != 1 ? 50 : 100;
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedArcade();
      if(_loc2_.isOwned && this.website.arcadeMural == this.website.purchasedArcadeMural && this.website.arcadeStyle == this.website.purchasedArcadeStyle && this.website.arcadeFloor == this.website.purchasedArcadeFloor && this.website.arcadeNeon == this.website.purchasedArcadeNeon && this.website.arcadeHighScores == this.website.purchasedArcadeHighScores && this.website.arcadeQuarters == this.website.purchasedArcadeQuarters && this.website.arcadeGarage == this.website.purchasedArcadeGarage)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedArcade();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getMuralBestCost(this.website.arcadeMural,this.website.purchasedArcadeMural);
      _loc2_ += _loc3_.getStyleBestCost(this.website.arcadeStyle,this.website.purchasedArcadeStyle);
      _loc2_ += _loc3_.getFloorBestCost(this.website.arcadeFloor,this.website.purchasedArcadeFloor);
      _loc2_ += _loc3_.getNeonBestCost(this.website.arcadeNeon,this.website.purchasedArcadeNeon);
      _loc2_ += _loc3_.getHighScoresBestCost(this.website.arcadeHighScores,this.website.purchasedArcadeHighScores);
      _loc2_ += _loc3_.getQuartersBestCost(this.website.arcadeQuarters,this.website.purchasedArcadeQuarters);
      _loc2_ += _loc3_.getGarageBestCost(this.website.arcadeGarage,this.website.purchasedArcadeGarage);
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
            this.website.dispatchPlayerArcadeSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerArcadeSelections();
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
