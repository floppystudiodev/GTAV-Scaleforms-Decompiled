class com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var buttonsHiddenByAlert;
   var prevPageName;
   var progressPanel;
   var tradeInAlert;
   var view;
   var website;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubSummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubSummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      if(this.website.nightclubLighting == -1)
      {
         this.website.nightclubLighting = 0;
      }
      if(this.website.nightclubName == -1)
      {
         this.website.nightclubName = 0;
      }
      if(this.website.nightclubStorage == -1)
      {
         this.website.nightclubStorage = 0;
      }
      if(this.website.nightclubGarage == -1)
      {
         this.website.nightclubGarage = 0;
      }
      if(this.website.nightclubDancers == -1)
      {
         this.website.nightclubDancers = 0;
      }
      if(this.website.nightclubDryIce == -1)
      {
         this.website.nightclubDryIce = 0;
      }
      var _loc6_ = this.website.getSelectedNightclub();
      if(this.website.purchasedNightclubDryIce != 1 || !_loc6_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DRY_ICE_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DANCERS_PAGE.name;
      }
      var _loc4_ = this.website.purchasedNightclubStorage != -1 ? this.website.purchasedNightclubStorage + 1 : 1;
      var _loc5_ = this.website.purchasedNightclubGarage != -1 ? this.website.purchasedNightclubGarage + 1 : 1;
      var _loc3_ = 1;
      var _loc2_;
      while(_loc3_ <= 5)
      {
         _loc2_ = this.view["storage" + _loc3_];
         _loc2_.gotoAndStop(_loc3_ > this.website.nightclubStorage + 1 ? "off" : "on");
         if(_loc3_ > 1)
         {
            _loc2_.label.text = _loc3_;
            _loc2_.label.autoSize = "left";
            _loc2_.label._x = 0.5 * (_loc2_._width - _loc2_.label._width);
            _loc2_.tick._visible = _loc3_ <= _loc4_;
            if(_loc2_.tick._visible)
            {
               _loc2_.label._x -= 0.5 * _loc2_.tick._width - 1;
               _loc2_.tick._x = _loc2_.label._x + _loc2_.label._width + 2;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 1;
      while(_loc3_ <= 4)
      {
         _loc2_ = this.view["garage" + _loc3_];
         _loc2_.gotoAndStop(_loc3_ > this.website.nightclubGarage + 1 ? "off" : "on");
         if(_loc3_ > 1)
         {
            _loc2_.label.text = _loc3_;
            _loc2_.label.autoSize = "left";
            _loc2_.label._x = 0.5 * (_loc2_._width - _loc2_.label._width);
            _loc2_.tick._visible = _loc3_ <= _loc5_;
            if(_loc2_.tick._visible)
            {
               _loc2_.label._x -= 0.5 * _loc2_.tick._width - 1;
               _loc2_.tick._x = _loc2_.label._x + _loc2_.label._width + 2;
            }
         }
         _loc2_.label.text = _loc3_;
         _loc3_ = _loc3_ + 1;
      }
      if(this.website.nightclubDancers == 0)
      {
         this.view.dancerGender._visible = false;
      }
      else
      {
         this.view.dancerGender.gotoAndStop((this.website.nightclubDancers - 1) % 3 + 1);
         this.view.dancerGender._visible = true;
      }
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initThumbnails();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initThumbnails()
   {
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"style" + (this.website.nightclubStyle + 1) + "_1",this.view.style);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"lighting" + (this.website.nightclubLighting + 1),this.view.lighting);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"name" + (this.website.nightclubName + 1),this.view.clubName);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"storage",this.view.storage);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"garage" + Math.max(1,this.website.nightclubGarage),this.view.garage);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"dry_ice",this.view.dryIce);
      var _loc2_ = Math.max(1,this.website.nightclubDancers);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage.TXD,"dancers" + _loc2_,this.view.dancers);
      if(this.website.nightclubDancers == 0)
      {
         this.view.dancers._alpha = 50;
      }
      if(this.website.nightclubDryIce == 0)
      {
         this.view.dryIce._alpha = 50;
      }
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedNightclub();
      if(_loc2_.isOwned && this.website.nightclubStyle == this.website.purchasedNightclubStyle && this.website.nightclubLighting == this.website.purchasedNightclubLighting && this.website.nightclubName == this.website.purchasedNightclubName && this.website.nightclubStorage == this.website.purchasedNightclubStorage && this.website.nightclubGarage == this.website.purchasedNightclubGarage && this.website.nightclubDancers == this.website.purchasedNightclubDancers && this.website.nightclubDryIce == this.website.purchasedNightclubDryIce)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initTotalCost()
   {
      var _loc4_ = this.website.getSelectedNightclub();
      var _loc3_ = !_loc4_.isOwned ? _loc4_.getBaseBestCost() : 0;
      _loc3_ += _loc4_.getStyleBestCost(this.website.nightclubStyle,this.website.purchasedNightclubStyle);
      _loc3_ += _loc4_.getLightingBestCost(this.website.nightclubLighting,this.website.purchasedNightclubLighting);
      _loc3_ += _loc4_.getNameBestCost(this.website.nightclubName,this.website.purchasedNightclubName);
      var _loc2_ = this.website.purchasedNightclubStorage + 1;
      while(_loc2_ <= this.website.nightclubStorage)
      {
         _loc3_ += _loc4_.getStorageBestCost(_loc2_,this.website.purchasedNightclubStorage);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = this.website.purchasedNightclubGarage + 1;
      while(_loc2_ <= this.website.nightclubGarage)
      {
         _loc3_ += _loc4_.getGarageBestCost(_loc2_,this.website.purchasedNightclubGarage);
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ += _loc4_.getDancersBestCost(this.website.nightclubDancers,this.website.purchasedNightclubDancers);
      _loc3_ += _loc4_.getDryIceBestCost(this.website.nightclubDryIce,this.website.purchasedNightclubDryIce);
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
            this.website.dispatchPlayerNightclubSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
            break;
         case "cancelButton":
            this.website.dataTextScope = this.buttonsHiddenByAlert;
            this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
            this.hideTradeInAlert();
            break;
         case "okButton":
            this.hideTradeInAlert();
            this.website.dispatchPlayerNightclubSelections();
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
