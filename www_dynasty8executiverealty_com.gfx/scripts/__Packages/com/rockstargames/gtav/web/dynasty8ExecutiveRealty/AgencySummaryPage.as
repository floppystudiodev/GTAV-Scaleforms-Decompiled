class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencySummaryPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var summaryPageName;
   var progressPanel;
   var slideshow;
   var view;
   static var TXD = "DYN8_EXEC_AGENCY";
   static var IMAGES = [];
   function AgencySummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"agencySummaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.agencyArt == -1)
      {
         this.website.agencyArt = 0;
      }
      if(this.website.agencyWallpaper == -1)
      {
         this.website.agencyWallpaper = 0;
      }
      if(this.website.agencyHighlight == -1)
      {
         this.website.agencyHighlight = 0;
      }
      if(this.website.agencyArmory == -1)
      {
         this.website.agencyArmory = 0;
      }
      if(this.website.agencyQuarters == -1)
      {
         this.website.agencyQuarters = 0;
      }
      if(this.website.agencyVehicle == -1)
      {
         this.website.agencyVehicle = 0;
      }
      var _loc2_ = this.website.getSelectedAgency();
      if(!_loc2_.isOwned || this.website.purchasedAgencyVehicle != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_VEHICLE_PAGE.name;
      }
      else if(!_loc2_.isOwned || this.website.purchasedAgencyQuarters != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_QUARTERS_PAGE.name;
      }
      else if(!_loc2_.isOwned || this.website.purchasedAgencyArmory != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ARMORY_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_HIGHLIGHT_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAgencyProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initPurchaseButton();
      this.initSlideshow();
      this.initSummary();
      this.initTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc2_ = [];
      _loc2_ = _loc2_.concat(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.IMAGES[this.website.agencyArt]);
      _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.IMAGES[this.website.agencyWallpaper]);
      _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.IMAGES[this.website.agencyHighlight]);
      if(this.website.agencyArmory == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArmoryPage.IMAGES[0]);
      }
      if(this.website.agencyQuarters == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyQuartersPage.IMAGES[0]);
      }
      if(this.website.agencyVehicle == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyVehiclePage.IMAGES[0]);
      }
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencySummaryPage.TXD,_loc2_,0);
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedAgency();
      if(_loc2_.isOwned && this.website.agencyArt == this.website.purchasedAgencyArt && this.website.agencyWallpaper == this.website.purchasedAgencyWallpaper && this.website.agencyHighlight == this.website.purchasedAgencyHighlight && this.website.agencyVehicle == this.website.purchasedAgencyVehicle && this.website.agencyArmory == this.website.purchasedAgencyArmory && this.website.agencyQuarters == this.website.purchasedAgencyQuarters)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initSummary()
   {
      var _loc2_ = "";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_ART") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_ART_" + this.website.agencyArt) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_WP") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_WP_" + this.website.agencyWallpaper) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_HI") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_HI_" + this.website.agencyHighlight) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_ARMORY") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.agencyArmory ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_QUARTERS") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.agencyQuarters ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_AG_WORKSHOP") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.agencyVehicle ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font>";
      this.view.summary.htmlText = _loc2_;
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedAgency();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getArtBestCost(this.website.agencyArt,this.website.purchasedAgencyArt);
      _loc2_ += _loc3_.getWallpaperBestCost(this.website.agencyWallpaper,this.website.purchasedAgencyWallpaper);
      _loc2_ += _loc3_.getHighlightBestCost(this.website.agencyHighlight,this.website.purchasedAgencyHighlight);
      _loc2_ += _loc3_.getArmoryBestCost(this.website.agencyArmory,this.website.purchasedAgencyArmory);
      _loc2_ += _loc3_.getQuartersBestCost(this.website.agencyQuarters,this.website.purchasedAgencyQuarters);
      _loc2_ += _loc3_.getVehicleBestCost(this.website.agencyVehicle,this.website.purchasedAgencyVehicle);
      if(_loc2_ == 0)
      {
         if(this.view.purchaseButton.disabled)
         {
            this.view.cost.text = "";
         }
         else
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.cost,"DYN8_EXEC_FREE");
         }
      }
      else
      {
         this.view.cost.text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc2_);
      }
   }
   function handleClick(type, id)
   {
      if(type == "purchaseButton")
      {
         this.website.dispatchPlayerAgencySelections();
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name);
      }
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
