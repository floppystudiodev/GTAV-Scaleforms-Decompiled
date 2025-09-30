class com.rockstargames.gtav.web.arena.pages.VehicleDetailsPage extends com.rockstargames.gtav.web.arena.Page
{
   var buyItNowPriceAvailable;
   var descriptionLabel;
   var progressPanel;
   var showingArenaReady;
   var textureDictionary;
   var textures;
   var tradePriceAvailable;
   var view;
   var website;
   static var IMAGE_FADE_OUT_DURATION = 0.2;
   static var IMAGE_FADE_IN_DURATION = 0.4;
   function VehicleDetailsPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"vehicleDetailsPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.textures = [];
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.website.vehicles.length)
      {
         _loc2_ = this.website.vehicles[_loc3_];
         if(_loc2_.id == this.website.selectedVehicleId)
         {
            this.showingArenaReady = _loc2_.theme != -1;
            this.textureDictionary = _loc2_.textureDictionary;
            this.buyItNowPriceAvailable = _loc2_.buyItNowPriceAvailable;
            this.tradePriceAvailable = _loc2_.tradePriceAvailable;
            this.descriptionLabel = _loc2_.descriptionLabel;
            this.initVehicle(_loc2_);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.initPreviewSticker();
      this.view.footer._y = this.view.description._y + this.view.description._height + 30;
      this.view.background._height = this.view.footer._y + this.view.footer._height;
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
      if(this.showingArenaReady)
      {
         com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.RESTORE_SCROLL_POSITION = com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.STORE_SCROLL_POSITION;
      }
      else
      {
         com.rockstargames.gtav.web.arena.pages.UpgradeablePage.RESTORE_SCROLL_POSITION = com.rockstargames.gtav.web.arena.pages.UpgradeablePage.STORE_SCROLL_POSITION;
      }
   }
   function initVehicle(v)
   {
      if(this.showingArenaReady)
      {
         this.initPreviewButton(this.view.themeButton_1,"MBA_VIEW_STOCK_1","MBA_VIEW_STOCK_2",v.stockTexture);
         this.initPreviewButton(this.view.themeButton_2,"MBA_MODDED","MBA_THEME_" + v.theme,v.upgradeTexture);
         this.view.themeButton_3._visible = false;
         this.view.themeButton_4._visible = false;
      }
      else
      {
         this.initPreviewButton(this.view.themeButton_1,"MBA_VIEW_STOCK_1","MBA_VIEW_STOCK_2",v.stockTexture);
         this.initPreviewButton(this.view.themeButton_2,"MBA_TRANSFORM","MBA_THEME_1",v.upgradeTexturePrefix + "1");
         this.initPreviewButton(this.view.themeButton_3,"MBA_TRANSFORM","MBA_THEME_2",v.upgradeTexturePrefix + "2");
         this.initPreviewButton(this.view.themeButton_4,"MBA_TRANSFORM","MBA_THEME_3",v.upgradeTexturePrefix + "3");
      }
      var _loc5_ = this.view.title._x + this.view.title._width;
      this.view.title.autoSize = "left";
      this.view.titleGradientMask.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,v.nameLabel).toUpperCase();
      this.view.titleGradientMask.text = this.view.title.text;
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(this.view.title);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(this.view.titleGradientMask);
      }
      var _loc3_ = _loc5_ - this.view.title._width;
      this.view.title._x = _loc3_;
      this.view.titleGradientMask._x = _loc3_;
      this.view.titleGradient._x = _loc3_;
      this.view.titleGradient._width = this.view.title._width;
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,v.descriptionLabel);
      this.view.disclaimer.autoSize = "right";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.disclaimer,"MBA_DISCLAIMER");
      var _loc4_ = v.buyItNowSalePrice != -1 && v.buyItNowSalePrice < v.buyItNowPrice;
      this.initPurchaseButton(this.view.buyItNowButton,"MBA_BUY_IT_NOW",!v.buyItNowPriceAvailable,_loc4_,v.buyItNowPrice,v.buyItNowSalePrice);
      _loc4_ = v.tradeSalePrice != -1 && v.tradeSalePrice < v.tradePrice;
      this.initPurchaseButton(this.view.tradePriceButton,"MBA_TRADE_PRICE",!v.tradePriceAvailable,_loc4_,v.tradePrice,v.tradeSalePrice);
      if(v.tradePriceAvailable)
      {
         this.view.buyItNowButton.disabled = true;
         this.view.buyItNowButton._visible = false;
         this.view.tradePriceButton._x = 0.5 * (com.rockstargames.gtav.web.arena.Page.STAGE_WIDTH - this.view.tradePriceButton._width);
      }
      this.setTheme(1,true);
   }
   function initPreviewButton(buttonView, topLabel, bottomLabel, targetTexture)
   {
      buttonView.label.transformed.textAutoSize = "shrink";
      buttonView.label.theme.textAutoSize = "shrink";
      buttonView.selected.label.transformed.textAutoSize = "shrink";
      buttonView.selected.label.theme.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.label.transformed,topLabel);
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.label.theme,bottomLabel);
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.selected.label.transformed,topLabel);
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.selected.label.theme,bottomLabel);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.label.transformed);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.label.theme);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.selected.label.transformed);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.selected.label.theme);
      }
      this.website.dataTextScope.push(buttonView.btnTxt);
      this.textures.push(targetTexture);
   }
   function initPurchaseButton(buttonView, titleLabel, showPadlock, isOnSale, normalPrice, salePrice)
   {
      buttonView.labels.gotoAndStop(!isOnSale ? "normal" : "sale");
      buttonView.labels.title.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.labels.title,titleLabel);
      buttonView.labels.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(normalPrice);
      if(isOnSale)
      {
         buttonView.labels.saleCost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(salePrice);
         buttonView.strikethrough._width = buttonView.labels.cost.textWidth;
         buttonView.strikethrough._x = buttonView.labels._x + buttonView.labels.cost._x + buttonView.labels.cost._width - buttonView.labels.cost.textWidth;
      }
      buttonView.strikethrough._visible = isOnSale;
      buttonView.padlock._visible = showPadlock;
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.labels.cost);
         if(isOnSale)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(buttonView.labels.saleCost);
         }
      }
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function initPreviewSticker()
   {
      this.view.previewSticker.label.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.previewSticker.label,"MBA_MOD_PREVIEW");
      this.view.previewSticker.bg.scale9Grid = new flash.geom.Rectangle(5,5,90,18);
      this.view.previewSticker.bg._width = this.view.previewSticker.label._width + 20;
      this.view.previewSticker._x = this.view.title._x + this.view.title._width - this.view.previewSticker._width;
      this.view.previewSticker._y = this.view.disclaimer._y + this.view.disclaimer._height + 10;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "buyItNowButton":
            if(this.buyItNowPriceAvailable)
            {
               this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.VEHICLE_PURCHASE_PROCESSING_PAGE.name);
            }
            break;
         case "tradePriceButton":
            if(this.tradePriceAvailable)
            {
               this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.VEHICLE_PURCHASE_PROCESSING_PAGE.name);
            }
            break;
         case "themeButton":
            this.setTheme(parseInt(id),false);
         default:
            return;
      }
   }
   function setTheme(index, isInstant)
   {
      var _loc2_ = 1;
      while(_loc2_ <= 4)
      {
         this.view["themeButton_" + _loc2_].selected._visible = _loc2_ == index;
         _loc2_ = _loc2_ + 1;
      }
      this.view.previewSticker._visible = index > 1;
      this.view.disclaimer._visible = index > 1;
      if(isInstant)
      {
         this.website.imageManager.addImage(this.textureDictionary,this.textures[index - 1],this.view.image);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.image,com.rockstargames.gtav.web.arena.pages.VehicleDetailsPage.IMAGE_FADE_OUT_DURATION,{_alpha:0,onCompleteScope:this,onComplete:this.fadeInImage,onCompleteArgs:[index]});
      }
      var _loc4_;
      if(!this.showingArenaReady)
      {
         _loc4_ = index != 1 ? this.descriptionLabel.substring(0,this.descriptionLabel.lastIndexOf("_")) + (index - 1) + "_DESC" : this.descriptionLabel;
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,_loc4_);
      }
   }
   function fadeInImage(index)
   {
      this.website.imageManager.addImage(this.textureDictionary,this.textures[index - 1],this.view.image);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.image,com.rockstargames.gtav.web.arena.pages.VehicleDetailsPage.IMAGE_FADE_IN_DURATION,{delay:0.05,_alpha:100});
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image);
      super.dispose();
   }
}
