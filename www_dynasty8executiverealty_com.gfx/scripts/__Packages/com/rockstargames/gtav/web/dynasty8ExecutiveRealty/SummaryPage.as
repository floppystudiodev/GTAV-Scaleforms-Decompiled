class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SummaryPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var WIDE_PERSONNEL_IMAGES = ["PERSONNEL_FEMALE_WIDE","PERSONNEL_MALE_WIDE"];
   static var TXD = "DYN8_EXEC_DEFAULT";
   function SummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"summaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.garageSelected)
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
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.colour == -1)
      {
         this.website.colour = 0;
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
      var _loc2_ = this.website.getSelectedOffice();
      if(!_loc2_.isOwned || this.website.purchasedBed != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      }
      else if(this.website.purchasedVault != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.VAULT_PAGE.name;
      }
      else if(this.website.purchasedGunLocker != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SIGNAGE_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initProgress(6);
      this.progressPanel.hidePurchaseButton();
      this.initOfficePurchaseButton();
      this.initOfficeSlideshow();
      this.initOfficeSummary();
      this.initOfficeTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initOfficeSlideshow()
   {
      this.view.garageSlideshow._visible = false;
      this.view.slideshow.imageFront.label.textAutoSize = "fit";
      this.view.slideshow.imageFront.label.verticalAlign = "center";
      this.view.slideshow.imageBack.label.textAutoSize = "fit";
      this.view.slideshow.imageBack.label.verticalAlign = "center";
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc2_ = [];
      _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.StylePage.IMAGES[this.website.style][0]);
      _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SummaryPage.WIDE_PERSONNEL_IMAGES[this.website.personnel]);
      var _loc4_ = [];
      var _loc5_ = !this.website.fontsSupported ? "$Font2" : com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONTS[this.website.font];
      var _loc6_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColourString(this.website.style,this.website.colour);
      var _loc3_ = this.website.signage;
      if(_loc3_ == "")
      {
         _loc3_ = this.website.purchasedSignage;
      }
      _loc4_[_loc2_.length] = "<font face=\'" + _loc5_ + "\' color=\'" + _loc6_ + "\'>" + _loc3_ + "</font>";
      _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.IMAGES[this.website.style]);
      if(this.website.gunLocker == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GunLockerPage.IMAGES[this.website.style]);
      }
      if(this.website.vault == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.VaultPage.IMAGES[this.website.style]);
      }
      if(this.website.bed == 1)
      {
         _loc2_.push(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.BedPage.IMAGES[this.website.style][0]);
      }
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SummaryPage.TXD,_loc2_,0,_loc4_);
   }
   function initOfficePurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedOffice();
      if(_loc2_.isOwned && this.website.style == this.website.purchasedStyle && this.website.personnel == this.website.purchasedPersonnel && (this.website.signage == "" || this.website.signage == this.website.purchasedSignage) && this.website.font == this.website.purchasedFont && this.website.colour == this.website.purchasedColour && this.website.gunLocker == this.website.purchasedGunLocker && this.website.vault == this.website.purchasedVault && this.website.bed == this.website.purchasedBed)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initOfficeSummary()
   {
      this.view.garageSummary._visible = false;
      var _loc2_ = "";
      var _loc3_ = undefined;
      if(this.website.signage != "")
      {
         _loc3_ = this.website.signage;
      }
      else
      {
         _loc3_ = this.website.purchasedSignage;
      }
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_STYLE") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_STYLE_" + this.website.style) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_PERSONNEL") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_PERSONNEL_" + this.website.personnel) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_ORGANIZATION_NAME") + ":</font> <font color=\'#333333\'>" + _loc3_ + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_GUN_LOCKER") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.gunLocker ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_VAULT") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.vault ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,"DYN8_EXEC_ACCOMMODATION") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.summary,!this.website.bed ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font>";
      this.view.summary.htmlText = _loc2_;
   }
   function initOfficeTotalCost()
   {
      var _loc3_ = this.website.getSelectedOffice();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getStyleBestCost(this.website.style,this.website.purchasedStyle);
      _loc2_ += _loc3_.getPersonnelBestCost(this.website.personnel,this.website.purchasedPersonnel);
      _loc2_ += _loc3_.getFontBestCost(this.website.font,this.website.purchasedFont);
      _loc2_ += _loc3_.getSignageBestCost(this.website.signage,this.website.purchasedSignage);
      _loc2_ += _loc3_.getGunLockerBestCost(this.website.gunLocker,this.website.purchasedGunLocker);
      _loc2_ += _loc3_.getVaultBestCost(this.website.vault,this.website.purchasedVault);
      _loc2_ += _loc3_.getBedBestCost(this.website.bed,this.website.purchasedBed);
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
      this.progressPanel.show();
      this.progressPanel.initGarageProgress(4);
      this.progressPanel.hidePurchaseButton();
      this.initGaragePurchaseButton();
      this.initGarageSlideshow();
      this.initGarageSummary();
      this.initGarageTotalCost();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initGaragePurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc3_ = true;
      var _loc5_ = this.website.modShopEquipped == 1;
      var _loc4_ = this.website.purchasedModShopEquipped != -1 && this.website.purchasedModShopEquipped != 0;
      if(_loc5_ && !_loc4_)
      {
         _loc3_ = false;
      }
      else if(_loc4_)
      {
         if(!(this.website.modShop == 0 && this.website.purchasedModShop == -1))
         {
            if(this.website.modShop != this.website.purchasedModShop)
            {
               _loc3_ = false;
            }
         }
      }
      var _loc6_ = this.website.getSelectedOffice();
      var _loc2_ = _loc3_;
      if(this.website.garage1Equipped == 1)
      {
         if(this.website.garage1Style != this.website.purchasedGarage1Style || this.website.garage1Lighting != this.website.purchasedGarage1Lighting || this.website.garage1Number != this.website.purchasedGarage1Number)
         {
            _loc2_ = false;
         }
      }
      if(this.website.garage2Equipped == 1)
      {
         if(this.website.garage2Style != this.website.purchasedGarage2Style || this.website.garage2Lighting != this.website.purchasedGarage2Lighting || this.website.garage2Number != this.website.purchasedGarage2Number)
         {
            _loc2_ = false;
         }
      }
      if(this.website.garage3Equipped == 1)
      {
         if(this.website.garage3Style != this.website.purchasedGarage3Style || this.website.garage3Lighting != this.website.purchasedGarage3Lighting || this.website.garage3Number != this.website.purchasedGarage3Number)
         {
            _loc2_ = false;
         }
      }
      if(_loc2_)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initGarageSlideshow()
   {
      this.view.slideshow._visible = false;
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.garageSlideshow);
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
      this.slideshow.show("DYN_GARAGE",_loc2_);
   }
   function initGarageSummary()
   {
      this.view.garageSummary.garage1Style.gotoAndStop(this.website.garage1Style + 1);
      this.view.garageSummary.garage1Lighting.gotoAndStop(this.website.garage1Lighting + 1);
      this.view.garageSummary.garage1Number.gotoAndStop(this.website.garage1Number + 1);
      this.view.garageSummary.summary1.htmlText = "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary1,"DYN8_EXEC_GARAGE_1") + ":</font>";
      if(this.website.garage2Equipped)
      {
         this.view.garageSummary.garage2Style.gotoAndStop(this.website.garage2Style + 1);
         this.view.garageSummary.garage2Lighting.gotoAndStop(this.website.garage2Lighting + 1);
         this.view.garageSummary.garage2Number.gotoAndStop(this.website.garage2Number + 10);
         this.view.garageSummary.summary2.htmlText = "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary2,"DYN8_EXEC_GARAGE_2") + ":</font>";
      }
      else
      {
         this.view.garageSummary.garage2Style._visible = false;
         this.view.garageSummary.garage2Lighting._visible = false;
         this.view.garageSummary.garage2Number._visible = false;
         this.view.garageSummary.summary2.htmlText = "<font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary2,"DYN8_EXEC_GARAGE_2") + ":</font><br><font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary2,"DYN8_EXEC_NOT_PURCHASED") + "</font>";
      }
      if(this.website.garage3Equipped)
      {
         this.view.garageSummary.garage3Style.gotoAndStop(this.website.garage3Style + 1);
         this.view.garageSummary.garage3Lighting.gotoAndStop(this.website.garage3Lighting + 1);
         this.view.garageSummary.garage3Number.gotoAndStop(this.website.garage3Number + 19);
         this.view.garageSummary.summary3.htmlText = "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary3,"DYN8_EXEC_GARAGE_3") + ":</font>";
      }
      else
      {
         this.view.garageSummary.garage3Style._visible = false;
         this.view.garageSummary.garage3Lighting._visible = false;
         this.view.garageSummary.garage3Number._visible = false;
         this.view.garageSummary.summary3.htmlText = "<font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary3,"DYN8_EXEC_GARAGE_3") + ":</font><br><font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary3,"DYN8_EXEC_NOT_PURCHASED") + "</font>";
      }
      if(this.website.modShopEquipped)
      {
         this.view.garageSummary.modShopStyle.gotoAndStop(this.website.modShop + 1);
         this.view.garageSummary.summary4.htmlText = "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary4,"DYN8_EXEC_MOD_SHOP") + ":</font>";
      }
      else
      {
         this.view.garageSummary.modShopStyle._visible = false;
         this.view.garageSummary.summary4.htmlText = "<font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary4,"DYN8_EXEC_MOD_SHOP") + ":</font><br><font color=\'#666666\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.garageSummary.summary4,"DYN8_EXEC_NOT_PURCHASED") + "</font>";
      }
   }
   function initGarageTotalCost()
   {
      var _loc3_ = this.website.getSelectedOffice();
      var _loc2_ = 0;
      _loc3_.logGarageCosts(this.website.garage1Style,this.website.garage1Lighting,this.website.garage1Number,this.website.garage2Style,this.website.garage2Lighting,this.website.garage2Number,this.website.garage3Style,this.website.garage3Lighting,this.website.garage3Number);
      if(this.website.garage1Equipped)
      {
         _loc2_ += _loc3_.getGarage1StyleBestCost(this.website.garage1Style,this.website.purchasedGarage1Style);
         _loc2_ += _loc3_.getGarage1LightingBestCost(this.website.garage1Lighting,this.website.purchasedGarage1Lighting);
         _loc2_ += _loc3_.getGarage1NumberBestCost(this.website.garage1Number,this.website.purchasedGarage1Number);
      }
      if(this.website.garage2Equipped)
      {
         _loc2_ += _loc3_.getGarage2StyleBestCost(this.website.garage2Style,this.website.purchasedGarage2Style);
         _loc2_ += _loc3_.getGarage2LightingBestCost(this.website.garage2Lighting,this.website.purchasedGarage2Lighting);
         _loc2_ += _loc3_.getGarage2NumberBestCost(this.website.garage2Number,this.website.purchasedGarage2Number);
      }
      if(this.website.garage3Equipped)
      {
         _loc2_ += _loc3_.getGarage3StyleBestCost(this.website.garage3Style,this.website.purchasedGarage3Style);
         _loc2_ += _loc3_.getGarage3LightingBestCost(this.website.garage3Lighting,this.website.purchasedGarage3Lighting);
         _loc2_ += _loc3_.getGarage3NumberBestCost(this.website.garage3Number,this.website.purchasedGarage3Number);
      }
      if(this.website.modShopEquipped)
      {
         _loc2_ += _loc3_.getModShopBestCost(this.website.modShop,this.website.purchasedModShop);
      }
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
      var _loc0_ = null;
      if((_loc0_ = type) === "purchaseButton")
      {
         if(this.website.garageSelected)
         {
            this.website.dispatchPlayerGarageSelections();
         }
         else
         {
            this.website.dispatchPlayerSelections();
         }
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
