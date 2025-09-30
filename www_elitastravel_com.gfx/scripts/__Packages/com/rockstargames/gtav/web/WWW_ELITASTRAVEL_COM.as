class com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM extends com.rockstargames.gtav.web.vehicleSites.VehicleWebsite
{
   var BUY_NOW_LABEL;
   var CAN_STORE_PAGE;
   var CONTENT;
   var DESCRIPTION_HEADER_LABEL;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_IMAGE_SUFFIX;
   var DETAILS_PAGE_VEHICLE_BUTTON_OFFSET;
   var ERROR_PAGE;
   var FAILED_PAGE;
   var FILTER_ALL_LABEL;
   var HOME_PAGE;
   var HOME_PAGE_BODY_LABEL;
   var HOME_PAGE_HEADER_LABEL;
   var LIVERY_HEADER_LABEL;
   var PAGE_NAMES;
   var PURCHASE_PAGE;
   var SORT_NEW_IN_LABEL;
   var SORT_PRICE_LABEL;
   var STATS_HEADER_LABEL;
   var SUCCESS_PAGE;
   var TOOLBAR_LABEL;
   var USE_SEPARATE_DETAIL_IMAGES;
   var VEHICLE_BUTTON_ROW_HEIGHT;
   var _name;
   var addVehicleImage;
   var browser;
   var categoryOrder;
   var currentFilter;
   var currentPage;
   var currentPageInitialised;
   var currentVehicle;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var dropDownButtonOffColour;
   var dropDownButtonOnColour;
   var favourUpperCase;
   var formatPrice;
   var getVehicleFromId;
   var hasSelectedBuyItNow;
   var initOptions;
   var initSortingButtons;
   var initVehicleButtons;
   var isMP;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var selectedOption;
   var selectedStyle;
   var setLocalisedText;
   var sortButtonOffColour;
   var sortButtonOnColour;
   static var BRAND_NONE = "";
   static var TXD_DEFAULT = "ELT_DEFAULT";
   static var TXD_BUSINESS = "ELT_DLC_BUSINESS";
   static var TXD_PILOT = "ELT_DLC_PILOT";
   static var TXD_LUXE = "ELT_DLC_LUXE";
   static var TXD_APARTMENTS = "ELT_DLC_APARTMENTS";
   static var TXD_EXECUTIVE1 = "ELT_DLC_EXECUTIVE1";
   static var TXD_SMUGGLER = "ELT_DLC_SMUGGLER";
   static var TXD_ASSAULT = "ELT_DLC_ASSAULT";
   static var TXD_BATTLE = "ELT_DLC_BATTLE";
   static var TXD_SUM2 = "ELT_DLC_SUM2";
   static var TXD_2024_02 = "ELT_DLC_2024_2";
   static var DLC_BUSINESS = "WEB_BUSINESSPACK";
   static var DLC_PILOT = "WEB_PILOTPACK";
   static var DLC_HEIST = "WEB_HEISTPACK";
   static var DLC_LUXE = "WEB_LUXEPACK";
   static var DLC_APARTMENTS = "WEB_APARTMENTSPACK";
   static var DLC_EXECUTIVE1 = "WEB_EXECUTIVE1PACK";
   static var DLC_SMUGGLER = "WEB_SMUGGLERPACK";
   static var DLC_ASSAULT = "WEB_ASSAULTPACK";
   static var DLC_BATTLE = "WEB_BATTLEPACK";
   static var DLC_SUM2 = "WEB_SUM2";
   static var DLC_2024_02 = "WEB_2024_02";
   var vehicles = {DUSTER:{id:3,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:2,colourways:false},SHAMAL:{id:4,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:10,colourways:false},CUBAN800:{id:5,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:2,colourways:false},LUXOR:{id:6,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:10,colourways:false},STUNT:{id:7,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:1,colourways:false},FROGGER:{id:8,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:4,colourways:false},MAVERICK:{id:15,brand:com
   .rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:4,colourways:false},ANNIHL:{id:16,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:6,colourways:false},MAMMATUS:{id:17,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:4,colourways:false},TITAN:{id:18,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:10,colourways:false},VELUM:{id:19,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:4,colourways:false},VESTRA:{id:20,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_BUSINESS,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM
   .DLC_BUSINESS,seats:2,colourways:false},MILJET:{id:21,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_PILOT,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_PILOT,seats:16,colourways:false},BESRA:{id:22,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_PILOT,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_PILOT,seats:1,colourways:false},DODO:{id:23,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,seats:4,colourways:false,desc:"ELT_DLCDODO"},SWIFT:{id:24,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_PILOT,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_PILOT,seats:4,livery:["ELT_DLC_LIV1","ELT_DLC_LIV2"]},VELUM2:{id:25,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM
   .BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_DEFAULT,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_HEIST,seats:5,buyItNow:true},LUXOR2:{id:26,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_LUXE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_LUXE,seats:8,colourways:false},SWIFT2:{id:27,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_LUXE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_LUXE,seats:4,colourways:false},SVOLITO:{id:28,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_APARTMENTS,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_APARTMENTS,seats:4,colourways:false},SVOLITO2:{id:29,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_APARTMENTS,dlc:com
   .rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_APARTMENTS,seats:4,colourways:false},VOLATUS:{id:30,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_EXECUTIVE1,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_EXECUTIVE1,seats:4,colourways:false},NIMBUS:{id:31,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_EXECUTIVE1,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_EXECUTIVE1,seats:8,colourways:false},HOWARD:{id:32,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SMUGGLER,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_SMUGGLER,seats:1,colourways:false,buyItNow:true},ALPHAZ1:{id:33,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SMUGGLER,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM
   .DLC_SMUGGLER,seats:1,colourways:false,buyItNow:true},HAVOK:{id:34,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_SMUGGLER,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SMUGGLER,seats:1,colourways:false,buyItNow:true},SEABREEZE:{id:35,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_SMUGGLER,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SMUGGLER,seats:2,colourways:false,buyItNow:true},MICROLIGHT:{id:36,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_SMUGGLER,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SMUGGLER,seats:1,colourways:false,buyItNow:true},SPARROW:{id:37,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_ASSAULT,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM
   .TXD_ASSAULT,seats:2,colourways:false,buyItNow:false},BLIMP3:{id:38,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_BATTLE,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_BATTLE,seats:4,colourways:false,livery:["BLIMP3_ELT_1","BLIMP3_ELT_2","BLIMP3_ELT_3","BLIMP3_ELT_4","BLIMP3_ELT_5","BLIMP3_ELT_6","BLIMP3_ELT_7","BLIMP3_ELT_8"],buyItNow:true},CONADA:{id:39,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_SUM2,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_SUM2,seats:4,colourways:false,buyItNow:true},DUSTER2:{id:40,brand:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BRAND_NONE,dlc:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.DLC_2024_02,txd:com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.TXD_2024_02,seats:1,colourways:false,buyItNow:true}};
   static var BLIMP_DATA_SLOT = 10;
   function WWW_ELITASTRAVEL_COM()
   {
      super();
      this._name = "WWW_ELITASTRAVEL_COM";
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 3355443;
      this.sortButtonOnColour = 16777215;
      this.sortButtonOffColour = 3355443;
      this.dropDownButtonOnColour = 16777215;
      this.dropDownButtonOffColour = 3355443;
      this.favourUpperCase = false;
      this.DETAILS_PAGE = "DETAILS";
      this.PURCHASE_PAGE = "PURCHASEPLANE";
      this.TOOLBAR_LABEL = "ELT_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "ELT_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "ELT_PG1_BODY1";
      this.BUY_NOW_LABEL = "ELT_BUYNOW";
      this.SORT_PRICE_LABEL = "ELT_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "ELT_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "ELT_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "ELT_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "ELT_STATS_HEADER";
      this.FILTER_ALL_LABEL = "ELT_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "ELT_";
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.hasSelectedBuyItNow = true;
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["ELT_PLANES"];
         this.vehicles = {ELT_PLANES:[this.vehicles.DUSTER2,this.vehicles.CONADA,this.vehicles.BLIMP3,this.vehicles.SPARROW,this.vehicles.SEABREEZE,this.vehicles.HOWARD,this.vehicles.ALPHAZ1,this.vehicles.MICROLIGHT,this.vehicles.HAVOK,this.vehicles.VOLATUS,this.vehicles.NIMBUS,this.vehicles.SVOLITO,this.vehicles.SVOLITO2,this.vehicles.LUXOR2,this.vehicles.SWIFT2,this.vehicles.VELUM2,this.vehicles.SWIFT,this.vehicles.DODO,this.vehicles.MILJET,this.vehicles.BESRA,this.vehicles.VESTRA,this.vehicles.DUSTER,this.vehicles.SHAMAL,this.vehicles.CUBAN800,this.vehicles.LUXOR,this.vehicles.STUNT,this.vehicles.FROGGER,this.vehicles.MAVERICK,this.vehicles.ANNIHL,this.vehicles.MAMMATUS,this.vehicles.TITAN,this.vehicles.VELUM]};
      }
      else
      {
         this.categoryOrder = ["ELT_PLANES"];
         this.vehicles = {ELT_PLANES:[this.vehicles.LUXOR2,this.vehicles.SWIFT2,this.vehicles.VESTRA,this.vehicles.MILJET,this.vehicles.BESRA,this.vehicles.SWIFT,this.vehicles.DODO,this.vehicles.DUSTER,this.vehicles.SHAMAL,this.vehicles.CUBAN800,this.vehicles.LUXOR,this.vehicles.STUNT,this.vehicles.FROGGER,this.vehicles.MAVERICK]};
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = this.SUCCESS_PAGE;
      this.PAGE_NAMES[12] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[13] = this.FAILED_PAGE;
      this.PAGE_NAMES[14] = this.ERROR_PAGE;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
   }
   function updateBackground(contentItem, page)
   {
      super.updateBackground(contentItem,page);
      page.panel._height = page.background._height - page.panel._y - page.footer._height;
   }
   function setOptionsButtons(selectedOption)
   {
      super.setOptionsButtons(selectedOption);
      var _loc11_;
      var _loc4_;
      var _loc8_;
      if(this.currentVehicle.livery)
      {
         _loc11_ = selectedOption != 0 ? this.currentVehicle.secondaryPrice : this.currentVehicle.price;
         if(this.currentVehicle.id == 38)
         {
            if(this.currentVehicle.secondaryPrice < 0)
            {
               _loc11_ = this.currentVehicle.price;
            }
         }
         _loc4_ = this.CONTENT.details;
         if(_loc11_ == 0)
         {
            _loc4_.priceText.text = "";
         }
         else
         {
            _loc4_.priceText.text = !isNaN(_loc11_) ? this.formatPrice(_loc11_) : _loc11_;
         }
         _loc8_ = selectedOption != 0 ? this.currentVehicle.secondarySalePrice : this.currentVehicle.salePrice;
         if(this.currentVehicle.id == 38)
         {
            if(_loc8_ < 0)
            {
               _loc8_ = this.currentVehicle.salePrice;
            }
         }
         if(_loc8_ == 0)
         {
            _loc4_.reducedPriceText.text = "";
         }
         else
         {
            _loc4_.reducedPriceText.text = !isNaN(_loc8_) ? this.formatPrice(_loc8_) : _loc8_;
         }
      }
      var _loc9_;
      var _loc7_;
      var _loc10_;
      var _loc3_;
      var _loc5_;
      if(this.currentVehicle.id == 38)
      {
         _loc9_ = -1;
         _loc7_ = 1;
         _loc10_ = 2;
         _loc3_ = 0;
         while(_loc3_ < 8)
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc3_] == _loc9_)
            {
               _loc4_.options["optionsButton_" + _loc3_].disabled = true;
            }
            else if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc3_] == _loc7_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc3_] == _loc10_)
            {
               _loc4_[this.PURCHASE_PAGE + "_" + (_loc3_ + 1)].disabled = true;
            }
            _loc5_ = _loc3_ == selectedOption;
            _loc4_["BUYITNOWSTOCK_1$" + _loc3_]._visible = _loc5_;
            _loc4_["BUYITNOWSTOCK_1$" + _loc3_].disabled = !_loc5_;
            _loc4_["BUYITNOWSTOCK_2$" + _loc3_]._visible = _loc5_;
            _loc4_["BUYITNOWSTOCK_2$" + _loc3_].disabled = !_loc5_;
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function initOutcomePage(headerText, bodyText, soldLabel, pauseBeforeShowing)
   {
      super.initOutcomePage(headerText,bodyText,soldLabel,pauseBeforeShowing);
      var _loc3_ = this.CONTENT.purchase;
      var _loc4_;
      var _loc5_;
      if(this.currentVehicle.livery)
      {
         _loc4_ = this.selectedOption != 1 ? this.currentVehicle.price : this.currentVehicle.secondaryPrice;
         if(_loc4_ == 0)
         {
            _loc3_.priceText.text = "";
         }
         else
         {
            _loc3_.priceText.text = !isNaN(_loc4_) ? this.formatPrice(_loc4_) : _loc4_;
         }
         _loc5_ = this.selectedOption != 1 ? this.currentVehicle.salePrice : this.currentVehicle.secondarySalePrice;
         if(_loc5_ == 0)
         {
            _loc3_.reducedPriceText.text = "";
         }
         else
         {
            _loc3_.reducedPriceText.text = !isNaN(_loc5_) ? this.formatPrice(_loc5_) : _loc5_;
         }
      }
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
         else if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice > 0)
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
   function goToAnchor(link)
   {
      var _loc7_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc6_ = link.slice(0,_loc7_);
      var _loc3_ = link.slice(_loc7_ + 1);
      var _loc9_;
      var _loc5_;
      var _loc8_;
      if(_loc6_ == this.PURCHASE_PAGE && this.currentVehicle.name == "BLIMP3")
      {
         _loc9_ = parseInt(_loc3_) - 1;
         if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc9_] != -1)
         {
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
      }
      else if(_loc6_ == "BUYITNOWSTOCK")
      {
         _loc5_ = true;
         if(_loc3_.charAt(1) == "$")
         {
            _loc8_ = parseInt(_loc3_.substr(2));
            if(this.currentVehicle.name == "BLIMP3")
            {
               if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc8_] != 0)
               {
                  _loc5_ = false;
               }
            }
         }
         if(_loc3_.charAt(0) == "1" && this.currentVehicle.price1Unlocked && _loc5_)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc3_.charAt(0) == "2" && this.currentVehicle.price2Unlocked && _loc5_)
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
   function initDetailsPage(pageName, newPage)
   {
      var _loc6_ = this.CONTENT.details;
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
      if(pageName == "DETAILS38")
      {
         this.initBlimpPage(pageName,newPage);
      }
   }
   function initBlimpPage(pageName, newPage)
   {
      var _loc11_ = -1;
      var _loc10_ = 1;
      var _loc8_ = 2;
      var _loc2_ = this.CONTENT.details;
      var _loc9_ = false;
      var _loc6_ = 0;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      while(_loc6_ < 8)
      {
         _loc3_ = _loc2_.options["liveryText" + _loc6_];
         if(_loc3_ != undefined)
         {
            if(_loc2_.options["tick" + _loc6_])
            {
               _loc2_.options["tick" + _loc6_].removeMovieClip();
            }
            if(_loc2_.options["padlock" + _loc6_])
            {
               _loc2_.options["padlock" + _loc6_].removeMovieClip();
            }
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc6_] == _loc11_)
            {
               _loc3_._alpha = 60;
               _loc4_ = _loc2_.options.attachMovie("padlock","padlock" + _loc6_,_loc2_.options.getNextHighestDepth());
               _loc4_._x = _loc3_._x + _loc3_._width - _loc4_._width;
               _loc4_._y = _loc3_._y;
               _loc2_.options["optionsButton_" + _loc6_].disabled = true;
            }
            else if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc6_] == _loc10_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc6_] == _loc8_)
            {
               _loc5_ = _loc2_.options.attachMovie("tick","tick" + _loc6_,_loc2_.options.getNextHighestDepth());
               _loc5_._x = _loc3_._x + _loc3_._width - _loc5_._width;
               _loc5_._y = _loc3_._y;
            }
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc6_] == _loc8_)
            {
               this.setLocalisedText(_loc2_.options["liveryText" + _loc6_],"BLIMP3_ELT_" + (_loc6_ + 1) + "_EQP");
               this.setOptionsButtons(_loc6_);
               _loc9_ = true;
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      var _loc12_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][8];
      var _loc13_;
      if(!isNaN(_loc12_) && _loc12_ >= 0 && _loc2_.options.liveryText7)
      {
         _loc13_ = [5,4,7,2,1,8,3,6,9];
         this.setLocalisedText(_loc2_.options.liveryText7,"FCCLUB_NAME_" + _loc13_[this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][8]]);
      }
      if(!_loc9_)
      {
         this.setOptionsButtons(0);
      }
      _loc2_.award._visible = false;
      var _loc7_;
      if(this.currentVehicle.secondaryPrice > 0)
      {
         _loc7_ = 235;
         _loc2_.optionsHeaderText._y = _loc7_;
         _loc7_ += _loc2_.optionsHeaderText._height + 5;
         _loc2_.options._y = _loc7_;
         _loc7_ += _loc2_.options._height + 16;
         _loc2_.BUYITNOWSTOCK_1._y = _loc7_;
         _loc6_ = 0;
         while(_loc6_ < 10)
         {
            _loc2_["BUYITNOWSTOCK_1$" + _loc6_]._y = _loc7_;
            _loc6_ = _loc6_ + 1;
         }
         _loc7_ += _loc2_.BUYITNOWSTOCK_1._height + 16;
         _loc2_.BUYITNOWSTOCK_2._y = _loc7_;
         _loc6_ = 0;
         while(_loc6_ < 10)
         {
            _loc2_["BUYITNOWSTOCK_2$" + _loc6_]._y = _loc7_;
            _loc6_ = _loc6_ + 1;
         }
         _loc7_ += _loc2_.BUYITNOWSTOCK_1._height + 16;
         _loc2_.descriptionText._y = _loc7_;
      }
   }
   function initPurchaseButtons(page, numOptions)
   {
      super.initPurchaseButtons(page,numOptions);
      var _loc6_;
      var _loc3_;
      var _loc4_;
      if(this.currentVehicle.id == 38)
      {
         _loc6_ = 1;
         page = this.CONTENT.details;
         _loc3_ = 0;
         while(_loc3_ < numOptions)
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc3_] == _loc6_)
            {
               _loc4_ = page[this.PURCHASE_PAGE + "_" + (_loc3_ + 1)];
               this.setLocalisedText(_loc4_.btnTxt,"ELT_OWNED");
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function initBuyItNowDetailsPage(id, currentVehicle, newPage, frame)
   {
      var _loc9_ = 1;
      var _loc10_ = 2;
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
      var _loc11_ = _loc2_.BUYITNOWSTOCK_2.textBlock2.originalPriceText;
      var _loc13_ = _loc2_.BUYITNOWSTOCK_2.textBlock1.priceText;
      var _loc8_;
      var _loc14_;
      if(currentVehicle.secondaryPrice > 0)
      {
         _loc2_.BUYITNOWSTOCK_2.onColour = this.purchaseButtonOnColour;
         _loc2_.BUYITNOWSTOCK_2.offColour = this.purchaseButtonOffColour;
         _loc8_ = _loc2_.BUYITNOWSTOCK_2._width;
         if(currentVehicle.secondarySalePrice != undefined && currentVehicle.secondarySalePrice > 0 && currentVehicle.secondarySalePrice != currentVehicle.secondaryPrice)
         {
            _loc11_.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc13_.text = this.formatPrice(currentVehicle.secondarySalePrice);
            _loc14_ = _loc11_.textWidth + _loc13_.textWidth + 10;
            _loc11_.autoSize = "left";
            _loc13_.autoSize = "left";
            _loc11_._x = 0.5 * (_loc8_ - _loc14_) - _loc2_.BUYITNOWSTOCK_2.textBlock2._x;
            _loc11_._y = _loc13_._y + _loc2_.BUYITNOWSTOCK_2.textBlock1._y - _loc2_.BUYITNOWSTOCK_2.textBlock2._y + 5;
            _loc13_._x = _loc11_._x + _loc11_.textWidth + 10;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._x = _loc11_._x + _loc11_._width + _loc2_.BUYITNOWSTOCK_2.textBlock1._x;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._y = _loc11_._y + _loc2_.BUYITNOWSTOCK_2.textBlock2._y + 7;
            _loc2_.BUYITNOWSTOCK_2.reductionLine._width = _loc11_._width;
         }
         else
         {
            _loc13_.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc2_.BUYITNOWSTOCK_2.reductionLine._visible = false;
         }
         _loc2_.BUYITNOWSTOCK_2.padlock._visible = !currentVehicle.price2Unlocked;
         this.setLocalisedText(_loc2_.BUYITNOWSTOCK_2.textBlock1.buyItNowText,"ELT_BIN_PRICE");
         if(currentVehicle.livery == undefined)
         {
            this.dataTextScope.unshift(_loc2_.BUYITNOWSTOCK_2.btnTxt);
         }
      }
      else
      {
         _loc2_.BUYITNOWSTOCK_2._visible = false;
         _loc2_.textBlock1.buyItNowText._visible = false;
      }
      _loc2_.BUYITNOWSTOCK_1.onColour = this.purchaseButtonOnColour;
      _loc2_.BUYITNOWSTOCK_1.offColour = this.purchaseButtonOffColour;
      _loc8_ = _loc2_.BUYITNOWSTOCK_1._width;
      _loc11_ = _loc2_.BUYITNOWSTOCK_1.textBlock2.originalPriceText;
      _loc13_ = _loc2_.BUYITNOWSTOCK_1.textBlock1.priceText;
      if(currentVehicle.salePrice != undefined && currentVehicle.salePrice > 0 && currentVehicle.salePrice != currentVehicle.price)
      {
         _loc11_.text = this.formatPrice(currentVehicle.price);
         _loc13_.text = this.formatPrice(currentVehicle.salePrice);
         _loc14_ = _loc11_.textWidth + _loc13_.textWidth + 10;
         _loc11_.autoSize = "left";
         _loc13_.autoSize = "left";
         _loc11_._x = 0.5 * (_loc8_ - _loc14_) - _loc2_.BUYITNOWSTOCK_1.textBlock2._x;
         _loc11_._y = _loc13_._y + _loc2_.BUYITNOWSTOCK_1.textBlock1._y - _loc2_.BUYITNOWSTOCK_1.textBlock2._y + 5;
         _loc13_._x = _loc11_._x + _loc11_.textWidth + 10;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._x = _loc11_._x + _loc11_._width + _loc2_.BUYITNOWSTOCK_1.textBlock2._x;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._y = _loc11_._y + _loc2_.BUYITNOWSTOCK_1.textBlock2._y + 7;
         _loc2_.BUYITNOWSTOCK_1.reductionLine._width = _loc11_._width;
      }
      else
      {
         _loc13_.text = this.formatPrice(currentVehicle.price);
         _loc2_.BUYITNOWSTOCK_1.reductionLine._visible = false;
      }
      _loc2_.BUYITNOWSTOCK_1.padlock._visible = !currentVehicle.price1Unlocked;
      this.setLocalisedText(_loc2_.BUYITNOWSTOCK_1.textBlock1.buyItNowText,"ELT_NORMAL_PRICE");
      if(currentVehicle.livery == undefined)
      {
         this.dataTextScope.unshift(_loc2_.BUYITNOWSTOCK_1.btnTxt);
      }
      var _loc7_;
      var _loc5_;
      var _loc3_;
      if(currentVehicle.livery != undefined)
      {
         _loc7_ = this.initOptions(_loc2_);
         _loc5_ = _loc7_ - 1;
         while(_loc5_ >= 0)
         {
            if(currentVehicle.secondaryPrice > 0)
            {
               _loc3_ = _loc2_.BUYITNOWSTOCK_2.duplicateMovieClip("BUYITNOWSTOCK_2$" + _loc5_,_loc2_.getNextHighestDepth());
               _loc3_._x = _loc2_.BUYITNOWSTOCK_2._x;
               _loc3_._y = _loc2_.BUYITNOWSTOCK_2._y;
               _loc3_.onColour = this.purchaseButtonOnColour;
               _loc3_.offColour = this.purchaseButtonOffColour;
               _loc3_.textBlock2.originalPriceText.text = _loc2_.BUYITNOWSTOCK_2.textBlock2.originalPriceText.text;
               _loc3_.textBlock1.priceText.text = _loc2_.BUYITNOWSTOCK_2.textBlock1.priceText.text;
               _loc3_.btnTxt.text = _loc2_.BUYITNOWSTOCK_2.btnTxt.text;
               if(currentVehicle.secondarySalePrice != undefined && currentVehicle.secondarySalePrice > 0 && currentVehicle.secondarySalePrice != currentVehicle.secondaryPrice)
               {
                  _loc3_.textBlock2.originalPriceText.autoSize = "left";
                  _loc3_.textBlock1.priceText.autoSize = "left";
                  _loc3_.textBlock2.originalPriceText._x = _loc2_.BUYITNOWSTOCK_2.textBlock2.originalPriceText._x;
                  _loc3_.textBlock2.originalPriceText._y = _loc2_.BUYITNOWSTOCK_2.textBlock2.originalPriceText._y;
                  _loc3_.textBlock1.priceText._x = _loc2_.BUYITNOWSTOCK_2.textBlock1.priceText._x;
                  _loc3_.reductionLine._x = _loc2_.BUYITNOWSTOCK_2.reductionLine._x;
                  _loc3_.reductionLine._y = _loc2_.BUYITNOWSTOCK_2.reductionLine._y;
                  _loc3_.reductionLine._width = _loc2_.BUYITNOWSTOCK_2.reductionLine._width;
               }
               else
               {
                  _loc3_.reductionLine._visible = false;
               }
               _loc3_.padlock._visible = _loc2_.BUYITNOWSTOCK_2.padlock._visible;
               if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc5_] == _loc9_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc5_] == _loc10_)
               {
                  this.setLocalisedText(_loc3_.textBlock2.originalPriceText,"ELT_OWNED");
                  _loc3_.textBlock2.originalPriceText._x = 0.5 * (_loc8_ - _loc3_.textBlock2.originalPriceText.textWidth) - 10;
                  _loc3_.reductionLine._visible = false;
                  _loc3_.textBlock1.buyItNowText.text = "";
                  _loc3_.textBlock1.priceText.text = "";
                  _loc3_.padlock._visible = true;
               }
               else
               {
                  _loc3_.textBlock1.buyItNowText.text = _loc2_.BUYITNOWSTOCK_2.textBlock1.buyItNowText.text;
               }
               this.dataTextScope.unshift(_loc3_.btnTxt);
            }
            _loc5_ = _loc5_ - 1;
         }
         _loc5_ = _loc7_ - 1;
         while(_loc5_ >= 0)
         {
            _loc3_ = _loc2_.BUYITNOWSTOCK_1.duplicateMovieClip("BUYITNOWSTOCK_1$" + _loc5_,_loc2_.getNextHighestDepth());
            _loc3_.onColour = this.purchaseButtonOnColour;
            _loc3_.offColour = this.purchaseButtonOffColour;
            _loc3_.textBlock2.originalPriceText.text = _loc2_.BUYITNOWSTOCK_1.textBlock2.originalPriceText.text;
            _loc3_.textBlock1.priceText.text = _loc2_.BUYITNOWSTOCK_1.textBlock1.priceText.text;
            _loc3_.btnTxt.text = _loc2_.BUYITNOWSTOCK_1.btnTxt.text;
            if(currentVehicle.salePrice != undefined && currentVehicle.salePrice > 0 && currentVehicle.salePrice != currentVehicle.price)
            {
               _loc3_.textBlock2.originalPriceText.autoSize = "left";
               _loc3_.textBlock1.priceText.autoSize = "left";
               _loc3_.textBlock2.originalPriceText._x = _loc2_.BUYITNOWSTOCK_1.textBlock2.originalPriceText._x;
               _loc3_.textBlock2.originalPriceText._y = _loc2_.BUYITNOWSTOCK_1.textBlock2.originalPriceText._y;
               _loc3_.textBlock1.priceText._x = _loc2_.BUYITNOWSTOCK_1.textBlock1.priceText._x;
               _loc3_.reductionLine._x = _loc2_.BUYITNOWSTOCK_1.reductionLine._x;
               _loc3_.reductionLine._y = _loc2_.BUYITNOWSTOCK_1.reductionLine._y;
               _loc3_.reductionLine._width = _loc2_.BUYITNOWSTOCK_1.reductionLine._width;
            }
            else
            {
               _loc3_.textBlock1.priceText.text = this.formatPrice(currentVehicle.price);
               _loc3_.reductionLine._visible = false;
            }
            _loc2_.BUYITNOWSTOCK_1.padlock._visible = !currentVehicle.price1Unlocked;
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc5_] == _loc9_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][_loc5_] == _loc10_)
            {
               this.setLocalisedText(_loc3_.textBlock2.originalPriceText,"ELT_OWNED");
               _loc3_.textBlock2.originalPriceText._x = 0.5 * (_loc8_ - _loc3_.textBlock2.originalPriceText.textWidth) - 10;
               _loc3_.reductionLine._visible = false;
               _loc3_.textBlock1.buyItNowText.text = "";
               _loc3_.textBlock1.priceText.text = "";
               _loc3_.padlock._visible = true;
            }
            else
            {
               _loc3_.textBlock1.buyItNowText.text = _loc2_.BUYITNOWSTOCK_1.textBlock1.buyItNowText.text;
            }
            this.dataTextScope.unshift(_loc3_.btnTxt);
            _loc5_ = _loc5_ - 1;
         }
         _loc2_.BUYITNOWSTOCK_2._visible = false;
         _loc2_.BUYITNOWSTOCK_1._visible = false;
      }
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
      var _loc6_ = _loc2_.BUYITNOWSTOCK_1._y;
      if(_loc2_.BUYITNOWSTOCK_1._visible)
      {
         _loc6_ += _loc2_.BUYITNOWSTOCK_1._height + 18;
      }
      else if(currentVehicle.livery != undefined)
      {
         _loc6_ += _loc2_.BUYITNOWSTOCK_1$0._height + 18;
      }
      if(_loc2_.BUYITNOWSTOCK_2._visible)
      {
         _loc2_.BUYITNOWSTOCK_2._y = _loc6_;
         _loc6_ += _loc2_.BUYITNOWSTOCK_2._height + 18;
      }
      else if(currentVehicle.livery != undefined)
      {
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc2_["BUYITNOWSTOCK_2$" + _loc5_]._y = _loc6_;
            _loc5_ = _loc5_ + 1;
         }
         _loc6_ += _loc2_.BUYITNOWSTOCK_2$0._height + 18;
      }
      _loc2_.descriptionText._y = _loc6_;
      _loc6_ += _loc2_.descriptionText._height + 16;
      if(_loc2_.options._visible)
      {
         _loc2_.optionsHeaderText._y = _loc6_;
         _loc6_ += _loc2_.optionsHeaderText._height + 10;
         _loc2_.options._y = _loc6_;
         _loc6_ += _loc2_.options._height;
      }
      var _loc12_ = 0;
      if(_loc6_ > _loc2_.subHeader._y)
      {
         _loc12_ = _loc6_ - _loc2_.subHeader._y;
         if(_loc2_.options._visible)
         {
            _loc12_ += 10;
         }
         _loc2_.subHeader._y += _loc12_;
         _loc2_.priceSortButton._y += _loc12_;
         _loc2_.filterDropDown._y += _loc12_;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc12_);
      this.initSortingButtons(_loc2_,1);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
   }
   function displayImage(vehicle, container)
   {
      var _loc7_ = container.vehicleImage._width - 4;
      var _loc6_ = container.vehicleImage._height - 4;
      var _loc3_ = vehicle.name;
      var _loc4_;
      if(vehicle.name == "BLIMP3" && this.selectedOption == 7)
      {
         _loc4_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_ELITASTRAVEL_COM.BLIMP_DATA_SLOT][8];
         if(isNaN(_loc4_) || _loc4_ < 0)
         {
            _loc4_ = 0;
         }
         _loc3_ += "_" + vehicle.livery[Math.max(0,this.selectedOption)] + "_" + _loc4_;
      }
      else if(vehicle.livery && container._parent == this.CONTENT)
      {
         _loc3_ += "_" + vehicle.livery[Math.max(0,this.selectedOption)];
      }
      else if(vehicle.styles && container._parent == this.CONTENT)
      {
         _loc3_ += "_" + vehicle.styles[Math.max(0,this.selectedStyle)];
      }
      if(this.USE_SEPARATE_DETAIL_IMAGES && this.currentPage != this.HOME_PAGE && container._parent == this.CONTENT)
      {
         _loc3_ += "_" + this.DETAILS_PAGE_IMAGE_SUFFIX;
      }
      container.vehicleImage.htmlText = "<img src=\'img://" + vehicle.txd + "/" + _loc3_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc7_ + "\' height=\'" + _loc6_ + "\'/>";
   }
}
