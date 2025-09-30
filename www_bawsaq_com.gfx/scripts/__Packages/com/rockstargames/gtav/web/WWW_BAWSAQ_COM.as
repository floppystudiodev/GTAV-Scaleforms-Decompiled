class com.rockstargames.gtav.web.WWW_BAWSAQ_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var _name;
   var arrayOfFunctions;
   var browser;
   var container;
   var currentPage;
   var current_changeNet;
   var current_changePercent;
   var current_value;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var indexStart;
   var listPageURL;
   var listPositionArray;
   var mcScope;
   var scriptAccessibleMovieClips;
   var scriptAccessibleMovieClipsXpos;
   var stockAnchorCharArray;
   var stockArray;
   var lineXPos = 220;
   var lineYPos = 271;
   var lineSpacing = 34;
   var debugticker = false;
   var cashColourRed = 16724787;
   var sortSlot = 3;
   var sortDirection = 1;
   var isSellingAll = false;
   var sortSlots = [3,0,2,5,6];
   function WWW_BAWSAQ_COM()
   {
      super();
      this._name = "WWW_BAWSAQ_COM";
      this.IS_SITE_DYNAMIC = 1;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "LISTINGS";
      this.PAGE_NAMES[3] = "STOCK_PORTFOLIO";
      this.PAGE_NAMES[4] = "STOCK_VIEW";
      this.PAGE_NAMES[5] = "STOCK_INFO";
      this.PAGE_NAMES[6] = "STOCK_TRADE_BUY";
      this.PAGE_NAMES[7] = "STOCK_TRADE_SELL";
      this.PAGE_NAMES[8] = "STOCK_TRADE_CONFIRM";
      this.PAGE_NAMES[9] = "CONFIRMED";
      this.PAGE_NAMES[10] = "NEWS";
      this.PAGE_NAMES[11] = "STOCK_PORTFOLIO_EMPTY";
      this.PAGE_NAMES[12] = "NEWS_CITY";
      this.PAGE_NAMES[13] = "NEWS_MONEY";
      this.PAGE_NAMES[14] = "NEWS_TECHNOLOGY";
      this.PAGE_NAMES[15] = "ERROR";
      this.PAGE_NAMES[16] = "STOCK_PORTFOLIO_SELL_D_ALL";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = false;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = false;
      this.CAN_STORE_PAGE[8] = false;
      this.CAN_STORE_PAGE[9] = false;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = false;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = false;
      this.CAN_STORE_PAGE[16] = false;
      this.browser = _level0.TIMELINE;
      this.scriptAccessibleMovieClips = ["WWW_BAWSAQ_COM_S_STOCK_TRADE_BUY","WWW_BAWSAQ_COM_S_STOCK_TRADE_SELL"];
      this.scriptAccessibleMovieClipsXpos = [336,488];
      this.arrayOfFunctions = ["SET_BAWSAQ_PLAYER_CASH"];
   }
   function READY()
   {
   }
   function UPDATE_TICKERTAPE(speed)
   {
      var _loc6_ = new String();
      var _loc4_ = " ";
      var _loc11_ = "<font color=\'#cccccc\'>";
      var _loc13_ = "<font color=\'#6d9437\'>";
      var _loc14_ = "<font color=\'#d95a5b\'>";
      var _loc7_ = "</font>";
      var _loc12_ = "   ";
      var _loc15_;
      if(arguments[1] == "NEWS" || arguments[1] == 1)
      {
         _loc15_ = "NEWS";
      }
      else
      {
         _loc15_ = "STOCK";
      }
      var _loc3_;
      var _loc9_;
      var _loc10_;
      var _loc5_;
      var _loc8_;
      switch(_loc15_)
      {
         case "NEWS":
            _loc3_ = 0;
            while(_loc3_ < this.dataProviderUI.length)
            {
               if(this.dataProviderUI[_loc3_] != undefined)
               {
                  _loc6_ += _loc12_ + _loc4_ + _loc11_ + this.dataProviderUI[_loc3_] + _loc7_ + _loc4_;
               }
               _loc3_ = _loc3_ + 1;
            }
            this.CONTENT.TICKER_NEWS.SET_TICKER_TEXT(speed,_loc6_);
            break;
         case "STOCK":
            _loc3_ = 0;
            while(_loc3_ < this.dataProviderUI.length)
            {
               if(this.dataProviderUI[_loc3_][0] != undefined)
               {
                  _loc9_ = this.dataProviderUI[_loc3_][3];
                  _loc10_ = this.dataProviderUI[_loc3_][0];
                  _loc5_ = this.dataProviderUI[_loc3_][1];
                  _loc8_ = this.dataProviderUI[_loc3_][2];
                  _loc6_ += _loc12_ + _loc4_ + _loc11_ + _loc9_ + _loc4_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc10_,2) + _loc7_ + _loc4_;
                  if(_loc5_ < 0)
                  {
                     _loc6_ += _loc14_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "<img src=\'down_arrow\' height=\'12\' width=\'12\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc8_),2) + "%" + _loc7_ + _loc4_;
                  }
                  else
                  {
                     _loc6_ += _loc13_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "<img src=\'up_arrow\' height=\'12\' width=\'12\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc8_),2) + "%" + _loc7_ + _loc4_;
                  }
               }
               _loc3_ = _loc3_ + 1;
            }
            this.CONTENT.TICKER_STOCK.SET_TICKER_TEXT(speed,_loc6_);
         default:
            return;
      }
   }
   function SET_MOVIECLIP_VISIBILITY(isVisible, instanceEnum)
   {
      var _loc2_ = this.mcScope[this.scriptAccessibleMovieClips[instanceEnum]];
      if(_loc2_)
      {
         if(isVisible == false)
         {
            this.hideMovieClip(_loc2_);
         }
         else
         {
            this.showMovieClip(_loc2_,_loc2_._x);
         }
      }
   }
   function PROXY_FUNCTION()
   {
      var _loc3_ = arguments;
      var _loc5_ = _loc3_[0];
      var _loc4_ = this.arrayOfFunctions[_loc5_];
      this[_loc4_](_loc3_.slice(1));
   }
   function SET_BAWSAQ_PLAYER_CASH()
   {
      var _loc3_;
      var _loc5_;
      var _loc4_;
      if(this.CONTENT)
      {
         _loc3_ = this.CONTENT.playerCashMC.playerCashTF;
         _loc5_ = this.CONTENT.playerCashMC.cashTitleTF;
         _loc4_ = arguments;
         this.set_price_text(_loc3_,_loc4_[0]);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc5_,"BS_WB_MCASH");
         this.CONTENT.playerCashMC._alpha = 100;
      }
   }
   function goToAnchor(AnchorLinkLetter)
   {
      var _loc13_ = AnchorLinkLetter.split("_");
      var _loc14_;
      var _loc11_;
      var _loc2_;
      var _loc6_;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      if(_loc13_[0] == "SORT" || _loc13_[0] == "slot")
      {
         this.updateSortSlotArrow(parseInt(_loc13_[1]),true);
         _loc14_ = this.MAKE_STOCK_LIST(this.indexStart,this.stockArray.length);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      }
      else
      {
         _loc11_ = this.listPositionArray.length;
         _loc2_ = 0;
         while(_loc2_ < _loc11_)
         {
            _loc6_ = this.listPositionArray[_loc2_][1];
            if(_loc6_.substr(0,1) == AnchorLinkLetter)
            {
               _loc5_ = this.listPositionArray[_loc2_][2];
               _loc3_ = this.browser.CURSOR._y - _loc5_ - this.browser.TOOLBAR._height + 6;
               _loc4_ = - (this.CONTENT.BOUNDING_BOX._height - 627);
               if(_loc3_ < _loc4_)
               {
                  _loc3_ = _loc4_;
               }
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,1,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.removeTween,onCompleteScope:this});
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function updateSortSlotArrow(sortId, userTriggered)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.sortSlots.length)
      {
         _loc3_ = this.sortSlots[_loc2_];
         this.mcScope["slotsortArrow_" + _loc3_]._alpha = 0;
         _loc2_ = _loc2_ + 1;
      }
      if(userTriggered)
      {
         if(this.sortSlot == sortId && this.sortDirection == 1)
         {
            this.sortDirection = 0;
         }
         else
         {
            this.sortDirection = 1;
         }
      }
      this.sortSlot = sortId;
      this.mcScope["slotsortArrow_" + this.sortSlot]._rotation = 180 * this.sortDirection * -1;
      this.mcScope["slotsortArrow_" + this.sortSlot]._alpha = 50;
   }
   function removeTween()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
   }
   function makeAnchorButtons(arrayIndex, numberOfEntries)
   {
      var _loc5_ = new Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
      var _loc4_ = 466;
      var _loc8_ = 235;
      var _loc6_;
      var _loc3_ = 0;
      var _loc7_;
      var _loc2_;
      while(_loc3_ < 26)
      {
         _loc7_ = _loc3_ + arrayIndex + numberOfEntries;
         _loc2_ = _loc5_[_loc3_];
         if(numberOfEntries > 10)
         {
            _loc6_ = this.doesInitialExist(_loc2_);
         }
         else
         {
            _loc6_ = false;
         }
         if(this.mcScope[_loc2_] != undefined)
         {
            this.mcScope[_loc2_].removeMovieClip();
         }
         if(_loc6_ == true)
         {
            this.mcScope.attachMovie("button_ANCHOR",_loc2_,this.mcScope.getNextHighestDepth(),{_x:_loc4_,_y:_loc8_});
            this.mcScope[_loc2_].btnTxt.text = _loc5_[_loc3_];
            this.dataTextScope[_loc7_] = this.mcScope[_loc2_].btnTxt;
            TextField(this.mcScope[_loc2_].btnTxt).textColor = 13421772;
            this.mcScope[_loc2_].onColour = 16777215;
            this.mcScope[_loc2_].offColour = 13421772;
         }
         else
         {
            this.mcScope.attachMovie("button_ANCHOR_FAKE",_loc2_,this.mcScope.getNextHighestDepth(),{_x:_loc4_,_y:_loc8_});
            this.mcScope[_loc2_].txt.text = _loc5_[_loc3_];
            TextField(this.mcScope[_loc2_].txt).textColor = 13421772;
         }
         _loc4_ += 21.5;
         _loc3_ = _loc3_ + 1;
      }
      this.stockAnchorCharArray = [];
   }
   function doesInitialExist(str)
   {
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.stockAnchorCharArray.length)
      {
         if(this.stockAnchorCharArray[_loc2_] == str)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function POPULATE_TEXT(pageName)
   {
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.currentPage = pageName;
      if(pageName == "STOCK_PORTFOLIO" && this.dataProviderUI.length == 15)
      {
         this.browser.GO_TO_WEBPAGE("WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_EMPTY");
      }
      var _loc11_;
      var _loc5_;
      var _loc3_;
      var _loc7_;
      var _loc2_;
      var _loc6_;
      var _loc15_;
      var _loc10_;
      var _loc9_;
      var _loc0_;
      var _loc4_;
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.txt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM.btnTxt._visible = false;
            this.dataTextScope[5] = this.mcScope.headerNews;
            this.dataTextScope[6] = this.mcScope.newsItem1.header;
            this.mcScope.newsItem1.header.autoSize = "left";
            this.mcScope.newsItem1.header.wordWrap = true;
            this.dataTextScope[8] = this.mcScope.newsItem2.header;
            this.mcScope.newsItem2.header.autoSize = "left";
            this.mcScope.newsItem2.header.wordWrap = true;
            this.dataTextScope[10] = this.mcScope.newsItem3.header;
            this.mcScope.newsItem3.header.autoSize = "left";
            this.mcScope.newsItem3.header.wordWrap = true;
            this.dataTextScope[12] = this.mcScope.topFive_company;
            this.dataTextScope[13] = this.mcScope.topFive_price;
            this.dataTextScope[14] = this.mcScope.topFive_change;
            this.dataTextScope[15] = this.mcScope.stockSummary1;
            this.dataTextScope[16] = this.mcScope.stockSummary2;
            this.dataTextScope[17] = this.mcScope.stockSummary3;
            this.dataTextScope[18] = this.mcScope.stockSummary4;
            this.dataTextScope[19] = this.mcScope.stockSummary5;
            this.ADD_TEXT(22);
            this.mcScope.newsItem1.bg._height = this.mcScope.newsItem1.header._y + this.mcScope.newsItem1.header._height + 10;
            this.mcScope.newsItem2.bg._height = this.mcScope.newsItem2.header._y + this.mcScope.newsItem2.header._height + 10;
            this.mcScope.newsItem3.bg._height = this.mcScope.newsItem3.header._y + this.mcScope.newsItem3.header._height + 10;
            this.UPDATE_FIXED_STOCK_LIST(22,"stockSummary");
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.headerMovers,"BS_WB_MOVERS");
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.topFive_company,"BS_WB_NAMEH_SHORT");
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.topFive_price,"BS_WB_CURPRICH_SHORT");
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.topFive_change,"BS_H_CHNG");
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.graphTitle,"BS_PH_GR");
            _loc11_ = new Array("headerNews_bar","newsItem1","newsItem2","newsItem3");
            com.rockstargames.gtav.web.FORMAT_COLUMN.adjustPosition(_loc11_,this.mcScope,2);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope,670);
            com.rockstargames.gtav.web.DynamicGraph.draw(this.dataProviderUI[27],this.dataProviderUI[28],this.mcScope.page1Graph,11259518);
            break;
         case "LISTINGS":
            this.mcScope = this.CONTENT.LISTINGS;
            this.listPageURL = "WWW_BAWSAQ_COM_S_STOCK_VIEW";
            if(this.sortSlot == 6)
            {
               this.sortSlot = 3;
               this.sortDirection = 1;
            }
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.txt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_LISTINGS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_LISTINGS.btnTxt._visible = false;
            this.dataTextScope[6] = this.mcScope.SORT_5.btnTxt;
            this.mcScope.SORT_5.btnTxt.autoSize = "left";
            this.dataTextScope[7] = this.mcScope.SORT_3.btnTxt;
            this.mcScope.SORT_3.btnTxt.autoSize = "left";
            this.mcScope.SORT_3.bg._width = 205;
            this.dataTextScope[8] = this.mcScope.SORT_0.btnTxt;
            this.mcScope.SORT_0.btnTxt.autoSize = "left";
            this.dataTextScope[10] = this.mcScope.SORT_2.btnTxt;
            this.mcScope.SORT_2.btnTxt.autoSize = "left";
            this.dataTextScope[13] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_LISTINGS_S_.btnTxt;
            this.ADD_TEXT(this.dataTextScope.length);
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.indexStart = 15;
            this.lineXPos = 220;
            if(this.dataProviderUI.length == 0)
            {
               this.dataProviderUI = this.stockArray;
            }
            _loc5_ = this.MAKE_STOCK_LIST(this.indexStart,this.dataProviderUI.length,this.dataProviderUI);
            this.updateSortSlotArrow(this.sortSlot);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "STOCK_PORTFOLIO":
            this.mcScope = this.CONTENT.STOCK_PORTFOLIO;
            this.listPageURL = "WWW_BAWSAQ_COM_S_STOCK_VIEW";
            if(this.sortSlot == 5)
            {
               this.sortSlot = 3;
               this.sortDirection = 1;
            }
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.txt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.SORT_5.btnTxt;
            this.mcScope.SORT_5.btnTxt.autoSize = "left";
            this.dataTextScope[7] = this.mcScope.SORT_3.btnTxt;
            this.mcScope.SORT_3.btnTxt.autoSize = "left";
            this.mcScope.SORT_3.bg._width = 205;
            this.dataTextScope[8] = this.mcScope.SORT_0.btnTxt;
            this.mcScope.SORT_0.btnTxt.autoSize = "left";
            this.dataTextScope[9] = this.mcScope.SORT_1.btnTxt;
            this.mcScope.SORT_1.btnTxt.autoSize = "left";
            this.dataTextScope[10] = this.mcScope.SORT_2.btnTxt;
            this.mcScope.SORT_2.btnTxt.autoSize = "left";
            this.dataTextScope[11] = this.mcScope.SORT_6.btnTxt;
            this.mcScope.SORT_6.btnTxt.autoSize = "left";
            this.dataTextScope[12] = this.mcScope.searchHeader;
            this.dataTextScope[13] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO_S_.btnTxt;
            this.dataTextScope[14] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_SELL_D_ALL.btnTxt;
            this.ADD_TEXT(this.dataTextScope.length);
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.indexStart = 15;
            this.lineXPos = 220;
            if(this.dataProviderUI.length == 0)
            {
               this.dataProviderUI = this.stockArray;
            }
            _loc5_ = this.MAKE_STOCK_LIST(this.indexStart,this.dataProviderUI.length,this.dataProviderUI);
            this.updateSortSlotArrow(this.sortSlot);
            this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_SELL_D_ALL._y = this.lineSpacing * _loc5_ + this.lineYPos + 10;
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            break;
         case "STOCK_PORTFOLIO_EMPTY":
            this.mcScope = this.CONTENT.STOCK_PORTFOLIO_EMPTY;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.txt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.message;
            this.dataTextScope[7] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO_S_.btnTxt;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "STOCK_VIEW":
            this.mcScope = this.CONTENT.STOCK_VIEW;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.stockInfoHeader;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.currentValue;
            this.dataTextScope[7] = this.mcScope.volumeLabel;
            this.dataTextScope[8] = this.mcScope.volumeValue;
            this.dataTextScope[9] = this.mcScope.changeNetValue;
            this.dataTextScope[10] = this.mcScope.companyAbv;
            this.dataTextScope[11] = this.mcScope.graphTitle;
            this.dataTextScope[12] = this.mcScope.sunday;
            this.dataTextScope[13] = this.mcScope.monday;
            this.dataTextScope[14] = this.mcScope.tuesday;
            this.dataTextScope[15] = this.mcScope.wednesday;
            this.dataTextScope[16] = this.mcScope.thursday;
            this.dataTextScope[17] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_BUY.btnTxt;
            this.dataTextScope[18] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_SELL.btnTxt;
            this.dataTextScope[19] = this.mcScope.companyStats;
            this.dataTextScope[20] = this.mcScope.friday;
            this.dataTextScope[21] = this.mcScope.companyInfo;
            this.dataTextScope[22] = this.mcScope.changePercentValue;
            this.dataTextScope[23] = this.mcScope.highLabel;
            this.dataTextScope[24] = this.mcScope.highValue;
            this.dataTextScope[25] = this.mcScope.lowLabel;
            this.dataTextScope[26] = this.mcScope.lowValue;
            this.dataTextScope[27] = this.mcScope.shareValueLabel;
            this.dataTextScope[28] = this.mcScope.shareValueValue;
            this.dataTextScope[29] = this.mcScope.graphLastLabel;
            this.dataTextScope[30] = this.mcScope.graphLastValue;
            this.dataTextScope[31] = this.mcScope.graphChangeNetLabel;
            this.dataTextScope[32] = this.mcScope.graphChangeNetValue;
            this.dataTextScope[33] = this.mcScope.graphVolumeLabel;
            this.dataTextScope[34] = this.mcScope.graphVolumeValue;
            this.dataTextScope[35] = this.mcScope.graphTimeLabel;
            this.dataTextScope[36] = this.mcScope.graphTimeValue;
            this.dataTextScope[37] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_LISTINGS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_LISTINGS.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.graphChangePercentLabel,"BS_WB_PERCHA");
            this.mcScope.graphChangePercentValue.text = this.mcScope.changePercentValue.text;
            _loc3_ = this.dataProviderUI[10][0];
            _loc7_ = " (" + _loc3_ + ")";
            this.dataTextScope[5].text += _loc7_;
            this.setAndPositionLogo(_loc3_);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.current_value = this.dataProviderUI[6][0];
            this.current_changeNet = this.dataProviderUI[9][0];
            this.current_changePercent = this.dataProviderUI[22][0];
            this.TINT_AND_ADD_SYMBOLS();
            this.dataTextScope[24].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[24][0],2);
            this.dataTextScope[26].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[26][0],2);
            this.dataTextScope[28].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[28][0],2);
            this.dataTextScope[30].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[30][0],2);
            if(this.dataProviderUI[17][0] == "" || this.dataProviderUI[17][0] == "HIDE_ME")
            {
               this.SET_MOVIECLIP_VISIBILITY(false,0);
            }
            else
            {
               this.SET_MOVIECLIP_VISIBILITY(true,0);
            }
            if(this.dataProviderUI[18][0] == "" || this.dataProviderUI[18][0] == "HIDE_ME")
            {
               this.SET_MOVIECLIP_VISIBILITY(false,1);
            }
            else
            {
               this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_SELL._alpha = 100;
               this.SET_MOVIECLIP_VISIBILITY(true,1);
            }
            this.CONTENT.BOUNDING_BOX._height = 640;
            com.rockstargames.gtav.web.DynamicGraph.draw(this.dataProviderUI[37],this.dataProviderUI[38],this.mcScope.stockViewGraph,11259518);
            _loc2_ = this.mcScope.graphTimeValue;
            _loc2_.autoSize = "left";
            _loc6_ = 90;
            _loc15_ = 33;
            _loc10_ = 709;
            _loc9_ = 548;
            _loc2_._yscale = _loc0_ = 100 * Math.min(_loc6_ / _loc2_.textWidth,1);
            _loc2_._xscale = _loc0_;
            _loc2_._x = _loc10_ - 0.5 * _loc2_._width;
            _loc2_._y = _loc9_ - 0.5 * _loc2_._height;
            break;
         case "STOCK_TRADE_BUY":
            this.mcScope = this.CONTENT.STOCK_TRADE_BUY;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.stockInfoHeader;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.companyAbv;
            this.dataTextScope[7] = this.mcScope.companyName;
            this.dataTextScope[8] = this.mcScope.currentValue;
            this.dataTextScope[9] = this.mcScope.volumeLabel;
            this.dataTextScope[10] = this.mcScope.volumeValue;
            this.dataTextScope[11] = this.mcScope.changeNetValue;
            this.dataTextScope[12] = this.mcScope.sharesValue;
            this.dataTextScope[13] = this.mcScope.sharesLabel;
            this.dataTextScope[14] = this.mcScope.grossSumValue;
            this.dataTextScope[15] = this.mcScope.grossSumLabel;
            this.dataTextScope[16] = this.mcScope.sharesOwnedValue;
            this.dataTextScope[17] = this.mcScope.sharesOwnedLabel;
            this.dataTextScope[18] = this.mcScope.totalInvestedValue;
            this.dataTextScope[19] = this.mcScope.totalInvestedLabel;
            if(this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM == undefined)
            {
               this.mcScope.attachMovie("button_GREEN","WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM",this.mcScope.getNextHighestDepth(),{_x:562,_y:414});
            }
            this.dataTextScope[20] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM.btnTxt;
            this.dataTextScope[21] = this.mcScope.PLUS_BUTTON.btnTxt;
            this.dataTextScope[22] = this.mcScope.MINUS_BUTTON.btnTxt;
            this.dataTextScope[23] = this.mcScope.changePercentValue;
            this.dataTextScope[24] = this.mcScope.highLabel;
            this.dataTextScope[25] = this.mcScope.highValue;
            this.dataTextScope[26] = this.mcScope.lowLabel;
            this.dataTextScope[27] = this.mcScope.lowValue;
            this.dataTextScope[28] = this.mcScope.shareValueLabel;
            this.dataTextScope[29] = this.mcScope.shareValueValue;
            this.ADD_TEXT(this.dataTextScope.length);
            _loc3_ = this.dataProviderUI[6][0];
            _loc7_ = " (" + _loc3_ + ")";
            this.dataTextScope[7].text += _loc7_;
            this.setAndPositionLogo(_loc3_);
            this.dataTextScope[14].text = "$" + Math.ceil(this.dataProviderUI[14][0]);
            this.dataTextScope[18].text = "$" + Math.ceil(this.dataProviderUI[18][0]);
            this.dataTextScope[25].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[25][0],2);
            this.dataTextScope[27].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[27][0],2);
            this.dataTextScope[29].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[29][0],2);
            this.dataTextScope[30] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.stockInfoHeader,"BS_WB_STCKINF");
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.current_value = this.dataProviderUI[8][0];
            this.current_changeNet = this.dataProviderUI[11][0];
            this.current_changePercent = this.dataProviderUI[23][0];
            this.TINT_AND_ADD_SYMBOLS();
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "STOCK_TRADE_SELL":
            this.mcScope = this.CONTENT.STOCK_TRADE_SELL;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.stockInfoHeader;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.companyAbv;
            this.dataTextScope[7] = this.mcScope.companyName;
            this.dataTextScope[8] = this.mcScope.currentValue;
            this.dataTextScope[9] = this.mcScope.volumeLabel;
            this.dataTextScope[10] = this.mcScope.volumeValue;
            this.dataTextScope[11] = this.mcScope.changeNetValue;
            this.dataTextScope[12] = this.mcScope.sharesValue;
            this.dataTextScope[13] = this.mcScope.sharesLabel;
            this.dataTextScope[14] = this.mcScope.grossSumValue;
            this.dataTextScope[15] = this.mcScope.grossSumLabel;
            this.dataTextScope[16] = this.mcScope.sharesOwnedValue;
            this.dataTextScope[17] = this.mcScope.sharesOwnedLabel;
            this.dataTextScope[18] = this.mcScope.totalInvestedValue;
            this.dataTextScope[19] = this.mcScope.totalInvestedLabel;
            if(this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM == undefined)
            {
               this.mcScope.attachMovie("button_RED","WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM",this.mcScope.getNextHighestDepth(),{_x:538.7,_y:409,_width:144.3,_height:33.75});
            }
            this.dataTextScope[20] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM.btnTxt;
            this.dataTextScope[21] = this.mcScope.PLUS_BUTTON.btnTxt;
            this.dataTextScope[22] = this.mcScope.MINUS_BUTTON.btnTxt;
            this.dataTextScope[23] = this.mcScope.changePercentValue;
            this.dataTextScope[24] = this.mcScope.highLabel;
            this.dataTextScope[25] = this.mcScope.highValue;
            this.dataTextScope[26] = this.mcScope.lowLabel;
            this.dataTextScope[27] = this.mcScope.lowValue;
            this.dataTextScope[28] = this.mcScope.shareValueLabel;
            this.dataTextScope[29] = this.mcScope.shareValueValue;
            if(this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM_S_ == undefined)
            {
               this.mcScope.attachMovie("button_RED","WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM_S_",this.mcScope.getNextHighestDepth(),{_x:438,_y:414});
            }
            this.dataTextScope[30] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_TRADE_CONFIRM_S_.btnTxt;
            this.dataTextScope[31] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.stockInfoHeader,"BS_WB_STCKINF");
            _loc3_ = this.dataProviderUI[6][0];
            _loc7_ = " (" + _loc3_ + ")";
            this.dataTextScope[7].text += _loc7_;
            this.setAndPositionLogo(_loc3_);
            this.dataTextScope[14].text = Math.ceil(this.dataProviderUI[14][0]);
            this.dataTextScope[16].text = "$" + Math.ceil(this.dataProviderUI[16][0]);
            this.dataTextScope[18].text = "$" + Math.ceil(this.dataProviderUI[18][0]);
            this.dataTextScope[25].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[25][0],2);
            this.dataTextScope[27].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[27][0],2);
            this.dataTextScope[29].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[29][0],2);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.current_value = this.dataProviderUI[8][0];
            this.current_changeNet = this.dataProviderUI[11][0];
            this.current_changePercent = this.dataProviderUI[23][0];
            this.TINT_AND_ADD_SYMBOLS();
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "STOCK_TRADE_CONFIRM":
            this.mcScope = this.CONTENT.STOCK_TRADE_CONFIRM;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.stockInfoHeader;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.companyAbv;
            this.dataTextScope[7] = this.mcScope.sharesAndCompanyName;
            this.dataTextScope[8] = this.mcScope.currentValue;
            this.dataTextScope[9] = this.mcScope.volumeLabel;
            this.dataTextScope[10] = this.mcScope.volumeValue;
            this.dataTextScope[11] = this.mcScope.changeNetValue;
            this.dataTextScope[13] = this.mcScope.sharesValue;
            this.dataTextScope[14] = this.mcScope.confirmTransaction;
            this.dataTextScope[15] = this.mcScope.costValue;
            this.dataTextScope[16] = this.mcScope.costLabel;
            this.dataTextScope[18] = this.mcScope.WWW_BAWSAQ_COM_S_CONFIRMED.btnTxt;
            this.dataTextScope[19] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_VIEW.btnTxt;
            this.dataTextScope[20] = this.mcScope.changePercentValue;
            this.dataTextScope[21] = this.mcScope.highLabel;
            this.dataTextScope[22] = this.mcScope.highValue;
            this.dataTextScope[23] = this.mcScope.lowLabel;
            this.dataTextScope[24] = this.mcScope.lowValue;
            this.dataTextScope[25] = this.mcScope.shareValueLabel;
            this.dataTextScope[26] = this.mcScope.shareValueValue;
            this.dataTextScope[27] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            this.dataTextScope[15].text = "$" + Math.ceil(this.dataProviderUI[15][0]);
            this.dataTextScope[22].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[22][0],2);
            this.dataTextScope[24].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[24][0],2);
            this.dataTextScope[26].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[26][0],2);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.stockInfoHeader,"BS_WB_STCKINF");
            this.current_value = this.dataProviderUI[8][0];
            this.current_changeNet = this.dataProviderUI[11][0];
            this.current_changePercent = this.dataProviderUI[20][0];
            this.TINT_AND_ADD_SYMBOLS();
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "CONFIRMED":
            this.mcScope = this.CONTENT.CONFIRMED;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_S_.btnTxt;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.companyAbv;
            this.dataTextScope[7] = this.mcScope.sharesAndCompanyName;
            this.dataTextScope[8] = this.mcScope.stockInfoHeader;
            this.dataTextScope[9] = this.mcScope.sharesValue;
            this.dataTextScope[10] = this.mcScope.transactionComplete;
            this.dataTextScope[11] = this.mcScope.costValue;
            this.dataTextScope[12] = this.mcScope.costLabel;
            this.dataTextScope[13] = this.mcScope.currentValue;
            this.dataTextScope[14] = this.mcScope.changeNetValue;
            this.dataTextScope[15] = this.mcScope.changePercentValue;
            this.dataTextScope[16] = this.mcScope.highLabel;
            this.dataTextScope[17] = this.mcScope.highValue;
            this.dataTextScope[18] = this.mcScope.lowLabel;
            this.dataTextScope[19] = this.mcScope.lowValue;
            this.dataTextScope[20] = this.mcScope.volumeLabel;
            this.dataTextScope[21] = this.mcScope.volumeValue;
            this.dataTextScope[22] = this.mcScope.shareValueLabel;
            this.dataTextScope[23] = this.mcScope.shareValueValue;
            this.ADD_TEXT(this.dataTextScope.length);
            _loc4_ = "";
            if(!this.isSellingAll)
            {
               _loc4_ += "$";
            }
            this.dataTextScope[11].text = "$" + Math.ceil(this.dataProviderUI[11][0]);
            this.dataTextScope[17].text = _loc4_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[17][0],2);
            this.dataTextScope[19].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[19][0],2);
            this.dataTextScope[23].text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[23][0],2);
            this.dataTextScope[24] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            if(!this.isSellingAll)
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.stockInfoHeader,"BS_WB_STCKINF");
            }
            else
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.stockInfoHeader,"BS_WB_INVINF");
            }
            this.current_value = this.dataProviderUI[13][0];
            this.current_changeNet = this.dataProviderUI[14][0];
            this.current_changePercent = this.dataProviderUI[15][0];
            this.TINT_AND_ADD_SYMBOLS();
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.isSellingAll = false;
            break;
         case "NEWS":
            this.mcScope = this.CONTENT.NEWS;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.txt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_S_.txt;
            this.dataTextScope[5] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_CITY.btnTxt;
            this.dataTextScope[6] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_MONEY.btnTxt;
            this.dataTextScope[7] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_TECHNOLOGY.btnTxt;
            this.dataTextScope[8] = this.mcScope.header;
            this.dataTextScope[9] = this.mcScope.newsItem1.header;
            this.dataTextScope[10] = this.mcScope.newsItem1.body;
            this.mcScope.newsItem1.body.autoSize = "left";
            this.mcScope.newsItem1.bg._height = this.mcScope.newsItem1.body._y + this.mcScope.newsItem1.body._height + 20;
            this.dataTextScope[11] = this.mcScope.newsItem2.header;
            this.dataTextScope[12] = this.mcScope.newsItem2.body;
            this.mcScope.newsItem2.body.autoSize = "left";
            this.mcScope.newsItem2.bg._height = this.mcScope.newsItem2.body._y + this.mcScope.newsItem2.body._height + 20;
            this.dataTextScope[13] = this.mcScope.newsItem3.header;
            this.dataTextScope[14] = this.mcScope.newsItem3.body;
            this.mcScope.newsItem3.body.autoSize = "left";
            this.mcScope.newsItem3.bg._height = this.mcScope.newsItem3.body._y + this.mcScope.newsItem3.body._height + 20;
            this.dataTextScope[15] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            _loc11_ = new Array("header","newsItem1","newsItem2","newsItem3");
            com.rockstargames.gtav.web.FORMAT_COLUMN.adjustPosition(_loc11_,this.mcScope,2);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            break;
         case "NEWS_CITY":
            this.mcScope = this.CONTENT.NEWS_CITY;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.txt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_S_.btnTxt;
            this.dataTextScope[5] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_CITY.txt;
            this.dataTextScope[6] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_MONEY.btnTxt;
            this.dataTextScope[7] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_TECHNOLOGY.btnTxt;
            this.dataTextScope[8] = this.mcScope.header;
            this.dataTextScope[9] = this.mcScope.newsItem1.header;
            this.dataTextScope[10] = this.mcScope.newsItem1.body;
            this.mcScope.newsItem1.body.autoSize = "left";
            this.mcScope.newsItem1.bg._height = this.mcScope.newsItem1.body._y + this.mcScope.newsItem1.body._height + 20;
            this.dataTextScope[11] = this.mcScope.newsItem2.header;
            this.dataTextScope[12] = this.mcScope.newsItem2.body;
            this.mcScope.newsItem2.body.autoSize = "left";
            this.mcScope.newsItem2.bg._height = this.mcScope.newsItem2.body._y + this.mcScope.newsItem2.body._height + 20;
            this.dataTextScope[13] = this.mcScope.newsItem3.header;
            this.dataTextScope[14] = this.mcScope.newsItem3.body;
            this.mcScope.newsItem3.body.autoSize = "left";
            this.mcScope.newsItem3.bg._height = this.mcScope.newsItem3.body._y + this.mcScope.newsItem3.body._height + 20;
            this.dataTextScope[15] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            _loc11_ = new Array("header","newsItem1","newsItem2","newsItem3");
            com.rockstargames.gtav.web.FORMAT_COLUMN.adjustPosition(_loc11_,this.mcScope,2);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            break;
         case "NEWS_MONEY":
            this.mcScope = this.CONTENT.NEWS_MONEY;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.txt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_S_.btnTxt;
            this.dataTextScope[5] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_CITY.btnTxt;
            this.dataTextScope[6] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_MONEY.txt;
            this.dataTextScope[7] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_TECHNOLOGY.btnTxt;
            this.dataTextScope[8] = this.mcScope.header;
            this.dataTextScope[9] = this.mcScope.newsItem1.header;
            this.dataTextScope[10] = this.mcScope.newsItem1.body;
            this.mcScope.newsItem1.body.autoSize = "left";
            this.dataTextScope[11] = this.mcScope.newsItem2.header;
            this.dataTextScope[12] = this.mcScope.newsItem2.body;
            this.mcScope.newsItem2.body.autoSize = "left";
            this.dataTextScope[13] = this.mcScope.newsItem3.header;
            this.dataTextScope[14] = this.mcScope.newsItem3.body;
            this.mcScope.newsItem3.body.autoSize = "left";
            this.dataTextScope[15] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.mcScope.newsItem1.bg._height = this.mcScope.newsItem1.body._y + this.mcScope.newsItem1.body._height + 20;
            this.mcScope.newsItem2.bg._height = this.mcScope.newsItem2.body._y + this.mcScope.newsItem2.body._height + 20;
            this.mcScope.newsItem3.bg._height = this.mcScope.newsItem3.body._y + this.mcScope.newsItem3.body._height + 20;
            _loc11_ = new Array("header","newsItem1","newsItem2","newsItem3");
            com.rockstargames.gtav.web.FORMAT_COLUMN.adjustPosition(_loc11_,this.mcScope,2);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            break;
         case "NEWS_TECHNOLOGY":
            this.mcScope = this.CONTENT.NEWS_TECHNOLOGY;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.txt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_S_.btnTxt;
            this.dataTextScope[5] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_CITY.btnTxt;
            this.dataTextScope[6] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_MONEY.btnTxt;
            this.dataTextScope[7] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS_TECHNOLOGY.txt;
            this.dataTextScope[8] = this.mcScope.header;
            this.dataTextScope[9] = this.mcScope.newsItem1.header;
            this.dataTextScope[10] = this.mcScope.newsItem1.body;
            this.mcScope.newsItem1.body.autoSize = "left";
            this.mcScope.newsItem1.bg._height = this.mcScope.newsItem1.body._y + this.mcScope.newsItem1.body._height + 20;
            this.dataTextScope[11] = this.mcScope.newsItem2.header;
            this.dataTextScope[12] = this.mcScope.newsItem2.body;
            this.mcScope.newsItem2.body.autoSize = "left";
            this.mcScope.newsItem2.bg._height = this.mcScope.newsItem2.body._y + this.mcScope.newsItem2.body._height + 20;
            this.dataTextScope[13] = this.mcScope.newsItem3.header;
            this.dataTextScope[14] = this.mcScope.newsItem3.body;
            this.mcScope.newsItem3.body.autoSize = "left";
            this.mcScope.newsItem3.bg._height = this.mcScope.newsItem3.body._y + this.mcScope.newsItem3.body._height + 20;
            this.dataTextScope[15] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_NEWS.btnTxt._visible = false;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            _loc11_ = new Array("header","newsItem1","newsItem2","newsItem3");
            com.rockstargames.gtav.web.FORMAT_COLUMN.adjustPosition(_loc11_,this.mcScope,2);
            this.SET_NEW_PAGE_HEIGHT(this.dataTextScope);
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.txt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM.btnTxt._visible = false;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.message;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "STOCK_PORTFOLIO_SELL_D_ALL":
            this.mcScope = this.CONTENT.STOCK_PORTFOLIO_SELL_D_ALL;
            this.isSellingAll = true;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_BAWSAQ_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_BAWSAQ_COM_S_NEWS.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_BAWSAQ_COM_S_LISTINGS.btnTxt;
            this.dataTextScope[3] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO.txt;
            this.dataTextScope[4] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt;
            this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO.btnTxt._visible = false;
            this.dataTextScope[5] = this.mcScope.header;
            this.dataTextScope[6] = this.mcScope.message;
            if(this.mcScope.WWW_BAWSAQ_COM_S_CONFIRMED == undefined)
            {
               this.mcScope.attachMovie("button_GREEN","WWW_BAWSAQ_COM_S_CONFIRMED",this.mcScope.getNextHighestDepth(),{_x:970,_y:360});
            }
            this.dataTextScope[7] = this.mcScope.WWW_BAWSAQ_COM_S_CONFIRMED.btnTxt;
            if(this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_S_ == undefined)
            {
               this.mcScope.attachMovie("button_RED","WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_S_",this.mcScope.getNextHighestDepth(),{_x:848,_y:360});
            }
            this.dataTextScope[8] = this.mcScope.WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_S_.btnTxt;
            this.dataTextScope[9] = this.mcScope.WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO_S_.btnTxt;
            this.ADD_TEXT(this.dataTextScope.length);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
         default:
            return;
      }
   }
   function SET_NEW_PAGE_HEIGHT(data, minHeight)
   {
      var _loc6_ = data.length;
      var _loc5_ = 627;
      if(minHeight && minHeight > 627)
      {
         _loc5_ = minHeight;
      }
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc6_)
      {
         if(this.dataTextScope[_loc2_]._parent != this.mcScope)
         {
            _loc3_ = data[_loc2_]._parent;
            _loc4_ = _loc3_._y + _loc3_._height;
            if(_loc4_ > _loc5_)
            {
               _loc5_ = _loc4_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.BOUNDING_BOX._height = _loc5_;
      this.mcScope.borders._height = _loc5_ + 1;
      this.mcScope.content_background._height = this.mcScope.borders._height;
      if(_loc5_ > 627)
      {
         this.CONTENT.BOUNDING_BOX._height = _loc5_ + 65;
         this.mcScope.borders._height = _loc5_ + 66;
         this.mcScope.content_background._height = this.mcScope.borders._height;
      }
   }
   function customSortAlphaDescending(a, b)
   {
      var _loc2_ = a.split(":")[0];
      var _loc1_ = b.split(":")[0];
      if(_loc2_ < _loc1_)
      {
         return -1;
      }
      if(_loc2_ > _loc1_)
      {
         return 1;
      }
      return 0;
   }
   function customSortAlphaAscending(a, b)
   {
      var _loc2_ = a.split(":")[0];
      var _loc1_ = b.split(":")[0];
      if(_loc2_ < _loc1_)
      {
         return 1;
      }
      if(_loc2_ > _loc1_)
      {
         return -1;
      }
      return 0;
   }
   function customSortNumberDescending(a, b)
   {
      var _loc2_ = parseFloat(a.split(":")[0]);
      var _loc1_ = parseFloat(b.split(":")[0]);
      if(_loc2_ < _loc1_)
      {
         return -1;
      }
      if(_loc2_ > _loc1_)
      {
         return 1;
      }
      return 0;
   }
   function customSortNumberAscending(a, b)
   {
      var _loc2_ = parseFloat(a.split(":")[0]);
      var _loc1_ = parseFloat(b.split(":")[0]);
      if(_loc2_ < _loc1_)
      {
         return 1;
      }
      if(_loc2_ > _loc1_)
      {
         return -1;
      }
      return 0;
   }
   function MAKE_STOCK_LIST(indexStart, dataLength, stocks)
   {
      if(dataLength == indexStart)
      {
         return 0;
      }
      if(stocks != undefined)
      {
         this.stockArray = stocks;
      }
      this.mcScope.SORT_0.onColour = this.mcScope.SORT_0.offColour = 3355443;
      this.mcScope.SORT_2.onColour = this.mcScope.SORT_2.offColour = 3355443;
      this.mcScope.SORT_3.onColour = this.mcScope.SORT_3.offColour = 3355443;
      this.mcScope.SORT_5.onColour = this.mcScope.SORT_5.offColour = 3355443;
      this.mcScope.SORT_6.onColour = this.mcScope.SORT_6.offColour = 3355443;
      if(this.sortSlot == undefined)
      {
         this.sortSlot = 3;
      }
      var _loc9_ = new Array();
      var _loc7_ = 0;
      while(_loc7_ < this.stockArray.length - indexStart)
      {
         _loc9_.push(this.stockArray[_loc7_ + indexStart][this.sortSlot] + ":" + _loc7_);
         _loc7_ = _loc7_ + 1;
      }
      if(this.sortSlot == 3)
      {
         if(this.sortDirection == 1)
         {
            _loc9_.sort(this.customSortAlphaDescending);
         }
         else
         {
            _loc9_.sort(this.customSortAlphaAscending);
         }
      }
      else if(this.sortDirection == 1)
      {
         _loc9_.sort(this.customSortNumberDescending);
      }
      else
      {
         _loc9_.sort(this.customSortNumberAscending);
      }
      var _loc15_ = new Array();
      _loc7_ = 0;
      var _loc14_;
      while(_loc7_ < _loc9_.length)
      {
         _loc14_ = _loc9_[_loc7_];
         _loc15_.push(parseInt(_loc14_.split(":")[1]));
         _loc7_ = _loc7_ + 1;
      }
      _loc9_ = [];
      this.listPositionArray = new Array();
      if(this.container != undefined)
      {
         this.container.removeMovieClip();
      }
      this.container = this.mcScope.createEmptyMovieClip("container",this.mcScope.getNextHighestDepth());
      this.mcScope["slot_" + this.sortSlot]._alpha = 100;
      var _loc21_;
      var _loc20_;
      if(this.mcScope == this.CONTENT.LISTINGS)
      {
         _loc21_ = "STOCKLIST_BUTTON";
         _loc20_ = 820;
      }
      else if(this.mcScope == this.CONTENT.STOCK_PORTFOLIO)
      {
         _loc21_ = "MYSTOCKS_BUTTON";
         _loc20_ = 820;
      }
      this.stockAnchorCharArray = new Array();
      var _loc2_;
      var _loc6_ = 0;
      _loc7_ = 0;
      var _loc3_;
      var _loc10_;
      var _loc19_;
      var _loc13_;
      var _loc4_;
      var _loc12_;
      var _loc5_;
      var _loc11_;
      while(_loc7_ < dataLength - indexStart)
      {
         _loc3_ = _loc15_[_loc7_] + indexStart;
         if(this.stockArray[_loc3_] != undefined && this.stockArray[_loc3_].length > 1)
         {
            _loc2_ = "LISTitem_" + _loc3_;
            if(_loc6_ % 2 == 0)
            {
               this.container.attachMovie("stockItemBG","stockItemBG",this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.lineSpacing * _loc6_ + this.lineYPos,_width:_loc20_});
            }
            this.container.attachMovie(_loc21_,_loc2_,this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.lineSpacing * _loc6_ + this.lineYPos});
            this.dataTextScope[_loc3_] = this.container[_loc2_].btnTxt;
            this.container[_loc2_].onColour = 3355443;
            this.container[_loc2_].offColour = 16777215;
            _loc10_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.stockArray[_loc3_][0],2);
            _loc19_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.stockArray[_loc3_][1],2);
            _loc13_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.stockArray[_loc3_][2],2);
            _loc4_ = this.stockArray[_loc3_][3];
            _loc12_ = this.stockArray[_loc3_][4];
            this.stockAnchorCharArray.push(_loc4_.charAt(0));
            this.listPositionArray.push(new Array(_loc3_,_loc4_,this.container[_loc2_]._y));
            _loc5_ = "";
            if(this.stockArray[_loc3_][5] != undefined)
            {
               _loc5_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.stockArray[_loc3_][5],2).toString();
               _loc5_ += "%";
            }
            _loc11_ = "";
            if(this.stockArray[_loc3_][6] != undefined)
            {
               _loc11_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.stockArray[_loc3_][6],2).toString();
            }
            if(this.stockArray[_loc3_][2] > 0)
            {
               this.container[_loc2_].upDownArrrow._rotation = 0;
               com.rockstargames.ui.utils.Colour.Colourise(this.container[_loc2_].upDownArrrow,102,189,94);
            }
            else
            {
               this.container[_loc2_].upDownArrrow._rotation = 180;
               com.rockstargames.ui.utils.Colour.Colourise(this.container[_loc2_].upDownArrrow,193,53,62);
            }
            if(_loc10_ != undefined)
            {
               this.container[_loc2_].currentValue.text = _loc10_;
            }
            if(_loc13_ != undefined)
            {
               this.container[_loc2_].changeValue.text = _loc13_;
            }
            if(_loc4_ != undefined)
            {
               this.container[_loc2_].btnTxt.text = _loc4_;
            }
            if(_loc12_ != undefined)
            {
               this.container[_loc2_].companyNameMC.companyName.text = _loc12_;
            }
            if(this.container[_loc2_].extraFieldOneValue != undefined)
            {
               this.container[_loc2_].extraFieldOneValue.text = _loc5_;
            }
            if(this.container[_loc2_].extraFieldTwoValue != undefined)
            {
               this.container[_loc2_].extraFieldTwoValue.text = _loc11_;
            }
            _loc6_ = _loc6_ + 1;
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc7_;
   }
   function UPDATE_FIXED_STOCK_LIST(indexStart, listItem)
   {
      var _loc2_;
      var _loc4_ = 0;
      var _loc3_;
      var _loc8_;
      var _loc7_;
      var _loc5_;
      var _loc6_;
      while(_loc4_ < 5)
      {
         _loc3_ = _loc4_ + indexStart;
         if(this.dataProviderUI[_loc3_] != undefined)
         {
            _loc2_ = this.mcScope[listItem + (_loc4_ + 1)];
            _loc8_ = this.dataProviderUI[_loc3_][0];
            _loc7_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[_loc3_][1],2);
            _loc5_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(this.dataProviderUI[_loc3_][2],2);
            _loc2_.btnTxt.text = _loc8_;
            _loc2_.price.text = _loc7_;
            _loc6_ = "";
            if(_loc5_ > 0)
            {
               _loc6_ = "+";
            }
            _loc2_.change.text = _loc6_ + _loc5_;
            if(_loc5_ > 0)
            {
               _loc2_.upDownArrow._rotation = 0;
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.upDownArrow,109,148,55);
               _loc2_.change.textColor = 7181367;
            }
            else
            {
               _loc2_.upDownArrow._rotation = 180;
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_.upDownArrow,217,90,91);
               _loc2_.change.textColor = 14244443;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function ADD_TEXT(numberOfSlots)
   {
      var _loc2_ = 0;
      while(_loc2_ < numberOfSlots)
      {
         if(this.dataProviderUI[_loc2_][0] != undefined)
         {
            if(!isNaN(Number(this.dataProviderUI[_loc2_][0])))
            {
               this.dataTextScope[_loc2_].text = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(this.dataProviderUI[_loc2_][0]),2);
            }
            else if(this.dataProviderUI[_loc2_][0] != "")
            {
               this.dataTextScope[_loc2_].text = this.dataProviderUI[_loc2_][0];
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function TINT_AND_ADD_SYMBOLS()
   {
      var _loc2_;
      if(this.current_changeNet > 0)
      {
         this.mcScope.upDownArrrow._rotation = 0;
         com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.upDownArrrow,109,148,55);
         _loc2_ = 7181367;
      }
      else
      {
         this.mcScope.upDownArrrow._rotation = 180;
         com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.upDownArrrow,217,90,91);
         _loc2_ = 14244443;
      }
      this.mcScope.currentValue.text = "$" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(this.current_value),2);
      if(this.current_changePercent != undefined)
      {
         this.mcScope.changePercentValue.text = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(this.current_changePercent),2) + "%";
      }
      this.mcScope.changeNetValue.textColor = _loc2_;
      this.mcScope.changePercentValue.textColor = _loc2_;
   }
   function setAndPositionLogo(companyAbv)
   {
      if(companyAbv != undefined)
      {
         this.mcScope.companyLogo.gotoAndStop(companyAbv);
      }
      else
      {
         this.mcScope.companyLogo.gotoAndStop("DEFAULT");
      }
      var _loc3_ = 10;
      var _loc4_ = 200;
      var _loc2_ = 100;
      if(this.mcScope.companyLogo._height > this.mcScope.headerBg._height - _loc3_ * 2)
      {
         _loc2_ = (this.mcScope.headerBg._height - _loc3_ * 2) / this.mcScope.companyLogo._height * 100;
         this.mcScope.companyLogo._xscale = this.mcScope.companyLogo._yscale = _loc2_;
      }
      if(this.mcScope.companyLogo._width > _loc4_)
      {
         _loc2_ *= _loc4_ / this.mcScope.companyLogo._width;
         this.mcScope.companyLogo._xscale = this.mcScope.companyLogo._yscale = _loc2_;
      }
      this.mcScope.companyLogo._x = this.mcScope.headerBg._x + this.mcScope.headerBg._width - (this.mcScope.companyLogo._width + _loc3_);
      this.mcScope.companyLogo._y = this.mcScope.headerBg._y + (this.mcScope.headerBg._height / 2 - this.mcScope.companyLogo._height / 2);
   }
   function set_price_text(TF, price)
   {
      if(!price || isNaN(price))
      {
         price = 0;
      }
      var _loc2_ = "$";
      var _loc3_ = price.toString().length;
      var _loc5_ = ",";
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if((_loc3_ - _loc1_) % 3 == 0 && _loc1_ != 0)
         {
            _loc2_ += _loc5_;
         }
         _loc2_ += price.toString().charAt(_loc1_);
         _loc1_ = _loc1_ + 1;
      }
      TF.text = _loc2_;
   }
}
