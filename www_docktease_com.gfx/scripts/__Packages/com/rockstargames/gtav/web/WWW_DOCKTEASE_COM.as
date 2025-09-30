class com.rockstargames.gtav.web.WWW_DOCKTEASE_COM extends com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_VEHICLE_BUTTON_OFFSET;
   var ERROR_PAGE;
   var FAILED_PAGE;
   var FILTER_ALL_LABEL;
   var HOME_PAGE;
   var HOME_PAGE_VEHICLE_BUTTON_OFFSET;
   var PAGE_NAMES;
   var PURCHASE_PAGE;
   var SUCCESS_PAGE;
   var _name;
   var addVehicleImage;
   var browser;
   var categoryOrder;
   var currentFilter;
   var currentPage;
   var currentPageInitialised;
   var currentSlideIndex;
   var currentVehicle;
   var dataProviderUI;
   var dataTextScope;
   var favourUpperCase;
   var filterDropDown;
   var formatPrice;
   var getVehicleFromId;
   var hasSelectedBuyItNow;
   var imageManager;
   var initOptions;
   var initSortingButtons;
   var initVehicleButtons;
   var isMP;
   var isModifying;
   var numSlides;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var selectedOption;
   var selectedStyle;
   var setLocalisedText;
   var slideDescriptionPrefix;
   var slideDescriptionTextField;
   var slideDisplay;
   var slideImagePrefix;
   var slideTXD;
   var yachtColour;
   var yachtData;
   var yachtFittings;
   var yachtFlag;
   var yachtLighting;
   var yachtModel;
   var yachtName;
   function WWW_DOCKTEASE_COM()
   {
      super();
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["DOCK_BOATS"];
         this.vehicles = {DOCK_BOATS:[this.vehicles.LONGFIN,this.vehicles.TUG,this.vehicles.TORO,this.vehicles.SUB2,this.vehicles.DINGHY3,this.vehicles.SPEEDER,this.vehicles.MARQUIS,this.vehicles.JETMAX,this.vehicles.SQUALO,this.vehicles.SUNTRAP,this.vehicles.TROPIC,this.vehicles.SEASHARK]};
         this.customVehicles = {YACHTS:[this.customVehicles.YACHT]};
      }
      else
      {
         this.categoryOrder = ["DOCK_BOATS"];
         this.vehicles = {DOCK_BOATS:[this.vehicles.TORO,this.vehicles.SUB2,this.vehicles.MARQUIS,this.vehicles.SPEEDER,this.vehicles.JETMAX,this.vehicles.SQUALO,this.vehicles.SUNTRAP,this.vehicles.TROPIC,this.vehicles.SEASHARK]};
         this.customVehicles = {YACHTS:[]};
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = this.SUCCESS_PAGE;
      this.PAGE_NAMES[12] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[13] = this.FAILED_PAGE;
      this.PAGE_NAMES[15] = this.ERROR_PAGE;
      this.PAGE_NAMES[19] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE;
      this.PAGE_NAMES[20] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_MODEL_PAGE;
      this.PAGE_NAMES[21] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE;
      this.PAGE_NAMES[22] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE;
      this.PAGE_NAMES[23] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE;
      this.PAGE_NAMES[24] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE;
      this.PAGE_NAMES[25] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_CHECKOUT_PAGE;
      this.PAGE_NAMES[26] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_PAGE;
      this.PAGE_NAMES[27] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_SUCCESS_PAGE;
      this.PAGE_NAMES[28] = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_FAILED_PAGE;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[15] = false;
      this.CAN_STORE_PAGE[19] = false;
      this.CAN_STORE_PAGE[20] = false;
      this.CAN_STORE_PAGE[21] = false;
      this.CAN_STORE_PAGE[22] = false;
      this.CAN_STORE_PAGE[23] = false;
      this.CAN_STORE_PAGE[24] = false;
      this.CAN_STORE_PAGE[25] = false;
      this.CAN_STORE_PAGE[26] = false;
      this.CAN_STORE_PAGE[27] = false;
      this.CAN_STORE_PAGE[28] = false;
      this.hasSelectedBuyItNow = true;
   }
   function updateBackground(contentItem, page)
   {
      super.updateBackground(contentItem,page);
      page.panel._height = page.background._height - page.panel._y - page.footer._height;
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc4_ = this.CONTENT.details;
      var _loc3_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc3_);
      if(this.currentVehicle.buyItNow && this.currentVehicle.price >= 0 && this.currentVehicle.secondaryPrice >= 0)
      {
         this.initBuyItNowDetailsPage(_loc3_,this.currentVehicle,newPage,"buyItNow");
      }
      else
      {
         super.initDetailsPage(pageName,newPage);
      }
   }
   function initBuyItNowDetailsPage(id, currentVehicle, newPage, frame)
   {
      this.dataTextScope.length = 0;
      this.priceSortDirection = -1;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.selectedOption = -1;
      this.selectedStyle = -1;
      var _loc2_ = this.CONTENT.details;
      _loc2_.gotoAndStop(frame);
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,currentVehicle.brand,this.favourUpperCase) + " " + this.setLocalisedText(_loc2_.nameText,currentVehicle.name,this.favourUpperCase);
      _loc2_.reductionLine._visible = false;
      _loc2_.reducedPriceText._visible = false;
      _loc2_.reductionLine._visible = false;
      _loc2_.priceText._visible = false;
      if(currentVehicle.award > 0)
      {
         _loc2_.award.gotoAndStop(currentVehicle.award);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.addVehicleImage(currentVehicle,_loc2_);
      if(!this.pricesSet)
      {
         _loc2_.options._visible = false;
         _loc2_.purchaseButton._visible = false;
         _loc2_.purchaseButton2._visible = false;
         return undefined;
      }
      if(!newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      _loc2_.options._visible = true;
      _loc2_.purchaseButton._visible = true;
      _loc2_.purchaseButton2._visible = true;
      var _loc6_;
      var _loc7_;
      if(currentVehicle.secondaryPrice > 0)
      {
         _loc2_.BUYITNOWSTOCK_2.onColour = this.purchaseButtonOffColour;
         _loc2_.BUYITNOWSTOCK_2.offColour = this.purchaseButtonOffColour;
         _loc6_ = _loc2_.BUYITNOWSTOCK_2._width;
         if(currentVehicle.secondarySalePrice != undefined && currentVehicle.secondarySalePrice >= 0 && currentVehicle.secondarySalePrice != currentVehicle.secondaryPrice)
         {
            _loc2_.BUYITNOWSTOCK_2.originalPriceText.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc2_.BUYITNOWSTOCK_2.priceText.text = this.formatPrice(currentVehicle.secondarySalePrice);
            _loc7_ = _loc2_.BUYITNOWSTOCK_2.originalPriceText.textWidth + _loc2_.BUYITNOWSTOCK_2.priceText.textWidth + 10;
            _loc2_.BUYITNOWSTOCK_2.originalPriceText.autoSize = "left";
            _loc2_.BUYITNOWSTOCK_2.priceText.autoSize = "left";
            _loc2_.BUYITNOWSTOCK_2.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
            _loc2_.BUYITNOWSTOCK_2.originalPriceText._y = _loc2_.BUYITNOWSTOCK_2.priceText._y + 5;
            _loc2_.BUYITNOWSTOCK_2.priceText._x = _loc2_.BUYITNOWSTOCK_2.originalPriceText._x + _loc2_.BUYITNOWSTOCK_2.originalPriceText.textWidth + 10;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._x = _loc2_.BUYITNOWSTOCK_2.originalPriceText._x + _loc2_.BUYITNOWSTOCK_2.originalPriceText._width;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._y = _loc2_.BUYITNOWSTOCK_2.originalPriceText._y + 7;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._width = _loc2_.BUYITNOWSTOCK_2.originalPriceText._width;
         }
         else
         {
            _loc2_.BUYITNOWSTOCK_2.priceText.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc2_.BUYITNOWSTOCK_2.reductionLine._visible = false;
         }
         _loc2_.BUYITNOWSTOCK_2.padlock._visible = !currentVehicle.price2Unlocked;
         this.setLocalisedText(_loc2_.BUYITNOWSTOCK_2.buyItNowText,"DOCK_BIN_PRICE");
         this.dataTextScope.unshift(_loc2_.BUYITNOWSTOCK_2.btnTxt);
      }
      else
      {
         _loc2_.BUYITNOWSTOCK_2._visible = false;
         _loc2_.buyItNowText._visible = false;
      }
      _loc2_.BUYITNOWSTOCK_1.onColour = this.purchaseButtonOffColour;
      _loc2_.BUYITNOWSTOCK_1.offColour = this.purchaseButtonOffColour;
      _loc6_ = _loc2_.BUYITNOWSTOCK_1._width;
      if(currentVehicle.salePrice != undefined && currentVehicle.salePrice >= 0 && currentVehicle.salePrice != currentVehicle.price)
      {
         _loc2_.BUYITNOWSTOCK_1.originalPriceText.text = this.formatPrice(currentVehicle.price);
         _loc2_.BUYITNOWSTOCK_1.priceText.text = this.formatPrice(currentVehicle.salePrice);
         _loc7_ = _loc2_.BUYITNOWSTOCK_1.originalPriceText.textWidth + _loc2_.BUYITNOWSTOCK_1.priceText.textWidth + 10;
         _loc2_.BUYITNOWSTOCK_1.originalPriceText.autoSize = "left";
         _loc2_.BUYITNOWSTOCK_1.priceText.autoSize = "left";
         _loc2_.BUYITNOWSTOCK_1.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
         _loc2_.BUYITNOWSTOCK_1.originalPriceText._y = _loc2_.BUYITNOWSTOCK_1.priceText._y + 5;
         _loc2_.BUYITNOWSTOCK_1.priceText._x = _loc2_.BUYITNOWSTOCK_1.originalPriceText._x + _loc2_.BUYITNOWSTOCK_1.originalPriceText.textWidth + 10;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._x = _loc2_.BUYITNOWSTOCK_1.originalPriceText._x + _loc2_.BUYITNOWSTOCK_1.originalPriceText._width;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._y = _loc2_.BUYITNOWSTOCK_1.originalPriceText._y + 7;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._width = _loc2_.BUYITNOWSTOCK_1.originalPriceText._width;
      }
      else
      {
         _loc2_.BUYITNOWSTOCK_1.priceText.text = this.formatPrice(currentVehicle.price);
         _loc2_.BUYITNOWSTOCK_1.reductionLine._visible = false;
      }
      _loc2_.BUYITNOWSTOCK_1.padlock._visible = !currentVehicle.price1Unlocked;
      this.setLocalisedText(_loc2_.BUYITNOWSTOCK_1.buyItNowText,"DOCK_NORMAL_PRICE");
      this.dataTextScope.unshift(_loc2_.BUYITNOWSTOCK_1.btnTxt);
      _loc2_.descriptionText.autoSize = "left";
      if(currentVehicle.desc)
      {
         this.setLocalisedText(_loc2_.descriptionText,currentVehicle.desc);
      }
      else
      {
         this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + currentVehicle.name);
      }
      this.initOptions(_loc2_);
      var _loc4_ = _loc2_.BUYITNOWSTOCK_1._y;
      if(_loc2_.BUYITNOWSTOCK_1._visible)
      {
         _loc4_ += _loc2_.BUYITNOWSTOCK_1._height + 18;
      }
      if(_loc2_.BUYITNOWSTOCK_2._visible)
      {
         _loc2_.BUYITNOWSTOCK_2._y = _loc4_;
         _loc4_ += _loc2_.BUYITNOWSTOCK_2._height + 18;
      }
      _loc2_.descriptionText._y = _loc4_;
      _loc4_ += _loc2_.descriptionText._height + 16;
      if(_loc2_.options._visible)
      {
         _loc2_.optionsHeaderText._y = _loc4_;
         _loc4_ += _loc2_.optionsHeaderText._height;
         _loc2_.options._y = _loc4_;
         _loc4_ += _loc2_.options._height;
      }
      var _loc5_ = 0;
      if(_loc4_ > _loc2_.subHeader._y)
      {
         _loc5_ = _loc4_ - _loc2_.subHeader._y;
         _loc2_.subHeader._y += _loc5_;
         _loc2_.priceSortButton._y += _loc5_;
         _loc2_.filterDropDown._y += _loc5_;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc5_);
      this.initSortingButtons(_loc2_,1);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
   }
   function initOutcomePage(headerText, bodyText, soldLabel, pauseBeforeShowing)
   {
      super.initOutcomePage(headerText,bodyText,soldLabel,pauseBeforeShowing);
      var _loc3_ = this.CONTENT.purchase;
      if(this.currentVehicle.buyItNow)
      {
         if(this.hasSelectedBuyItNow)
         {
            if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0)
            {
               _loc3_.priceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
               _loc3_.reductionLine._width = _loc3_.priceText.textWidth + 5;
               _loc3_.reducedPriceText._x = _loc3_.priceText._x - _loc3_.priceText.textWidth - 20;
               _loc3_.reducedPriceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
               _loc3_.reductionLine._visible = true;
            }
            else
            {
               _loc3_.priceText.text = !isNaN(this.currentVehicle.secondaryPrice) ? this.formatPrice(this.currentVehicle.secondaryPrice) : this.currentVehicle.secondaryPrice;
               _loc3_.reductionLine._visible = false;
            }
         }
         else if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice >= 0)
         {
            _loc3_.priceText.text = this.formatPrice(this.currentVehicle.price);
            _loc3_.reductionLine._width = _loc3_.priceText.textWidth + 5;
            _loc3_.reducedPriceText._x = _loc3_.priceText._x - _loc3_.priceText.textWidth - 20;
            _loc3_.reducedPriceText.text = this.formatPrice(this.currentVehicle.salePrice);
            _loc3_.reductionLine._visible = true;
         }
         else
         {
            _loc3_.priceText.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(this.currentVehicle.price) : this.currentVehicle.price;
            _loc3_.reductionLine._visible = false;
         }
      }
   }
   function addVehicleNames()
   {
      super.addVehicleNames();
      for(var _loc3_ in this.customVehicles)
      {
         this.customVehicles[_loc3_].name = _loc3_;
      }
   }
   function getYachtFromId(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.customVehicles.YACHTS.length;
      while(_loc2_ < _loc3_)
      {
         if(this.customVehicles.YACHTS[_loc2_].id == id)
         {
            return this.customVehicles.YACHTS[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function goToAnchor(link)
   {
      var _loc6_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc5_ = link.slice(0,_loc6_);
      var _loc3_ = parseInt(link.slice(_loc6_ + 1));
      if(link == this._name)
      {
         this.browser.GO_TO_WEBPAGE(this._name);
      }
      else if(link.indexOf("YACHT") == 0 || link.indexOf("yacht") == 0)
      {
         switch(_loc5_)
         {
            case "yachtStart":
               this.goToYachtStartAnchor(_loc3_);
               break;
            case "yachtModelButton":
               this.goToYachtModelAnchor(_loc3_);
               break;
            case "yachtFittingsButton":
               this.goToYachtFittingsAnchor(_loc3_);
               break;
            case "yachtLightingButton":
               this.goToYachtLightingAnchor(_loc3_);
               break;
            case "yachtColourButton":
               this.goToYachtColourAnchor(_loc3_);
               break;
            case "yachtFlagButton":
               this.goToYachtFlagAnchor(_loc3_);
               break;
            default:
               this.browser.GO_TO_WEBPAGE(this._name + "_S_" + link);
               break;
            case "yachtPurchaseButton":
               this.dispatchPlayerSelections();
               this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_PAGE);
               break;
            case "yachtSlidePrev":
               this.updateSlideshow(-1);
               break;
            case "yachtSlideNext":
               this.updateSlideshow(1);
            case "yachtSetNameButton":
               return;
         }
      }
      else if(_loc5_ == "BUYITNOWSTOCK")
      {
         if(_loc3_ == 1 && this.currentVehicle.price1Unlocked)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc3_ == 2 && this.currentVehicle.price2Unlocked)
         {
            this.hasSelectedBuyItNow = true;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
      }
      else
      {
         super.goToAnchor(link);
      }
   }
   function goToYachtStartAnchor(attribute)
   {
      this.currentVehicle = this.getYachtFromId(attribute);
      this.yachtData = this.dataProviderUI[this.currentVehicle.id];
      this.isModifying = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] != -5;
      this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_MODEL_PAGE);
   }
   function goToYachtModelAnchor(attribute)
   {
      var _loc2_ = this.CONTENT.model;
      this.yachtModel = attribute != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] ? attribute : -1;
      this.updateNextButton(_loc2_.YACHT_D_FITTINGS,false);
      this.updateUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST[this.yachtModel]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST[this.yachtModel]]);
      this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
      this.updateTabs(_loc2_);
      this.updateModelDropDown();
      this.updateModelText();
      this.initModelSlideshow();
   }
   function goToYachtFittingsAnchor(attribute)
   {
      var _loc2_ = this.CONTENT.fittings;
      this.yachtFittings = attribute != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] ? attribute : -1;
      this.updateNextButton(_loc2_.YACHT_D_LIGHTING,false);
      this.updateUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST[this.yachtFittings]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST[this.yachtFittings]]);
      this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
      this.updateTabs(_loc2_);
      this.updateFittingsDropDown();
      this.updateFittingsImage(_loc2_);
   }
   function goToYachtLightingAnchor(attribute)
   {
      var _loc2_ = this.CONTENT.lighting;
      this.yachtLighting = attribute != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] ? attribute : -1;
      this.updateNextButton(_loc2_.YACHT_D_COLOR,false);
      this.updateUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST[this.yachtLighting]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST[this.yachtLighting]]);
      this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
      this.updateTabs(_loc2_);
      this.updateOptionButtons(_loc2_.options,"yachtLightingButton_",this.yachtLighting,this.currentVehicle.numLightingOptions,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING);
      this.updateLightingImage(_loc2_);
   }
   function goToYachtColourAnchor(attribute)
   {
      var _loc2_ = this.CONTENT.colour;
      this.yachtColour = attribute != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] ? attribute : -1;
      this.updateNextButton(_loc2_.YACHT_D_PERSONALIZE,false);
      this.updateUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST[this.yachtColour]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST[this.yachtColour]]);
      this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
      this.updateTabs(_loc2_);
      this.updateOptionButtons(_loc2_.options,"yachtColourButton_",this.yachtColour,this.currentVehicle.numColours,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR);
      this.updateColourImage(_loc2_);
   }
   function goToYachtFlagAnchor(attribute)
   {
      var _loc2_ = this.CONTENT.personalise;
      this.yachtFlag = attribute != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] ? attribute : -1;
      if(this.isModifying)
      {
         this.updateNextButton(_loc2_.YACHT_D_CHECKOUT,this.yachtColour + this.yachtLighting + this.yachtFlag + this.yachtModel + this.yachtFittings == -5 && this.yachtName == "");
      }
      else
      {
         this.updateNextButton(_loc2_.YACHT_D_CHECKOUT,this.yachtName == "");
      }
      var _loc4_ = 0;
      var _loc3_;
      if(this.yachtFlag != -1)
      {
         _loc4_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST];
         if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] >= 0)
         {
            _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST];
         }
      }
      if(this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME])
      {
         _loc4_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
         if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] >= 0)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
            }
            else
            {
               _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
            }
         }
         else if(_loc3_ != undefined)
         {
            _loc3_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
         }
      }
      this.updateUpgradeItemCost(_loc2_.upgradeItemCost,_loc4_,_loc3_);
      this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
      this.updateTabs(_loc2_);
      this.updateOptionButtons(_loc2_.options,"yachtFlagButton_",this.yachtFlag,this.currentVehicle.numFlags,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG);
      this.updateFlagImage(_loc2_);
   }
   function dispatchPlayerSelections()
   {
      var _loc10_ = this.currentVehicle.id;
      var _loc6_ = this.yachtColour != -1 ? this.yachtColour : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR];
      if(_loc6_ == -1)
      {
         _loc6_ = 0;
      }
      var _loc7_ = this.yachtLighting != -1 ? this.yachtLighting : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING];
      if(_loc7_ == -1)
      {
         _loc7_ = 3;
      }
      var _loc4_ = this.yachtFlag != -1 ? this.yachtFlag : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG];
      if(_loc4_ == -1)
      {
         _loc4_ = 0;
      }
      var _loc5_ = this.yachtFittings != -1 ? this.yachtFittings : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS];
      if(_loc5_ == -1)
      {
         _loc5_ = 0;
      }
      var _loc8_ = this.yachtModel != -1 ? this.yachtModel : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
      if(_loc8_ == -1)
      {
         _loc8_ = 0;
      }
      var _loc13_ = 6;
      var _loc14_ = 6;
      var _loc9_ = 6;
      var _loc11_ = 6;
      var _loc12_ = 2;
      var _loc15_ = 2;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= _loc10_ << _loc2_;
      _loc2_ += _loc13_;
      _loc3_ |= _loc6_ << _loc2_;
      _loc2_ += _loc14_;
      _loc3_ |= _loc7_ << _loc2_;
      _loc2_ += _loc9_;
      _loc3_ |= _loc4_ << _loc2_;
      _loc2_ += _loc11_;
      _loc3_ |= _loc8_ << _loc2_;
      _loc2_ += _loc12_;
      _loc3_ |= _loc5_ << _loc2_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.YACHT,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DOCKTEASE_COM::YACHT DATA OUT");
      com.rockstargames.ui.utils.Debug.log("COLOUR: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("LIGHTING: " + _loc7_);
      com.rockstargames.ui.utils.Debug.log("FLAG: " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("MODEL: " + _loc8_);
      com.rockstargames.ui.utils.Debug.log("FITTINGS: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function displayPage(pageName)
   {
      this.disposeTweens();
      if(pageName.indexOf("YACHT") == 0)
      {
         if(pageName.indexOf(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_PAGE) == 0)
         {
            pageName = com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_PAGE;
         }
         else
         {
            this.CONTENT.gotoAndStop("BLANK");
         }
         this.CONTENT.gotoAndStop(pageName);
      }
      else
      {
         super.displayPage(pageName);
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      var _loc8_ = this.dataProviderUI[this.customVehicles.YACHTS[0].id];
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DOCKTEASE_COM::YACHT DATA IN [" + arguments + "]: " + _loc8_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("COLOUR: " + _loc8_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR]);
      com.rockstargames.ui.utils.Debug.log("LIGHTING: " + _loc8_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING]);
      com.rockstargames.ui.utils.Debug.log("FLAG: " + _loc8_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG]);
      com.rockstargames.ui.utils.Debug.log("MODEL: " + _loc8_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL]);
      com.rockstargames.ui.utils.Debug.log("FITTINGS: " + _loc8_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS]);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      this.CONTENT._y = 0;
      this.filterDropDown.dispose();
      delete this.filterDropDown;
      this.browser.SUPRESS_HISTORY(false);
      var _loc5_;
      var _loc7_;
      var _loc4_;
      if(pageName.indexOf("YACHT") == 0)
      {
         this.currentPage = pageName;
         this.currentVehicle = this.customVehicles.YACHTS[0];
         this.yachtData = this.dataProviderUI[this.currentVehicle.id];
         _loc5_ = [com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG];
         _loc7_ = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(this.yachtData[_loc5_[_loc4_]] == -1)
            {
               _loc7_ = _loc7_ + 1;
            }
            _loc4_ = _loc4_ + 1;
         }
         if(_loc7_ > 0 && _loc7_ < _loc5_.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               if(this.yachtData[_loc5_[_loc4_]] == -1)
               {
                  this.yachtData[_loc5_[_loc4_]] = 0;
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         this.isModifying = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] != -5;
         switch(pageName)
         {
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE:
               this.initYachtHomePage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_MODEL_PAGE:
               this.initYachtModelPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE:
               this.initYachtFittingsPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE:
               this.initYachtLightingPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE:
               this.initYachtColourPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE:
               this.initYachtPersonalisePage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_CHECKOUT_PAGE:
               this.initYachtCheckoutPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_PAGE:
               this.initYachtPurchasePage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_SUCCESS_PAGE:
               this.initYachtPurchaseSuccessPage(newPage);
               break;
            case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PURCHASE_FAILED_PAGE:
               this.initYachtPurchaseFailurePage(newPage);
            default:
               return;
         }
      }
      else
      {
         super.POPULATE_TEXT(pageName,searchArgs,newPage);
      }
   }
   function initHomePage(newPage)
   {
      var _loc4_ = this.CONTENT.home;
      var _loc6_ = false;
      var _loc3_ = 0;
      while(_loc3_ < this.customVehicles.YACHTS.length)
      {
         if(this.dataProviderUI[this.customVehicles.YACHTS[_loc3_].id])
         {
            this.yachtData = this.dataProviderUI[this.customVehicles.YACHTS[_loc3_].id];
            _loc6_ = true;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc8_;
      var _loc7_;
      var _loc5_;
      var _loc9_;
      if(_loc6_)
      {
         if(!_loc4_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE])
         {
            _loc8_ = 236;
            _loc7_ = _loc4_.panel._y + 20;
            _loc5_ = _loc4_.attachMovie("yachtBannerButton",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE,_loc4_.getNextHighestDepth(),{_x:_loc8_,_y:_loc7_});
            this.setLocalisedYachtText(_loc5_.name,"BOAT_YACHT",true);
            _loc5_.btnTxt.textAutoSize = "shrink";
            _loc5_.btnTxt.verticalAlign = "center";
            this.setLocalisedText(_loc5_.btnTxt,"BOAT_YACHT_BANNER");
            _loc5_.cost.textAutoSize = "shrink";
            _loc9_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] != -5;
            if(_loc9_)
            {
               _loc5_.cost.text = this.setLocalisedText(_loc5_.cost,"BOAT_YACHT_MODIFY_FROM") + ": " + this.formatPrice(this.getCheapestModification());
            }
            else
            {
               _loc5_.cost.text = this.setLocalisedText(_loc5_.cost,"BOAT_YACHT_PURCHASE_FROM") + ": " + this.formatPrice(this.getCheapestInitialPurchase());
            }
            _loc7_ += _loc5_._height + 20;
            _loc4_.filterDropDown._y = _loc7_;
            _loc4_.priceSortButton._y = _loc7_;
            _loc4_.subHeaderText._y = _loc7_ + 4;
            _loc7_ += _loc4_.filterDropDown._height + 20;
            this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = _loc7_;
            _loc5_._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BANNER_FADE_DURATION,{_alpha:100});
            this.initSlideshow(6,"DOCK_DLC_BANNER",_loc5_.topImage.txt,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BANNER_IMAGE,undefined,undefined,1);
            this.updateHomePageBannerSlideshow(0);
            this.imageManager.addYachtImage("DOCK_DLC_BANNER",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BANNER_IMAGE + "0",_loc5_.bottomImage.txt);
            this.initRebateSticker(_loc5_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_HOMEPAGE],_loc5_.btnTxt);
            _loc4_.rebate._x = _loc4_.topBGImage._x + 0.5 * (_loc4_.topBGImage._width - _loc4_.rebate._width);
         }
         this.dataTextScope.push(_loc4_[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE].btnTxt);
      }
      else
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = 256;
         _loc4_.filterDropDown._y = !this.isMP ? 195 : 662;
         _loc4_.priceSortButton._y = !this.isMP ? 195 : 662;
         _loc4_.subHeaderText._y = !this.isMP ? 195 : 666;
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      super.initHomePage(newPage);
   }
   function updateHomePageBannerSlideshow(step)
   {
      var _loc2_ = this.CONTENT.home[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE];
      if(_loc2_)
      {
         _loc2_.bottomImage.txt.htmlText = _loc2_.topImage.txt.htmlText;
         this.updateSlideshow(step);
         _loc2_.topImage._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.topImage,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BANNER_FADE_DURATION,{_alpha:100,delay:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BANNER_PAUSE_DURATION,onCompleteScope:this,onComplete:this.updateHomePageBannerSlideshow,onCompleteArgs:[1]});
      }
   }
   function initYachtHomePage(newPage)
   {
      var _loc2_ = this.CONTENT.home;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      var _loc3_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         _loc4_ = 0;
         while(_loc4_ < this.customVehicles.YACHTS.length)
         {
            _loc6_ = this.customVehicles.YACHTS[_loc4_];
            _loc5_ = "yachtStart_" + _loc6_.id;
            _loc3_ = _loc2_.attachMovie("yachtHomepageButton",_loc5_,_loc2_.getNextHighestDepth());
            _loc3_._y = 400 - _loc4_ * (_loc3_._height + 10);
            if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] == -5)
            {
               this.initRoundedButton(_loc3_,"BOAT_YACHT_CREATE",0,0,16777215,100);
            }
            else
            {
               this.initRoundedButton(_loc3_,"BOAT_YACHT_MODIFY",0,0,16777215,100);
            }
            _loc3_._x = 0.5 * (_loc2_.background._width - _loc3_._width);
            _loc4_ = _loc4_ + 1;
         }
         this.initSlideshow(8,"DOCK_DLC_SLIDES",_loc2_.slideshow,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.HOMEPAGE_IMAGE);
         this.dataTextScope.push(_loc2_.yachtSlidePrev.btnTxt);
         this.dataTextScope.push(_loc2_.yachtSlideNext.btnTxt);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.setLocalisedText(_loc2_.heading,"BOAT_YACHT_HOME_PAGE_HEADING");
         _loc2_.body.autoSize = "center";
         this.setLocalisedText(_loc2_.body,"BOAT_YACHT_HOME_PAGE_BODY");
         if(this.isModifying)
         {
            _loc2_.price.text = this.setLocalisedText(_loc2_.price,"BOAT_YACHT_PRICE_MODIFY_FROM") + " - " + this.formatPrice(this.getCheapestModification());
         }
         else
         {
            _loc2_.price.text = this.setLocalisedText(_loc2_.price,"BOAT_YACHT_PRICE_FROM") + " - " + this.formatPrice(this.getCheapestInitialPurchase());
         }
         _loc2_.heading.autoSize = "left";
         _loc2_.body._y = _loc2_.heading._y + _loc2_.heading._height + 20;
         _loc2_.price._y = _loc2_.body._y + _loc2_.body._height + 20;
         _loc2_.slideshow._y = _loc2_.price._y + _loc2_.price._height + 20;
         _loc2_.yachtSlidePrev._y = _loc2_.yachtSlideNext._y = _loc2_.slideshow._y + 0.5 * _loc2_.slideshow._height;
         _loc2_.background._height = _loc2_.slideshow._y + _loc2_.slideshow._height + 65;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_home",_loc2_.topBGImage);
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_model",_loc2_.bottomBGImage);
         this.updateYachtBackground(_loc2_);
      }
      this.yachtColour = -1;
      this.yachtLighting = -1;
      this.yachtFlag = -1;
      this.yachtModel = -1;
      this.yachtFittings = -1;
      this.yachtName = "";
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function getCheapestModification()
   {
      var _loc4_ = 1.7976931348623157e+308;
      var _loc6_ = [com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST].concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST);
      var _loc7_ = [com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST].concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST).concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST);
      var _loc3_ = 0;
      var _loc5_;
      var _loc2_;
      while(_loc3_ < _loc6_.length)
      {
         _loc5_ = this.yachtData[_loc6_[_loc3_]];
         if(_loc5_ < _loc4_)
         {
            _loc4_ = _loc5_;
         }
         _loc2_ = this.yachtData[_loc7_[_loc3_]];
         if(_loc2_ != undefined && _loc2_ >= 0 && _loc2_ < _loc4_)
         {
            _loc4_ = _loc2_;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc4_;
   }
   function getCheapestInitialPurchase()
   {
      var _loc2_ = 0;
      _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST]);
      _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST]);
      _loc2_ += this.getLowestValueInArray(this.yachtData,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST.concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST));
      _loc2_ += this.getLowestValueInArray(this.yachtData,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST.concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST));
      _loc2_ += this.getLowestValueInArray(this.yachtData,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST.concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST));
      _loc2_ += this.getLowestValueInArray(this.yachtData,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST.concat(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST));
      return _loc2_;
   }
   function getLowestValueInArray(array, indexes)
   {
      var _loc3_ = 1.7976931348623157e+308;
      var _loc2_ = 0;
      var _loc1_;
      while(_loc2_ < indexes.length)
      {
         _loc1_ = array[indexes[_loc2_]];
         if(_loc1_ != undefined && _loc1_ >= 0 && _loc1_ < _loc3_)
         {
            _loc3_ = _loc1_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function initYachtModelPage(newPage)
   {
      var _loc2_ = this.CONTENT.model;
      var _loc3_;
      if(newPage || !this.currentPageInitialised)
      {
         this.dataTextScope.length = 0;
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_MODEL);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.initNextButton(_loc2_.YACHT_D_FITTINGS,!this.isModifying && this.yachtModel == -1,_loc2_.heading);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.setLocalisedYachtText(_loc2_.heading,"BOAT_YACHT_MODEL_PAGE_HEADING",true);
         _loc2_.leftBulletPoints.autoSize = "left";
         _loc2_.rightBulletPoints.autoSize = "left";
         _loc2_.body.textAutoSize = "shrink";
         this.updateModelText();
         this.dataTextScope.push(_loc2_.yachtSlidePrev.btnTxt);
         this.dataTextScope.push(_loc2_.yachtSlideNext.btnTxt);
         _loc2_.disclaimer.autoSize = "left";
         this.setLocalisedText(_loc2_.disclaimer,"BOAT_YACHT_DISCLAIMER");
         if(_loc2_.disclaimer.textHeight > 62)
         {
            _loc2_.disclaimer.autoSize = "none";
            _loc3_ = _loc2_.disclaimer.getTextFormat();
            while(_loc2_.disclaimer.textHeight > 62)
            {
               _loc3_.size = _loc3_.size - 1;
               _loc2_.disclaimer.setTextFormat(_loc3_);
            }
         }
         _loc2_.disclaimerBG._height = _loc2_.disclaimer.textHeight + 11;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_model",_loc2_.bgImage);
         this.initRebateSticker(_loc2_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_MODEL],_loc2_.slideshow);
         this.updateYachtBackground(_loc2_);
         this.currentPageInitialised = true;
      }
      if(!this.isModifying && this.yachtModel == -1)
      {
         this.goToAnchor("yachtModelButton_0");
      }
      if(this.yachtData)
      {
         this.initModelDropDown(_loc2_);
         this.initUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST[this.yachtModel]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST[this.yachtModel]],_loc2_.YACHT_D_FITTINGS);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.initModelSlideshow();
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initModelSlideshow()
   {
      var _loc2_ = this.getDisplayedModel();
      this.initSlideshow(10,"DOCK_DLC_MODEL",this.CONTENT.model.slideshow,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.MODEL_IMAGE + _loc2_ + "_");
   }
   function initModelDropDown(page)
   {
      if(this.filterDropDown && this.filterDropDown.container == page.optionsDropDown)
      {
         return undefined;
      }
      this.filterDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(page.optionsDropDown,"yachtDropDownItem","BOAT_YACHT_MODEL_PAGE_HEADING",43,45,16777215,16777215);
      this.dataTextScope.push(page.optionsDropDown.dropDownHeader.btnTxt);
      var _loc2_ = 0;
      var _loc4_ = this.currentVehicle.models.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.filterDropDown.addItem(this.currentVehicle.models[_loc2_]);
         _loc3_._name = "yachtModelButton_" + _loc2_;
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      page.optionsDropDown.swapDepths(page.getNextHighestDepth() - 1);
      this.updateModelDropDown();
   }
   function updateModelDropDown()
   {
      var _loc2_ = this.getDisplayedModel();
      this.filterDropDown.setHeaderText(this.currentVehicle.models[_loc2_]);
      this.filterDropDown.close();
      this.filterDropDown.showAllItems();
      this.filterDropDown.hideItemAt(_loc2_);
   }
   function updateModelText()
   {
      var _loc2_ = this.CONTENT.model;
      var _loc4_ = this.getDisplayedModel();
      var _loc3_ = "BOAT_YACHT_MODEL_PAGE_";
      this.setLocalisedText(_loc2_.subheading,_loc3_ + "SUBHEADING_" + _loc4_);
      this.setLocalisedText(_loc2_.leftBulletPoints,_loc3_ + "LEFT_BULLET_POINTS_" + _loc4_);
      this.setLocalisedText(_loc2_.rightBulletPoints,_loc3_ + "RIGHT_BULLET_POINTS_" + _loc4_);
      this.setLocalisedText(_loc2_.body,_loc3_ + "BODY_" + _loc4_);
      var _loc6_ = _loc2_.leftBulletPoints._y + _loc2_.leftBulletPoints._height;
      var _loc7_ = _loc2_.rightBulletPoints._y + _loc2_.rightBulletPoints._height;
      _loc2_.background._height = Math.max(_loc6_,_loc7_) + 65;
      this.updateYachtBackground(_loc2_);
      var _loc5_ = 627 - this.CONTENT._height - this.CONTENT._y;
      if(_loc5_ > 0)
      {
         this.browser.SCROLL_WEBPAGE_PIXELS(_loc5_);
      }
   }
   function getDisplayedModel()
   {
      if(this.yachtModel != -1)
      {
         return this.yachtModel;
      }
      if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL] != -1)
      {
         return this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
      }
      return 0;
   }
   function initYachtFittingsPage(newPage)
   {
      var _loc2_ = this.CONTENT.fittings;
      if(newPage || !this.currentPageInitialised)
      {
         this.dataTextScope.length = 0;
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_FITTINGS);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.initNextButton(_loc2_.YACHT_D_LIGHTING,!this.isModifying && this.yachtFittings == -1,_loc2_.heading);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.setLocalisedYachtText(_loc2_.heading,"BOAT_YACHT_FITTINGS_PAGE_HEADING",true);
         _loc2_.body.textAutoSize = "shrink";
         this.setLocalisedText(_loc2_.body,"BOAT_YACHT_FITTINGS_PAGE_BODY");
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_fittings",_loc2_.bgImage);
         this.initRebateSticker(_loc2_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_FITTINGS],_loc2_.fittingsImage);
         this.updateYachtBackground(_loc2_);
         this.currentPageInitialised = true;
      }
      if(!this.isModifying && this.yachtFittings == -1)
      {
         this.goToAnchor("yachtFittingsButton_0");
      }
      if(this.yachtData)
      {
         this.initFittingsDropDown(_loc2_);
         this.initUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST[this.yachtFittings]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST[this.yachtFittings]],_loc2_.YACHT_D_LIGHTING);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.updateFittingsImage(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initFittingsDropDown(page)
   {
      if(this.filterDropDown && this.filterDropDown.container == page.optionsDropDown)
      {
         return undefined;
      }
      this.filterDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(page.optionsDropDown,"yachtDropDownItem","BOAT_YACHT_FITTINGS_PAGE_HEADING",43,45,16777215,16777215);
      this.dataTextScope.push(page.optionsDropDown.dropDownHeader.btnTxt);
      var _loc2_ = 0;
      var _loc4_ = this.currentVehicle.fittings.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.filterDropDown.addItem(this.currentVehicle.fittings[_loc2_]);
         _loc3_._name = "yachtFittingsButton_" + _loc2_;
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      page.optionsDropDown.swapDepths(page.getNextHighestDepth() - 1);
      this.updateFittingsDropDown();
   }
   function updateFittingsDropDown()
   {
      var _loc2_ = 0;
      if(this.yachtFittings != -1)
      {
         _loc2_ = this.yachtFittings;
      }
      else if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] != -1)
      {
         _loc2_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS];
      }
      if(this.filterDropDown.container.dropDownHeader.btnTxt)
      {
         this.filterDropDown.setHeaderText(this.currentVehicle.fittings[_loc2_]);
      }
      this.filterDropDown.close();
      this.filterDropDown.showAllItems();
      this.filterDropDown.hideItemAt(_loc2_);
   }
   function updateFittingsImage(page)
   {
      var _loc2_ = this.yachtFittings == -1 ? this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS] : this.yachtFittings;
      this.imageManager.addYachtImage("DOCK_DLC_FITTINGS",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.FITTINGS_IMAGE + _loc2_,page.fittingsImage);
   }
   function initYachtLightingPage(newPage)
   {
      var _loc2_ = this.CONTENT.lighting;
      if(newPage || !this.currentPageInitialised)
      {
         this.dataTextScope.length = 0;
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_LIGHTING);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.initNextButton(_loc2_.YACHT_D_COLOR,!this.isModifying && this.yachtLighting == -1,_loc2_.heading);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.setLocalisedYachtText(_loc2_.heading,"BOAT_YACHT_LIGHTING_PAGE_HEADING",true);
         _loc2_.body.textAutoSize = "shrink";
         this.setLocalisedText(_loc2_.body,"BOAT_YACHT_LIGHTING_PAGE_BODY");
         this.setLocalisedText(_loc2_.options.subheading1,"BOAT_YACHT_LIGHTING_PAGE_SUBHEADING_1");
         this.setLocalisedText(_loc2_.options.subheading2,"BOAT_YACHT_LIGHTING_PAGE_SUBHEADING_2");
         _loc2_.imageDescription.textAutoSize = "shrink";
         _loc2_.imageDescription.verticalAlign = "center";
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_lighting",_loc2_.bgImage);
         this.initRebateSticker(_loc2_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_LIGHTING],_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
         this.currentPageInitialised = true;
      }
      if(!this.isModifying && this.yachtLighting == -1)
      {
         this.goToAnchor("yachtLightingButton_3");
      }
      if(this.yachtData)
      {
         this.initLightingButtons(_loc2_);
         this.initUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST[this.yachtLighting]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST[this.yachtLighting]],_loc2_.YACHT_D_COLOR);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.updateLightingImage(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initLightingButtons(page)
   {
      var _loc2_ = 0;
      var _loc4_ = this.currentVehicle.numLightingOptions;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = page.options["yachtLightingButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 2);
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.updateOptionButtons(page.options,"yachtLightingButton_",this.yachtLighting,this.currentVehicle.numLightingOptions,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING);
   }
   function updateLightingImage(page)
   {
      var _loc2_ = this.yachtLighting == -1 ? this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING] : this.yachtLighting;
      this.imageManager.addYachtImage("DOCK_DLC_LIGHTS",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.LIGHTING_IMAGE + _loc2_,page.yachtImage);
      this.setLocalisedText(page.imageDescription,"YACHT_LIGHTING_" + _loc2_);
   }
   function initYachtColourPage(newPage)
   {
      var _loc2_ = this.CONTENT.colour;
      if(newPage || !this.currentPageInitialised)
      {
         this.dataTextScope.length = 0;
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_COLOR);
         this.initColourButtons(_loc2_);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.initNextButton(_loc2_.YACHT_D_PERSONALIZE,!this.isModifying && this.yachtColour == -1,_loc2_.heading);
         this.initUpgradeItemCost(_loc2_.upgradeItemCost,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST[this.yachtColour]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST[this.yachtColour]],_loc2_.YACHT_D_PERSONALIZE);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         this.setLocalisedYachtText(_loc2_.heading,"BOAT_YACHT_COLOUR_PAGE_HEADING",true);
         _loc2_.body.textAutoSize = "shrink";
         this.setLocalisedText(_loc2_.body,"BOAT_YACHT_COLOUR_PAGE_BODY");
         _loc2_.imageDescription.textAutoSize = "shrink";
         _loc2_.imageDescription.verticalAlign = "center";
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_colour",_loc2_.bgImage);
         this.initRebateSticker(_loc2_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_COLOUR],_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
         this.currentPageInitialised = true;
      }
      if(!this.isModifying && this.yachtColour == -1)
      {
         this.goToAnchor("yachtColourButton_0");
      }
      if(this.yachtData)
      {
         this.updateColourImage(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initColourButtons(page)
   {
      var _loc2_ = 0;
      var _loc4_ = this.currentVehicle.numColours;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = page.options["yachtColourButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 2);
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.updateOptionButtons(page.options,"yachtColourButton_",this.yachtColour,this.currentVehicle.numColours,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR);
   }
   function updateColourImage(page)
   {
      var _loc2_ = this.yachtColour == -1 ? this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR] : this.yachtColour;
      this.imageManager.addYachtImage("DOCK_DLC_COLOR",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.COLOUR_IMAGE + _loc2_,page.yachtImage);
      this.setLocalisedText(page.imageDescription,"YACHT_COLOUR_" + _loc2_);
   }
   function initYachtPersonalisePage(newPage)
   {
      var _loc2_ = this.CONTENT.personalise;
      var _loc4_ = _loc2_.yachtSetNameButton;
      _loc4_.btnTxt.textAutoSize = "shrink";
      var _loc7_;
      if(newPage || !this.currentPageInitialised)
      {
         this.dataTextScope.length = 0;
         this.dataTextScope.push(_loc4_.btnTxt);
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_PERSONALIZE);
         this.initFlagButtons(_loc2_);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         _loc7_ = !this.isModifying || this.yachtModel + this.yachtFittings + this.yachtLighting + this.yachtColour + this.yachtFlag == -5 && this.yachtName == "";
         this.initNextButton(_loc2_.YACHT_D_CHECKOUT,_loc7_,_loc2_.heading);
         this.setLocalisedYachtText(_loc2_.heading,"BOAT_YACHT_PERSONALISE_PAGE_HEADING",true);
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_flags",_loc2_.bgImage);
         this.initRebateSticker(_loc2_,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_REBATE_FLAG],_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
         this.currentPageInitialised = true;
      }
      if(this.yachtData)
      {
         this.pollYachtNameChange(_loc2_);
      }
      if(!this.isModifying && this.yachtFlag == -1)
      {
         this.goToAnchor("yachtFlagButton_0");
      }
      var _loc5_;
      var _loc3_;
      var _loc6_;
      if(this.yachtData)
      {
         _loc5_ = 0;
         if(this.yachtFlag != -1)
         {
            _loc5_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST];
            if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] >= 0)
            {
               _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST];
            }
         }
         if(this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME])
         {
            _loc5_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
            if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] >= 0)
            {
               if(_loc3_ == undefined)
               {
                  _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST] + this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
               }
               else
               {
                  _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
               }
            }
            else if(_loc3_ != undefined)
            {
               _loc3_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
            }
         }
         this.initUpgradeItemCost(_loc2_.upgradeItemCost,_loc5_,_loc3_,_loc2_.YACHT_D_CHECKOUT);
         this.updateUpgradeTotal(_loc2_.tabs.YACHT_D_CHECKOUT.cost);
         _loc6_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME];
         _loc2_.changeName.textAutoSize = "shrink";
         if(_loc6_ == "")
         {
            this.setLocalisedYachtText(_loc2_.changeName,"BOAT_YACHT_SET_NAME",true);
            _loc4_.btnTxt.text = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NEW_NAME];
         }
         else
         {
            this.setLocalisedYachtText(_loc2_.changeName,"BOAT_YACHT_CHANGE_NAME",true);
            _loc4_.btnTxt.text = _loc6_;
         }
         _loc4_.caret._x = _loc4_.btnTxt._x + _loc4_.btnTxt.textWidth + 3;
         this.updateFlagImage(_loc2_);
      }
      else
      {
         this.updateUpgradeItemCost(_loc2_.upgradeItemCost,0);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initFlagButtons(page)
   {
      var _loc2_ = 0;
      var _loc4_ = this.currentVehicle.numFlags;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = page.options["yachtFlagButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 2);
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.updateOptionButtons(page.options,"yachtFlagButton_",this.yachtFlag,this.currentVehicle.numFlags,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG);
   }
   function updateFlagImage(page)
   {
      var _loc2_ = this.yachtFlag == -1 ? this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG] : this.yachtFlag;
      this.imageManager.addYachtImage("DOCK_DLC_FLAG",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.FLAG_IMAGE + _loc2_,page.yachtImage);
      this.setLocalisedText(page.imageDescription,"BOAT_YACHT_FLAG_" + _loc2_);
   }
   function pollYachtNameChange(page)
   {
      var _loc10_;
      var _loc4_;
      var _loc6_;
      var _loc3_;
      var _loc5_;
      if(page)
      {
         this.yachtData = this.dataProviderUI[this.currentVehicle.id];
         _loc10_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME];
         _loc4_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NEW_NAME];
         this.yachtName = _loc4_;
         _loc6_ = 0;
         if(this.yachtFlag != -1)
         {
            _loc6_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST];
            if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST] >= 0)
            {
               _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST];
            }
         }
         if(this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME])
         {
            _loc6_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
            if(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] != undefined && this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST] >= 0)
            {
               if(_loc3_ != undefined)
               {
                  _loc3_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
               }
               else
               {
                  _loc3_ = this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST];
               }
            }
            else if(_loc3_ != undefined)
            {
               _loc3_ += this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST];
            }
         }
         this.updateUpgradeItemCost(page.upgradeItemCost,_loc6_,_loc3_);
         this.updateUpgradeTotal(page.tabs.YACHT_D_CHECKOUT.cost);
         this.updateTabs(page);
         _loc5_ = page.yachtSetNameButton.btnTxt;
         if(_loc4_ != "")
         {
            _loc5_.text = _loc4_;
            this.updateNextButton(page.YACHT_D_CHECKOUT,false);
            this.setTabDisabled(page.tabs.YACHT_D_CHECKOUT,false);
         }
         else if(!this.isModifying)
         {
            _loc5_.text = _loc4_;
            this.updateNextButton(page.YACHT_D_CHECKOUT,true);
            this.setTabDisabled(page.tabs.YACHT_D_CHECKOUT,true);
         }
         page.yachtSetNameButton.caret._x = _loc5_._x + _loc5_.textWidth + 3;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(page,0.5,{onCompleteScope:this,onComplete:this.pollYachtNameChange,onCompleteArgs:[page]});
      }
   }
   function initYachtCheckoutPage(newPage)
   {
      var _loc2_ = this.CONTENT.checkout;
      if(!this.isModifying)
      {
         if(this.yachtModel == -1)
         {
            this.yachtModel = 0;
         }
         if(this.yachtFittings == -1)
         {
            this.yachtFittings = 0;
         }
         if(this.yachtLighting == -1)
         {
            this.yachtLighting = 3;
         }
         if(this.yachtColour == -1)
         {
            this.yachtColour = 0;
         }
         if(this.yachtFlag == -1)
         {
            this.yachtFlag = 0;
         }
      }
      var _loc5_;
      var _loc4_;
      var _loc3_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.initTabs(_loc2_.tabs,_loc2_.tabs.YACHT_D_CHECKOUT);
         this.dataTextScope.push(_loc2_.WWW_DOCKTEASE_COM.btnTxt);
         this.initRoundedButton(_loc2_.yachtPurchaseButton,"BOAT_YACHT_PURCHASE",16777215,16777215,2688167);
         this.initSummaries(_loc2_);
         _loc5_ = this.initTotalPrice(_loc2_.price);
         if(this.isModifying)
         {
            _loc4_ = this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME];
            if(this.yachtModel < 0 && this.yachtFittings < 0 && this.yachtLighting < 0 && this.yachtColour < 0 && this.yachtFlag < 0 && !_loc4_)
            {
               this.setButtonDisabled(_loc2_.yachtPurchaseButton,true);
               _loc2_.yachtPurchaseButton._visible = false;
            }
         }
         _loc2_.yachtPurchaseButton._x = _loc2_.flagSummary._x + _loc2_.flagSummary._width - _loc2_.yachtPurchaseButton._width;
         _loc2_.price._width = _loc2_.yachtPurchaseButton._x - _loc2_.price._x - 10;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_checkout",_loc2_.bgImage);
         _loc2_.disclaimer.autoSize = "left";
         this.setLocalisedText(_loc2_.disclaimer,"BOAT_YACHT_DISCLAIMER");
         if(_loc2_.disclaimer.textHeight > 62)
         {
            _loc2_.disclaimer.autoSize = "none";
            _loc3_ = _loc2_.disclaimer.getTextFormat();
            while(_loc2_.disclaimer.textHeight > 62)
            {
               _loc3_.size = _loc3_.size - 1;
               _loc2_.disclaimer.setTextFormat(_loc3_);
            }
         }
         _loc2_.disclaimerBG._height = _loc2_.disclaimer.textHeight + 11;
         this.updateYachtBackground(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initSummaries(page)
   {
      var _loc2_;
      _loc2_ = this.yachtModel != -1 ? this.yachtModel : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
      this.initSummaryItem(page.modelSummary,"BOAT_YACHT_MODEL",this.currentVehicle.models[_loc2_],com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.MODEL_IMAGE + _loc2_ + "_0","DOCK_DLC_MODEL",this.yachtModel != -1);
      _loc2_ = this.yachtFittings != -1 ? this.yachtFittings : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS];
      this.initSummaryItem(page.fittingsSummary,"BOAT_YACHT_FITTINGS",this.currentVehicle.fittings[_loc2_],com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.FITTINGS_IMAGE + _loc2_,"DOCK_DLC_FITTINGS",this.yachtFittings != -1);
      _loc2_ = this.yachtColour != -1 ? this.yachtColour : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR];
      this.initSummaryItem(page.colourSummary,"BOAT_YACHT_COLOUR","YACHT_COLOUR_" + _loc2_,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.COLOUR_IMAGE + _loc2_,"DOCK_DLC_COLOR",this.yachtColour != -1);
      _loc2_ = this.yachtLighting != -1 ? this.yachtLighting : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING];
      this.initSummaryItem(page.lightingSummary,"BOAT_YACHT_LIGHTING","YACHT_LIGHTING_" + _loc2_,com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.LIGHTING_IMAGE + _loc2_,"DOCK_DLC_LIGHTS",this.yachtLighting != -1);
      _loc2_ = this.yachtFlag != -1 ? this.yachtFlag : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG];
      this.setLocalisedYachtText(page.flagSummary.description,"BOAT_YACHT_PERSONALISE",true);
      page.flagSummary.selection.textAutoSize = "shrink";
      page.flagSummary.selection.text = this.yachtName != "" ? this.yachtName : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME];
      if((this.yachtName == "" || this.yachtName == this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME]) && this.yachtFlag == -1)
      {
         page.flagSummary.selection._alpha = 50;
      }
      this.imageManager.addYachtImage("DOCK_DLC_FLAG",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.FLAG_IMAGE + _loc2_,page.flagSummary.image);
   }
   function initSummaryItem(item, descriptionLabel, selectionLabel, imageID, imageTXD, itemModified)
   {
      this.setLocalisedYachtText(item.description,descriptionLabel,true);
      item.selection.textAutoSize = "shrink";
      this.setLocalisedYachtText(item.selection,selectionLabel);
      if(!itemModified)
      {
         item.selection._alpha = 50;
      }
      this.imageManager.addYachtImage(imageTXD,imageID,item.image);
   }
   function initTotalPrice(price)
   {
      var _loc3_ = this.getTotalPrice(true);
      var _loc4_ = !this.isModifying ? "BOAT_YACHT_TOTAL_PRICE" : "BOAT_YACHT_TOTAL_UPGRADE_PRICE";
      price.textAutoSize = "shrink";
      price.verticalAlign = "center";
      if(_loc3_ == 0)
      {
         price.htmlText = "<B>" + this.setLocalisedText(price,_loc4_) + " " + this.setLocalisedText(price,"CLUB_FREE") + "</B>";
      }
      else
      {
         price.htmlText = "<B>" + this.setLocalisedText(price,_loc4_) + " " + this.formatPrice(_loc3_) + "</B>";
      }
      return _loc3_;
   }
   function initYachtPurchasePage(newPage)
   {
      var _loc2_ = this.CONTENT.purchase;
      var _loc3_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         _loc2_.WWW_DOCKTEASE_COM._visible = false;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_checkout",_loc2_.bgImage);
         _loc2_.heading.autoSize = "left";
         this.setLocalisedText(_loc2_.heading,"BOATS_WAITING_TO_PURCHASE");
         _loc3_ = this.yachtModel != -1 ? this.yachtModel : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
         this.imageManager.addYachtImage("DOCK_DLC_MODEL",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.MODEL_IMAGE + _loc3_ + "_0",_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initYachtPurchaseSuccessPage(newPage)
   {
      var _loc2_ = this.CONTENT.purchase;
      var _loc3_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_checkout",_loc2_.bgImage);
         this.initRoundedButton(_loc2_.WWW_DOCKTEASE_COM,"BOAT_YACHT_CONTINUE",0,0,16777215);
         _loc2_.WWW_DOCKTEASE_COM._x = _loc2_.heading._x + _loc2_.heading._width - _loc2_.WWW_DOCKTEASE_COM._width;
         _loc2_.WWW_DOCKTEASE_COM._visible = true;
         _loc2_.heading.autoSize = "left";
         this.setLocalisedText(_loc2_.heading,"BOAT_YACHT_PURCHASE_COMPLETE");
         _loc2_.body.autoSize = "left";
         this.setLocalisedText(_loc2_.body,"BOATS_PURCHASED");
         _loc3_ = this.yachtModel != -1 ? this.yachtModel : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
         this.imageManager.addYachtImage("DOCK_DLC_MODEL",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.MODEL_IMAGE + _loc3_ + "_0",_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initYachtPurchaseFailurePage(newPage)
   {
      var _loc2_ = this.CONTENT.purchase;
      var _loc3_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.imageManager.addYachtImage(com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BACKGROUNDS_TXD,"yacht_bg_checkout",_loc2_.bgImage);
         this.initRoundedButton(_loc2_.WWW_DOCKTEASE_COM,"BOAT_YACHT_CONTINUE",0,0,16777215);
         _loc2_.WWW_DOCKTEASE_COM._x = _loc2_.heading._x + _loc2_.heading._width - _loc2_.WWW_DOCKTEASE_COM._width;
         _loc2_.WWW_DOCKTEASE_COM._visible = true;
         _loc2_.heading.autoSize = "left";
         _loc2_.body.autoSize = "left";
         _loc3_ = this.yachtModel != -1 ? this.yachtModel : this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL];
         this.imageManager.addYachtImage("DOCK_DLC_MODEL",com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.MODEL_IMAGE + _loc3_ + "_0",_loc2_.yachtImage);
         this.updateYachtBackground(_loc2_);
      }
      if(this.dataProviderUI[1][0] && this.dataProviderUI[2][0])
      {
         _loc2_.heading.htmlText = "<B>" + this.dataProviderUI[1][0] + "</B>";
         _loc2_.body.text = this.dataProviderUI[2][0];
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function getCheapestValidPrice(price, salePrice)
   {
      if(salePrice != undefined && salePrice >= 0)
      {
         return Math.min(price,salePrice);
      }
      return price;
   }
   function getTotalPrice(includeBaseCost)
   {
      var _loc2_ = 0;
      if(this.yachtModel != -1)
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST[this.yachtModel]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST[this.yachtModel]]);
      }
      if(this.yachtFittings != -1)
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST[this.yachtFittings]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST[this.yachtFittings]]);
      }
      if(this.yachtLighting != -1)
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST[this.yachtLighting]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST[this.yachtLighting]]);
      }
      if(this.yachtColour != -1)
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST[this.yachtColour]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST[this.yachtColour]]);
      }
      if(this.yachtFlag != -1)
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST]);
      }
      if(this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME])
      {
         _loc2_ += this.getCheapestValidPrice(this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST]);
      }
      return _loc2_;
   }
   function setLocalisedYachtText(tf, label, bold)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      if(bold)
      {
         tf.htmlText = "<B>" + tf.text + "</B>";
      }
      return tf.text;
   }
   function initTabs(container, activeTab)
   {
      var _loc5_ = 0;
      var _loc2_ = false;
      var _loc4_ = false;
      var _loc3_ = true;
      _loc4_ = !this.isModifying && this.yachtModel != -1;
      _loc3_ = container.YACHT_D_MODEL == activeTab;
      _loc5_ = this.initTab(container.YACHT_D_MODEL,"BOAT_YACHT_MODEL",_loc2_,_loc4_,_loc3_,_loc5_);
      _loc4_ = !this.isModifying && this.yachtFittings != -1;
      _loc3_ = container.YACHT_D_FITTINGS == activeTab;
      _loc2_ = !this.isModifying && this.yachtModel == -1;
      _loc5_ = this.initTab(container.YACHT_D_FITTINGS,"BOAT_YACHT_FITTINGS",_loc2_,_loc4_,_loc3_,_loc5_);
      _loc4_ = !this.isModifying && this.yachtLighting != -1;
      _loc3_ = container.YACHT_D_LIGHTING == activeTab;
      _loc2_ = !this.isModifying && this.yachtFittings == -1;
      _loc5_ = this.initTab(container.YACHT_D_LIGHTING,"BOAT_YACHT_LIGHTING",_loc2_,_loc4_,_loc3_,_loc5_);
      _loc4_ = !this.isModifying && this.yachtColour != -1;
      _loc3_ = container.YACHT_D_COLOR == activeTab;
      _loc2_ = !this.isModifying && this.yachtLighting == -1;
      _loc5_ = this.initTab(container.YACHT_D_COLOR,"BOAT_YACHT_COLOUR",_loc2_,_loc4_,_loc3_,_loc5_);
      _loc4_ = !this.isModifying && this.yachtFlag != -1;
      _loc3_ = container.YACHT_D_PERSONALIZE == activeTab;
      _loc2_ = !this.isModifying && this.yachtColour == -1;
      _loc5_ = this.initTab(container.YACHT_D_PERSONALIZE,"BOAT_YACHT_PERSONALISE",_loc2_,_loc4_,_loc3_,_loc5_);
      _loc4_ = false;
      _loc3_ = container.YACHT_D_CHECKOUT == activeTab;
      if(this.isModifying)
      {
         _loc2_ = this.yachtModel + this.yachtFittings + this.yachtLighting + this.yachtColour + this.yachtFlag == -5 && this.yachtName == "";
      }
      else
      {
         _loc2_ = this.yachtModel != -1 || this.yachtFittings != -1 || this.yachtLighting != -1 || this.yachtColour != -1 || this.yachtFlag != -1 || this.yachtName != "";
      }
      _loc5_ = this.initTab(container.YACHT_D_CHECKOUT,"BOAT_YACHT_CHECKOUT",_loc2_,_loc4_,_loc3_,_loc5_);
      this.updateTabs(container._parent,true);
      activeTab.btnTxt._alpha = 100;
   }
   function initTab(tab, label, disabled, showTick, showCircle, x)
   {
      tab.gotoAndStop("normal");
      var _loc3_ = tab.btnTxt;
      _loc3_.autoSize = "left";
      this.setLocalisedYachtText(_loc3_,label,true);
      tab._x = x;
      tab.bg._width = _loc3_._x + _loc3_._width + 15;
      tab.tick._visible = !showCircle && showTick;
      tab.circle._visible = showCircle;
      tab.cost.autoSize = "left";
      tab.sale.autoSize = "left";
      tab.redLine._visible = false;
      this.setTabDisabled(tab,disabled);
      this.dataTextScope.push(_loc3_);
      return x + tab.bg._width;
   }
   function updateTabs(page, noBluePanelAnimation)
   {
      var _loc4_ = page.tabs;
      var _loc3_ = 0;
      _loc3_ += this.updateTab(_loc4_.YACHT_D_MODEL,this.yachtModel,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_COST[this.yachtModel]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_MODEL_SALE_COST[this.yachtModel]]);
      _loc3_ += this.updateTab(_loc4_.YACHT_D_FITTINGS,this.yachtFittings,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_COST[this.yachtFittings]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FITTINGS_SALE_COST[this.yachtFittings]]);
      _loc3_ += this.updateTab(_loc4_.YACHT_D_COLOR,this.yachtColour,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_COST[this.yachtColour]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_COLOUR_SALE_COST[this.yachtColour]]);
      _loc3_ += this.updateTab(_loc4_.YACHT_D_LIGHTING,this.yachtLighting,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_COST[this.yachtLighting]],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_LIGHTING_SALE_COST[this.yachtLighting]]);
      _loc3_ += this.updatePersonaliseTab(_loc4_.YACHT_D_PERSONALIZE,this.yachtFlag,this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_FLAG_SALE_COST],this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME_SALE_COST]);
      if(_loc3_ >= 0)
      {
         if(noBluePanelAnimation)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(page.bluePanel);
            page.bluePanel._x = 0;
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(page.bluePanel,0.1,{_x:0,ease:com.rockstargames.ui.tweenStar.easing.Quad.easeIn});
         }
      }
      else if(noBluePanelAnimation)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(page.bluePanel);
         page.bluePanel._x = - page.bluePanel._width;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(page.bluePanel,0.1,{_x:- page.bluePanel._width,ease:com.rockstargames.ui.tweenStar.easing.Quad.easeIn});
      }
      var _loc5_;
      if(this.isModifying)
      {
         _loc5_ = this.yachtModel + this.yachtFittings + this.yachtLighting + this.yachtColour + this.yachtFlag == -5 && this.yachtName == "";
      }
      else
      {
         _loc5_ = this.yachtModel != -1 || this.yachtFittings != -1 || this.yachtLighting != -1 || this.yachtColour != -1 || this.yachtFlag != -1 || this.yachtName != "";
      }
      this.setTabDisabled(_loc4_.YACHT_D_CHECKOUT,_loc5_);
   }
   function updateTab(tab, value, price, salePrice)
   {
      var _loc4_ = tab.btnTxt;
      var _loc2_ = tab.cost;
      var _loc3_ = tab.sale;
      var _loc5_ = tab.redLine;
      if(price > 0)
      {
         if(salePrice != undefined && salePrice >= 0)
         {
            _loc2_.htmlText = "<B>" + this.formatPrice(price) + "</B>";
            _loc2_._x = _loc4_._x + 0.5 * (_loc4_._width - _loc2_._width);
            _loc2_._y = 61;
            if(salePrice == 0)
            {
               _loc3_.htmlText = "<B>" + this.setLocalisedText(_loc3_,"CLUB_FREE") + "</B>";
            }
            else
            {
               _loc3_.htmlText = "<B>+" + this.formatPrice(salePrice) + "</B>";
            }
            _loc3_._x = _loc4_._x + 0.5 * (_loc4_._width - _loc3_._width);
            _loc5_._x = _loc2_._x + _loc2_.textWidth + 7;
            _loc5_._width = _loc2_.textWidth + 10;
            _loc5_._visible = true;
            return Math.min(price,salePrice);
         }
         _loc2_.htmlText = "<B>+" + this.formatPrice(price) + "</B>";
         _loc2_._x = _loc4_._x + 0.5 * (_loc4_._width - _loc2_._width);
         _loc2_._y = 70;
         _loc3_.htmlText = "";
         _loc5_._visible = false;
         return price;
      }
      _loc2_.htmlText = "";
      _loc3_.htmlText = "";
      _loc5_._visible = false;
      return 0;
   }
   function updatePersonaliseTab(tab, value, flagPrice, namePrice, flagSalePrice, nameSalePrice)
   {
      var _loc6_ = tab.btnTxt;
      var _loc2_ = tab.cost;
      var _loc5_ = tab.sale;
      var _loc7_ = tab.redLine;
      var _loc8_ = value != -1;
      var _loc9_ = this.yachtName != "" && this.yachtName != this.yachtData[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DATA_NAME];
      if(!_loc8_ && !_loc9_)
      {
         _loc2_.htmlText = "";
         _loc5_.htmlText = "";
         _loc7_._visible = false;
         return 0;
      }
      var _loc4_ = 0;
      var _loc3_ = 0;
      if(_loc8_ && _loc9_)
      {
         _loc4_ = flagPrice + namePrice;
         if(flagSalePrice == -1 && nameSalePrice == -1)
         {
            _loc3_ = -1;
         }
         else if(flagSalePrice == -1)
         {
            _loc3_ = flagPrice + nameSalePrice;
         }
         else if(nameSalePrice == -1)
         {
            _loc3_ = flagSalePrice + namePrice;
         }
         else
         {
            _loc3_ = flagSalePrice + nameSalePrice;
         }
      }
      else if(_loc8_)
      {
         _loc4_ = flagPrice;
         _loc3_ = flagSalePrice;
      }
      else if(_loc9_)
      {
         _loc4_ = namePrice;
         _loc3_ = nameSalePrice;
      }
      if(_loc3_ >= 0 && _loc3_ < _loc4_)
      {
         _loc2_.htmlText = "<B>" + this.formatPrice(_loc4_) + "</B>";
         _loc2_._x = _loc6_._x + 0.5 * (_loc6_._width - _loc2_._width);
         _loc2_._y = 61;
         if(_loc3_ == 0)
         {
            _loc5_.htmlText = "<B>" + this.setLocalisedText(_loc5_,"CLUB_FREE") + "</B>";
         }
         else
         {
            _loc5_.htmlText = "<B>+" + this.formatPrice(_loc3_) + "</B>";
         }
         _loc5_._x = _loc6_._x + 0.5 * (_loc6_._width - _loc5_._width);
         _loc7_._x = _loc2_._x + _loc2_.textWidth + 7;
         _loc7_._width = _loc2_.textWidth + 10;
         _loc7_._visible = true;
         return _loc3_;
      }
      if(_loc4_ == 0)
      {
         if(this.isModifying)
         {
            _loc2_.htmlText = "<B>" + this.setLocalisedText(_loc2_,"CLUB_FREE") + "</B>";
         }
         else
         {
            _loc2_.htmlText = "";
         }
      }
      else
      {
         _loc2_.htmlText = "<B>+" + this.formatPrice(_loc4_) + "</B>";
      }
      _loc2_._x = _loc6_._x + 0.5 * (_loc6_._width - _loc2_._width);
      _loc2_._y = 70;
      _loc5_.htmlText = "";
      _loc7_._visible = false;
      return _loc4_;
   }
   function setTabDisabled(tab, isDisabled)
   {
      tab.disabled = isDisabled;
      if(isDisabled)
      {
         tab.btnTxt._alpha = 25;
      }
      else
      {
         tab.btnTxt._alpha = 100;
      }
   }
   function initTextButton(button, label)
   {
      var _loc2_ = button.btnTxt;
      _loc2_.textAutoSize = "shrink";
      _loc2_.verticalAlign = "center";
      this.setLocalisedText(_loc2_,label);
      this.dataTextScope.push(_loc2_);
   }
   function initNextButton(button, isDisabled, heading)
   {
      this.initRoundedButton(button,"BOAT_YACHT_NEXT",0,0,16777215);
      this.updateNextButton(button,isDisabled);
      button._x = heading._x + heading._width - button._width;
   }
   function updateNextButton(button, isDisabled)
   {
      button.disabled = isDisabled;
      button._alpha = !isDisabled ? 100 : 25;
   }
   function initRoundedButton(button, label, textOnColour, textOffColour, backgroundColour, backgroundAlpha)
   {
      button.onColour = textOnColour;
      button.offColour = textOffColour;
      button.btnTxt.autoSize = "left";
      this.setLocalisedText(button.btnTxt,label);
      button.btnTxt.htmlText = "<B>" + button.btnTxt.text + "</B>";
      var _loc8_ = Math.floor(button.btnTxt._width);
      var _loc7_ = 60;
      var _loc3_ = Math.max(_loc8_,_loc7_);
      button.bg._width = _loc3_ + button.bg._height;
      button.btnTxt._x = Math.floor(0.5 * (_loc3_ - button.btnTxt._width + button.bg._height));
      var _loc6_ = backgroundColour >> 16 & 0xFF;
      var _loc9_ = backgroundColour >> 8 & 0xFF;
      var _loc5_ = backgroundColour & 0xFF;
      com.rockstargames.ui.utils.Colour.Colourise(button.bg,_loc6_,_loc9_,_loc5_,backgroundAlpha);
      this.dataTextScope.push(button.btnTxt);
   }
   function setButtonDisabled(button, isDisabled)
   {
      button.disabled = isDisabled;
      button.gotoAndStop(!isDisabled ? "enabled" : "disabled");
   }
   function updateOptionButtons(page, buttonName, selectedIndex, numButtons, dataProviderIndex)
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < numButtons)
      {
         _loc2_ = page[buttonName + _loc3_];
         _loc2_.disabled = false;
         _loc2_.selected._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = null;
      if(selectedIndex != -1)
      {
         _loc2_ = page[buttonName + selectedIndex];
      }
      else if(this.yachtData[dataProviderIndex] != -1)
      {
         _loc2_ = page[buttonName + this.yachtData[dataProviderIndex]];
      }
      if(_loc2_)
      {
         _loc2_.disabled = true;
         _loc2_.selected._visible = true;
      }
   }
   function initUpgradeItemCost(mc, cost, saleCost, nextButton)
   {
      mc.label.textAutoSize = "shrink";
      mc.label._width = nextButton._x - mc._x - mc.label._x - 10;
      mc.saleSticker.label.autoSize = "left";
      this.setLocalisedYachtText(mc.saleSticker.label,"WEB_VEHICLE_SALE",true);
      mc.saleSticker.right._x = mc.saleSticker.label._x + Math.ceil(mc.saleSticker.label.textWidth) + 7;
      mc.saleSticker.centre._width = mc.saleSticker.right._x - mc.saleSticker.centre._x + 5;
      mc.originalPrice.shadowStrength = 2;
      mc.originalPrice.shadowDistance = 2;
      mc.originalPrice.shadowColor = 0;
      mc.originalPrice.shadowAlpha = 0.5;
      mc.originalPrice.shadowBlurX = 1;
      mc.originalPrice.shadowBlurY = 1;
      this.updateUpgradeItemCost(mc,cost,saleCost);
   }
   function updateUpgradeItemCost(mc, cost, saleCost)
   {
      mc.label.text = this.formatPrice(cost);
      mc._visible = cost > 0;
      if(saleCost != undefined && saleCost >= 0)
      {
         mc.originalPrice.text = mc.label.text;
         if(saleCost == 0)
         {
            mc.label.htmlText = "<B><font size=\"28\">" + this.setLocalisedText(mc.label,"CLUB_FREE") + "</font></B>";
         }
         else
         {
            mc.label.text = this.formatPrice(saleCost);
         }
         if(this.currentPage == "YACHT_D_PERSONALIZE")
         {
            mc.originalPrice._x = -280 - mc.originalPrice.textWidth;
            mc.saleSticker._x = -274 - mc.saleSticker._width;
         }
         else
         {
            mc.originalPrice._x = -34 - mc.originalPrice.textWidth;
            mc.saleSticker._x = -28 - mc.saleSticker._width;
         }
         mc.redLine._width = mc.originalPrice.textWidth + 5;
         mc.redLine._x = mc.originalPrice._x + mc.redLine._width;
         mc.redLine._visible = true;
         mc.saleSticker._visible = true;
      }
      else
      {
         mc.originalPrice.text = "";
         mc.redLine._visible = false;
         mc.saleSticker._visible = false;
      }
   }
   function updateUpgradeTotal(tf)
   {
      var _loc3_ = this.getTotalPrice(false);
      var _loc4_;
      if(_loc3_ == 0)
      {
         _loc4_ = this.yachtModel + this.yachtFittings + this.yachtLighting + this.yachtColour + this.yachtFlag != -5 || this.yachtName != "";
         if(_loc4_)
         {
            tf.htmlText = "<B>" + this.setLocalisedText(tf,"CLUB_FREE") + "</B>";
         }
         else
         {
            tf.htmlText = "";
         }
      }
      else
      {
         tf.htmlText = "<B>" + this.formatPrice(_loc3_) + "</B>";
      }
   }
   function initRebateSticker(page, isVisible, image)
   {
      if(isVisible)
      {
         page.rebate.label.autoSize = "left";
         this.setLocalisedYachtText(page.rebate.label,"WEB_VEHICLE_REBATE",true);
         page.rebate.right._x = page.rebate.label._x + Math.ceil(page.rebate.label.textWidth) + 7;
         page.rebate.centre._width = page.rebate.right._x - page.rebate.centre._x + 5;
         if(image)
         {
            page.rebate._x = image._x + image._width - page.rebate._width - 8;
         }
      }
      else
      {
         page.rebate._visible = false;
      }
   }
   function initSlideshow(numSlides, slideTXD, slideDisplay, imagePrefix, descriptionLabelPrefix, descriptionTextField, startIndex)
   {
      this.numSlides = numSlides;
      this.slideTXD = slideTXD;
      this.slideDisplay = slideDisplay;
      this.slideImagePrefix = imagePrefix;
      this.slideDescriptionPrefix = descriptionLabelPrefix;
      this.slideDescriptionTextField = descriptionTextField;
      this.currentSlideIndex = !isNaN(startIndex) ? startIndex : 0;
      this.updateSlideshow(0);
   }
   function updateSlideshow(step)
   {
      this.currentSlideIndex += step + this.numSlides;
      this.currentSlideIndex %= this.numSlides;
      this.imageManager.addYachtImage(this.slideTXD,this.slideImagePrefix + this.currentSlideIndex,this.slideDisplay);
      if(this.slideDescriptionPrefix)
      {
         this.setLocalisedText(this.slideDescriptionTextField,this.slideDescriptionPrefix + this.currentSlideIndex);
      }
   }
   function updateYachtBackground(page)
   {
      this.CONTENT.BOUNDING_BOX._height = page.background._height;
      this.browser.RESIZE_WEBSITE();
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success && id.indexOf("yacht") == 0)
      {
         this.imageManager.yachtTextureLoaded(txd);
      }
      else
      {
         super.TXD_HAS_LOADED(txd,success,id);
      }
   }
   function CLEANUP()
   {
      this.disposeTweens();
      this.imageManager.dispose();
      super.CLEANUP();
   }
   function disposeTweens()
   {
      var _loc3_ = [this.CONTENT.home[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE],this.CONTENT.home[com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_HOME_PAGE].topImage,this.CONTENT.model.bluePanel,this.CONTENT.model.optionsDropDown.itemContainer,this.CONTENT.fittings.bluePanel,this.CONTENT.fittings.optionsDropDown.itemContainer,this.CONTENT.lighting.bluePanel,this.CONTENT.colour.bluePanel,this.CONTENT.personalise.bluePanel,this.CONTENT.checkout.bluePanel];
      var _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc3_[_loc2_])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.slideDisplay = undefined;
   }
}
