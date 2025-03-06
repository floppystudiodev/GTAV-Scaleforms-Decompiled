class com.rockstargames.gtav.web.arena.pages.ArenaReadyPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var website;
   var view;
   var scrollPositions;
   var listsAvailable;
   static var NUM_COLS = 3;
   static var COL_OFFSET = 217;
   static var COL_WIDTH = 285;
   static var ROW_HEIGHT = 277;
   static var NAV_HEADER_HEIGHT = 125;
   static var HEADER_HEIGHT = 125;
   static var FOOTER_OFFSET = 30;
   static var RESTORE_SCROLL_POSITION = 0;
   static var STORE_SCROLL_POSITION = 0;
   function ArenaReadyPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"arenaReadyPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.initAvailableLists();
      this.initNavButtons();
      this.initVehicleButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.view.background._height = this.view.footer._y + this.view.footer._height;
      this.website.setPageHeight(this.view.background._height);
      this.website.browser.SCROLL_WEBPAGE_PIXELS(com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.RESTORE_SCROLL_POSITION);
      com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.RESTORE_SCROLL_POSITION = 0;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "vehicleButton":
            this.website.selectedVehicleId = parseInt(id);
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.VEHICLE_DETAILS_PAGE_PREFIX + id);
            break;
         case "sectionButton":
            this.website.browser.SCROLL_WEBPAGE_PIXELS(this.scrollPositions[parseInt(id)]);
      }
   }
   function initAvailableLists()
   {
      this.listsAvailable = [false,false,false];
      var _loc3_ = 0;
      while(_loc3_ < this.website.vehicles.length)
      {
         var _loc2_ = this.website.vehicles[_loc3_];
         if(_loc2_.buyItNowPrice >= 0 || _loc2_.tradePrice >= 0)
         {
            this.listsAvailable[_loc2_.theme - 1] = true;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function initNavButtons()
   {
      var _loc4_ = ["MBA_THEME_1","MBA_THEME_2","MBA_THEME_3"];
      var _loc6_ = [this.view.navHeader.sectionButton_0._x,this.view.navHeader.sectionButton_1._x,this.view.navHeader.sectionButton_2._x];
      var _loc5_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         var _loc2_ = this.view.navHeader["sectionButton_" + _loc3_];
         if(this.listsAvailable[_loc3_])
         {
            _loc2_.wrapper.label.textAutoSize = "shrink";
            _loc2_.wrapper.label.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.wrapper.label,_loc4_[_loc3_]).toUpperCase();
            _loc2_._x = _loc6_[_loc5_];
            this.website.dataTextScope.push(_loc2_.btnTxt);
            _loc5_ = _loc5_ + 1;
         }
         else
         {
            _loc2_._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function initVehicleButtons()
   {
      var _loc4_ = [];
      var _loc3_ = 0;
      while(_loc3_ < this.listsAvailable.length)
      {
         if(this.listsAvailable[_loc3_])
         {
            _loc4_[_loc3_] = this.initListView("list" + (_loc3_ + 1),"MBA_THEME_" + (_loc3_ + 1),false);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      var _loc6_ = [0,0,0];
      while(_loc3_ < this.website.vehicles.length)
      {
         var _loc2_ = this.website.vehicles[_loc3_];
         var _loc7_ = _loc2_.theme;
         if(_loc7_ != -1)
         {
            if(_loc2_.buyItNowPrice >= 0 || _loc2_.tradePrice >= 0)
            {
               var _loc5_ = _loc7_ - 1;
               var _loc9_ = _loc6_[_loc5_] % com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.NUM_COLS * com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.COL_WIDTH;
               var _loc8_ = Math.floor(_loc6_[_loc5_] / com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.NUM_COLS) * com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.ROW_HEIGHT + com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.HEADER_HEIGHT;
               this.initVehicleButton(_loc4_[_loc5_],_loc9_,_loc8_,_loc2_.id,_loc2_.nameLabel,_loc2_.thumbnailTexture,_loc2_.textureDictionary,_loc2_.buyItNowPrice,_loc2_.buyItNowSalePrice,_loc2_.buyItNowPriceAvailable,_loc2_.tradePrice,_loc2_.tradeSalePrice,_loc2_.tradePriceAvailable,_loc2_.numSeats,_loc2_.award);
               _loc6_[_loc5_] = _loc6_[_loc5_] + 1;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.scrollPositions = [];
      this.view.navHeader._x = com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.COL_OFFSET;
      _loc9_ = com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.COL_OFFSET;
      _loc8_ = com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.NAV_HEADER_HEIGHT;
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         this.scrollPositions.push(_loc8_);
         if(this.listsAvailable[_loc3_])
         {
            _loc4_[_loc3_]._x = _loc9_;
            _loc4_[_loc3_]._y = _loc8_;
            _loc8_ += _loc4_[_loc3_]._height;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.footer._y = _loc8_ + com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.FOOTER_OFFSET;
   }
   function initListView(name, titleLabel, logoVisible)
   {
      var _loc2_ = this.view.attachMovie("vehicleListHeader",name,this.view.getNextHighestDepth());
      _loc2_.logo._visible = logoVisible;
      var _loc4_ = _loc2_.label._x + _loc2_.label._width;
      _loc2_.label.autoSize = "left";
      _loc2_.label.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.label,titleLabel).toUpperCase();
      _loc2_.labelGradientMask.autoSize = "left";
      _loc2_.labelGradientMask.text = _loc2_.label.text;
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc2_.label);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc2_.labelGradientMask);
         _loc2_.labelGradient._height *= 0.8;
      }
      var _loc3_ = _loc4_ - _loc2_.label._width;
      _loc2_.label._x = _loc3_;
      _loc2_.labelGradientMask._x = _loc3_;
      _loc2_.labelGradient._x = _loc3_;
      _loc2_.labelGradient._width = _loc2_.label._width;
      return _loc2_;
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
      if(award > 0)
      {
         _loc2_.award.gotoAndStop(award);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.updateSaleSticker(_loc2_.saleSticker,_loc4_ || _loc3_);
      if(!_loc2_.buyItNowPrice._visible)
      {
         _loc2_.tradePrice._x = 0.5 * (_loc2_.image._width - _loc2_.tradePrice._width) + _loc2_.image._x;
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
      com.rockstargames.gtav.web.arena.pages.ArenaReadyPage.STORE_SCROLL_POSITION = - this.website.browser.TIMELINE[this.website.browser.movieClipName].CONTENT._y;
      super.dispose();
   }
}
