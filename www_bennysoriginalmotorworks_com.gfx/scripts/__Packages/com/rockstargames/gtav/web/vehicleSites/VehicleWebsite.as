class com.rockstargames.gtav.web.vehicleSites.VehicleWebsite extends com.rockstargames.ui.core.BaseWebsite
{
   var BUY_NOW_LABEL;
   var CAN_STORE_PAGE;
   var CONTENT;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_IMAGE_SUFFIX;
   var FILTER_ALL_LABEL;
   var HOME_PAGE_BODY_LABEL;
   var HOME_PAGE_HEADER_LABEL;
   var LIVERY_HEADER_LABEL;
   var PAGE_NAMES;
   var PURCHASE_PAGE;
   var SORT_PRICE_LABEL;
   var TOOLBAR_LABEL;
   var VEHICLE_BUTTON_ROW_HEIGHT;
   var _name;
   var browser;
   var categoryOrder;
   var currentFilter;
   var currentPage;
   var currentPageInitialised;
   var currentTab;
   var currentVehicle;
   var dataProviderUI;
   var dataTextScope;
   var dropDownButtonOffColour;
   var dropDownButtonOnColour;
   var favourUpperCase;
   var filterDropDown;
   var isMP;
   var playerRank;
   var populateTextCount;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var selectedOption;
   var selectedStyle;
   var sortButtonOffColour;
   var sortButtonOnColour;
   var sortTabOffColour;
   var tabButtons;
   var tabs;
   var textLabelDictionary;
   var vehicleButtonYOffset;
   var vehicleMCs;
   var vehicles;
   var className = "VehicleWebsite";
   var HOME_PAGE = "PAGE1";
   var FAILED_PAGE = "PURCHASE_D_FAILED";
   var ERROR_PAGE = "PURCHASE_D_ERROR";
   var SUCCESS_PAGE = "PURCHASE_D_SUCCESS";
   var HOME_PAGE_VEHICLE_BUTTON_OFFSET = 380;
   var DETAILS_PAGE_VEHICLE_BUTTON_OFFSET = 852;
   var VEHICLE_BUTTON_COLUMNS = [236,512,788];
   var NUM_VEHICLE_BUTTON_COLUMNS = com.rockstargames.gtav.web.vehicleSites.VehicleWebsite.prototype.VEHICLE_BUTTON_COLUMNS.length;
   var VEHICLE_COLOURS = [[204,0,0],[255,0,153],[255,255,0],[253,173,7],[102,204,51],[0,102,204],[25,25,25],[255,255,255]];
   var SORT_FADE_IN_DURATION = 0.5;
   var SORT_FADE_IN_DELAY = 0.1;
   var NUM_COLOUR_OPTIONS = 8;
   var DROP_DOWN_ITEM_SPACING = 39;
   var DROP_DOWN_HEADER_OFFSET = 41;
   var SORT_PRICE = "price";
   var SORT_NEWNESS = "newness";
   var USE_SEPARATE_DETAIL_IMAGES = false;
   var MAX_LIVERIES = 10;
   function VehicleWebsite()
   {
      super();
      _global.gfxExtensions = true;
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeAllTweens();
      this.filterDropDown.dispose();
      this.browser.SUPRESS_HISTORY(false);
      var _loc8_;
      if(pageName.indexOf(this.DETAILS_PAGE) == 0)
      {
         _loc8_ = pageName;
         pageName = this.DETAILS_PAGE;
      }
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(this.currentPage != pageName)
      {
         this.populateTextCount = 1;
         this.currentPageInitialised = false;
         for(var _loc6_ in this.vehicles)
         {
            _loc3_ = this.vehicles[_loc6_];
            _loc2_ = 0;
            _loc4_ = _loc3_.length;
            while(_loc2_ < _loc4_)
            {
               _loc3_[_loc2_].txdRequested = false;
               _loc3_[_loc2_].txdLoaded = false;
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      else if(++this.populateTextCount > 2 && pageName == this.HOME_PAGE)
      {
         return undefined;
      }
      this.currentPage = pageName;
      switch(pageName)
      {
         case this.HOME_PAGE:
            this.initHomePage(newPage);
            break;
         case this.DETAILS_PAGE:
            this.initDetailsPage(_loc8_,newPage);
            break;
         case this.PURCHASE_PAGE:
            this.initPurchasePage();
            break;
         case this.SUCCESS_PAGE:
            this.initSuccessPage(newPage);
            break;
         case this.FAILED_PAGE:
         case this.ERROR_PAGE:
            this.initFailedPage(newPage);
         default:
            return;
      }
   }
   function SET_RANKS(id, rank, playerRank)
   {
      var _loc2_ = this.getVehicleFromId(id);
      if(_loc2_)
      {
         _loc2_.rank = rank;
         this.playerRank = playerRank;
      }
   }
   function SET_PRICES(id, price, secondaryPrice, reductionType, salePrice, secondarySalePrice, award, price1Unlocked, price2Unlocked)
   {
      if(reductionType == undefined)
      {
         reductionType = 0;
      }
      if(salePrice == undefined)
      {
         salePrice = 0;
      }
      if(secondarySalePrice == undefined)
      {
         secondarySalePrice = 0;
      }
      if(award == undefined)
      {
         award = -1;
      }
      var _loc2_ = this.getVehicleFromId(id);
      var _loc4_;
      if(_loc2_)
      {
         _loc2_.price = price;
         _loc2_.secondaryPrice = secondaryPrice;
         _loc2_.reduction = reductionType;
         _loc2_.salePrice = salePrice;
         _loc2_.secondarySalePrice = secondarySalePrice;
         _loc2_.award = award;
         if(_loc2_.securoserv || _loc2_.buyItNow || _loc2_.unlockable)
         {
            _loc2_.price1Unlocked = price1Unlocked;
            _loc2_.price2Unlocked = price2Unlocked;
            if(secondaryPrice == undefined)
            {
               _loc2_.secondaryPrice = -1;
            }
         }
         if(_loc2_ == this.currentVehicle)
         {
            _loc4_ = this.CONTENT.details.priceText || this.CONTENT.purchase.priceText;
            _loc4_.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(this.currentVehicle.price) : this.currentVehicle.price;
         }
      }
      this.pricesSet = true;
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(success)
      {
         _loc4_ = parseInt(id.substring(id.lastIndexOf("_") + 1));
         _loc2_ = this.getVehicleFromId(_loc4_);
         _loc2_.txdLoaded = true;
         if(this.vehicleMCs[_loc2_.id])
         {
            this.displayImage(_loc2_,this.vehicleMCs[_loc2_.id]);
            if(this.tabs.length > 0)
            {
               if(this.vehicleMCs[_loc2_.id]._parent != this.tabs[0])
               {
                  _loc3_ = this.tabs[0][this.vehicleMCs[_loc2_.id]._name];
                  if(_loc3_)
                  {
                     this.displayImage(_loc2_,_loc3_);
                  }
               }
            }
         }
         if(_loc2_ == this.currentVehicle)
         {
            this.displayImage(_loc2_,this.CONTENT.details || this.CONTENT.purchase);
         }
      }
   }
   function CLEANUP()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeAllTweens();
      this.filterDropDown.dispose();
      var _loc5_;
      var _loc3_;
      var _loc4_;
      var _loc2_;
      for(var _loc6_ in this.vehicles)
      {
         _loc5_ = this.vehicles[_loc6_];
         _loc3_ = 0;
         _loc4_ = _loc5_.length;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _loc5_[_loc3_];
            if(_loc2_.txdRequested)
            {
               com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",_loc2_.txd);
               _loc2_.txdRequested = false;
               _loc2_.txdLoaded = false;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      this.CONTENT.gotoAndStop("BLANK");
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.playerRank = 0;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.vehicleMCs = [];
      this.currentPageInitialised = false;
      this.pricesSet = false;
      this.textLabelDictionary = [];
      this.addVehicleNames();
      this.filterVehicles();
      this.addVehicleDefaults();
      this.setCommonPageIDs();
      this.browser.SET_TITLEBAR_TEXT(this.setLocalisedText(this.CONTENT.blank.bodyText,this.TOOLBAR_LABEL),14474460);
      this.CONTENT.home.bodyText.text = "";
      this.currentTab = 0;
   }
   function addVehicleNames()
   {
      for(var _loc2_ in this.vehicles)
      {
         if(_loc2_.charAt(0) == "_" && parseInt(_loc2_.substring(1)).toString() == _loc2_.substring(1))
         {
            this.vehicles[_loc2_].name = _loc2_.substring(1);
         }
         else
         {
            this.vehicles[_loc2_].name = _loc2_;
         }
      }
   }
   function filterVehicles()
   {
   }
   function addVehicleDefaults()
   {
      var _loc8_ = 0;
      var _loc6_ = 0;
      var _loc7_ = this.categoryOrder.length;
      var _loc4_;
      var _loc3_;
      var _loc2_;
      var _loc5_;
      while(_loc6_ < _loc7_)
      {
         _loc4_ = this.vehicles[this.categoryOrder[_loc6_]];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc3_];
            _loc2_.price = -1;
            _loc2_.rank = -1;
            if(_loc2_[this.SORT_NEWNESS] == undefined)
            {
               _loc2_[this.SORT_NEWNESS] = _loc8_++;
            }
            _loc2_.txdLoaded = false;
            _loc2_.txdRequested = false;
            _loc5_ = _loc2_.isGen9 !== true || this.browser.isGen9;
            if(_loc5_)
            {
               this.PAGE_NAMES[_loc2_.id] = this.DETAILS_PAGE + _loc2_.id;
               this.CAN_STORE_PAGE[_loc2_.id] = true;
            }
            else
            {
               this.PAGE_NAMES[_loc2_.id] = undefined;
               this.CAN_STORE_PAGE[_loc2_.id] = false;
               _loc4_.splice(_loc3_,1);
               _loc3_ = _loc3_ - 1;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
   }
   function setCommonPageIDs()
   {
   }
   function getVehicleFromId(id)
   {
      var _loc3_;
      var _loc2_;
      var _loc4_;
      for(var _loc6_ in this.vehicles)
      {
         _loc3_ = this.vehicles[_loc6_];
         _loc2_ = 0;
         _loc4_ = _loc3_.length;
         while(_loc2_ < _loc4_)
         {
            if(_loc3_[_loc2_].id == id)
            {
               return _loc3_[_loc2_];
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return null;
   }
   function formatPrice(value)
   {
      if(value < 0)
      {
         return "";
      }
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "$" : "-$") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   function setLocalisedText(tf, label, forceUpperCase)
   {
      if(this.textLabelDictionary[label] == null)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
         this.textLabelDictionary[label] = !tf.html ? tf.text : tf.htmlText;
      }
      else if(tf.html)
      {
         tf.htmlText = this.textLabelDictionary[label];
      }
      else
      {
         tf.text = this.textLabelDictionary[label];
      }
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      return tf.text;
   }
   function addVehicleImage(vehicle, container)
   {
      var _loc3_;
      if(vehicle.txdLoaded)
      {
         this.displayImage(vehicle,container);
      }
      else if(!vehicle.txdRequested)
      {
         _loc3_ = this.DETAILS_PAGE + "_" + vehicle.id;
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",vehicle.txd,_loc3_,true);
         vehicle.txdRequested = true;
      }
   }
   function displayImage(vehicle, container)
   {
      var _loc6_ = container.vehicleImage._width - 4;
      var _loc5_ = container.vehicleImage._height - 4;
      var _loc2_ = vehicle.name;
      if(vehicle.livery && container._parent == this.CONTENT)
      {
         _loc2_ += "_" + vehicle.livery[Math.max(0,this.selectedOption)];
      }
      else if(vehicle.styles && container._parent == this.CONTENT)
      {
         _loc2_ += "_" + vehicle.styles[Math.max(0,this.selectedStyle)];
      }
      if(this.USE_SEPARATE_DETAIL_IMAGES && this.currentPage != this.HOME_PAGE && container._parent == this.CONTENT)
      {
         _loc2_ += "_" + this.DETAILS_PAGE_IMAGE_SUFFIX;
      }
      container.vehicleImage.htmlText = "<img src=\'img://" + vehicle.txd + "/" + _loc2_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc6_ + "\' height=\'" + _loc5_ + "\'/>";
   }
   function updateBackground(contentItem, page)
   {
      var _loc2_ = Math.max(contentItem._y + this.VEHICLE_BUTTON_ROW_HEIGHT,720);
      page.footer._y = _loc2_;
      this.CONTENT.BOUNDING_BOX._height = page.background._height = _loc2_ + page.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function updateTabbedBackground(contentItem, page)
   {
      var _loc2_ = Math.max(contentItem._y + contentItem._height + 30,720);
      page.footer._y = _loc2_;
      this.CONTENT.BOUNDING_BOX._height = page.background._height = _loc2_ + page.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function goToAnchor(link)
   {
      var _loc4_;
      if(link.indexOf("dropDownItem") == 0)
      {
         _loc4_ = Math.max(0,link.indexOf("_")) || link.length;
      }
      else
      {
         _loc4_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      }
      var _loc5_ = link.slice(0,_loc4_);
      var _loc2_ = link.slice(_loc4_ + 1);
      switch(_loc5_)
      {
         case this.DETAILS_PAGE:
            this.currentVehicle = this.getVehicleFromId(parseInt(_loc2_));
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.DETAILS_PAGE + _loc2_);
            break;
         case this.PURCHASE_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
            break;
         case "priceSortButton":
            this.sortVehicleButtons(this.SORT_PRICE,this.priceSortDirection + 17);
            break;
         case "optionsButton":
            this.setOptionsButtons(parseInt(_loc2_));
            break;
         case "stylesButton":
            this.setStylesButtons(parseInt(_loc2_));
            break;
         case "dropDownHeader":
            this.filterDropDown.toggleOpen();
            break;
         case "dropDownItem":
            this.filterVehicleButtons(_loc2_);
            break;
         case "crossLinkButton":
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.DETAILS_PAGE + this.currentVehicle.crossLink[_loc2_]);
            break;
         case "tab":
            this.showTab(parseInt(_loc2_));
         default:
            return;
      }
   }
   function displayPage(pageName)
   {
      if(pageName == this.currentPage)
      {
         return undefined;
      }
      if(pageName.indexOf(this.DETAILS_PAGE) == 0)
      {
         pageName = "DETAILS";
         this.CONTENT.gotoAndStop("BLANK");
      }
      else if(pageName.indexOf("PURCHASE") == 0)
      {
         pageName = "PURCHASE";
      }
      else
      {
         this.CONTENT.gotoAndStop("BLANK");
      }
      this.CONTENT.gotoAndStop(pageName);
      for(var _loc2_ in this.CONTENT)
      {
         this.CONTENT[_loc2_].priceSortButton._visible = false;
         this.CONTENT[_loc2_].filterDropDown._visible = false;
      }
   }
   function initHomePage(newPage)
   {
      var _loc2_ = this.CONTENT.home;
      if(newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.priceSortDirection = -1;
         this.currentFilter = this.FILTER_ALL_LABEL;
         this.selectedOption = -1;
         this.selectedStyle = -1;
         this.setLocalisedText(_loc2_.headerText,this.HOME_PAGE_HEADER_LABEL);
         this.setLocalisedText(_loc2_.bodyText,this.HOME_PAGE_BODY_LABEL);
         this.initSortingButtons(_loc2_);
         _loc2_.bodyText.textAutoSize = "shrink";
      }
      if(this.pricesSet && !this.currentPageInitialised)
      {
         this.initVehicleButtons(_loc2_,this.HOME_PAGE_VEHICLE_BUTTON_OFFSET);
         _loc2_.filterDropDown.swapDepths(_loc2_.getNextHighestDepth() - 1);
         this.hideUnusedFilterOptions(_loc2_);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         this.currentPageInitialised = true;
      }
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc2_ = this.CONTENT.details;
      this.dataTextScope.length = 0;
      this.priceSortDirection = -1;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.selectedOption = -1;
      this.selectedStyle = -1;
      var _loc8_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc8_);
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,this.currentVehicle.brand,this.favourUpperCase) + " " + this.setLocalisedText(_loc2_.nameText,this.currentVehicle.name,this.favourUpperCase);
      if(this.currentVehicle.price != 0)
      {
         _loc2_.priceText.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(this.currentVehicle.price) : this.currentVehicle.price;
      }
      if(this.currentVehicle.reduction == 3)
      {
         _loc2_.reductionLine._width = _loc2_.priceText.textWidth + 5;
         _loc2_.reducedPriceText._x = _loc2_.priceText._x - _loc2_.priceText.textWidth - 20;
         if(this.currentVehicle.salePrice === 0)
         {
            this.setLocalisedText(_loc2_.reducedPriceText,"CLUB_FREE");
         }
         else
         {
            _loc2_.reducedPriceText.text = !isNaN(this.currentVehicle.salePrice) ? this.formatPrice(this.currentVehicle.salePrice) : this.currentVehicle.salePrice;
         }
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      if(this.currentVehicle.award > 0)
      {
         _loc2_.award.gotoAndStop(this.currentVehicle.award);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.addVehicleImage(this.currentVehicle,_loc2_);
      if(!this.pricesSet)
      {
         _loc2_.options._visible = false;
         _loc2_.purchaseButton._visible = false;
         return undefined;
      }
      if(!newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      _loc2_.options._visible = true;
      _loc2_.purchaseButton._visible = true;
      var _loc4_ = this.initOptions(_loc2_) || 1;
      this.initPurchaseButtons(_loc2_,_loc4_);
      _loc2_.descriptionText.autoSize = "left";
      if(this.currentVehicle.desc)
      {
         this.setLocalisedText(_loc2_.descriptionText,this.currentVehicle.desc);
      }
      else
      {
         this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + this.currentVehicle.name);
      }
      this.initStats(_loc2_);
      _loc2_.options._y = _loc2_.optionsHeaderText._y + _loc2_.optionsHeaderText._height + 5;
      var _loc5_ = !_loc2_.options._visible ? _loc2_.optionsHeaderText._y : _loc2_.options._y + _loc2_.options._height + 5;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc2_[this.PURCHASE_PAGE + "_" + (_loc3_ + 1)]._y = _loc5_;
         _loc3_ = _loc3_ + 1;
      }
      _loc2_.lockedPurchase._y = _loc5_;
      _loc2_.purchaseButton._y = _loc5_;
      _loc2_.descriptionText._y = _loc2_.purchaseButton._y + _loc2_.purchaseButton._height + 16;
      _loc2_.statsHeaderText._y = _loc2_.descriptionText._y + _loc2_.descriptionText._height + 16;
      _loc2_.stats._y = _loc2_.statsHeaderText._y + _loc2_.statsHeaderText._height + 5;
      var _loc7_ = _loc2_.stats._y + _loc2_.stats._height + 20;
      var _loc6_ = 0;
      if(_loc7_ > _loc2_.subHeader._y)
      {
         _loc6_ = _loc7_ - _loc2_.subHeader._y;
         _loc2_.subHeader._y += _loc6_;
         _loc2_.priceSortButton._y += _loc6_;
         _loc2_.filterDropDown._y += _loc6_;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc6_);
      this.initSortingButtons(_loc2_,_loc4_);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
      if(this.currentVehicle.livery)
      {
         this.setOptionsButtons(0);
      }
      else if(this.currentVehicle.styles)
      {
         this.setOptionsButtons(0);
         this.setStylesButtons(0);
      }
   }
   function initStats(page)
   {
   }
   function updateStats(page, selectedStyle)
   {
   }
   function initOptions(page)
   {
      page.optionsHeaderText.autoSize = "left";
      var _loc7_;
      var _loc4_;
      if(this.currentVehicle.styles)
      {
         this.setLocalisedText(page.optionsHeaderText,"LGM_STYLES");
         page.options.gotoAndStop("STYLES");
         _loc7_ = this.NUM_COLOUR_OPTIONS;
         _loc4_ = this.currentVehicle.styles.length;
         while(_loc4_ < 8)
         {
            page.options["stylesText" + _loc4_]._x = page.options["stylesText" + _loc4_]._y = 0;
            page.options["stylesButton_" + _loc4_]._x = page.options["stylesButton_" + _loc4_]._y = 0;
            page.options["stylesButton_" + _loc4_]._visible = false;
            _loc4_ = _loc4_ + 1;
         }
      }
      else if(this.currentVehicle.livery)
      {
         this.setLocalisedText(page.optionsHeaderText,this.LIVERY_HEADER_LABEL);
         page.options.gotoAndStop("LIVERY");
         _loc7_ = this.currentVehicle.livery.length;
         _loc4_ = _loc7_;
         while(_loc4_ < this.MAX_LIVERIES)
         {
            page.options["liveryText" + _loc4_]._x = page.options["liveryText" + _loc4_]._y = 0;
            page.options["optionsButton_" + _loc4_]._x = page.options["optionsButton_" + _loc4_]._y = 0;
            page.options["optionsButton_" + _loc4_]._visible = false;
            _loc4_ = _loc4_ + 1;
         }
      }
      else if(this.currentVehicle.colourways)
      {
         this.setLocalisedText(page.optionsHeaderText,"LGM_COLOUR");
         _loc7_ = this.NUM_COLOUR_OPTIONS;
      }
      else
      {
         page.options._visible = false;
      }
      _loc4_ = 0;
      var _loc3_;
      var _loc6_;
      var _loc8_;
      var _loc5_;
      while(_loc4_ < _loc7_)
      {
         _loc3_ = page.options["optionsButton_" + _loc4_];
         _loc3_.selected._visible = false;
         if(_loc3_.swatch)
         {
            if(this.currentVehicle.swatches)
            {
               _loc6_ = this.currentVehicle.swatches[_loc4_] >> 16 & 0xFF;
               _loc8_ = this.currentVehicle.swatches[_loc4_] >> 8 & 0xFF;
               _loc5_ = this.currentVehicle.swatches[_loc4_] & 0xFF;
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.swatch,_loc6_,_loc8_,_loc5_,100);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.swatch,this.VEHICLE_COLOURS[_loc4_][0],this.VEHICLE_COLOURS[_loc4_][1],this.VEHICLE_COLOURS[_loc4_][2],100);
               if(_loc3_.outline)
               {
                  _loc3_.outline._visible = _loc4_ == 6;
               }
            }
         }
         if(this.currentVehicle.livery)
         {
            this.setLocalisedText(page.options["liveryText" + _loc4_],this.currentVehicle.livery[_loc4_]);
         }
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc4_ = _loc4_ + 1;
      }
      if(this.currentVehicle.styles)
      {
         _loc4_ = 0;
         while(_loc4_ < this.currentVehicle.styles.length)
         {
            this.setLocalisedText(page.options["stylesText" + _loc4_],this.currentVehicle.styles[_loc4_]);
            this.dataTextScope.push(page.options["stylesButton_" + _loc4_].btnTxt);
            _loc4_ = _loc4_ + 1;
         }
         _loc7_ = this.currentVehicle.styles.length * this.NUM_COLOUR_OPTIONS;
      }
      return _loc7_;
   }
   function initPurchaseButtons(page, numOptions)
   {
      var _loc2_;
      var _loc4_ = page.purchaseButton;
      var _loc3_ = numOptions - 1;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc4_.duplicateMovieClip(this.PURCHASE_PAGE + "_" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc4_._x,_y:_loc4_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         if(this.currentVehicle.unlockable && !this.currentVehicle.price1Unlocked)
         {
            _loc2_._name = "lockedPurchase";
         }
         else
         {
            _loc2_.padlock._visible = false;
         }
         this.setLocalisedText(_loc2_.btnTxt,this.BUY_NOW_LABEL);
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc4_._visible = false;
   }
   function initPurchasePage()
   {
      var _loc2_ = "";
      var _loc3_ = "";
      this.initOutcomePage(_loc2_,_loc3_,"WEB_SOLD");
   }
   function initSuccessPage(newPage)
   {
      var _loc2_ = "";
      var _loc3_ = this.setLocalisedText(this.CONTENT.purchase.bodyText,this.DESCRIPTION_LABEL_PREFIX + "PURCHASED");
      this.initOutcomePage(_loc2_,_loc3_,"WEB_SOLD");
      this.showOutcomePageMessage();
   }
   function initFailedPage(newPage)
   {
      var _loc2_;
      var _loc3_;
      if(!newPage)
      {
         _loc2_ = this.dataProviderUI[1][0];
         _loc3_ = this.dataProviderUI[2][0];
         this.initOutcomePage(_loc2_,_loc3_,"WEB_NOT_SOLD");
         this.showOutcomePageMessage();
      }
   }
   function initOutcomePage(headerText, bodyText, soldLabel)
   {
      var _loc2_ = this.CONTENT.purchase;
      this.dataTextScope.length = 0;
      var _loc3_ = this.selectedStyle <= 0 ? this.currentVehicle.price : this.currentVehicle.secondaryPrice;
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,this.currentVehicle.brand,this.favourUpperCase) + " " + this.setLocalisedText(_loc2_.nameText,this.currentVehicle.name,this.favourUpperCase);
      _loc2_.priceText.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(_loc3_) : this.currentVehicle.price;
      var _loc4_;
      if(this.currentVehicle.reduction == 3)
      {
         _loc2_.priceText.text = this.formatPrice(_loc3_);
         _loc2_.reductionLine._width = _loc2_.priceText.textWidth + 5;
         _loc2_.reducedPriceText._x = _loc2_.priceText._x - _loc2_.priceText.textWidth - 20;
         _loc4_ = this.selectedStyle <= 0 ? this.currentVehicle.salePrice : this.currentVehicle.secondarySalePrice;
         _loc2_.reducedPriceText.text = this.formatPrice(_loc4_);
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      this.addVehicleImage(this.currentVehicle,_loc2_);
      this.initSelectedOption(_loc2_);
      _loc2_.waitingText.autoSize = "left";
      this.setLocalisedText(_loc2_.waitingText,this.DESCRIPTION_LABEL_PREFIX + "WAITING_TO_PURCHASE");
      this.setLocalisedText(_loc2_.soldText,soldLabel);
      _loc2_.soldText._alpha = 0;
      _loc2_.headerText.autoSize = "left";
      _loc2_.headerText.text = headerText;
      _loc2_.headerText._alpha = 0;
      _loc2_.bodyText.autoSize = "left";
      _loc2_.bodyText.text = bodyText;
      _loc2_.bodyText._alpha = 0;
      if(_loc2_.headerText.length > 0)
      {
         _loc2_.bodyText._y = _loc2_.headerText._y + _loc2_.headerText._height + 5;
      }
      else
      {
         _loc2_.bodyText._y = _loc2_.headerText._y;
      }
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.CONTENT.BOUNDING_BOX._height = _loc2_.background._height = _loc2_.footer._y + _loc2_.footer._height;
      if(_loc2_.panel)
      {
         _loc2_.panel._height = _loc2_.background._height - _loc2_.panel._y - _loc2_.footer._height;
      }
      this.browser.RESIZE_WEBSITE();
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initSelectedOption(page)
   {
      var _loc3_;
      var _loc5_;
      var _loc6_;
      var _loc4_;
      if(this.selectedOption == -1)
      {
         page.selectedOption._visible = false;
      }
      else if(this.currentVehicle.livery)
      {
         page.selectedOption.gotoAndStop("LIVERY");
         this.setLocalisedText(page.selectedOption.liveryText,this.currentVehicle.livery[this.selectedOption]);
         page.selectedOption.liveryText.shadowAlpha = 1;
         page.selectedOption.liveryText.shadowDistance = 2;
         page.selectedOption.liveryText.shadowStrength = 1.5;
      }
      else if(this.currentVehicle.colourways)
      {
         _loc3_ = page.selectedOption.optionsButton;
         _loc3_.selected._visible = false;
         if(this.currentVehicle.swatches)
         {
            _loc5_ = this.currentVehicle.swatches[this.selectedOption] >> 16 & 0xFF;
            _loc6_ = this.currentVehicle.swatches[this.selectedOption] >> 8 & 0xFF;
            _loc4_ = this.currentVehicle.swatches[this.selectedOption] & 0xFF;
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_.swatch,_loc5_,_loc6_,_loc4_,100);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_.swatch,this.VEHICLE_COLOURS[this.selectedOption][0],this.VEHICLE_COLOURS[this.selectedOption][1],this.VEHICLE_COLOURS[this.selectedOption][2],100);
         }
      }
   }
   function showOutcomePageMessage()
   {
      var _loc2_ = this.CONTENT.purchase;
      _loc2_.soldText._alpha = 100;
      _loc2_.bodyText._alpha = 100;
      _loc2_.headerText._alpha = 100;
      _loc2_.priceText._visible = false;
      _loc2_.waitingText._visible = false;
      _loc2_.reductionLine._visible = false;
      _loc2_.reducedPriceText._visible = false;
   }
   function initVehicleButtons(page, yOffset)
   {
      this.vehicleButtonYOffset = yOffset;
      this.vehicleMCs.length = 0;
      var _loc4_ = 0;
      var _loc21_ = true;
      var _loc8_ = 0;
      var _loc20_ = this.categoryOrder.length;
      var _loc6_;
      var _loc16_;
      var _loc7_;
      var _loc12_;
      var _loc2_;
      var _loc11_;
      var _loc15_;
      var _loc9_;
      var _loc10_;
      var _loc14_;
      var _loc13_;
      var _loc5_;
      while(_loc8_ < _loc20_)
      {
         _loc6_ = this.vehicles[this.categoryOrder[_loc8_]];
         _loc16_ = true;
         _loc7_ = 0;
         _loc12_ = _loc6_.length;
         while(_loc7_ < _loc12_)
         {
            _loc2_ = _loc6_[_loc7_];
            _loc11_ = this.DETAILS_PAGE + "_" + _loc2_.id;
            if(_loc2_.price != -1 && page[_loc11_] == undefined)
            {
               _loc16_ = false;
               break;
            }
            _loc7_ = _loc7_ + 1;
         }
         if(!_loc16_)
         {
            if(_loc21_)
            {
               if(page.subHeaderText)
               {
                  this.setLocalisedText(page.subHeaderText,this.categoryOrder[_loc8_],this.favourUpperCase);
               }
               else if(page.subHeader && page.subHeader.subHeaderText)
               {
                  this.setLocalisedText(page.subHeader.subHeaderText,this.categoryOrder[_loc8_],this.favourUpperCase);
               }
            }
            else
            {
               _loc15_ = page.attachMovie("subHeader","subHeader" + _loc8_,page.getNextHighestDepth());
               this.setLocalisedText(_loc15_.subHeaderText,this.categoryOrder[_loc8_],this.favourUpperCase);
               _loc4_ += (this.NUM_VEHICLE_BUTTON_COLUMNS - _loc4_ % this.NUM_VEHICLE_BUTTON_COLUMNS) % this.NUM_VEHICLE_BUTTON_COLUMNS;
               _loc15_._y = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc4_ / this.NUM_VEHICLE_BUTTON_COLUMNS) + yOffset;
               yOffset += _loc15_._height + 20;
            }
            _loc21_ = false;
            _loc7_ = 0;
            _loc12_ = _loc6_.length;
            while(_loc7_ < _loc12_)
            {
               _loc2_ = _loc6_[_loc7_];
               _loc11_ = this.DETAILS_PAGE + "_" + _loc2_.id;
               _loc9_ = false;
               if(_loc2_.hideForCrossLink)
               {
                  if(_loc2_.crossLink[0] != _loc2_.id)
                  {
                     _loc10_ = this.getVehicleFromId(_loc2_.crossLink[0]);
                  }
                  else
                  {
                     _loc10_ = this.getVehicleFromId(_loc2_.crossLink[1]);
                  }
                  if(_loc10_)
                  {
                     _loc9_ = _loc10_.price != -1;
                  }
               }
               if(_loc2_.price != -1 && page[_loc11_] == undefined && !_loc9_)
               {
                  _loc14_ = this.VEHICLE_BUTTON_COLUMNS[_loc4_ % this.NUM_VEHICLE_BUTTON_COLUMNS];
                  _loc13_ = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc4_ / this.NUM_VEHICLE_BUTTON_COLUMNS) + yOffset;
                  _loc5_ = this.initVehicleButton(_loc2_,page,_loc14_,_loc13_);
                  _loc5_._alpha = 0;
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,this.SORT_FADE_IN_DURATION,{_alpha:100,delay:this.SORT_FADE_IN_DELAY * _loc4_});
                  this.vehicleMCs[_loc2_.id] = _loc5_;
                  _loc4_ = _loc4_ + 1;
               }
               _loc7_ = _loc7_ + 1;
            }
         }
         _loc8_ = _loc8_ + 1;
      }
      this.updateBackground(_loc5_,page);
   }
   function initTabbedVehicleButtons(page, yOffset)
   {
      this.tabs = [];
      this.tabButtons = [];
      this.vehicleButtonYOffset = yOffset;
      this.vehicleMCs.length = 0;
      var _loc16_ = 0;
      var _loc20_ = 231;
      var _loc15_ = 0;
      var _loc19_ = this.categoryOrder.length;
      var _loc18_;
      var _loc10_;
      var _loc17_;
      var _loc11_;
      var _loc7_;
      var _loc4_;
      var _loc13_;
      var _loc2_;
      var _loc12_;
      var _loc5_;
      var _loc6_;
      var _loc9_;
      var _loc8_;
      var _loc3_;
      while(_loc15_ < _loc19_)
      {
         _loc18_ = this.categoryOrder[_loc15_];
         _loc10_ = this.vehicles[_loc18_];
         if(_loc10_.length > 0)
         {
            _loc17_ = this.initTabButton(page,_loc18_,_loc16_,_loc20_,yOffset - 5);
            _loc20_ += _loc17_._width;
            _loc11_ = page.createEmptyMovieClip("tabContent" + _loc16_,page.getNextHighestDepth());
            _loc11_._x = 0;
            _loc11_._y = yOffset + _loc17_._height;
            this.tabs[_loc16_] = _loc11_;
            _loc16_ = _loc16_ + 1;
            _loc7_ = 0;
            _loc4_ = 0;
            _loc13_ = _loc10_.length;
            while(_loc4_ < _loc13_)
            {
               _loc2_ = _loc10_[_loc4_];
               _loc12_ = this.DETAILS_PAGE + "_" + _loc2_.id;
               _loc5_ = false;
               if(_loc2_.hideForCrossLink)
               {
                  if(_loc2_.crossLink[0] != _loc2_.id)
                  {
                     _loc6_ = this.getVehicleFromId(_loc2_.crossLink[0]);
                  }
                  else
                  {
                     _loc6_ = this.getVehicleFromId(_loc2_.crossLink[1]);
                  }
                  if(_loc6_)
                  {
                     _loc5_ = _loc6_.price != -1;
                  }
               }
               if(_loc2_.price != -1 && page[_loc12_] == undefined && !_loc5_)
               {
                  if(_loc2_.price == undefined)
                  {
                     _loc2_.sortingPrice = 0;
                  }
                  else
                  {
                     _loc2_.sortingPrice = _loc2_.reduction != 3 ? _loc2_.price : _loc2_.salePrice;
                  }
                  _loc9_ = this.VEHICLE_BUTTON_COLUMNS[_loc7_ % this.NUM_VEHICLE_BUTTON_COLUMNS];
                  _loc8_ = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc7_ / this.NUM_VEHICLE_BUTTON_COLUMNS);
                  _loc3_ = this.initVehicleButton(_loc2_,_loc11_,_loc9_,_loc8_);
                  _loc3_.originalX = _loc9_;
                  _loc3_.originalY = _loc8_;
                  this.vehicleMCs[_loc2_.id] = _loc3_;
                  _loc7_ = _loc7_ + 1;
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         _loc15_ = _loc15_ + 1;
      }
      this.showTab(this.currentTab);
   }
   function sortTab(sortingAttribute, direction)
   {
      if(sortingAttribute == "price")
      {
         sortingAttribute = "sortingPrice";
      }
      var _loc11_ = this.categoryOrder[this.currentTab];
      var _loc5_;
      var _loc4_;
      var _loc3_;
      var _loc7_;
      var _loc2_ = new Array();
      _loc7_ = this.vehicles[_loc11_].length;
      _loc3_ = 0;
      len = _loc7_;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = this.vehicles[_loc11_][_loc3_];
         if(_loc4_.price > -1 || _loc4_.price == "FREE")
         {
            _loc2_.push(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc8_;
      if(sortingAttribute == "sortingPrice")
      {
         _loc2_.sortOn(sortingAttribute,direction);
         var len = _loc2_.length;
         _loc8_ = 0;
         if(direction == 16)
         {
            while(typeof _loc2_[len - 1].sortingPrice == "string")
            {
               _loc2_.unshift(_loc2_.pop());
               if((_loc8_ = _loc8_ + 1) == len)
               {
                  break;
               }
            }
         }
         else if(direction == 18)
         {
            while(typeof _loc2_[0].sortingPrice == "string")
            {
               _loc2_.push(_loc2_.shift());
               if((_loc8_ = _loc8_ + 1) == len)
               {
                  break;
               }
            }
         }
      }
      else
      {
         _loc2_.sort(function(a, b)
         {
            if(isNaN(a[sortingAttribute]))
            {
               return -1;
            }
            if(isNaN(b[sortingAttribute]))
            {
               return 1;
            }
            return a[sortingAttribute] >= b[sortingAttribute] ? 1 : -1;
         }
         ,direction);
      }
      _loc3_ = 0;
      var len = _loc2_.length;
      var _loc6_;
      while(_loc3_ < len)
      {
         _loc4_ = _loc2_[_loc3_];
         _loc6_ = this.vehicleMCs[_loc4_.id];
         _loc5_ = this.tabs[this.currentTab][_loc6_._name];
         _loc5_._x = this.VEHICLE_BUTTON_COLUMNS[_loc3_ % this.NUM_VEHICLE_BUTTON_COLUMNS];
         _loc5_._y = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc3_ / this.NUM_VEHICLE_BUTTON_COLUMNS);
         _loc5_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,this.SORT_FADE_IN_DURATION,{_alpha:100,delay:this.SORT_FADE_IN_DELAY * _loc3_});
         _loc3_ = _loc3_ + 1;
      }
      var _loc12_ = _loc5_._parent._parent;
      var _loc14_;
      if(sortingAttribute == "sortingPrice")
      {
         this.priceSortDirection = - this.priceSortDirection;
         _loc14_ = this.priceSortDirection != 1 ? "DOWN" : "UP";
         _loc12_.priceSortButton.arrow.gotoAndStop(_loc14_);
      }
      else
      {
         _loc12_.priceSortButton.arrow.gotoAndStop("UNSET");
      }
   }
   function unsortTab()
   {
      var _loc10_ = this.categoryOrder[this.currentTab];
      var _loc2_;
      var _loc3_;
      var _loc4_;
      var _loc7_;
      var _loc5_ = new Array();
      _loc7_ = this.vehicles[_loc10_].length;
      _loc4_ = 0;
      len = _loc7_;
      while(_loc4_ < _loc7_)
      {
         _loc3_ = this.vehicles[_loc10_][_loc4_];
         if(_loc3_.price > -1 || _loc3_.price == "FREE")
         {
            _loc5_.push(_loc3_);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      var len = _loc5_.length;
      var _loc6_;
      while(_loc4_ < len)
      {
         _loc3_ = _loc5_[_loc4_];
         _loc6_ = this.vehicleMCs[_loc3_.id];
         _loc2_ = this.tabs[this.currentTab][_loc6_._name];
         _loc2_._x = _loc2_.originalX;
         _loc2_._y = _loc2_.originalY;
         _loc2_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,this.SORT_FADE_IN_DURATION,{_alpha:100,delay:this.SORT_FADE_IN_DELAY * _loc4_});
         _loc4_ = _loc4_ + 1;
      }
      var _loc11_ = _loc2_._parent._parent;
      _loc11_.priceSortButton.arrow.gotoAndStop("UNSET");
   }
   function initTabButton(page, label, index, x, y)
   {
      var _loc2_ = page.attachMovie("tab","tab_" + index,page.getNextHighestDepth());
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.onColour = this.sortButtonOnColour;
      _loc2_.offColour = this.sortButtonOffColour;
      _loc2_.btnTxt.verticalAlign = "center";
      this.setLocalisedText(_loc2_.btnTxt,label,this.favourUpperCase);
      this.dataTextScope.push(_loc2_.btnTxt);
      this.tabButtons.push(_loc2_);
      return _loc2_;
   }
   function showTab(index)
   {
      var _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < this.tabs.length)
      {
         if(_loc3_ == index)
         {
            this.tabs[_loc3_]._parent.priceSortButton.arrow.gotoAndStop("UNSET");
            this.tabs[_loc3_]._visible = true;
            this.tabs[_loc3_]._xscale = 100;
            this.tabs[_loc3_]._yscale = 100;
            this.tabs[_loc3_]._x = 0;
            this.tabButtons[_loc3_].offColour = this.sortTabOffColour;
            this.tabButtons[_loc3_].disabled = true;
            this.tabButtons[_loc3_].highlight._visible = true;
         }
         else
         {
            this.tabs[_loc3_]._visible = false;
            this.tabs[_loc3_]._xscale = 0;
            this.tabs[_loc3_]._yscale = 0;
            this.tabs[_loc3_]._x = -1000;
            this.tabButtons[_loc3_].offColour = this.sortButtonOffColour;
            this.tabButtons[_loc3_].disabled = false;
            this.tabButtons[_loc3_].highlight._visible = false;
         }
         _loc4_ = this.tabButtons[_loc3_];
         if(_loc4_.hitTest(_root._xmouse,_root._ymouse,true))
         {
            this.tabButtons[_loc3_].btnTxt.textColor = this.sortButtonOnColour;
            this.tabButtons[_loc3_].gotoAndStop("ON");
         }
         else
         {
            this.tabButtons[_loc3_].btnTxt.textColor = this.sortButtonOffColour;
            this.tabButtons[_loc3_].gotoAndStop("OFF");
         }
         _loc3_ = _loc3_ + 1;
      }
      this.updateTabbedBackground(this.tabs[index],this.tabs[index]._parent);
      this.currentTab = index;
      this.unsortTab();
      var _loc6_;
      if(this.currentPage.indexOf("DETAILS") > 0)
      {
         _loc6_ = this.CONTENT.BOUNDING_BOX._height + this.CONTENT._y - 627;
         if(_loc6_ < 0)
         {
            this.browser.SCROLL_WEBPAGE_PIXELS(_loc6_);
         }
      }
      else
      {
         this.browser.SCROLL_WEBPAGE_PIXELS(this.CONTENT._y);
      }
   }
   function initVehicleButton(vehicle, container, x, y)
   {
      var _loc4_ = this.DETAILS_PAGE + "_" + vehicle.id;
      var _loc2_ = container.attachMovie("vehicleButton",_loc4_,container.getNextHighestDepth());
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.btnTxt.text = this.setLocalisedText(_loc2_.btnTxt,vehicle.brand,true) + (_loc2_.btnTxt.text.length <= 0 ? "" : " ") + this.setLocalisedText(_loc2_.btnTxt,vehicle.name,true);
      _loc2_.header.seatsText.text = vehicle.seats;
      if(vehicle.price == 0)
      {
         _loc2_.outOfStock.outOfStockText.textAutoSize = "shrink";
         _loc2_.outOfStock.outOfStockText.autoSize = "center";
         this.setLocalisedText(_loc2_.outOfStock.outOfStockText,"WEB_OUTOFSTOCK",this.favourUpperCase);
      }
      else
      {
         _loc2_.outOfStock._visible = false;
         _loc2_.priceText.text = !isNaN(vehicle.price) ? this.formatPrice(vehicle.price) : vehicle.price;
         if(vehicle.secondaryPrice && vehicle.secondaryPrice != -1)
         {
            if(vehicle.secondaryPrice != vehicle.price)
            {
               _loc2_.priceText.text += " - " + this.formatPrice(vehicle.secondaryPrice);
            }
         }
      }
      if(vehicle.reduction)
      {
         _loc2_.promo.labelText.textAutoSize = "shrink";
         _loc2_.promo.labelText.verticalAlign = "center";
         switch(vehicle.reduction)
         {
            case 1:
               _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_CASH_BACK") + "</B>";
               break;
            case 2:
               _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_REBATE") + "</B>";
               break;
            case 3:
               _loc2_.promo.gotoAndStop("sale");
               _loc2_.promo.line._width = _loc2_.priceText.textWidth + 5;
               if(vehicle.secondarySalePrice > 0)
               {
                  if(vehicle.salePrice == vehicle.secondarySalePrice)
                  {
                     _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_SALE") + "</B>: " + this.formatPrice(vehicle.salePrice);
                     break;
                  }
                  _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_SALE") + "</B>: " + this.formatPrice(vehicle.salePrice) + " - " + this.formatPrice(vehicle.secondarySalePrice);
                  break;
               }
               if(vehicle.salePrice == 0)
               {
                  _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_SALE") + "</B> - " + this.setLocalisedText(_loc2_.promo.labelText,"CLUB_FREE");
                  break;
               }
               _loc2_.promo.labelText.htmlText = "<B>" + this.setLocalisedText(_loc2_.promo.labelText,"WEB_VEHICLE_SALE") + "</B> - " + this.formatPrice(vehicle.salePrice);
         }
      }
      else
      {
         _loc2_.promo._visible = false;
      }
      if(vehicle.award > 0)
      {
         _loc2_.award.gotoAndStop(vehicle.award);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      var _loc5_ = _loc2_.btnTxt._width - _loc2_.priceText.textWidth - 10;
      if(_loc2_.btnTxt.textWidth > _loc5_)
      {
         _loc4_ = _loc2_.btnTxt.text + "...";
         while(_loc2_.btnTxt.textWidth > _loc5_)
         {
            _loc4_ = _loc4_.slice(0,-4) + "...";
            _loc2_.btnTxt.text = _loc4_;
         }
      }
      if(vehicle.dlc)
      {
         _loc2_.header.dlcText.textAutoSize = "shrink";
         _loc2_.header.dlcText.verticalAlign = "center";
         this.setLocalisedText(_loc2_.header.dlcText,vehicle.dlc,true);
      }
      var _loc6_;
      var _loc7_;
      if(_loc2_.priceBG)
      {
         if(vehicle.price == 0)
         {
            _loc2_.priceBG._visible = false;
         }
         else
         {
            _loc6_ = _loc2_.priceBG._x + _loc2_.priceBG._width;
            _loc7_ = _loc2_.priceText.textWidth + 10;
            _loc2_.priceBG.centre._width = _loc7_ - 10;
            _loc2_.priceBG.right._x = _loc2_.priceBG.centre._x + _loc2_.priceBG.centre._width - 5;
            _loc2_.priceBG._x = _loc6_ - _loc2_.priceBG._width;
            _loc2_.priceBG._visible = true;
         }
      }
      this.addVehicleImage(vehicle,_loc2_);
      if(this.isMP && vehicle.rank > this.playerRank)
      {
         _loc2_.rankText.textAutoSize = "shrink";
         _loc2_.rankText.text = vehicle.rank;
      }
      else
      {
         if(vehicle.price != 0)
         {
            this.dataTextScope.push(_loc2_.btnTxt);
         }
         _loc2_.rank._visible = false;
      }
      return _loc2_;
   }
   function initSortingButtons(page, numOptions)
   {
      page.priceSortButton.onColour = this.sortButtonOnColour;
      page.priceSortButton.offColour = this.sortButtonOffColour;
      page.priceSortButton.btnTxt.textAutoSize = "shrink";
      page.priceSortButton.btnTxt.verticalAlign = "center";
      page.priceSortButton._visible = true;
      this.dataTextScope.push(page.priceSortButton.btnTxt);
      this.setLocalisedText(page.priceSortButton.btnTxt,this.SORT_PRICE_LABEL);
      var _loc2_;
      var _loc3_;
      if(this.categoryOrder.length > 2 && !this.isMP)
      {
         this.filterDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(page.filterDropDown,"dropDownItem","SELECT",this.DROP_DOWN_ITEM_SPACING,this.DROP_DOWN_HEADER_OFFSET,this.dropDownButtonOnColour,this.dropDownButtonOffColour);
         this.dataTextScope.push(page.filterDropDown.dropDownHeader.btnTxt);
         this.dataTextScope.splice(numOptions,0,this.filterDropDown.addItem(this.FILTER_ALL_LABEL).btnTxt);
         _loc2_ = 0;
         _loc3_ = this.categoryOrder.length;
         while(_loc2_ < _loc3_)
         {
            this.dataTextScope.splice(numOptions + _loc2_ + 1,0,this.filterDropDown.addItem(this.categoryOrder[_loc2_]).btnTxt);
            _loc2_ = _loc2_ + 1;
         }
         page.filterDropDown.swapDepths(page.getNextHighestDepth() - 1);
         page.filterDropDown._visible = true;
      }
      else
      {
         page.priceSortButton._x = page.filterDropDown._x;
      }
   }
   function hideUnusedFilterOptions(page)
   {
      var _loc6_;
      var _loc9_;
      var _loc5_;
      var _loc7_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      var _loc8_;
      if(this.categoryOrder.length > 2)
      {
         _loc6_ = 0;
         _loc9_ = this.categoryOrder.length;
         while(_loc6_ < _loc9_)
         {
            _loc5_ = this.vehicles[this.categoryOrder[_loc6_]];
            _loc7_ = true;
            _loc2_ = 0;
            _loc4_ = _loc5_.length;
            while(_loc2_ < _loc4_)
            {
               _loc3_ = _loc5_[_loc2_];
               _loc8_ = this.DETAILS_PAGE + "_" + _loc3_.id;
               if(_loc3_.price != -1)
               {
                  _loc7_ = false;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            if(_loc7_)
            {
               this.filterDropDown.hideItemAt(_loc6_ + 1);
            }
            _loc6_ = _loc6_ + 1;
         }
      }
   }
   function setOptionsButtons(selectedOption)
   {
      var _loc6_ = this.CONTENT.details;
      var _loc7_ = !this.currentVehicle.livery ? this.NUM_COLOUR_OPTIONS : this.currentVehicle.livery.length;
      var _loc2_ = 0;
      var _loc5_;
      while(_loc2_ < _loc7_)
      {
         _loc5_ = _loc6_.options["optionsButton_" + _loc2_];
         _loc5_.disabled = _loc2_ == selectedOption;
         _loc5_.selected._visible = _loc2_ == selectedOption;
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = selectedOption;
      if(this.currentVehicle.styles)
      {
         _loc7_ *= this.currentVehicle.styles.length;
         _loc9_ += this.NUM_COLOUR_OPTIONS * Math.max(0,this.selectedStyle);
      }
      _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc7_)
      {
         _loc3_ = _loc6_[this.PURCHASE_PAGE + "_" + (_loc2_ + 1)];
         _loc4_ = _loc9_ == _loc2_;
         _loc3_.disabled = !_loc4_;
         _loc3_._alpha = !_loc4_ ? 50 : 100;
         _loc3_._visible = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      this.selectedOption = selectedOption;
      if(this.currentVehicle.livery || this.currentVehicle.styles)
      {
         this.addVehicleImage(this.currentVehicle,_loc6_);
      }
   }
   function setStylesButtons(selectedStyle)
   {
      var _loc6_ = this.CONTENT.details;
      var _loc8_ = this.currentVehicle.styles.length;
      var _loc2_ = 0;
      var _loc5_;
      while(_loc2_ < _loc8_)
      {
         _loc5_ = _loc6_.options["stylesButton_" + _loc2_];
         _loc5_.disabled = _loc2_ == selectedStyle;
         _loc5_.selected._visible = _loc2_ == selectedStyle;
         _loc2_ = _loc2_ + 1;
      }
      var _loc10_ = _loc8_ * this.NUM_COLOUR_OPTIONS;
      var _loc9_ = this.NUM_COLOUR_OPTIONS * selectedStyle + Math.max(this.selectedOption,0);
      _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc10_)
      {
         _loc3_ = _loc6_[this.PURCHASE_PAGE + "_" + (_loc2_ + 1)];
         _loc4_ = _loc9_ == _loc2_;
         _loc3_.disabled = !_loc4_;
         _loc3_._alpha = !_loc4_ ? 50 : 100;
         _loc3_._visible = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      this.selectedStyle = selectedStyle;
      this.addVehicleImage(this.currentVehicle,_loc6_);
      var _loc11_ = this.currentVehicle.price;
      if(selectedStyle != 0 && this.currentVehicle.secondaryPrice && this.currentVehicle.secondaryPrice > 0)
      {
         _loc11_ = this.currentVehicle.secondaryPrice;
      }
      if(_loc11_ != 0 && _loc11_ != undefined)
      {
         _loc6_.priceText.text = !isNaN(_loc11_) ? this.formatPrice(_loc11_) : _loc11_;
      }
      var _loc12_ = this.currentVehicle.salePrice;
      if(selectedStyle != 0 && this.currentVehicle.secondarySalePrice && this.currentVehicle.secondarySalePrice > 0)
      {
         _loc12_ = this.currentVehicle.secondarySalePrice;
      }
      if(_loc12_ != 0 && _loc12_ != undefined)
      {
         _loc6_.reducedPriceText.text = !isNaN(_loc12_) ? this.formatPrice(_loc12_) : _loc12_;
         _loc6_.reductionLine._width = _loc6_.priceText.textWidth + 5;
         _loc6_.reducedPriceText._x = _loc6_.priceText._x - _loc6_.priceText.textWidth - 20;
      }
      this.updateStats(_loc6_,selectedStyle);
   }
   function sortVehicleButtons(sortingAttribute, direction)
   {
      var _loc3_ = [];
      var _loc7_;
      var _loc9_;
      var _loc8_;
      var _loc2_;
      var _loc5_;
      var _loc6_;
      var _loc4_;
      for(var _loc15_ in this.vehicles)
      {
         _loc7_ = this.vehicles[_loc15_];
         _loc9_ = 0;
         _loc8_ = _loc7_.length;
         while(_loc9_ < _loc8_)
         {
            _loc2_ = _loc7_[_loc9_];
            _loc5_ = this.vehicleMCs[_loc2_.id];
            if(_loc5_ && _loc5_._visible)
            {
               _loc6_ = false;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == _loc2_)
                  {
                     _loc6_ = true;
                     break;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               if(!_loc6_)
               {
                  _loc2_.sortingPrice = _loc2_.reduction != 3 ? _loc2_.price : _loc2_.salePrice;
                  _loc3_.push(_loc2_);
               }
            }
            _loc9_ = _loc9_ + 1;
         }
      }
      if(sortingAttribute == "price")
      {
         sortingAttribute = "sortingPrice";
      }
      var _loc12_;
      if(sortingAttribute == "sortingPrice")
      {
         _loc3_.sortOn(sortingAttribute,direction);
         _loc8_ = _loc3_.length;
         _loc12_ = 0;
         if(direction == 16)
         {
            while(typeof _loc3_[_loc8_ - 1].sortingPrice == "string")
            {
               _loc3_.unshift(_loc3_.pop());
               if((_loc12_ = _loc12_ + 1) == _loc8_)
               {
                  break;
               }
            }
         }
         else if(direction == 18)
         {
            while(typeof _loc3_[0].sortingPrice == "string")
            {
               _loc3_.push(_loc3_.shift());
               if((_loc12_ = _loc12_ + 1) == _loc8_)
               {
                  break;
               }
            }
         }
      }
      else
      {
         _loc3_.sort(function(a, b)
         {
            if(isNaN(a[sortingAttribute]))
            {
               return -1;
            }
            if(isNaN(b[sortingAttribute]))
            {
               return 1;
            }
            return a[sortingAttribute] >= b[sortingAttribute] ? 1 : -1;
         }
         ,direction);
      }
      _loc9_ = 0;
      _loc8_ = _loc3_.length;
      while(_loc9_ < _loc8_)
      {
         _loc2_ = _loc3_[_loc9_];
         _loc5_ = this.vehicleMCs[_loc2_.id];
         _loc5_._x = this.VEHICLE_BUTTON_COLUMNS[_loc9_ % this.NUM_VEHICLE_BUTTON_COLUMNS];
         _loc5_._y = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc9_ / this.NUM_VEHICLE_BUTTON_COLUMNS) + this.vehicleButtonYOffset;
         _loc5_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,this.SORT_FADE_IN_DURATION,{_alpha:100,delay:this.SORT_FADE_IN_DELAY * _loc9_});
         _loc9_ = _loc9_ + 1;
      }
      var _loc11_ = _loc5_._parent;
      if(sortingAttribute == "sortingPrice")
      {
         this.priceSortDirection = - this.priceSortDirection;
         _loc11_.priceSortButton.arrow.gotoAndStop(this.priceSortDirection != 1 ? "DOWN" : "UP");
      }
      else
      {
         _loc11_.priceSortButton.arrow.gotoAndStop("UNSET");
      }
      this.updateBackground(_loc5_,_loc11_);
      if(_loc11_.subHeaderText)
      {
         this.setLocalisedText(_loc11_.subHeaderText,this.currentFilter,this.favourUpperCase);
      }
      else if(_loc11_.subHeader.subHeaderText)
      {
         this.setLocalisedText(_loc11_.subHeader.subHeaderText,this.currentFilter,this.favourUpperCase);
      }
      _loc9_ = 1;
      var _loc10_ = this.categoryOrder.length;
      while(_loc9_ < _loc10_)
      {
         _loc11_["subHeader" + _loc9_]._visible = false;
         _loc9_ = _loc9_ + 1;
      }
      var _loc16_ = this.CONTENT.BOUNDING_BOX._height + this.CONTENT._y - 627;
      if(_loc16_ < 0)
      {
         this.browser.SCROLL_WEBPAGE_PIXELS(_loc16_);
      }
   }
   function filterVehicleButtons(filter)
   {
      this.currentFilter = filter;
      this.filterDropDown.setHeaderText(filter);
      this.filterDropDown.close();
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc6_;
      var _loc3_;
      for(var _loc8_ in this.vehicles)
      {
         _loc5_ = this.vehicles[_loc8_];
         _loc2_ = 0;
         _loc4_ = _loc5_.length;
         while(_loc2_ < _loc4_)
         {
            _loc6_ = _loc5_[_loc2_];
            _loc3_ = this.vehicleMCs[_loc6_.id];
            _loc3_._visible = false;
            _loc3_.disabled = true;
            _loc2_ = _loc2_ + 1;
         }
      }
      for(_loc8_ in this.vehicles)
      {
         _loc5_ = this.vehicles[_loc8_];
         _loc2_ = 0;
         _loc4_ = _loc5_.length;
         while(_loc2_ < _loc4_)
         {
            _loc6_ = _loc5_[_loc2_];
            _loc3_ = this.vehicleMCs[_loc6_.id];
            if(_loc8_ == filter || filter == this.FILTER_ALL_LABEL)
            {
               _loc3_._visible = true;
               _loc3_.disabled = false;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.priceSortDirection = -1;
      this.sortVehicleButtons(this.SORT_NEWNESS,Array.NUMERIC);
   }
   function handleLB()
   {
      this.currentTab = this.currentTab - 1;
      if(this.currentTab < 0)
      {
         this.currentTab = this.tabButtons.length - 1;
      }
      this.showTab(this.currentTab);
      this.tabButtons[this.currentTab].btnTxt.textColor = this.sortTabOffColour;
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Link","WEB_NAVIGATION_SOUNDS_PHONE");
   }
   function handleRB()
   {
      this.currentTab = this.currentTab + 1;
      if(this.currentTab > this.tabButtons.length - 1)
      {
         this.currentTab = 0;
      }
      this.showTab(this.currentTab);
      this.tabButtons[this.currentTab].btnTxt.textColor = this.sortTabOffColour;
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Link","WEB_NAVIGATION_SOUNDS_PHONE");
   }
}
