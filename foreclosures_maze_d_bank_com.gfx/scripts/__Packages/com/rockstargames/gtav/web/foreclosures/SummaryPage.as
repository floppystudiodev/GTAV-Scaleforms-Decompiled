class com.rockstargames.gtav.web.foreclosures.SummaryPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var view;
   function SummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"summaryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      if(this.website.bikeShop == -1)
      {
         this.website.bikeShop = 0;
      }
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      if(!_loc2_.isOwned || this.website.purchasedBikeShop != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BIKE_SHOP_PAGE.name;
      }
      else if(this.website.purchasedGunLocker != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SIGNAGE_PAGE.name;
      }
      this.progressPanel.show();
      this.progressPanel.initProgress(6);
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
      var _loc2_ = [];
      var _loc4_ = [];
      var _loc7_ = [];
      var _loc8_ = [];
      var _loc3_ = [];
      var _loc10_ = [];
      var _loc5_ = this.website.getSelectedClubhouseType();
      _loc2_.push("FORECLOSURES_MURAL");
      _loc4_.push("MURAL_" + _loc5_ + "_" + this.website.mural);
      _loc3_.push(undefined);
      _loc2_.push("FORECLOSURES_STYLE");
      _loc4_.push("STYLE_" + _loc5_ + "_" + this.website.mural + "_" + this.website.wall + "_" + this.website.hanging + "_" + this.website.furniture);
      _loc3_.push(undefined);
      _loc7_[_loc2_.length] = "FORECLOSURES_SIGNAGE";
      _loc8_[_loc2_.length] = "EMBLEM_BG_" + _loc5_ + "_" + this.website.mural;
      var _loc11_ = [this.website.crewEmblem].concat(com.rockstargames.gtav.web.foreclosures.EmblemPage.IMAGES);
      var _loc9_ = _loc11_[this.website.emblem];
      if(this.website.emblem == 0)
      {
         _loc10_[_loc2_.length] = this.view.slideshow.imageFront.tf._height;
         _loc2_.push(_loc9_);
      }
      else
      {
         _loc2_.push("FORECLOSURES_SIGNAGE");
      }
      _loc4_.push(_loc9_);
      _loc3_.push(undefined);
      if(this.website.hideSignage == 0)
      {
         _loc2_.push("FORECLOSURES_SIGNAGE");
         _loc4_.push("SIGNAGE_BG_" + _loc5_ + "_" + this.website.mural);
         var _loc12_ = !this.website.fontsSupported ? "$Font2" : com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS[this.website.font];
         var _loc13_ = "#" + com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.COLOURS[this.website.fontColour];
         var _loc6_ = this.website.signage;
         if(_loc6_ == "")
         {
            _loc6_ = this.website.purchasedSignage;
         }
         _loc3_.push("<font face=\'" + _loc12_ + "\' color=\'" + _loc13_ + "\'>" + _loc6_ + "</font>");
      }
      if(this.website.gunLocker == 1)
      {
         _loc2_.push("FORECLOSURES_GUN_LOCKER");
         _loc4_.push("GUN_LOCKER_" + _loc5_ + "_" + this.website.mural);
         _loc3_.push(undefined);
      }
      if(this.website.bikeShop == 1)
      {
         _loc2_.push("FORECLOSURES_BIKE_SHOP");
         _loc4_.push("BIKE_SHOP_" + _loc5_ + "_" + this.website.mural);
         _loc3_.push(undefined);
      }
      this.slideshow.show(_loc2_,_loc4_,0,_loc3_,_loc8_,_loc7_,_loc10_);
   }
   function initPurchaseButton()
   {
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY");
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      var _loc2_ = this.website.getSelectedClubhouse();
      if(_loc2_.isOwned && this.website.mural == this.website.purchasedMural && this.website.wall == this.website.purchasedWall && this.website.hanging == this.website.purchasedHanging && this.website.furniture == this.website.purchasedFurniture && this.website.emblem == this.website.purchasedEmblem && (this.website.signage == "" || this.website.signage == this.website.purchasedSignage) && this.website.hideSignage == this.website.purchasedHideSignage && this.website.font == this.website.purchasedFont && this.website.fontColour == this.website.purchasedFontColour && this.website.gunLocker == this.website.purchasedGunLocker && this.website.bikeShop == this.website.purchasedBikeShop)
      {
         this.view.purchaseButton.disabled = true;
         this.view.purchaseButton._alpha = 50;
      }
   }
   function initSummary()
   {
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
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_MURAL");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FC_MURAL_" + (this.website.getSelectedClubhouseType() * 9 + this.website.mural)) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_STYLE");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FC_WALL_" + this.website.wall);
      _loc2_ += ", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FC_HANGING_" + this.website.hanging);
      _loc2_ += ", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FC_FURNITURE_" + this.website.furniture) + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_CLUB_EMBLEM");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FC_EMBLEM_" + this.website.emblem) + "</font><br>";
      if(this.website.hideSignage == 1 || this.website.signage == "" && this.website.purchasedSignage == "")
      {
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_CLUB_NAME");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"NONE") + "</font><br>";
      }
      else if(this.website.signage != "")
      {
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_CLUB_NAME");
         _loc2_ += ":</font> <font color=\'#333333\'>" + this.website.signage + "</font><br>";
      }
      else if(this.website.purchasedSignage != "")
      {
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_CLUB_NAME");
         _loc2_ += ":</font> <font color=\'#333333\'>" + this.website.purchasedSignage + "</font><br>";
      }
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_GUN_LOCKER");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,!this.website.gunLocker ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
      _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,"FORECLOSURES_BIKE_SHOP");
      _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.summary,!this.website.bikeShop ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font>";
      this.view.summary.htmlText = _loc2_;
   }
   function initTotalCost()
   {
      var _loc3_ = this.website.getSelectedClubhouse();
      var _loc2_ = !_loc3_.isOwned ? _loc3_.getBaseBestCost() : 0;
      _loc2_ += _loc3_.getMuralBestCost(this.website.mural,this.website.purchasedMural);
      _loc2_ += _loc3_.getWallBestCost(this.website.wall,this.website.purchasedWall);
      _loc2_ += _loc3_.getHangingBestCost(this.website.hanging,this.website.purchasedHanging);
      _loc2_ += _loc3_.getFurnitureBestCost(this.website.furniture,this.website.purchasedFurniture);
      _loc2_ += _loc3_.getFontBestCost(this.website.font,this.website.purchasedFont);
      _loc2_ += _loc3_.getSignageBestCost(this.website.signage,this.website.purchasedSignage);
      _loc2_ += _loc3_.getEmblemBestCost(this.website.emblem,this.website.purchasedEmblem);
      _loc2_ += _loc3_.getGunLockerBestCost(this.website.gunLocker,this.website.purchasedGunLocker);
      _loc2_ += _loc3_.getBikeShopBestCost(this.website.bikeShop,this.website.purchasedBikeShop);
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
      var _loc0_ = null;
      if((_loc0_ = type) === "purchaseButton")
      {
         this.website.dispatchPlayerSelections();
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name);
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
