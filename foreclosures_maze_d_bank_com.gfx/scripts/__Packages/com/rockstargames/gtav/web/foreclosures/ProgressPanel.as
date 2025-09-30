class com.rockstargames.gtav.web.foreclosures.ProgressPanel
{
   var arcade;
   var autoShop;
   var bailOffice;
   var base;
   var bottom;
   var bunker;
   var carWash;
   var clubhouse;
   var currImageId;
   var displayConfig;
   var hangar;
   var helitours;
   var left;
   var nightclub;
   var right;
   var salvageYard;
   var slideshow;
   var top;
   var view;
   var website;
   var weedShop;
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function dispose()
   {
      this.slideshow.dispose();
      this.website = null;
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.displayConfig = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function init()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.displayConfig = this.website.browser.getConfig();
      this.hide();
   }
   function initOverview()
   {
      this.view.gotoAndStop("overview");
      this.view.nextButton.onColour = 16777215;
      this.view.nextButton.offColour = 16777215;
      this.view.nextButton.disabled = true;
      this.website.dataTextScope.push(this.view.nextButton.btnTxt);
      this.hide();
   }
   function showOverview(clubhouse, showImmediately)
   {
      this.clubhouse = clubhouse;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,clubhouse.name,this.view.clubhouseName._width - 5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.clubhouseAddress,clubhouse.address,true);
      var _loc8_ = !clubhouse.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!clubhouse.isOwned)
      {
         _loc5_ = clubhouse.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      this.view.starterPack._visible = clubhouse.isInStarterPack;
      var _loc7_ = 0;
      var _loc2_;
      if(clubhouse.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_MURAL");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_MURAL_" + (this.website.getSelectedClubhouseType() * 9 + this.website.purchasedMural)) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_STYLE");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_WALL_" + this.website.purchasedWall);
         _loc2_ += ", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_HANGING_" + this.website.purchasedHanging);
         _loc2_ += ", " + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_FURNITURE_" + this.website.purchasedFurniture) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_CLUB_EMBLEM");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FC_EMBLEM_" + this.website.purchasedEmblem) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_CLUB_NAME");
         if(this.website.purchasedHideSignage == 1 || this.website.purchasedSignage == "")
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"NONE") + "</font><br>";
         }
         else
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + this.website.purchasedSignage + "</font><br>";
         }
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_GUN_LOCKER");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.purchasedGunLocker ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_BIKE_SHOP");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.purchasedBikeShop ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font>";
         this.view.description.htmlText = _loc2_;
         _loc7_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,clubhouse.description,true);
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(clubhouse.getBaseCost() != clubhouse.getBaseBestCost() && !clubhouse.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = clubhouse.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showClubhouseImage();
      this.view.marker.gotoAndStop(!clubhouse.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function initProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("progress");
      this.clubhouse = this.website.getSelectedClubhouse();
      this.showClubhouseImage();
      this.showPurchaseButton();
      this.view.starterPack._visible = this.clubhouse.isInStarterPack;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.clubhouse.isOwned)
      {
         _loc2_ = this.clubhouse.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.clubhouse.name,this.view.clubhouseName._width - 5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.clubhouseAddress,this.clubhouse.address,true);
      this.website.dataTextScope.push(this.view.MURAL.btnTxt);
      this.website.dataTextScope.push(this.view.STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.CLUB_D_EMBLEM.btnTxt);
      this.website.dataTextScope.push(this.view.CLUB_D_NAME.btnTxt);
      this.website.dataTextScope.push(this.view.GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.BIKE_D_SHOP.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.MURAL.btnTxt,"FORECLOSURES_MURAL",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.STYLE.btnTxt,"FORECLOSURES_STYLE",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.CLUB_D_EMBLEM.btnTxt,"FORECLOSURES_CLUB_EMBLEM",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.CLUB_D_NAME.btnTxt,"FORECLOSURES_CLUB_NAME",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.GUN_D_LOCKER.btnTxt,"FORECLOSURES_GUN_LOCKER",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.BIKE_D_SHOP.btnTxt,"FORECLOSURES_BIKE_SHOP",false);
      this.setProgressDots(numCompleteSteps);
      if(this.clubhouse.isOwned && this.website.purchasedGunLocker == 1)
      {
         this.view.GUN_D_LOCKER.disabled = true;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.GUN_D_LOCKER.disabled = false;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.clubhouse.isOwned && this.website.purchasedBikeShop == 1)
      {
         this.view.BIKE_D_SHOP.disabled = true;
         this.view.BIKE_D_SHOP.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.BIKE_D_SHOP.disabled = false;
         this.view.BIKE_D_SHOP.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateCosts();
      this.view.bg._yscale = 100;
   }
   function showClubhouseImage()
   {
      if(this.currImageId != this.clubhouse.txd)
      {
         this.currImageId = this.clubhouse.txd;
         this.slideshow.show([this.clubhouse.txd,this.clubhouse.txd],[this.clubhouse.txd + "_EXT",this.clubhouse.txd + "_INT"]);
      }
   }
   function setProgressDots(numCompleteSteps)
   {
      var _loc2_ = 0;
      while(_loc2_ < 7)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(_loc2_ >= numCompleteSteps ? "incomplete" : "complete");
         this.view["stepDot" + _loc2_].tick._visible = false;
         this.view["stepDot" + _loc2_].exclamation._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showBunkerOverview(bunker, showImmediately)
   {
      this.view.gotoAndStop("bunkerOverview");
      this.clubhouse = null;
      this.bunker = bunker;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,bunker.name,this.view.clubhouseName._width - 5);
      var _loc9_ = !bunker.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc9_,false);
      var _loc6_;
      if(!bunker.isOwned)
      {
         _loc6_ = bunker.getBaseBestCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
      }
      this.view.starterPack._visible = bunker.isInStarterPack;
      var _loc8_ = 0;
      var _loc3_;
      var _loc5_;
      if(bunker.isOwned)
      {
         _loc3_ = "";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_BUNKER_STYLE");
         _loc5_ = "FORECLOSURES_BUNKER_STYLE_" + (this.website.purchasedBunkerStyle + 1);
         _loc3_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_QUARTERS");
         _loc3_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.purchasedQuarters ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_FIRING_RANGE");
         _loc5_ = "FORECLOSURES_NO";
         switch(this.website.purchasedFiringRange)
         {
            case 1:
               _loc5_ = "FORECLOSURES_SHOOTING_1";
               break;
            case 2:
               _loc5_ = "FORECLOSURES_SHOOTING_1";
         }
         _loc3_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_GUN_LOCKER");
         _loc3_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,!this.website.purchasedBunkerGunLocker ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_TRANSPORTATION");
         _loc5_ = "FORECLOSURES_NO";
         switch(this.website.purchasedTransportation)
         {
            case 1:
               _loc5_ = "FORECLOSURES_TRANSPORTATION_1";
               break;
            case 2:
               _loc5_ = "FORECLOSURES_TRANSPORTATION_2";
         }
         _loc3_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc5_) + "</font><br>";
         this.view.description.htmlText = _loc3_;
         _loc8_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,bunker.description,true);
      }
      var _loc7_ = this.view.description.getTextFormat();
      _loc7_.leading = _loc8_;
      this.view.description.setTextFormat(_loc7_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(bunker.getBaseCost() != bunker.getBaseBestCost() && !bunker.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc6_ = bunker.getBaseCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showBunkerImage();
      this.view.marker.gotoAndStop(!bunker.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showBunkerImage()
   {
      if(this.currImageId != this.bunker.txd)
      {
         this.currImageId = this.bunker.txd;
         this.slideshow.show([this.bunker.txd,this.bunker.txd],[this.bunker.txd + "_EXT",this.bunker.txd + "_INT"]);
      }
   }
   function initBunkerProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("bunkerProgress");
      this.bunker = this.website.getSelectedBunker();
      this.showBunkerImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.bunker.isOwned)
      {
         _loc2_ = this.bunker.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.bunker.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.bunker.isInStarterPack;
      this.website.dataTextScope.push(this.view.BUNKER_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.PERSONAL_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.SHOOTING_D_RANGE.btnTxt);
      this.website.dataTextScope.push(this.view.BUNKER_D_GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.TRANSPORTATION.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BUNKER_D_STYLE.btnTxt,"FORECLOSURES_BUNKER_STYLE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.PERSONAL_D_QUARTERS.btnTxt,"FORECLOSURES_QUARTERS");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SHOOTING_D_RANGE.btnTxt,"FORECLOSURES_FIRING_RANGE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BUNKER_D_GUN_D_LOCKER.btnTxt,"FORECLOSURES_GUN_LOCKER");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.TRANSPORTATION.btnTxt,"FORECLOSURES_TRANSPORTATION");
      this.setProgressDots(numCompleteSteps);
      this.disableRenovatingOption(this.bunker.isOwned,this.website.purchasedQuarters,this.view.PERSONAL_D_QUARTERS,this.view.stepDot1);
      this.disableRenovatingOption(this.bunker.isOwned,this.website.purchasedBunkerGunLocker,this.view.BUNKER_D_GUN_D_LOCKER,this.view.stepDot3);
      this.updateBunkerCosts();
      this.view.bg._yscale = 100;
   }
   function disableRenovatingOption(bunkerIsOwned, optionPurchased, stepView, stepDot)
   {
      if(bunkerIsOwned && optionPurchased == 1)
      {
         stepView.disabled = true;
         stepView.btnTxt._alpha = 30;
         stepDot.tick._visible = true;
      }
      else
      {
         stepView.disabled = false;
         stepView.btnTxt._alpha = 100;
         stepDot.tick._visible = false;
      }
   }
   function showLightingExclamation()
   {
      this.view.stepDot1.exclamation._visible = true;
   }
   function hideLightingExclamation()
   {
      this.view.stepDot1.exclamation._visible = false;
   }
   function showHangarOverview(hangar, showImmediately)
   {
      this.view.gotoAndStop("hangarOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = hangar;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,hangar.name,this.view.clubhouseName._width - 5);
      var _loc9_ = !hangar.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc9_,false);
      var _loc6_;
      if(!hangar.isOwned)
      {
         _loc6_ = hangar.getBaseBestCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
      }
      this.view.starterPack._visible = hangar.isInStarterPack;
      var _loc8_ = 0;
      var _loc2_;
      var _loc10_;
      var _loc5_;
      if(hangar.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_STY");
         _loc10_ = "FCHNGR_STY_" + (this.website.purchasedHangarStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_LGT");
         _loc5_ = this.website.purchasedHangarLighting + 1;
         if(_loc5_ > 2)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc10_ = "FCHNGR_LGT_" + _loc5_;
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_FLR");
         _loc10_ = "FCHNGR_FLR_" + (this.website.purchasedHangarDecal + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_FRN");
         _loc10_ = "FCHNGR_FRN_" + (this.website.purchasedHangarFurniture + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_QRT");
         _loc10_ = this.website.hangarQuarters != 0 ? "FCHNGR_FRN_" + (this.website.purchasedHangarQuarters + 1) : "FORECLOSURES_NO";
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHNGR_WKS");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedHangarWorkshop != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         this.view.description.htmlText = _loc2_;
         _loc8_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = hangar.description;
      }
      var _loc7_ = this.view.description.getTextFormat();
      _loc7_.leading = _loc8_;
      this.view.description.setTextFormat(_loc7_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(hangar.getBaseCost() != hangar.getBaseBestCost() && !hangar.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc6_ = hangar.getBaseCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showHangarImage();
      this.view.marker.gotoAndStop(!hangar.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showHangarImage()
   {
      if(this.currImageId != this.hangar.txd)
      {
         this.currImageId = this.hangar.txd;
         this.slideshow.show([this.hangar.txd,this.hangar.txd],[this.hangar.txd + "_EXT",this.hangar.txd + "_INT"]);
      }
   }
   function initHangarProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("hangarProgress");
      this.hangar = this.website.getSelectedHangar();
      this.showHangarImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.hangar.isOwned)
      {
         _loc2_ = this.hangar.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.hangar.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.hangar.isInStarterPack;
      this.website.dataTextScope.push(this.view.HANGAR_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_LIGHTING.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_FLOORING.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_FURNITURE.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.HANGAR_D_WORKSHOP.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_STYLE.btnTxt,"FCHNGR_STY");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_LIGHTING.btnTxt,"FCHNGR_LGT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_FLOORING.btnTxt,"FCHNGR_FLR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_FURNITURE.btnTxt,"FCHNGR_FRN");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_QUARTERS.btnTxt,"FCHNGR_QRT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HANGAR_D_WORKSHOP.btnTxt,"FCHNGR_WKS");
      this.setProgressDots(numCompleteSteps);
      this.disableRenovatingOption(this.hangar.isOwned,this.website.purchasedHangarWorkshop,this.view.HANGAR_D_WORKSHOP,this.view.stepDot5);
      this.updateHangarCosts();
      this.view.bg._yscale = 100;
   }
   function showBaseOverview(base, showImmediately)
   {
      this.view.gotoAndStop("baseOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = base;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,base.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = base.isInStarterPack;
      var _loc8_ = !base.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!base.isOwned)
      {
         _loc5_ = base.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc2_;
      var _loc9_;
      if(base.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_STY");
         _loc9_ = "FCBASE_STY" + (this.website.purchasedBaseStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_GRA");
         _loc9_ = "FCBASE_GRA" + (this.website.purchasedBaseGraphics + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_WEA");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBaseWeapon != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_SEC");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBaseSecurity != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_LNG");
         _loc9_ = "FCBASE_LNG" + (this.website.purchasedBaseLounge + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_WIND").toUpperCase();
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBaseWindow != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_QRT");
         if(this.website.purchasedBaseQuarters == 0)
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_NO") + "</font><br>";
         }
         else
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBASE_QRT" + this.website.purchasedBaseQuarters) + "</font><br>";
         }
         this.view.description.htmlText = _loc2_;
         _loc7_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = base.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(base.getBaseCost() != base.getBaseBestCost() && !base.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = base.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showBaseImage();
      this.view.marker.gotoAndStop(!base.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showBaseImage()
   {
      if(this.currImageId != this.base.txd)
      {
         this.currImageId = this.base.txd;
         this.slideshow.show([this.base.txd,this.base.txd],[this.base.txd + "_EXT",this.base.txd + "_INT"]);
      }
   }
   function initBaseProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("baseProgress");
      this.base = this.website.getSelectedBase();
      this.showBaseImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.base.isOwned)
      {
         _loc2_ = this.base.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.base.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.base.isInStarterPack;
      this.website.dataTextScope.push(this.view.BASE_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.BASE_D_GRAPHICS.btnTxt);
      this.website.dataTextScope.push(this.view.BASE_D_WEAPON.btnTxt);
      this.website.dataTextScope.push(this.view.BASE_D_SECURITY.btnTxt);
      this.website.dataTextScope.push(this.view.BASE_D_LOUNGE.btnTxt);
      this.website.dataTextScope.push(this.view.BASE_D_QUARTERS.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_STYLE.btnTxt,"FCBASE_STY");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_GRAPHICS.btnTxt,"FCBASE_GRA");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_WEAPON.btnTxt,"FCBASE_WEA");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_SECURITY.btnTxt,"FCBASE_SEC");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_LOUNGE.btnTxt,"FCBASE_LNG");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BASE_D_QUARTERS.btnTxt,"FCBASE_QRT");
      this.setProgressDots(numCompleteSteps);
      this.disableRenovatingOption(this.base.isOwned,this.website.purchasedBaseWeapon,this.view.BASE_D_WEAPON,this.view.stepDot2);
      this.disableRenovatingOption(this.base.isOwned,this.website.purchasedBaseSecurity,this.view.BASE_D_SECURITY,this.view.stepDot3);
      this.updateBaseCosts();
      this.view.bg._yscale = 100;
   }
   function showNightclubOverview(nightclub, showImmediately)
   {
      this.view.gotoAndStop("nightclubOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = nightclub;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,nightclub.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = nightclub.isInStarterPack;
      var _loc9_ = !nightclub.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc9_,false);
      var _loc6_;
      if(!nightclub.isOwned)
      {
         _loc6_ = nightclub.getBaseBestCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
      }
      var _loc8_ = 0;
      var _loc2_;
      var _loc10_;
      var _loc5_;
      if(nightclub.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_STY");
         _loc10_ = "FCCLUB_STY_" + (this.website.purchasedNightclubStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_LGHT");
         _loc10_ = "FCCLUB_LGHT_" + (this.website.purchasedNightclubLighting + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_NAME");
         _loc10_ = "FCCLUB_NAME_" + (this.website.purchasedNightclubName + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_STOR");
         _loc10_ = "FCCLUB_STOR_" + this.website.purchasedNightclubStorage;
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_GARG");
         _loc5_ = this.website.purchasedNightclubGarage;
         if(_loc5_ == 3 && this.website.purchasedNightclubG4 == 1)
         {
            _loc5_ = 4;
         }
         _loc10_ = "FCCLUB_GARG_" + _loc5_;
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_DNC");
         _loc10_ = this.website.purchasedNightclubDancers <= 0 ? "FCCLUB_DNC_NONE" : "FCCLUB_DNC_" + this.website.purchasedNightclubDancers;
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc10_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCLUB_ICE");
         if(this.website.purchasedNightclubDryIce == 0)
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_NO") + "</font><br>";
         }
         else
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_YES") + "</font><br>";
         }
         this.view.description.htmlText = _loc2_;
         _loc8_ = 10;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = nightclub.description;
      }
      var _loc7_ = this.view.description.getTextFormat();
      _loc7_.leading = _loc8_;
      this.view.description.setTextFormat(_loc7_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(nightclub.getBaseCost() != nightclub.getBaseBestCost() && !nightclub.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc6_ = nightclub.getBaseCost();
         if(_loc6_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showNightclubImage();
      this.view.marker.gotoAndStop(!nightclub.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showNightclubImage()
   {
      if(this.currImageId != this.nightclub.txd)
      {
         this.currImageId = this.nightclub.txd;
         this.slideshow.show([this.nightclub.txd,this.nightclub.txd],[this.nightclub.txd + "_EXT",this.nightclub.txd + "_INT"]);
      }
   }
   function initNightclubProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("nightclubProgress");
      this.nightclub = this.website.getSelectedNightclub();
      this.showNightclubImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.nightclub.isOwned)
      {
         _loc2_ = this.nightclub.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.nightclub.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.nightclub.isInStarterPack;
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_LIGHTING.btnTxt);
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_NAME.btnTxt);
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_STORAGE.btnTxt);
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_DANCERS.btnTxt);
      this.website.dataTextScope.push(this.view.NIGHTCLUB_D_DRYICE.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_STYLE.btnTxt,"FCCLUB_STY");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_LIGHTING.btnTxt,"FCCLUB_LGHT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_NAME.btnTxt,"FCCLUB_NAME");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_STORAGE.btnTxt,"FCCLUB_STOR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_DANCERS.btnTxt,"FCCLUB_DNC");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.NIGHTCLUB_D_DRYICE.btnTxt,"FCCLUB_ICE");
      this.setProgressDots(numCompleteSteps);
      if(this.nightclub.isOwned && this.website.purchasedNightclubDryIce == 1)
      {
         this.view.NIGHTCLUB_D_DRYICE.disabled = true;
         this.view.NIGHTCLUB_D_DRYICE.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.NIGHTCLUB_D_DRYICE.disabled = false;
         this.view.NIGHTCLUB_D_DRYICE.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateNightclubCosts();
      this.view.bg._yscale = 100;
   }
   function showArcadeOverview(arcade, showImmediately)
   {
      this.view.gotoAndStop("arcadeOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = arcade;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,arcade.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = arcade.isInStarterPack;
      var _loc8_ = !arcade.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!arcade.isOwned)
      {
         _loc5_ = arcade.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc2_;
      var _loc9_;
      if(arcade.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_STYLE");
         _loc9_ = "FCARCADE_STYLE_" + (this.website.purchasedArcadeStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_MURAL");
         _loc9_ = "FCARCADE_MURAL_" + (this.website.purchasedArcadeMural + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_FLR");
         _loc9_ = "FCARCADE_FLR_" + (this.website.purchasedArcadeFloor + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_NE");
         _loc9_ = "FCARCADE_NE_" + (this.website.purchasedArcadeNeon + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_HS");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedArcadeHighScores != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_QRT");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedArcadeQuarters != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCARCADE_GRG");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedArcadeGarage != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc2_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = arcade.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(arcade.getBaseCost() != arcade.getBaseBestCost() && !arcade.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = arcade.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showArcadeImage();
      this.view.marker.gotoAndStop(!arcade.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showArcadeImage()
   {
      if(this.currImageId != this.arcade.txd)
      {
         this.currImageId = this.arcade.txd;
         this.slideshow.show([this.arcade.txd],[this.arcade.txd + "_EXT"]);
      }
   }
   function initArcadeProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("arcadeProgress");
      this.arcade = this.website.getSelectedArcade();
      this.showArcadeImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.arcade.isOwned)
      {
         _loc2_ = this.arcade.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.arcade.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.arcade.isInStarterPack;
      this.website.dataTextScope.push(this.view.ARCADE_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.ARCADE_D_MURAL.btnTxt);
      this.website.dataTextScope.push(this.view.ARCADE_D_FLOOR.btnTxt);
      this.website.dataTextScope.push(this.view.ARCADE_D_NEON_D_ART.btnTxt);
      this.website.dataTextScope.push(this.view.ARCADE_D_EXTRAS.btnTxt);
      this.website.dataTextScope.push(this.view.ARCADE_D_GARAGE.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_STYLE.btnTxt,"FCARCADE_STYLE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_MURAL.btnTxt,"FCARCADE_MURAL");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_FLOOR.btnTxt,"FCARCADE_FLR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_NEON_D_ART.btnTxt,"FCARCADE_NE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_EXTRAS.btnTxt,"FCARCADE_XTR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.ARCADE_D_GARAGE.btnTxt,"FCARCADE_GRG");
      this.setProgressDots(numCompleteSteps);
      if(this.arcade.isOwned && this.website.purchasedArcadeQuarters == 1 && this.website.purchasedArcadeHighScores == 1)
      {
         this.view.ARCADE_D_EXTRAS.disabled = true;
         this.view.ARCADE_D_EXTRAS.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.ARCADE_D_EXTRAS.disabled = false;
         this.view.ARCADE_D_EXTRAS.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.website.purchasedArcadeGarage == 1)
      {
         this.view.ARCADE_D_GARAGE.disabled = true;
         this.view.ARCADE_D_GARAGE.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.ARCADE_D_GARAGE.disabled = false;
         this.view.ARCADE_D_GARAGE.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateArcadeCosts();
      this.view.bg._yscale = 100;
   }
   function setArcadeMuralExclamationVisible(isVisible)
   {
      this.view.stepDot1.exclamation._visible = isVisible;
   }
   function setArcadeFloorExclamationVisible(isVisible)
   {
      this.view.stepDot2.exclamation._visible = isVisible;
   }
   function showAutoShopOverview(autoShop, showImmediately)
   {
      this.view.gotoAndStop("autoShopOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = autoShop;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,autoShop.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = autoShop.isInStarterPack;
      var _loc8_ = !autoShop.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!autoShop.isOwned)
      {
         _loc5_ = autoShop.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc2_;
      var _loc9_;
      if(autoShop.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_STYLE");
         _loc9_ = "FCAUTOSHOP_STYLE_" + (this.website.purchasedAutoShopStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_TINT");
         _loc9_ = "FCAUTOSHOP_TINT_" + (this.website.purchasedAutoShopTint + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_EMBLEM");
         _loc9_ = "FCAUTOSHOP_EMBLEM_" + (this.website.purchasedAutoShopEmblem + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_NAME");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopName != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_STAFF1");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopStaff1 != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_STAFF2");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopStaff2 != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_CARLIFT");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopCarLift != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_QRT");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopQuarters != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCAUTOSHOP_MBR");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedAutoShopMembership != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc2_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = autoShop.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(autoShop.getBaseCost() != autoShop.getBaseBestCost() && !autoShop.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = autoShop.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showAutoShopImage();
      this.view.marker.gotoAndStop(!autoShop.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showAutoShopImage()
   {
      if(this.currImageId != this.autoShop.txd)
      {
         this.currImageId = this.autoShop.txd;
         this.slideshow.show([this.autoShop.txd],[this.autoShop.txd + "_EXT"]);
      }
   }
   function initAutoShopProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("autoShopProgress");
      this.autoShop = this.website.getSelectedAutoShop();
      this.showAutoShopImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.autoShop.isOwned)
      {
         _loc2_ = this.autoShop.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.autoShop.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.autoShop.isInStarterPack;
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_TINT.btnTxt);
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_EMBLEM.btnTxt);
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_STAFF.btnTxt);
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_EXTRAS.btnTxt);
      this.website.dataTextScope.push(this.view.AUTO_D_SHOP_D_MEMBERSHIP.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_STYLE.btnTxt,"FCAUTOSHOP_STYLE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_TINT.btnTxt,"FCAUTOSHOP_TINT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_EMBLEM.btnTxt,"FCAUTOSHOP_EMBLEM");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_STAFF.btnTxt,"FCAUTOSHOP_STAFF");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_EXTRAS.btnTxt,"FCAUTOSHOP_EXTRAS");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.AUTO_D_SHOP_D_MEMBERSHIP.btnTxt,"FCAUTOSHOP_MBR");
      this.setProgressDots(numCompleteSteps);
      if(this.autoShop.isOwned && this.website.purchasedAutoShopStaff1 == 1 && this.website.purchasedAutoShopStaff2 == 1)
      {
         this.view.AUTO_D_SHOP_D_STAFF.disabled = true;
         this.view.AUTO_D_SHOP_D_STAFF.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.AUTO_D_SHOP_D_STAFF.disabled = false;
         this.view.AUTO_D_SHOP_D_STAFF.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.autoShop.isOwned && this.website.purchasedAutoShopCarLift == 1 && this.website.purchasedAutoShopQuarters == 1)
      {
         this.view.AUTO_D_SHOP_D_EXTRAS.disabled = true;
         this.view.AUTO_D_SHOP_D_EXTRAS.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.AUTO_D_SHOP_D_EXTRAS.disabled = false;
         this.view.AUTO_D_SHOP_D_EXTRAS.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.website.purchasedAutoShopMembership == 1)
      {
         this.view.AUTO_D_SHOP_D_MEMBERSHIP.disabled = true;
         this.view.AUTO_D_SHOP_D_MEMBERSHIP.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.AUTO_D_SHOP_D_MEMBERSHIP.disabled = false;
         this.view.AUTO_D_SHOP_D_MEMBERSHIP.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateAutoShopCosts();
      this.view.bg._yscale = 100;
   }
   function showSalvageYardOverview(salvageYard, showImmediately)
   {
      this.view.gotoAndStop("salvageYardOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = salvageYard;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,salvageYard.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = salvageYard.isInStarterPack;
      var _loc8_ = !salvageYard.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!salvageYard.isOwned)
      {
         _loc5_ = salvageYard.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc2_;
      var _loc9_;
      if(salvageYard.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_TINT");
         _loc9_ = "FCSALVAGE_TINT_" + (this.website.purchasedSalvageYardTint + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_REPAIR");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedSalvageYardRepairBay != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_TOW");
         if(this.website.purchasedSalvageYardTowTruck == 2)
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_TOWB") + "</font><br>";
         }
         else if(this.website.purchasedSalvageYardTowTruck == 1)
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_TOW") + "</font><br>";
         }
         else
         {
            _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FORECLOSURES_NO") + "</font><br>";
         }
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_SAFE");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedSalvageYardWallSafe != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCSALVAGE_STAFF");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedSalvageYardStaff != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc2_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = salvageYard.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(salvageYard.getBaseCost() != salvageYard.getBaseBestCost() && !salvageYard.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = salvageYard.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showSalvageYardImage();
      this.view.marker.gotoAndStop(!salvageYard.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showSalvageYardImage()
   {
      if(this.currImageId != this.salvageYard.txd)
      {
         this.currImageId = this.salvageYard.txd;
         this.slideshow.show([this.salvageYard.txd],[this.salvageYard.txd + "_EXT"]);
      }
   }
   function initSalvageYardProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("salvageYardProgress");
      this.salvageYard = this.website.getSelectedSalvageYard();
      this.showSalvageYardImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.salvageYard.isOwned)
      {
         _loc2_ = this.salvageYard.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.salvageYard.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.salvageYard.isInStarterPack;
      this.website.dataTextScope.push(this.view.SALVAGE_D_YARD_D_TINT.btnTxt);
      this.website.dataTextScope.push(this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.btnTxt);
      this.website.dataTextScope.push(this.view.SALVAGE_D_YARD_D_TOW_D_TRUCK.btnTxt);
      this.website.dataTextScope.push(this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.btnTxt);
      this.website.dataTextScope.push(this.view.SALVAGE_D_YARD_D_STAFF.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SALVAGE_D_YARD_D_TINT.btnTxt,"FCSALVAGE_TINT");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.btnTxt,"FCSALVAGE_REPAIR");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SALVAGE_D_YARD_D_TOW_D_TRUCK.btnTxt,"FCSALVAGE_TOW");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.btnTxt,"FCSALVAGE_SAFE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.SALVAGE_D_YARD_D_STAFF.btnTxt,"FCSALVAGE_STAFF");
      this.setProgressDots(numCompleteSteps);
      if(this.salvageYard.isOwned && this.website.purchasedSalvageYardRepairBay == 1)
      {
         this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.disabled = true;
         this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.btnTxt._alpha = 30;
         this.view.stepDot1.tick._visible = true;
      }
      else
      {
         this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.disabled = false;
         this.view.SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES.btnTxt._alpha = 100;
         this.view.stepDot1.tick._visible = false;
      }
      if(this.website.purchasedSalvageYardWallSafe == 1)
      {
         this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.disabled = true;
         this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.disabled = false;
         this.view.SALVAGE_D_YARD_D_WALL_D_SAFE.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.salvageYard.isOwned && this.website.purchasedSalvageYardStaff == 1)
      {
         this.view.SALVAGE_D_YARD_D_STAFF.disabled = true;
         this.view.SALVAGE_D_YARD_D_STAFF.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.SALVAGE_D_YARD_D_STAFF.disabled = false;
         this.view.SALVAGE_D_YARD_D_STAFF.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      this.updateSalvageYardCosts();
      this.view.bg._yscale = 100;
   }
   function showBailOfficeOverview(bailOffice, showImmediately)
   {
      this.view.gotoAndStop("bailOfficeOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = bailOffice;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,bailOffice.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = bailOffice.isInStarterPack;
      var _loc8_ = !bailOffice.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!bailOffice.isOwned)
      {
         _loc5_ = bailOffice.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc2_;
      var _loc9_;
      if(bailOffice.isOwned)
      {
         _loc2_ = "";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_STYLE");
         _loc9_ = "FCBAIL_STYLE_" + (this.website.purchasedBailOfficeStyle + 1);
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_STAFF_1");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBailOfficeStaff1 != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_STAFF_2");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBailOfficeStaff2 != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_QUARTERS");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBailOfficeQuarters != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_GUNLOCKER");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBailOfficeGunLocker != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         _loc2_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCBAIL_TRANSP");
         _loc2_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,this.website.purchasedBailOfficeTransporter != 1 ? "FORECLOSURES_NO" : "FORECLOSURES_YES") + "</font><br>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc2_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = bailOffice.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(bailOffice.getBaseCost() != bailOffice.getBaseBestCost() && !bailOffice.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = bailOffice.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
         this.view.nextButton._y = _loc4_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showBailOfficeImage();
      this.view.marker.gotoAndStop(!bailOffice.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showBailOfficeImage()
   {
      if(this.currImageId != this.bailOffice.txd)
      {
         this.currImageId = this.bailOffice.txd;
         this.slideshow.show([this.bailOffice.txd],[this.bailOffice.txd + "_EXT"]);
      }
   }
   function initBailOfficeProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("bailOfficeProgress");
      this.bailOffice = this.website.getSelectedBailOffice();
      this.showBailOfficeImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.bailOffice.isOwned)
      {
         _loc2_ = this.bailOffice.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.bailOffice.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.bailOffice.isInStarterPack;
      this.website.dataTextScope.push(this.view.BAIL_D_OFFICE_D_STYLE.btnTxt);
      this.website.dataTextScope.push(this.view.BAIL_D_OFFICE_D_STAFF.btnTxt);
      this.website.dataTextScope.push(this.view.BAIL_D_OFFICE_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.BAIL_D_OFFICE_D_TRANSPORTER.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BAIL_D_OFFICE_D_STYLE.btnTxt,"FCBAIL_STYLE");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BAIL_D_OFFICE_D_STAFF.btnTxt,"FCBAIL_STAFF");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BAIL_D_OFFICE_D_QUARTERS.btnTxt,"FCBAIL_QUARTERS");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.btnTxt,"FCBAIL_GUNLOCKER");
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.BAIL_D_OFFICE_D_TRANSPORTER.btnTxt,"FCBAIL_TRANSP");
      this.setProgressDots(numCompleteSteps);
      if(this.bailOffice.isOwned && this.website.purchasedBailOfficeStaff1 == 1 && this.website.purchasedBailOfficeStaff2 == 1)
      {
         this.view.BAIL_D_OFFICE_D_STAFF.disabled = true;
         this.view.BAIL_D_OFFICE_D_STAFF.btnTxt._alpha = 30;
         this.view.stepDot1.tick._visible = true;
      }
      else
      {
         this.view.BAIL_D_OFFICE_D_STAFF.disabled = false;
         this.view.BAIL_D_OFFICE_D_STAFF.btnTxt._alpha = 100;
         this.view.stepDot1.tick._visible = false;
      }
      if(this.bailOffice.isOwned && this.website.purchasedBailOfficeQuarters == 1)
      {
         this.view.BAIL_D_OFFICE_D_QUARTERS.disabled = true;
         this.view.BAIL_D_OFFICE_D_QUARTERS.btnTxt._alpha = 30;
         this.view.stepDot2.tick._visible = true;
      }
      else
      {
         this.view.BAIL_D_OFFICE_D_QUARTERS.disabled = false;
         this.view.BAIL_D_OFFICE_D_QUARTERS.btnTxt._alpha = 100;
         this.view.stepDot2.tick._visible = false;
      }
      if(this.bailOffice.isOwned && this.website.purchasedBailOfficeGunLocker == 1)
      {
         this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.disabled = true;
         this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.disabled = false;
         this.view.BAIL_D_OFFICE_D_GUN_D_LOCKER.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.bailOffice.isOwned && this.website.purchasedBailOfficeTransporter == 1)
      {
         this.view.BAIL_D_OFFICE_D_TRANSPORTER.disabled = true;
         this.view.BAIL_D_OFFICE_D_TRANSPORTER.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.BAIL_D_OFFICE_D_TRANSPORTER.disabled = false;
         this.view.BAIL_D_OFFICE_D_TRANSPORTER.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      this.updateBailOfficeCosts();
      this.view.bg._yscale = 100;
   }
   function showBasicPropertyOverview(property, showImmediately)
   {
      this.view.gotoAndStop("basicPropertyOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.truncate(this.view.clubhouseName,property.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = property.isInStarterPack;
      var _loc4_;
      if(property.isOwned)
      {
         this.hideNextButton();
      }
      else
      {
         _loc4_ = property.getBaseBestCost();
         if(_loc4_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FORECLOSURES_BUY_FROM",false);
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc4_),true);
         }
         this.showNextButton();
      }
      var _loc6_ = 0;
      this.view.description.autoSize = "left";
      this.view.description.htmlText = property.description;
      var _loc5_ = this.view.description.getTextFormat();
      _loc5_.leading = _loc6_;
      this.view.description.setTextFormat(_loc5_);
      var _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
      if(property.getBaseCost() != property.getBaseBestCost() && !property.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc4_ = property.getBaseCost();
         if(_loc4_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc4_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc3_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc3_ + 12;
         _loc3_ += 25;
         this.view.nextButton._y = _loc3_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc3_ += 15;
      }
      if(property.isOwned)
      {
         this.view.bg._height = _loc3_;
      }
      else
      {
         this.view.nextButton._y = _loc3_;
         this.view.nextButton.disabled = false;
         this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      }
      this.bottom = this.top + this.view.bg._height;
      if(this.currImageId != property.txd)
      {
         this.currImageId = property.txd;
         this.slideshow.show([property.txd],[property.txd + "_EXT"]);
      }
      this.view.marker.gotoAndStop(!property.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showCarWashOverview(carWash, showImmediately)
   {
      this.view.gotoAndStop("carWashOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = carWash;
      this.helitours = null;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,carWash.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = carWash.isInStarterPack;
      var _loc8_ = !carWash.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!carWash.isOwned)
      {
         _loc5_ = carWash.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc4_;
      var _loc9_;
      if(carWash.isOwned)
      {
         _loc4_ = "";
         _loc4_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCCARWASH_TINT");
         _loc9_ = "FCCARWASH_TINT_" + (this.website.purchasedCarWashTint + 1);
         _loc4_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc4_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = carWash.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
      if(carWash.getBaseCost() != carWash.getBaseBestCost() && !carWash.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = carWash.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc3_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc3_ + 12;
         _loc3_ += 25;
         this.view.nextButton._y = _loc3_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc3_ += 15;
      }
      this.view.nextButton._y = _loc3_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showCarWashImage();
      this.view.marker.gotoAndStop(!carWash.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showCarWashImage()
   {
      if(this.currImageId != this.carWash.txd)
      {
         this.currImageId = this.carWash.txd;
         this.slideshow.show([this.carWash.txd],[this.carWash.txd + "_EXT"]);
      }
   }
   function initCarWashProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("carWashProgress");
      this.carWash = this.website.getSelectedCarWash();
      this.showCarWashImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.carWash.isOwned)
      {
         _loc2_ = this.carWash.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.carWash.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.carWash.isInStarterPack;
      this.website.dataTextScope.push(this.view.CAR_D_WASH_D_TINT.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.CAR_D_WASH_D_TINT.btnTxt,"FCCARWASH_TINT");
      this.setProgressDots(numCompleteSteps);
      this.updateCarWashCosts();
      this.view.bg._yscale = 100;
   }
   function showHelitoursOverview(helitours, showImmediately)
   {
      this.view.gotoAndStop("helitoursOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = helitours;
      this.weedShop = null;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,helitours.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = helitours.isInStarterPack;
      var _loc8_ = !helitours.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!helitours.isOwned)
      {
         _loc5_ = helitours.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc4_;
      var _loc9_;
      if(helitours.isOwned)
      {
         _loc4_ = "";
         _loc4_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCHELITOURS_TINT");
         _loc9_ = "FCCARWASH_TINT_" + (this.website.purchasedHelitoursTint + 1);
         _loc4_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc4_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = helitours.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
      if(helitours.getBaseCost() != helitours.getBaseBestCost() && !helitours.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = helitours.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc3_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc3_ + 12;
         _loc3_ += 25;
         this.view.nextButton._y = _loc3_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc3_ += 15;
      }
      this.view.nextButton._y = _loc3_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showHelitoursImage();
      this.view.marker.gotoAndStop(!helitours.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showHelitoursImage()
   {
      if(this.currImageId != this.helitours.txd)
      {
         this.currImageId = this.helitours.txd;
         this.slideshow.show([this.helitours.txd],[this.helitours.txd + "_EXT"]);
      }
   }
   function initHelitoursProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("helitoursProgress");
      this.helitours = this.website.getSelectedHelitours();
      this.showHelitoursImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.helitours.isOwned)
      {
         _loc2_ = this.helitours.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.helitours.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.helitours.isInStarterPack;
      this.website.dataTextScope.push(this.view.HELITOURS_D_TINT.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.HELITOURS_D_TINT.btnTxt,"FCHELITOURS_TINT");
      this.setProgressDots(numCompleteSteps);
      this.updateHelitoursCosts();
      this.view.bg._yscale = 100;
   }
   function showWeedShopOverview(weedShop, showImmediately)
   {
      this.view.gotoAndStop("carWashOverview");
      this.clubhouse = null;
      this.bunker = null;
      this.hangar = null;
      this.base = null;
      this.nightclub = null;
      this.arcade = null;
      this.autoShop = null;
      this.salvageYard = null;
      this.bailOffice = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = weedShop;
      this.showNextButton();
      this.truncate(this.view.clubhouseName,weedShop.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = weedShop.isInStarterPack;
      var _loc8_ = !weedShop.isOwned ? "FORECLOSURES_BUY_FROM" : "FORECLOSURES_RENOVATE";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!weedShop.isOwned)
      {
         _loc5_ = weedShop.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc4_;
      var _loc9_;
      if(weedShop.isOwned)
      {
         _loc4_ = "";
         _loc4_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,"FCWEEDSHOP_TINT");
         _loc9_ = "FCWEEDSHOP_TINT_" + (this.website.purchasedWeedShopTint + 1);
         _loc4_ += ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.description,_loc9_) + "</font><br>";
         this.view.description.autoSize = "left";
         this.view.description.htmlText = _loc4_;
         _loc7_ = 5;
      }
      else
      {
         this.view.description.autoSize = "left";
         this.view.description.htmlText = weedShop.description;
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
      if(weedShop.getBaseCost() != weedShop.getBaseBestCost() && !weedShop.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         _loc5_ = weedShop.getBaseCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
         }
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc3_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc3_ + 12;
         _loc3_ += 25;
         this.view.nextButton._y = _loc3_;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc3_ += 15;
      }
      this.view.nextButton._y = _loc3_;
      this.view.nextButton.disabled = false;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showWeedShopImage();
      this.view.marker.gotoAndStop(!weedShop.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showWeedShopImage()
   {
      if(this.currImageId != this.weedShop.txd)
      {
         this.currImageId = this.weedShop.txd;
         this.slideshow.show([this.weedShop.txd],[this.weedShop.txd + "_EXT"]);
      }
   }
   function initWeedShopProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("weedShopProgress");
      this.weedShop = this.website.getSelectedWeedShop();
      this.showWeedShopImage();
      this.showPurchaseButton();
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FORECLOSURES_BUY",false);
      var _loc2_;
      if(!this.weedShop.isOwned)
      {
         _loc2_ = this.weedShop.getBaseBestCost();
         if(_loc2_ == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"FCFREE",false);
         }
         else
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
         }
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.clubhouseName,this.weedShop.name,this.view.clubhouseName._width - 5);
      this.view.starterPack._visible = this.weedShop.isInStarterPack;
      this.website.dataTextScope.push(this.view.WEED_D_SHOP_D_TINT.btnTxt);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.WEED_D_SHOP_D_TINT.btnTxt,"FCCARWASH_TINT");
      this.setProgressDots(numCompleteSteps);
      this.updateWeedShopCosts();
      this.view.bg._yscale = 100;
   }
   function hide()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._visible = false;
      this.view.nextButton.disabled = true;
   }
   function show()
   {
      this.view._visible = true;
      this.view.nextButton.disabled = false;
   }
   function hidePurchaseButton()
   {
      this.view.purchaseButton._visible = false;
      this.view.purchaseButton.disabled = true;
   }
   function showPurchaseButton()
   {
      this.view.purchaseButton._visible = true;
      this.view.purchaseButton.disabled = false;
   }
   function hideNextButton()
   {
      this.view.nextButton._visible = false;
      this.view.nextButton.disabled = true;
   }
   function showNextButton()
   {
      this.view.nextButton._visible = true;
      this.view.nextButton.disabled = false;
   }
   function get isHidden()
   {
      return !this.view._visible;
   }
   function stopSlideshow()
   {
      this.slideshow.stopOn(1);
   }
   function restartSlideshow()
   {
      this.slideshow.restart();
   }
   function truncate(tf, text, availableWidth)
   {
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(tf,text,true);
      var _loc4_ = tf.getTextFormat();
      tf.letterSpacing = 1;
      var _loc1_;
      if(tf.textWidth > availableWidth)
      {
         _loc1_ = text.length;
         while(_loc1_ > 0)
         {
            tf.text = text.substring(0,_loc1_) + "...";
            tf.setTextFormat(_loc4_);
            if(tf.textWidth <= availableWidth)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCostStep(step, actualPrice, normalPrice, salePrice, prefix, saleSumCost)
   {
      if(salePrice >= 0)
      {
         this.view["cost" + step].text = "";
         if(saleSumCost != undefined)
         {
            if(normalPrice == 0)
            {
               this.view["saleCost" + step].text = "";
            }
            else if(saleSumCost == 0)
            {
               com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view["saleCost" + step],"FCFREE",false);
            }
            else
            {
               this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(saleSumCost);
            }
         }
         else if(normalPrice == 0)
         {
            this.view["saleCost" + step].text = "";
         }
         else if(salePrice == 0)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view["saleCost" + step],"FCFREE",false);
         }
         else
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(salePrice);
         }
         this.view["originalCost" + step].autoSize = "left";
         if(normalPrice == 0)
         {
            this.view["originalCost" + step].text = "";
            this.view["strikethrough" + step]._visible = false;
         }
         else
         {
            this.view["originalCost" + step].text = prefix + " $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(normalPrice);
            this.view["strikethrough" + step]._width = this.view["originalCost" + step]._width;
            this.view["strikethrough" + step]._visible = true;
         }
      }
      else
      {
         this.view["cost" + step].text = normalPrice <= 0 ? "" : prefix + " $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(normalPrice);
         this.view["saleCost" + step].text = "";
         this.view["originalCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
      }
      var _loc3_;
      if(this.displayConfig.isAsian)
      {
         _loc3_ = this.view["saleCost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["saleCost" + step].setNewTextFormat(_loc3_);
         _loc3_ = this.view["cost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["cost" + step].setNewTextFormat(_loc3_);
      }
      return actualPrice;
   }
   function updateCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc5_ = !this.clubhouse.isOwned ? this.clubhouse.getBaseBestCost() : 0;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      var _loc6_;
      _loc2_ = this.clubhouse.getMuralBestCost(this.website.mural,this.website.purchasedMural);
      _loc4_ = this.clubhouse.getMuralCost(this.website.mural,this.website.purchasedMural);
      _loc3_ = this.clubhouse.getMuralRawSaleCost(this.website.mural,this.website.purchasedMural);
      _loc5_ += this.updateCostStep(0,_loc2_,_loc4_,_loc3_,"+");
      var _loc20_ = this.clubhouse.getWallBestCost(this.website.wall,this.website.purchasedWall);
      var _loc12_ = this.clubhouse.getWallCost(this.website.wall,this.website.purchasedWall);
      var _loc16_ = this.clubhouse.getWallRawSaleCost(this.website.wall,this.website.purchasedWall);
      var _loc22_ = this.clubhouse.getHangingBestCost(this.website.hanging,this.website.purchasedHanging);
      var _loc13_ = this.clubhouse.getHangingCost(this.website.hanging,this.website.purchasedHanging);
      var _loc7_ = this.clubhouse.getHangingRawSaleCost(this.website.hanging,this.website.purchasedHanging);
      var _loc24_ = this.clubhouse.getFurnitureBestCost(this.website.furniture,this.website.purchasedFurniture);
      var _loc15_ = this.clubhouse.getFurnitureCost(this.website.furniture,this.website.purchasedFurniture);
      var _loc14_ = this.clubhouse.getFurnitureRawSaleCost(this.website.furniture,this.website.purchasedFurniture);
      _loc2_ = _loc20_ + _loc22_ + _loc24_;
      _loc4_ = _loc12_ + _loc13_ + _loc15_;
      var _loc19_ = !(this.website.wall != this.website.purchasedWall || !this.clubhouse.isOwned) ? -1 : _loc16_;
      var _loc26_ = !(this.website.hanging != this.website.purchasedHanging || !this.clubhouse.isOwned) ? -1 : _loc7_;
      var _loc18_ = !(this.website.furniture != this.website.purchasedFurniture || !this.clubhouse.isOwned) ? -1 : _loc14_;
      _loc3_ = this.getSaleCost(_loc19_,_loc26_,_loc18_,-1);
      _loc6_ = 0;
      if(this.website.wall != this.website.purchasedWall || !this.clubhouse.isOwned)
      {
         _loc6_ = this.clubhouse.getWallRawSaleCost(this.website.wall) != -1 ? _loc16_ : _loc12_;
      }
      if(this.website.hanging != this.website.purchasedHanging || !this.clubhouse.isOwned)
      {
         _loc6_ += this.clubhouse.getHangingRawSaleCost(this.website.hanging) != -1 ? _loc7_ : _loc13_;
      }
      if(this.website.furniture != this.website.purchasedFurniture || !this.clubhouse.isOwned)
      {
         _loc6_ += this.clubhouse.getFurnitureRawSaleCost(this.website.furniture) != -1 ? _loc14_ : _loc15_;
      }
      _loc5_ += this.updateCostStep(1,_loc2_,_loc4_,_loc3_,"+",_loc6_);
      _loc2_ = this.clubhouse.getEmblemBestCost(this.website.emblem,this.website.purchasedEmblem);
      _loc4_ = this.clubhouse.getEmblemCost(this.website.emblem,this.website.purchasedEmblem);
      _loc3_ = this.clubhouse.getEmblemRawSaleCost(this.website.emblem,this.website.purchasedEmblem);
      _loc5_ += this.updateCostStep(2,_loc2_,_loc4_,_loc3_,"+");
      var _loc25_ = this.clubhouse.getFontBestCost(this.website.font,this.website.purchasedFont);
      var _loc17_ = this.clubhouse.getFontCost(this.website.font,this.website.purchasedFont);
      var _loc8_ = this.clubhouse.getFontRawSaleCost(this.website.font,this.website.purchasedFont);
      var _loc21_ = this.clubhouse.getSignageBestCost(this.website.signage,this.website.purchasedSignage);
      var _loc11_ = this.clubhouse.getSignageCost(this.website.signage,this.website.purchasedSignage);
      var _loc9_ = this.clubhouse.getSignageSaleCost(this.website.signage,this.website.purchasedSignage);
      _loc2_ = _loc25_ + _loc21_;
      _loc4_ = _loc17_ + _loc11_;
      _loc3_ = _loc8_ + _loc9_;
      _loc6_ = this.clubhouse.getFontRawSaleCost(this.website.font) != -1 ? _loc8_ : _loc17_;
      _loc6_ += this.clubhouse.getSignageRawSaleCost() != -1 ? _loc9_ : _loc11_;
      _loc5_ += this.updateCostStep(3,_loc2_,_loc4_,_loc3_,"+",_loc6_);
      _loc2_ = this.clubhouse.getGunLockerBestCost(this.website.gunLocker,this.website.purchasedGunLocker);
      _loc4_ = this.clubhouse.getGunLockerCost(this.website.gunLocker,this.website.purchasedGunLocker);
      _loc3_ = this.clubhouse.getGunLockerRawSaleCost(this.website.gunLocker,this.website.purchasedGunLocker);
      _loc5_ += this.updateCostStep(4,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.clubhouse.getBikeShopBestCost(this.website.bikeShop,this.website.purchasedBikeShop);
      _loc4_ = this.clubhouse.getBikeShopCost(this.website.bikeShop,this.website.purchasedBikeShop);
      _loc3_ = this.clubhouse.getBikeShopRawSaleCost(this.website.bikeShop,this.website.purchasedBikeShop);
      _loc5_ += this.updateCostStep(5,_loc2_,_loc4_,_loc3_,"+");
      var _loc23_ = !this.clubhouse.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc10_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc23_);
      if(_loc5_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc10_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc5_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc10_,true);
      }
   }
   function updateBunkerCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.bunker.isOwned ? this.bunker.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc9_;
      var _loc6_;
      if(this.website.bunkerStyle != -1)
      {
         _loc3_ = this.bunker.getStyleBestCost(this.website.bunkerStyle,this.website.purchasedBunkerStyle);
         _loc5_ = this.bunker.getStyleCost(this.website.bunkerStyle,this.website.purchasedBunkerStyle);
         _loc4_ = this.bunker.getStyleRawSaleCost(this.website.bunkerStyle,this.website.purchasedBunkerStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      _loc6_ = !this.bunker.isOwned && this.website.quarters == 1 || this.bunker.isOwned && this.website.quarters != this.website.purchasedQuarters;
      if(_loc6_)
      {
         _loc3_ = this.bunker.getQuartersBestCost();
         _loc5_ = this.bunker.getQuartersCost();
         _loc4_ = this.bunker.getQuartersRawSaleCost();
         _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.firingRange != -1)
      {
         _loc3_ = this.bunker.getFiringRangeBestCost(this.website.firingRange,this.website.purchasedFiringRange);
         _loc5_ = this.bunker.getFiringRangeCost(this.website.firingRange,this.website.purchasedFiringRange);
         _loc4_ = this.bunker.getFiringRangeRawSaleCost(this.website.firingRange,this.website.purchasedFiringRange);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      _loc6_ = !this.bunker.isOwned && this.website.bunkerGunLocker == 1 || this.bunker.isOwned && this.website.bunkerGunLocker != this.website.purchasedBunkerGunLocker;
      if(_loc6_)
      {
         _loc3_ = this.bunker.getGunLockerBestCost();
         _loc5_ = this.bunker.getGunLockerCost();
         _loc4_ = this.bunker.getGunLockerRawSaleCost();
         _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.transportation != -1)
      {
         _loc3_ = this.bunker.getTransportationBestCost(this.website.transportation,this.website.purchasedTransportation);
         _loc5_ = this.bunker.getTransportationCost(this.website.transportation,this.website.purchasedTransportation);
         _loc4_ = this.bunker.getTransportationRawSaleCost(this.website.transportation,this.website.purchasedTransportation);
         _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      var _loc8_ = !this.bunker.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc7_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc8_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_,true);
      }
   }
   function updateHangarCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.hangar.isOwned ? this.hangar.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc9_;
      var _loc8_;
      if(this.website.hangarStyle != -1)
      {
         _loc3_ = this.hangar.getStyleBestCost(this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc5_ = this.hangar.getStyleCost(this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc4_ = this.hangar.getStyleRawSaleCost(this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.hangarLighting != -1)
      {
         _loc3_ = this.hangar.getLightingBestCost(this.website.hangarLighting,this.website.purchasedHangarLighting,this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc5_ = this.hangar.getLightingCost(this.website.hangarLighting,this.website.purchasedHangarLighting,this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc4_ = this.hangar.getLightingRawSaleCost(this.website.hangarLighting,this.website.purchasedHangarLighting,this.website.hangarStyle,this.website.purchasedHangarStyle);
         _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.hangarDecal != -1)
      {
         _loc3_ = this.hangar.getDecalBestCost(this.website.hangarDecal,this.website.purchasedHangarDecal);
         _loc5_ = this.hangar.getDecalCost(this.website.hangarDecal,this.website.purchasedHangarDecal);
         _loc4_ = this.hangar.getDecalRawSaleCost(this.website.hangarDecal,this.website.purchasedHangarDecal);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.hangarFurniture != -1)
      {
         _loc3_ = this.hangar.getFurnitureBestCost(this.website.hangarFurniture,this.website.purchasedHangarFurniture);
         _loc5_ = this.hangar.getFurnitureCost(this.website.hangarFurniture,this.website.purchasedHangarFurniture);
         _loc4_ = this.hangar.getFurnitureRawSaleCost(this.website.hangarFurniture,this.website.purchasedHangarFurniture);
         _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.hangarQuarters != -1)
      {
         _loc3_ = this.hangar.getQuartersBestCost(this.website.hangarQuarters,this.website.purchasedHangarQuarters);
         _loc5_ = this.hangar.getQuartersCost(this.website.hangarQuarters,this.website.purchasedHangarQuarters);
         _loc4_ = this.hangar.getQuartersRawSaleCost(this.website.hangarQuarters,this.website.purchasedHangarQuarters);
         _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      _loc8_ = !this.hangar.isOwned && this.website.hangarWorkshop == 1 || this.hangar.isOwned && this.website.hangarWorkshop != this.website.purchasedHangarWorkshop;
      if(_loc8_)
      {
         _loc3_ = this.hangar.getWorkshopBestCost(this.website.hangarWorkshop,this.website.purchasedHangarWorkshop);
         _loc5_ = this.hangar.getWorkshopCost(this.website.hangarWorkshop,this.website.purchasedHangarWorkshop);
         _loc4_ = this.hangar.getWorkshopRawSaleCost(this.website.hangarWorkshop,this.website.purchasedHangarWorkshop);
         _loc2_ += this.updateCostStep(5,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(5,0,0,0,"+");
      }
      var _loc7_ = !this.hangar.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc6_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_,true);
      }
   }
   function updateBaseCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.base.isOwned ? this.base.getBaseBestCost() : 0;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      var _loc9_;
      var _loc6_;
      if(this.website.baseStyle != -1)
      {
         _loc3_ = this.base.getStyleBestCost(this.website.baseStyle,this.website.purchasedBaseStyle);
         _loc4_ = this.base.getStyleCost(this.website.baseStyle,this.website.purchasedBaseStyle);
         _loc5_ = this.base.getStyleRawSaleCost(this.website.baseStyle,this.website.purchasedBaseStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.baseGraphics != -1)
      {
         _loc3_ = this.base.getGraphicsBestCost(this.website.baseGraphics,this.website.purchasedBaseGraphics);
         _loc4_ = this.base.getGraphicsCost(this.website.baseGraphics,this.website.purchasedBaseGraphics);
         _loc5_ = this.base.getGraphicsRawSaleCost(this.website.baseGraphics,this.website.purchasedBaseGraphics);
         _loc2_ += this.updateCostStep(1,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      _loc6_ = !this.base.isOwned && this.website.baseWeapon == 1 || this.base.isOwned && this.website.baseWeapon != this.website.purchasedBaseWeapon;
      if(_loc6_)
      {
         _loc3_ = this.base.getWeaponBestCost(this.website.baseWeapon,this.website.purchasedBaseWeapon);
         _loc4_ = this.base.getWeaponCost(this.website.baseWeapon,this.website.purchasedBaseWeapon);
         _loc5_ = this.base.getWeaponRawSaleCost(this.website.baseWeapon,this.website.purchasedBaseWeapon);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      _loc6_ = !this.base.isOwned && this.website.baseSecurity == 1 || this.base.isOwned && this.website.baseSecurity != this.website.purchasedBaseSecurity;
      if(_loc6_)
      {
         _loc3_ = this.base.getSecurityBestCost(this.website.baseSecurity,this.website.purchasedBaseSecurity);
         _loc4_ = this.base.getSecurityCost(this.website.baseSecurity,this.website.purchasedBaseSecurity);
         _loc5_ = this.base.getSecurityRawSaleCost(this.website.baseSecurity,this.website.purchasedBaseSecurity);
         _loc2_ += this.updateCostStep(3,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.baseLounge != -1)
      {
         _loc3_ = this.base.getLoungeBestCost(this.website.baseLounge,this.website.purchasedBaseLounge);
         _loc4_ = this.base.getLoungeCost(this.website.baseLounge,this.website.purchasedBaseLounge);
         _loc3_ += this.base.getWindowBestCost(this.website.baseWindow,this.website.purchasedBaseWindow);
         _loc4_ += this.base.getWindowCost(this.website.baseWindow,this.website.purchasedBaseWindow);
         _loc5_ = this.getSaleCost(this.base.getLoungeRawSaleCost(this.website.baseLounge,this.website.purchasedBaseLounge),this.base.getWindowRawSaleCost(this.website.baseWindow,this.website.purchasedBaseWindow),-1,-1);
         _loc2_ += this.updateCostStep(4,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      _loc6_ = !this.base.isOwned && this.website.baseQuarters > 0 || this.website.baseQuarters != this.website.purchasedBaseQuarters || this.website.baseWindow != this.website.purchasedBaseWindow;
      if(_loc6_)
      {
         _loc3_ = this.base.getQuartersBestCost(this.website.baseQuarters,this.website.purchasedBaseQuarters);
         _loc4_ = this.base.getQuartersCost(this.website.baseQuarters,this.website.purchasedBaseQuarters);
         _loc5_ = this.base.getQuartersRawSaleCost(this.website.baseQuarters,this.website.purchasedBaseQuarters);
         _loc2_ += this.updateCostStep(5,_loc3_,_loc4_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(5,0,0,0,"+");
      }
      var _loc8_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc7_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc8_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc7_,true);
      }
   }
   function updateNightclubCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc4_ = !this.nightclub.isOwned ? this.nightclub.getBaseBestCost() : 0;
      var _loc6_;
      var _loc8_;
      var _loc7_;
      var _loc16_;
      var _loc19_;
      if(this.website.nightclubStyle != -1)
      {
         _loc6_ = this.nightclub.getStyleBestCost(this.website.nightclubStyle,this.website.purchasedNightclubStyle);
         _loc8_ = this.nightclub.getStyleCost(this.website.nightclubStyle,this.website.purchasedNightclubStyle);
         _loc7_ = this.nightclub.getStyleRawSaleCost(this.website.nightclubStyle,this.website.purchasedNightclubStyle);
         _loc4_ += this.updateCostStep(0,_loc6_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc4_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.nightclubLighting != -1)
      {
         _loc6_ = this.nightclub.getLightingBestCost(this.website.nightclubLighting,this.website.purchasedNightclubLighting);
         _loc8_ = this.nightclub.getLightingCost(this.website.nightclubLighting,this.website.purchasedNightclubLighting);
         _loc7_ = this.nightclub.getLightingRawSaleCost(this.website.nightclubLighting,this.website.purchasedNightclubLighting);
         _loc4_ += this.updateCostStep(1,_loc6_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc4_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.nightclubName != -1)
      {
         _loc6_ = this.nightclub.getNameBestCost(this.website.nightclubName,this.website.purchasedNightclubName);
         _loc8_ = this.nightclub.getNameCost(this.website.nightclubName,this.website.purchasedNightclubName);
         _loc7_ = this.nightclub.getNameRawSaleCost(this.website.nightclubName,this.website.purchasedNightclubName);
         _loc4_ += this.updateCostStep(2,_loc6_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc4_ += this.updateCostStep(2,0,0,0,"+");
      }
      var _loc15_;
      var _loc12_;
      var _loc10_;
      var _loc9_;
      var _loc5_;
      var _loc2_;
      var _loc14_;
      var _loc13_;
      var _loc11_;
      var _loc3_;
      if(this.website.nightclubStorage != -1 || this.website.nightclubGarage != -1)
      {
         _loc15_ = 0;
         _loc12_ = 0;
         _loc10_ = 0;
         _loc9_ = 0;
         _loc5_ = false;
         _loc2_ = this.website.purchasedNightclubStorage + 1;
         while(_loc2_ <= this.website.nightclubStorage)
         {
            _loc9_ = this.nightclub.getStorageRawSaleCost(_loc2_,this.website.purchasedNightclubStorage);
            _loc15_ += this.nightclub.getStorageBestCost(_loc2_,this.website.purchasedNightclubStorage);
            _loc12_ += this.nightclub.getStorageCost(_loc2_,this.website.purchasedNightclubStorage);
            if(_loc9_ > -1 && _loc2_ != 0)
            {
               _loc10_ += this.nightclub.getStorageRawSaleCost(_loc2_,this.website.purchasedNightclubStorage);
               _loc5_ = true;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc14_ = 0;
         _loc13_ = 0;
         _loc11_ = 0;
         _loc3_ = 0;
         _loc2_ = this.website.purchasedNightclubGarage + 1;
         while(_loc2_ <= this.website.nightclubGarage)
         {
            _loc3_ = this.nightclub.getGarageRawSaleCost(_loc2_,this.website.purchasedNightclubGarage);
            _loc14_ += this.nightclub.getGarageBestCost(_loc2_,this.website.purchasedNightclubGarage);
            _loc13_ += this.nightclub.getGarageCost(_loc2_,this.website.purchasedNightclubGarage);
            if(_loc3_ != -1 && _loc2_ != 0)
            {
               _loc11_ += _loc3_;
               _loc5_ = true;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc5_)
         {
            _loc10_ = -1;
            _loc11_ = -1;
         }
         _loc6_ = _loc15_ + _loc14_;
         _loc8_ = _loc12_ + _loc13_;
         _loc7_ = _loc10_ + _loc11_;
         _loc16_ = this.nightclub.getStorageRawSaleCost(this.website.nightclubStorage) != -1 ? _loc10_ : _loc12_;
         _loc16_ += this.nightclub.getGarageRawSaleCost(this.website.nightclubGarage) != -1 ? _loc11_ : _loc13_;
         _loc4_ += this.updateCostStep(3,_loc6_,_loc8_,_loc7_,"+",_loc16_);
         if(_loc16_ > -1 && this.website.nightclubStorage > 0 && _loc5_)
         {
            if(_loc7_ == 0 && _loc6_ == 0)
            {
               com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.saleCost3,"FCFREE",false);
            }
            else
            {
               this.view.saleCost3.text = "+ $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc6_);
            }
            this.view.cost3.text = "";
            this.view.originalCost3.text = "+ $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc8_);
            this.view.strikethrough3._width = this.view.originalCost3._width;
            this.view.strikethrough3._visible = true;
         }
      }
      else
      {
         _loc4_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.nightclubDancers != -1)
      {
         _loc6_ = this.nightclub.getDancersBestCost(this.website.nightclubDancers,this.website.purchasedNightclubDancers);
         _loc8_ = this.nightclub.getDancersCost(this.website.nightclubDancers,this.website.purchasedNightclubDancers);
         _loc7_ = this.nightclub.getDancersRawSaleCost(this.website.nightclubDancers,this.website.purchasedNightclubDancers);
         _loc4_ += this.updateCostStep(4,_loc6_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc4_ += this.updateCostStep(4,0,0,0,"+");
      }
      if(this.website.nightclubDryIce != -1)
      {
         _loc6_ = this.nightclub.getDryIceBestCost(this.website.nightclubDryIce,this.website.purchasedNightclubDryIce);
         _loc8_ = this.nightclub.getDryIceCost(this.website.nightclubDryIce,this.website.purchasedNightclubDryIce);
         _loc7_ = this.nightclub.getDryIceRawSaleCost(this.website.nightclubDryIce,this.website.purchasedNightclubDryIce);
         _loc4_ += this.updateCostStep(5,_loc6_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc4_ += this.updateCostStep(5,0,0,0,"+");
      }
      var _loc18_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc17_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc18_);
      if(_loc4_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc17_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc4_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc17_,true);
      }
   }
   function updateArcadeCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.arcade.isOwned ? this.arcade.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc7_;
      var _loc15_;
      if(this.website.arcadeStyle != -1)
      {
         _loc3_ = this.arcade.getStyleBestCost(this.website.arcadeStyle,this.website.purchasedArcadeStyle);
         _loc5_ = this.arcade.getStyleCost(this.website.arcadeStyle,this.website.purchasedArcadeStyle);
         _loc4_ = this.arcade.getStyleRawSaleCost(this.website.arcadeStyle,this.website.purchasedArcadeStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.arcadeMural != -1)
      {
         _loc3_ = this.arcade.getMuralBestCost(this.website.arcadeMural,this.website.purchasedArcadeMural);
         _loc5_ = this.arcade.getMuralCost(this.website.arcadeMural,this.website.purchasedArcadeMural);
         _loc4_ = this.arcade.getMuralRawSaleCost(this.website.arcadeMural,this.website.purchasedArcadeMural);
         _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.arcadeFloor != -1)
      {
         _loc3_ = this.arcade.getFloorBestCost(this.website.arcadeFloor,this.website.purchasedArcadeFloor);
         _loc5_ = this.arcade.getFloorCost(this.website.arcadeFloor,this.website.purchasedArcadeFloor);
         _loc4_ = this.arcade.getFloorRawSaleCost(this.website.arcadeFloor,this.website.purchasedArcadeFloor);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.arcadeNeon != -1)
      {
         _loc3_ = this.arcade.getNeonBestCost(this.website.arcadeNeon,this.website.purchasedArcadeNeon);
         _loc5_ = this.arcade.getNeonCost(this.website.arcadeNeon,this.website.purchasedArcadeNeon);
         _loc4_ = this.arcade.getNeonRawSaleCost(this.website.arcadeNeon,this.website.purchasedArcadeNeon);
         _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      var _loc12_;
      var _loc6_;
      var _loc11_;
      var _loc14_;
      var _loc8_;
      var _loc10_;
      if(this.website.arcadeQuarters != -1 || this.website.arcadeHighScores != -1 && this.website.purchasedArcadeHighScores != 1)
      {
         _loc12_ = this.arcade.getQuartersBestCost(this.website.arcadeQuarters,this.website.purchasedArcadeQuarters);
         _loc6_ = this.arcade.getQuartersCost(this.website.arcadeQuarters,this.website.purchasedArcadeQuarters);
         _loc11_ = this.arcade.getQuartersRawSaleCost(this.website.arcadeQuarters,this.website.purchasedArcadeQuarters);
         _loc14_ = this.arcade.getHighScoresBestCost(this.website.arcadeHighScores,this.website.purchasedArcadeHighScores);
         _loc8_ = this.arcade.getHighScoresCost(this.website.arcadeHighScores,this.website.purchasedArcadeHighScores);
         _loc10_ = this.arcade.getHighScoresRawSaleCost(this.website.arcadeHighScores,this.website.purchasedArcadeHighScores);
         _loc3_ = _loc12_ + _loc14_;
         _loc5_ = _loc6_ + _loc8_;
         _loc4_ = this.getSaleCost(_loc11_,_loc10_,-1,-1);
         _loc7_ = this.arcade.getQuartersRawSaleCost(this.website.arcadeQuarters) != -1 ? _loc11_ : _loc6_;
         _loc7_ += this.arcade.getHighScoresRawSaleCost(this.website.arcadeHighScores) != -1 ? _loc10_ : _loc8_;
         _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+",_loc7_);
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      if(this.website.arcadeGarage != -1 && this.website.purchasedArcadeGarage != 1)
      {
         _loc3_ = this.arcade.getGarageBestCost(this.website.arcadeGarage,this.website.purchasedArcadeGarage);
         _loc5_ = this.arcade.getGarageCost(this.website.arcadeGarage,this.website.purchasedArcadeGarage);
         _loc4_ = this.arcade.getGarageRawSaleCost(this.website.arcadeGarage,this.website.purchasedArcadeGarage);
         _loc2_ += this.updateCostStep(5,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(5,0,0,0,"+");
      }
      var _loc13_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc9_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc13_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc9_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc9_,true);
      }
   }
   function updateAutoShopCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.autoShop.isOwned ? this.autoShop.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      var _loc35_;
      if(this.website.autoShopStyle != -1)
      {
         _loc3_ = this.autoShop.getStyleBestCost(this.website.autoShopStyle,this.website.purchasedAutoShopStyle);
         _loc5_ = this.autoShop.getStyleCost(this.website.autoShopStyle,this.website.purchasedAutoShopStyle);
         _loc4_ = this.autoShop.getStyleRawSaleCost(this.website.autoShopStyle,this.website.purchasedAutoShopStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.autoShopTint != -1)
      {
         _loc3_ = this.autoShop.getTintBestCost(this.website.autoShopTint,this.website.purchasedAutoShopTint);
         _loc5_ = this.autoShop.getTintCost(this.website.autoShopTint,this.website.purchasedAutoShopTint);
         _loc4_ = this.autoShop.getTintRawSaleCost(this.website.autoShopTint,this.website.purchasedAutoShopTint);
         _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      var _loc23_;
      var _loc18_;
      var _loc10_;
      var _loc29_;
      var _loc14_;
      var _loc16_;
      var _loc31_;
      var _loc27_;
      if(this.website.autoShopEmblem != -1)
      {
         _loc23_ = this.autoShop.getEmblemBestCost(this.website.autoShopEmblem,this.website.purchasedAutoShopEmblem);
         _loc18_ = this.autoShop.getEmblemCost(this.website.autoShopEmblem,this.website.purchasedAutoShopEmblem);
         _loc10_ = this.autoShop.getEmblemRawSaleCost(this.website.autoShopEmblem,this.website.purchasedAutoShopEmblem);
         _loc29_ = this.autoShop.getNameBestCost(this.website.autoShopName,this.website.purchasedAutoShopName);
         _loc14_ = this.autoShop.getNameCost(this.website.autoShopName,this.website.purchasedAutoShopName);
         _loc16_ = this.autoShop.getNameRawSaleCost(this.website.autoShopName,this.website.purchasedAutoShopName);
         _loc31_ = this.website.autoShopName == 1 && this.website.purchasedAutoShopName != 1;
         _loc27_ = this.website.autoShopEmblem != this.website.purchasedAutoShopEmblem;
         if(_loc31_ && _loc27_)
         {
            _loc3_ = _loc23_ + _loc29_;
            _loc5_ = _loc18_ + _loc14_;
            _loc4_ = this.getSaleCost(_loc10_,_loc16_,-1,-1);
            _loc6_ = this.autoShop.getEmblemRawSaleCost(this.website.autoShopEmblem) != -1 ? _loc10_ : _loc18_;
            _loc6_ += this.autoShop.getNameRawSaleCost(this.website.autoShopName) != -1 ? _loc16_ : _loc14_;
            _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+",_loc6_);
         }
         else if(_loc31_)
         {
            _loc2_ += this.updateCostStep(2,_loc29_,_loc14_,_loc16_,"+");
         }
         else if(_loc27_)
         {
            _loc2_ += this.updateCostStep(2,_loc23_,_loc18_,_loc10_,"+");
         }
         else
         {
            _loc2_ += this.updateCostStep(2,0,0,0,"+");
         }
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      var _loc28_;
      var _loc11_;
      var _loc17_;
      var _loc24_;
      var _loc13_;
      var _loc15_;
      var _loc32_;
      var _loc33_;
      if(this.website.autoShopStaff1 != -1 || this.website.autoShopStaff2 != -1)
      {
         _loc28_ = this.autoShop.getStaff1BestCost(this.website.autoShopStaff1,this.website.purchasedAutoShopStaff1);
         _loc11_ = this.autoShop.getStaff1Cost(this.website.autoShopStaff1,this.website.purchasedAutoShopStaff1);
         _loc17_ = this.autoShop.getStaff1RawSaleCost(this.website.autoShopStaff1,this.website.purchasedAutoShopStaff1);
         _loc24_ = this.autoShop.getStaff2BestCost(this.website.autoShopStaff2,this.website.purchasedAutoShopStaff2);
         _loc13_ = this.autoShop.getStaff2Cost(this.website.autoShopStaff2,this.website.purchasedAutoShopStaff2);
         _loc15_ = this.autoShop.getStaff2RawSaleCost(this.website.autoShopStaff2,this.website.purchasedAutoShopStaff2);
         _loc32_ = (this.website.purchasedAutoShopStaff1 != 1 || !this.autoShop.isOwned) && this.website.autoShopStaff1 == 1;
         _loc33_ = (this.website.purchasedAutoShopStaff2 != 1 || !this.autoShop.isOwned) && this.website.autoShopStaff2 == 1;
         if(_loc32_ && _loc33_)
         {
            _loc3_ = _loc28_ + _loc24_;
            _loc5_ = _loc11_ + _loc13_;
            _loc4_ = this.getSaleCost(_loc17_,_loc15_,-1,-1);
            _loc6_ = this.autoShop.getStaff1RawSaleCost(this.website.autoShopStaff1) != -1 ? _loc17_ : _loc11_;
            _loc6_ += this.autoShop.getStaff2RawSaleCost(this.website.autoShopStaff2) != -1 ? _loc15_ : _loc13_;
            _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+",_loc6_);
         }
         else if(_loc32_)
         {
            _loc2_ += this.updateCostStep(3,_loc28_,_loc11_,_loc17_,"+");
         }
         else if(_loc33_)
         {
            _loc2_ += this.updateCostStep(3,_loc24_,_loc13_,_loc15_,"+");
         }
         else
         {
            _loc2_ += this.updateCostStep(3,0,0,0,"+");
         }
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      var _loc7_;
      var _loc8_;
      var _loc25_;
      var _loc19_;
      var _loc12_;
      var _loc30_;
      var _loc9_;
      var _loc20_;
      var _loc21_;
      var _loc22_;
      if(this.website.autoShopCarLift != -1 || this.website.autoShopQuarters != -1)
      {
         _loc7_ = this.website.purchasedAutoShopCarLift;
         _loc8_ = this.website.purchasedAutoShopQuarters;
         if(this.website.purchasedAutoShopID != this.website.selectedAutoShopID)
         {
            _loc7_ = 0;
            _loc8_ = 0;
         }
         _loc25_ = this.autoShop.getCarLiftBestCost(this.website.autoShopCarLift,_loc7_);
         _loc19_ = this.autoShop.getCarLiftCost(this.website.autoShopCarLift,_loc7_);
         _loc12_ = this.autoShop.getCarLiftRawSaleCost(this.website.autoShopCarLift,_loc7_);
         _loc30_ = this.autoShop.getQuartersBestCost(this.website.autoShopQuarters,_loc8_);
         _loc9_ = this.autoShop.getQuartersCost(this.website.autoShopQuarters,_loc8_);
         _loc20_ = this.autoShop.getQuartersRawSaleCost(this.website.autoShopQuarters,_loc8_);
         _loc21_ = this.website.autoShopCarLift != _loc7_;
         _loc22_ = this.website.autoShopQuarters != _loc8_;
         if(_loc21_ && _loc22_)
         {
            _loc3_ = _loc25_ + _loc30_;
            _loc5_ = _loc19_ + _loc9_;
            _loc4_ = this.getSaleCost(_loc12_,_loc20_,-1,-1);
            _loc6_ = this.autoShop.getCarLiftRawSaleCost(this.website.autoShopCarLift) != -1 ? _loc12_ : _loc19_;
            _loc6_ += this.autoShop.getQuartersRawSaleCost(this.website.autoShopQuarters) != -1 ? _loc20_ : _loc9_;
            _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+",_loc6_);
         }
         else if(_loc21_)
         {
            _loc2_ += this.updateCostStep(4,_loc25_,_loc19_,_loc12_,"+");
         }
         else if(_loc22_)
         {
            _loc2_ += this.updateCostStep(4,_loc30_,_loc9_,_loc20_,"+");
         }
         else
         {
            _loc2_ += this.updateCostStep(4,0,0,0,"+");
         }
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      if(this.website.autoShopMembership != -1 && this.website.purchasedAutoShopMembership != 1)
      {
         _loc3_ = this.autoShop.getMembershipBestCost(this.website.autoShopMembership,this.website.purchasedAutoShopMembership);
         _loc5_ = this.autoShop.getMembershipCost(this.website.autoShopMembership,this.website.purchasedAutoShopMembership);
         _loc4_ = this.autoShop.getMembershipRawSaleCost(this.website.autoShopMembership,this.website.purchasedAutoShopMembership);
         _loc2_ += this.updateCostStep(5,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(5,0,0,0,"+");
      }
      var _loc34_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc26_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc34_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc26_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc26_,true);
      }
   }
   function updateSalvageYardCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.salvageYard.isOwned ? this.salvageYard.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc8_;
      var _loc9_;
      if(this.website.salvageYardTint != -1)
      {
         _loc3_ = this.salvageYard.getTintBestCost(this.website.salvageYardTint,this.website.purchasedSalvageYardTint);
         _loc5_ = this.salvageYard.getTintCost(this.website.salvageYardTint,this.website.purchasedSalvageYardTint);
         _loc4_ = this.salvageYard.getTintRawSaleCost(this.website.salvageYardTint,this.website.purchasedSalvageYardTint);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.salvageYardRepairBay != -1)
      {
         _loc3_ = this.salvageYard.getRepairBayBestCost(this.website.salvageYardRepairBay,this.website.purchasedSalvageYardRepairBay);
         _loc5_ = this.salvageYard.getRepairBayCost(this.website.salvageYardRepairBay,this.website.purchasedSalvageYardRepairBay);
         _loc4_ = this.salvageYard.getRepairBayRawSaleCost(this.website.salvageYardRepairBay,this.website.purchasedSalvageYardRepairBay);
         _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.salvageYardTowTruck != -1)
      {
         _loc3_ = this.salvageYard.getTowTruckBestCost(this.website.salvageYardTowTruck,this.website.purchasedSalvageYardTowTruck);
         _loc5_ = this.salvageYard.getTowTruckCost(this.website.salvageYardTowTruck,this.website.purchasedSalvageYardTowTruck);
         _loc4_ = this.salvageYard.getTowTruckRawSaleCost(this.website.salvageYardTowTruck,this.website.purchasedSalvageYardTowTruck);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.salvageYardWallSafe != -1 && this.website.purchasedSalvageYardWallSafe != 1)
      {
         _loc3_ = this.salvageYard.getWallSafeBestCost(this.website.salvageYardWallSafe,this.website.purchasedSalvageYardWallSafe);
         _loc5_ = this.salvageYard.getWallSafeCost(this.website.salvageYardWallSafe,this.website.purchasedSalvageYardWallSafe);
         _loc4_ = this.salvageYard.getWallSafeRawSaleCost(this.website.salvageYardWallSafe,this.website.purchasedSalvageYardWallSafe);
         _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.salvageYardStaff != -1)
      {
         _loc3_ = this.salvageYard.getStaffBestCost(this.website.salvageYardStaff,this.website.purchasedSalvageYardStaff);
         _loc5_ = this.salvageYard.getStaffCost(this.website.salvageYardStaff,this.website.purchasedSalvageYardStaff);
         _loc4_ = this.salvageYard.getStaffRawSaleCost(this.website.salvageYardStaff,this.website.purchasedSalvageYardStaff);
         _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      var _loc7_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc6_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_,true);
      }
   }
   function updateBailOfficeCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.bailOffice.isOwned ? this.bailOffice.getBaseBestCost() : 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc10_;
      var _loc17_;
      if(this.website.bailOfficeStyle != -1)
      {
         _loc3_ = this.bailOffice.getStyleBestCost(this.website.bailOfficeStyle,this.website.purchasedBailOfficeStyle);
         _loc5_ = this.bailOffice.getStyleCost(this.website.bailOfficeStyle,this.website.purchasedBailOfficeStyle);
         _loc4_ = this.bailOffice.getStyleRawSaleCost(this.website.bailOfficeStyle,this.website.purchasedBailOfficeStyle);
         _loc2_ += this.updateCostStep(0,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      var _loc13_;
      var _loc6_;
      var _loc9_;
      var _loc11_;
      var _loc7_;
      var _loc8_;
      var _loc14_;
      var _loc15_;
      if(this.website.bailOfficeStaff1 != -1 || this.website.bailOfficeStaff2 != -1)
      {
         _loc13_ = this.bailOffice.getStaff1BestCost(this.website.bailOfficeStaff1,this.website.purchasedBailOfficeStaff1);
         _loc6_ = this.bailOffice.getStaff1Cost(this.website.bailOfficeStaff1,this.website.purchasedBailOfficeStaff1);
         _loc9_ = this.bailOffice.getStaff1RawSaleCost(this.website.bailOfficeStaff1,this.website.purchasedBailOfficeStaff1);
         _loc11_ = this.bailOffice.getStaff2BestCost(this.website.bailOfficeStaff2,this.website.purchasedBailOfficeStaff2);
         _loc7_ = this.bailOffice.getStaff2Cost(this.website.bailOfficeStaff2,this.website.purchasedBailOfficeStaff2);
         _loc8_ = this.bailOffice.getStaff2RawSaleCost(this.website.bailOfficeStaff2,this.website.purchasedBailOfficeStaff2);
         _loc14_ = (this.website.purchasedBailOfficeStaff1 != 1 || !this.bailOffice.isOwned) && this.website.bailOfficeStaff1 == 1;
         _loc15_ = (this.website.purchasedBailOfficeStaff2 != 1 || !this.bailOffice.isOwned) && this.website.bailOfficeStaff2 == 1;
         if(_loc14_ && _loc15_)
         {
            _loc3_ = _loc13_ + _loc11_;
            _loc5_ = _loc6_ + _loc7_;
            _loc4_ = this.getSaleCost(_loc9_,_loc8_,-1,-1);
            _loc10_ = this.bailOffice.getStaff1RawSaleCost(this.website.bailOfficeStaff1) != -1 ? _loc9_ : _loc6_;
            _loc10_ += this.bailOffice.getStaff2RawSaleCost(this.website.bailOfficeStaff2) != -1 ? _loc8_ : _loc7_;
            _loc2_ += this.updateCostStep(1,_loc3_,_loc5_,_loc4_,"+",_loc10_);
         }
         else if(_loc14_)
         {
            _loc2_ += this.updateCostStep(1,_loc13_,_loc6_,_loc9_,"+");
         }
         else if(_loc15_)
         {
            _loc2_ += this.updateCostStep(1,_loc11_,_loc7_,_loc8_,"+");
         }
         else
         {
            _loc2_ += this.updateCostStep(1,0,0,0,"+");
         }
      }
      else
      {
         _loc2_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.bailOfficeQuarters != -1)
      {
         _loc3_ = this.bailOffice.getQuartersBestCost(this.website.bailOfficeQuarters,this.website.purchasedBailOfficeQuarters);
         _loc5_ = this.bailOffice.getQuartersCost(this.website.bailOfficeQuarters,this.website.purchasedBailOfficeQuarters);
         _loc4_ = this.bailOffice.getQuartersRawSaleCost(this.website.bailOfficeQuarters,this.website.purchasedBailOfficeQuarters);
         _loc2_ += this.updateCostStep(2,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.bailOfficeGunLocker != -1)
      {
         _loc3_ = this.bailOffice.getGunLockerBestCost(this.website.bailOfficeGunLocker,this.website.purchasedBailOfficeGunLocker);
         _loc5_ = this.bailOffice.getGunLockerCost(this.website.bailOfficeGunLocker,this.website.purchasedBailOfficeGunLocker);
         _loc4_ = this.bailOffice.getGunLockerRawSaleCost(this.website.bailOfficeGunLocker,this.website.purchasedBailOfficeGunLocker);
         _loc2_ += this.updateCostStep(3,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(3,0,0,0,"+");
      }
      if(this.website.bailOfficeTransporter != -1)
      {
         _loc3_ = this.bailOffice.getTransporterBestCost(this.website.bailOfficeTransporter,this.website.purchasedBailOfficeTransporter);
         _loc5_ = this.bailOffice.getTransporterCost(this.website.bailOfficeTransporter,this.website.purchasedBailOfficeTransporter);
         _loc4_ = this.bailOffice.getTransporterRawSaleCost(this.website.bailOfficeTransporter,this.website.purchasedBailOfficeTransporter);
         _loc2_ += this.updateCostStep(4,_loc3_,_loc5_,_loc4_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(4,0,0,0,"+");
      }
      var _loc16_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc12_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc16_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc12_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc12_,true);
      }
   }
   function updateCarWashCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.carWash.isOwned ? this.carWash.getBaseBestCost() : 0;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      var _loc8_;
      var _loc9_;
      if(this.website.carWashTint != -1)
      {
         _loc4_ = this.carWash.getTintBestCost(this.website.carWashTint,this.website.purchasedCarWashTint);
         _loc6_ = this.carWash.getTintCost(this.website.carWashTint,this.website.purchasedCarWashTint);
         _loc5_ = this.carWash.getTintRawSaleCost(this.website.carWashTint,this.website.purchasedCarWashTint);
         _loc2_ += this.updateCostStep(0,_loc4_,_loc6_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      var _loc7_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc3_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_,true);
      }
   }
   function updateHelitoursCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.helitours.isOwned ? this.helitours.getBaseBestCost() : 0;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      var _loc8_;
      var _loc9_;
      if(this.website.helitoursTint != -1)
      {
         _loc4_ = this.helitours.getTintBestCost(this.website.helitoursTint,this.website.purchasedHelitoursTint);
         _loc6_ = this.helitours.getTintCost(this.website.helitoursTint,this.website.purchasedHelitoursTint);
         _loc5_ = this.helitours.getTintRawSaleCost(this.website.helitoursTint,this.website.purchasedHelitoursTint);
         _loc2_ += this.updateCostStep(0,_loc4_,_loc6_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      var _loc7_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc3_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_,true);
      }
   }
   function updateWeedShopCosts()
   {
      this.updateCostStep(0,-1,-1,-1,"");
      var _loc2_ = !this.weedShop.isOwned ? this.weedShop.getBaseBestCost() : 0;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      var _loc8_;
      var _loc9_;
      if(this.website.weedShopTint != -1)
      {
         _loc4_ = this.weedShop.getTintBestCost(this.website.weedShopTint,this.website.purchasedWeedShopTint);
         _loc6_ = this.weedShop.getTintCost(this.website.weedShopTint,this.website.purchasedWeedShopTint);
         _loc5_ = this.weedShop.getTintRawSaleCost(this.website.weedShopTint,this.website.purchasedWeedShopTint);
         _loc2_ += this.updateCostStep(0,_loc4_,_loc6_,_loc5_,"+");
      }
      else
      {
         _loc2_ += this.updateCostStep(0,0,0,0,"+");
      }
      var _loc7_ = !this.base.isOwned ? "FORECLOSURES_BUY" : "FORECLOSURES_RENOVATE";
      var _loc3_ = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc2_ > 0)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_ + ": $" + com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.formatNumber(_loc2_),true);
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc3_,true);
      }
   }
   function getSaleCost(price1, price2, price3, price4)
   {
      var _loc1_;
      if(price1 < 0 && price2 < 0 && price3 < 0 && price4 < 0)
      {
         _loc1_ = -1;
      }
      else
      {
         _loc1_ = price1 <= -1 ? 0 : price1;
         _loc1_ += price2 <= -1 ? 0 : price2;
         _loc1_ += price3 <= -1 ? 0 : price3;
         _loc1_ += price4 <= -1 ? 0 : price4;
      }
      return _loc1_;
   }
}
