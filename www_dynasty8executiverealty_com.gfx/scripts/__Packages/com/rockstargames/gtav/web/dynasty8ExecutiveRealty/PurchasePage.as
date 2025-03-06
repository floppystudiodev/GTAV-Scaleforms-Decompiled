class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var pageName;
   var website;
   var prevPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var OFFICE_TXD = "DYN8_EXEC_DEFAULT";
   static var OFFICE_IMAGES = [["DECOR_EXEC_RICH_1","DECOR_EXEC_RICH_2","DECOR_EXEC_RICH_n"],["DECOR_EXEC_COOL_1","DECOR_EXEC_COOL_2","DECOR_EXEC_COOL_n"],["DECOR_EXEC_CONTRAST_1","DECOR_EXEC_CONTRAST_2","DECOR_EXEC_CONTRAST_n"],["DECOR_OLDSPICE_WARM_1","DECOR_OLDSPICE_WARM_2","DECOR_OLDSPICE_WARM_n"],["DECOR_OLDSPICE_CLASSICAL_1","DECOR_OLDSPICE_CLASSICAL_2","DECOR_OLDSPICE_CLASSICAL_n"],["DECOR_OLDSPICE_VINTAGE_1","DECOR_OLDSPICE_VINTAGE_2","DECOR_OLDSPICE_VINTAGE_n"],["DECOR_POWER_ICE_1","DECOR_POWER_ICE_2","DECOR_POWER_ICE_n"],["DECOR_POWER_CONSERVATIVE_1","DECOR_POWER_CONSERVATIVE_2","DECOR_POWER_CONSERVATIVE_n"],["DECOR_POWER_POLISHED_1","DECOR_POWER_POLISHED_2","DECOR_POWER_POLISHED_n"]];
   static var selectedOfficeID = -1;
   static var AGENCY_TXD = "DYN8_EXEC_AGENCY";
   static var selectedAgencyID = -1;
   function PurchasePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"purchasePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         if(this.website.selectedAgencyID != -1)
         {
            this.initAgencyFlow();
         }
         else if(this.website.garageSelected == true)
         {
            this.initGarageFlow();
         }
         else
         {
            this.initOfficeFlow();
         }
      }
      else if(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedAgencyID != -1)
      {
         this.initAgencyFlow();
      }
      else if(this.website.garageSelected == true)
      {
         this.initGarageFlow();
      }
      else
      {
         this.initOfficeFlow();
      }
   }
   function initOfficeFlow()
   {
      if(this.website.style == -1)
      {
         this.website.style = 0;
      }
      if(this.website.personnel == -1)
      {
         this.website.personnel = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      if(this.website.vault == -1)
      {
         this.website.vault = 0;
      }
      if(this.website.bed == -1)
      {
         this.website.bed = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      this.progressPanel.setProgressDots(7);
      this.progressPanel.hidePurchaseButton();
      this.initOfficeSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,"DYN8_EXEC_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
      }
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedOffice();
      }
      var _loc2_ = this.website.getSelectedOffice().id;
      if(_loc2_ != undefined)
      {
         com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedOfficeID = _loc2_;
      }
      com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedAgencyID = -1;
      this.website.setSelectedOffice(-1);
   }
   function initOfficeSlideshow()
   {
      this.view.garageSlideshow._visible = false;
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         var _loc2_ = [].concat(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.OFFICE_IMAGES[this.website.style]);
         var _loc3_ = this.website.getSelectedOffice();
         _loc2_[2] = _loc2_[2].substring(0,_loc2_[2].lastIndexOf("_") + 1) + _loc3_.id;
         this.website.purchaseSlideshow = _loc2_;
         this.website.officeToMarkAsPurchased = _loc3_;
      }
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.OFFICE_TXD,this.website.purchaseSlideshow);
   }
   function initGarageFlow()
   {
      if(this.website.garage1Equipped != 1)
      {
         this.website.garage1Equipped = 1;
      }
      if(this.website.garage1Style == -1)
      {
         this.website.garage1Style = 0;
      }
      if(this.website.garage1Lighting == -1)
      {
         this.website.garage1Lighting = 0;
      }
      if(this.website.garage1Number == -1)
      {
         this.website.garage1Number = 0;
      }
      if(this.website.garage2Equipped == -1)
      {
         this.website.garage2Equipped = 0;
      }
      if(this.website.garage2Style == -1)
      {
         this.website.garage2Style = 0;
      }
      if(this.website.garage2Lighting == -1)
      {
         this.website.garage2Lighting = 0;
      }
      if(this.website.garage2Number == -1)
      {
         this.website.garage2Number = 0;
      }
      if(this.website.garage3Equipped == -1)
      {
         this.website.garage3Equipped = 0;
      }
      if(this.website.garage3Style == -1)
      {
         this.website.garage3Style = 0;
      }
      if(this.website.garage3Lighting == -1)
      {
         this.website.garage3Lighting = 0;
      }
      if(this.website.garage3Number == -1)
      {
         this.website.garage3Number = 0;
      }
      if(this.website.modShopEquipped == -1)
      {
         this.website.modShopEquipped = 0;
      }
      if(this.website.modShop == -1)
      {
         this.website.modShop = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MOD_SHOP_PAGE.name;
      this.progressPanel.setProgressDots(4);
      this.progressPanel.hidePurchaseButton();
      this.initGarageSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,"DYN8_EXEC_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
      }
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedOffice();
      }
      this.website.setSelectedOffice(-1);
   }
   function initGarageSlideshow()
   {
      this.view.slideshow._visible = false;
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         var _loc2_ = [];
         _loc2_.push("INTERIOR_" + this.website.garage1Style);
         _loc2_.push("LIGHTING_" + this.website.garage1Lighting);
         _loc2_.push("SIGNAGE_1_" + this.website.garage1Number);
         if(this.website.garage2Equipped == 1)
         {
            _loc2_.push("INTERIOR_" + this.website.garage2Style);
            _loc2_.push("LIGHTING_" + this.website.garage2Lighting);
            _loc2_.push("SIGNAGE_2_" + this.website.garage2Number);
         }
         if(this.website.garage3Equipped == 1)
         {
            _loc2_.push("INTERIOR_" + this.website.garage3Style);
            _loc2_.push("LIGHTING_" + this.website.garage3Lighting);
            _loc2_.push("SIGNAGE_3_" + this.website.garage3Number);
         }
         if(this.website.modShopEquipped == 1)
         {
            _loc2_.push("MODSHOP_" + this.website.modShop);
         }
         this.website.purchaseSlideshow = _loc2_;
      }
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.garageSlideshow);
      this.slideshow.show("DYN_GARAGE",this.website.purchaseSlideshow);
      this.view.heading._y -= 72;
      this.view.description._y -= 72;
   }
   function initAgencyFlow()
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
      if(this.website.agencyVehicle == -1)
      {
         this.website.agencyVehicle = 0;
      }
      if(this.website.agencyArmory == -1)
      {
         this.website.agencyArmory = 0;
      }
      if(this.website.agencyQuarters == -1)
      {
         this.website.agencyQuarters = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initAgencySlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,"DYN8_EXEC_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
      }
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedAgency();
      }
      var _loc2_ = this.website.getSelectedAgency().id;
      if(_loc2_ != undefined)
      {
         com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedAgencyID = _loc2_;
      }
      com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedOfficeID = -1;
      this.website.setSelectedAgency(-1);
   }
   function initAgencySlideshow()
   {
      this.view.garageSlideshow._visible = false;
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
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
         var _loc3_ = this.website.getSelectedAgency();
         this.website.purchaseSlideshow = _loc2_;
         this.website.agencyToMarkAsPurchased = _loc3_;
      }
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.AGENCY_TXD,this.website.purchaseSlideshow);
   }
   function initButtons()
   {
      var _loc3_ = 5;
      this.initButton(this.view.waypointButton,"DYN8_EXEC_SET_WAYPOINT",_loc3_);
      this.initButton(this.view.mapButton,"DYN8_EXEC_RETURN_TO_MAP",_loc3_);
      this.initButton(this.view.garageButton,!this.website.hasOwnedGarage() ? "DYN8_EXEC_BUY_GARAGE" : "DYN8_EXEC_RENOVATE_GARAGE",_loc3_);
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.view.mapButton._visible = false;
         this.view.mapButton.disabled = true;
      }
      else
      {
         this.view.mapButton._visible = true;
         this.view.mapButton.disabled = false;
      }
      if(this.pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.view.waypointButton._visible = true;
         this.view.waypointButton.disabled = false;
         this.view.garageButton._visible = !this.website.garageSelected && this.website.selectedAgencyID == -1 && com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedAgencyID == -1;
         this.view.garageButton.disabled = this.website.garageSelected || this.website.selectedAgencyID != -1 || com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedAgencyID != -1;
      }
      else
      {
         this.view.waypointButton._visible = false;
         this.view.waypointButton.disabled = true;
         this.view.garageButton._visible = false;
         this.view.garageButton.disabled = true;
      }
      if(this.view.mapButton._visible && this.view.waypointButton._visible)
      {
         var _loc2_ = Math.max(this.view.mapButton._width,this.view.waypointButton._width);
         this.view.mapButton.bg._width = _loc2_;
         this.view.mapButton.btnTxt.autoSize = "none";
         this.view.mapButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.bg._width = _loc2_;
         this.view.waypointButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.btnTxt.autoSize = "none";
         var _loc4_ = (this.view.slideshow._width - 2 * _loc2_) / 3;
         this.view.waypointButton._x = this.view.slideshow._x + _loc4_;
         this.view.mapButton._x = this.view.slideshow._x + this.view.slideshow._width - _loc4_ - _loc2_;
      }
      else if(this.view.mapButton._visible)
      {
         this.view.mapButton._x = 0.5 * (this.view.slideshow._width - this.view.mapButton._width) + this.view.slideshow._x;
      }
      else if(this.view.waypointButton._visible)
      {
         this.view.waypointButton._x = 0.5 * (this.view.slideshow._width - this.view.waypointButton._width) + this.view.slideshow._x;
      }
      if(this.view.garageButton._visible)
      {
         this.view.garageButton._x = 0.5 * (this.view.slideshow._width - this.view.garageButton._width) + this.view.slideshow._x;
      }
   }
   function initButton(btn, label, padding)
   {
      var _loc4_ = btn.bg._width;
      btn.onColour = 16777215;
      btn.offColour = 16777215;
      btn.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(btn.btnTxt,label,false);
      this.website.dataTextScope.push(btn.btnTxt);
      btn.btnTxt._x = padding;
      btn.bg._width = btn.btnTxt._width + 2 * padding;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "mapButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name);
            break;
         case "waypointButton":
            this.view.mapButton.disabled = true;
            this.view.garageButton.disabled = true;
            break;
         case "garageButton":
            this.website.rebuildOfficeData();
            this.website.garageSelected = true;
            this.website.setSelectedOffice(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage.selectedOfficeID);
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_1_PAGE.name);
      }
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
