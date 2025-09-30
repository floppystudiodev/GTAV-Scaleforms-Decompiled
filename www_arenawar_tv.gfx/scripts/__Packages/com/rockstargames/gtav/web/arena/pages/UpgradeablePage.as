class com.rockstargames.gtav.web.arena.pages.UpgradeablePage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   static var NUM_COLS = 3;
   static var COL_OFFSET = 217;
   static var COL_WIDTH = 285;
   static var ROW_HEIGHT = 277;
   static var HEADER_HEIGHT = 140;
   static var FOOTER_OFFSET = 30;
   static var RESTORE_SCROLL_POSITION = 0;
   static var STORE_SCROLL_POSITION = 0;
   function UpgradeablePage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"upgradeablePage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.initVehicleButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.view.footer._y = this.view.listA._y + this.view.listA._height + com.rockstargames.gtav.web.arena.pages.UpgradeablePage.FOOTER_OFFSET;
      this.view.background._height = this.view.footer._y + this.view.footer._height;
      this.website.setPageHeight(this.view.background._height);
      this.website.browser.SCROLL_WEBPAGE_PIXELS(com.rockstargames.gtav.web.arena.pages.UpgradeablePage.RESTORE_SCROLL_POSITION);
      com.rockstargames.gtav.web.arena.pages.UpgradeablePage.RESTORE_SCROLL_POSITION = 0;
   }
   function handleClick(type, id)
   {
      var _loc0_;
      if((_loc0_ = type) === "vehicleButton")
      {
         this.website.selectedVehicleId = parseInt(id);
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.VEHICLE_DETAILS_PAGE_PREFIX + id);
      }
   }
   function initVehicleButtons()
   {
      var _loc3_ = this.view.attachMovie("vehicleListHeader","listA",this.view.getNextHighestDepth());
      _loc3_._x = com.rockstargames.gtav.web.arena.pages.UpgradeablePage.COL_OFFSET;
      _loc3_._y = 0;
      var _loc11_ = _loc3_.label._x + _loc3_.label._width;
      _loc3_.label.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc3_.label,"MBA_UPGRADEABLE");
      _loc3_.labelGradientMask.autoSize = "left";
      _loc3_.labelGradientMask.text = _loc3_.label.text;
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc3_.label);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc3_.labelGradientMask);
         _loc3_.labelGradient._height *= 0.8;
      }
      var _loc10_ = _loc11_ - _loc3_.label._width;
      _loc3_.label._x = _loc10_;
      _loc3_.labelGradientMask._x = _loc10_;
      _loc3_.labelGradient._x = _loc10_;
      _loc3_.labelGradient._width = _loc3_.label._width;
      _loc3_.message.autoSize = "right";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc3_.message,"MBA_UPGRADEABLE_MSG");
      var _loc9_ = Math.max(_loc3_.message._y + _loc3_.message._height + 20,com.rockstargames.gtav.web.arena.pages.UpgradeablePage.HEADER_HEIGHT);
      if(_loc3_.label._x + _loc3_.label_width > _loc3_.message._x)
      {
         _loc11_ = _loc3_.message + _loc3_.message;
         _loc3_.message._x = _loc3_.label._x + _loc3_.label_width + 10;
         _loc3_.message._width = _loc11_ - _loc3_.message._x;
      }
      var _loc5_ = 0;
      var _loc4_ = 0;
      var _loc2_;
      var _loc6_;
      var _loc8_;
      var _loc7_;
      while(_loc5_ < this.website.vehicles.length)
      {
         _loc2_ = this.website.vehicles[_loc5_];
         _loc6_ = _loc2_.theme;
         if(_loc6_ == -1)
         {
            if(_loc2_.buyItNowPrice >= 0 || _loc2_.tradePrice >= 0)
            {
               _loc8_ = _loc4_ % com.rockstargames.gtav.web.arena.pages.UpgradeablePage.NUM_COLS * com.rockstargames.gtav.web.arena.pages.UpgradeablePage.COL_WIDTH;
               _loc7_ = Math.floor(_loc4_ / com.rockstargames.gtav.web.arena.pages.UpgradeablePage.NUM_COLS) * com.rockstargames.gtav.web.arena.pages.UpgradeablePage.ROW_HEIGHT + _loc9_;
               this.initVehicleButton(_loc3_,_loc8_,_loc7_,_loc2_.id,_loc2_.nameLabel,_loc2_.thumbnailTexture,_loc2_.textureDictionary,_loc2_.buyItNowPrice,_loc2_.buyItNowSalePrice,_loc2_.buyItNowPriceAvailable,_loc2_.tradePrice,_loc2_.tradeSalePrice,_loc2_.tradePriceAvailable,_loc2_.numSeats,_loc2_.award);
               _loc4_ = _loc4_ + 1;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function initVehicleButton(listView, x, y, id, vehicleName, texture, textureDictionary, buyItNowPrice, saleBuyItNowPrice, buyItNowPriceAvailable, tradePrice, saleTradePrice, tradePriceAvailable, numSeats, award)
   {
      var _loc2_ = listView.attachMovie("vehicleButton","vehicleButton_" + id,listView.getNextHighestDepth());
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.btnTxt.textAutoSize = "shrink";
      _loc2_.btnTxtShadow.textAutoSize = "shrink";
      _loc2_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.btnTxt,vehicleName).toUpperCase();
      _loc2_.btnTxtShadow.text = _loc2_.btnTxt.text;
      _loc2_.seats.count.text = numSeats;
      this.website.imageManager.addImage(textureDictionary,texture,_loc2_.image);
      var _loc4_ = saleBuyItNowPrice != -1 && saleBuyItNowPrice < buyItNowPrice;
      this.updateCost(_loc2_.buyItNowPrice,_loc4_,buyItNowPrice,saleBuyItNowPrice,"MBA_BUY_IT_NOW");
      if(!buyItNowPriceAvailable)
      {
         _loc2_.buyItNowPrice._alpha = 50;
      }
      var _loc3_ = saleTradePrice != -1 && saleTradePrice < tradePrice;
      this.updateCost(_loc2_.tradePrice,_loc3_,tradePrice,saleTradePrice,"MBA_TRADE_PRICE");
      if(!tradePriceAvailable)
      {
         _loc2_.tradePrice._alpha = 50;
      }
      this.updateSaleSticker(_loc2_.saleSticker,_loc4_ || _loc3_);
      if(!_loc2_.buyItNowPrice._visible)
      {
         _loc2_.tradePrice._x = 0.5 * (_loc2_.image._width - _loc2_.tradePrice._width) + _loc2_.image._x;
      }
      if(award > 0)
      {
         _loc2_.award.gotoAndStop(award);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.website.dataTextScope.push(_loc2_.btnTxt);
   }
   function updateCost(panel, isOnSale, originalCost, saleCost, titleLabel)
   {
      panel.gotoAndStop(!isOnSale ? "normal" : "sale");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(panel.title,titleLabel);
      if(isOnSale)
      {
         panel.originalCost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(originalCost);
         panel.originalCostShadow.text = panel.originalCost.text;
         panel.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(saleCost);
         panel.strikethrough._x = 0.5 * (panel.originalCost._width - panel.originalCost.textWidth) + panel.originalCost._x;
         panel.strikethrough._width = panel.originalCost.textWidth + 4;
         panel.strikethrough._visible = true;
      }
      else if(originalCost < 0)
      {
         panel._visible = false;
      }
      else if(originalCost == 0)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(panel.cost,"CLUB_FREE");
         panel.strikethrough._visible = false;
      }
      else
      {
         panel.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(originalCost);
         panel.strikethrough._visible = false;
      }
      panel.costShadow.text = panel.cost.text;
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(panel.title);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(panel.cost);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(panel.costShadow);
         if(isOnSale)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(panel.originalCost);
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(panel.originalCostShadow);
         }
      }
   }
   function updateSaleSticker(sticker, isOnSale)
   {
      sticker._visible = isOnSale;
      if(!isOnSale)
      {
         return undefined;
      }
      var _loc4_ = sticker._width;
      var _loc5_ = 42;
      sticker.label.autoSize = "left";
      sticker.label.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(sticker.label,"WEB_VEHICLE_SALE").toUpperCase();
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(sticker.label);
      }
      var _loc3_ = sticker.label._width + 20;
      if(_loc3_ > _loc4_)
      {
         sticker.centre._xscale = 100 * (_loc3_ - 34) / _loc5_;
         sticker.right._x = sticker.centre._x + (_loc3_ - 34) - 1;
      }
   }
   function dispose()
   {
      com.rockstargames.gtav.web.arena.pages.UpgradeablePage.STORE_SCROLL_POSITION = - this.website.browser.TIMELINE[this.website.browser.movieClipName].CONTENT._y;
      super.dispose();
   }
}
