class com.rockstargames.gtav.web.WWW_LEGENDARYMOTORSPORT_NET extends com.rockstargames.gtav.web.WWW_LEGENDARYMOTORSPORT_NET_WRAPPER
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
   var HOME_PAGE_VEHICLE_BUTTON_OFFSET;
   var LIVERY_HEADER_LABEL;
   var NUM_COLOUR_OPTIONS;
   var PAGE_NAMES;
   var PURCHASE_PAGE;
   var SORT_NEW_IN_LABEL;
   var SORT_PRICE;
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
   var currentPageInitialised;
   var currentVehicle;
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
   var initPurchaseButtons;
   var initTabbedVehicleButtons;
   var isMP;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var selectedOption;
   var selectedStyle;
   var setLocalisedText;
   var setStylesButtons;
   var sortButtonOffColour;
   var sortButtonOnColour;
   var sortTab;
   var sortTabOffColour;
   var sortVehicleButtons;
   var vehicles;
   function WWW_LEGENDARYMOTORSPORT_NET()
   {
      super();
      this._name = "WWW_LEGENDARYMOTORSPORT_NET";
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 16777215;
      this.sortTabOffColour = 0;
      this.sortButtonOnColour = 16777215;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 16777215;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = true;
      this.DETAILS_PAGE = "CAR_D_DETAILS";
      this.PURCHASE_PAGE = "PURCHASECAR";
      this.TOOLBAR_LABEL = "LGM_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "LGM_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "LGM_PG1_BODY1";
      this.BUY_NOW_LABEL = "LGM_BUYNOW";
      this.SORT_PRICE_LABEL = "LGM_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "LGM_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "LGM_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "LGM_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "LGM_STATS_HEADER";
      this.FILTER_ALL_LABEL = "LGM_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "LGM_";
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.hasSelectedBuyItNow = true;
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["LMS_EXCLUSIVE","LMS_2DOOR","LMS_4DOOR","LMS_MOTORCYCLES","LMS_OPENWHEEL"];
         this.vehicles = {LMS_EXCLUSIVE:[this.vehicles.CHEETAH3,this.vehicles.SUZUME,this.vehicles.EVERON3,this.vehicles.SENTINEL5,this.vehicles.RAPIDGT4,this.vehicles.COQUETTE6,this.vehicles.JESTER5,this.vehicles.BANSHEE3],LMS_2DOOR:[this.vehicles.CHEETAH3,this.vehicles.SUZUME,this.vehicles.EVERON3,this.vehicles.RAPIDGT4,this.vehicles.COQUETTE6,this.vehicles.JESTER5,this.vehicles.BANSHEE3,this.vehicles.PIPISTRELLO,this.vehicles.COQUETTE5,this.vehicles.EUROSX32,this.vehicles.NIOBE,this.vehicles.PARAGON3,this.vehicles.ENVISAGE,this.vehicles.TURISMO3,this.vehicles.COUREUR,this.vehicles.BUFFALO5,this.vehicles.STINGERTT,this.vehicles.VIRTUE,this.vehicles.PANTHERE,this.vehicles.BROADWAY,this.vehicles.R300,this.vehicles.ENTITY3,this.vehicles.TENF,this.vehicles.SM722,this.vehicles.TORERO2,this.vehicles.CORSITA,this.vehicles.LM87,this.vehicles.CYCLONE2,this.vehicles.COMET7,this.vehicles.ZENO,this.vehicles.IGNUS,this.vehicles.CHAMPION,this.vehicles.CYPHER,this.vehicles.GROWLER,this.vehicles.VECTRE,this.vehicles
         .COMET6,this.vehicles.JESTER4,this.vehicles.ZR350,this.vehicles.EUROS,this.vehicles.ITALIRSX,this.vehicles.TIGON,this.vehicles.COQUETTE4,this.vehicles.IMORGON,this.vehicles.FURIA,this.vehicles.ZORRUSSO,this.vehicles.KRIEGER,this.vehicles.LOCUST,this.vehicles.EMERUS,this.vehicles.NEO,this.vehicles.THRAX,this.vehicles.PARAGON,this.vehicles.S80,this.vehicles.DRAFTER,this.vehicles.DEVESTE,this.vehicles.DEVIANT,this.vehicles.SCHLAGEN,this.vehicles.ITALIGTO,this.vehicles.CLIQUE,this.vehicles.SWINGER,this.vehicles.JESTER3,this.vehicles.TYRANT,this.vehicles.FLASHGT,this.vehicles.TEZERACT,this.vehicles.ENTITY2,this.vehicles.TAIPAN,this.vehicles.GB200,this.vehicles.COMET5,this.vehicles.HUSTLER,this.vehicles.Z190,this.vehicles.GT500,this.vehicles.VISERIS,this.vehicles.SAVESTRA,this.vehicles.AUTARCH,this.vehicles.COMET4,this.vehicles.PARIAH,this.vehicles.SC1,this.vehicles.CYCLONE,this.vehicles.RAPIDGT3,this.vehicles.VISIONE,this.vehicles.XA21,this.vehicles.TORERO,this.vehicles.CHEETAH2,this.vehicles
         .VAGNER,this.vehicles.TURISMO2,this.vehicles.INFERNUS2,this.vehicles.RUSTON,this.vehicles.GP1,this.vehicles.TEMPESTA,this.vehicles.PENETRATOR,this.vehicles.RAPTOR,this.vehicles.LYNX,this.vehicles.SHEAVA,this.vehicles.TYRUS,this.vehicles.LE7B,this.vehicles.REAPER,this.vehicles.PROTOTIPO,this.vehicles.SEVEN70,this.vehicles.PFISTER811,this.vehicles.FMJ,this.vehicles.BESTIAGTS,this.vehicles.NITESHAD,this.vehicles.VERLIER,this.vehicles.MAMBA,this.vehicles.BRAWLER,this.vehicles.CHINO,this.vehicles.COQUETTE3,this.vehicles.T20,this.vehicles.OSIRIS,this.vehicles.FELTZER3,this.vehicles.VIRGO,this.vehicles.WINDSOR,this.vehicles.CASCO,this.vehicles.FURORE,this.vehicles.COQUETTE2,this.vehicles.COQUETTE2_TLESS,this.vehicles.MASSACRO,this.vehicles.STINGER_TLESS,this.vehicles.COQUETTE_TLESS,this.vehicles.VOLTIC_HTOP,this.vehicles.BANSHEE_TLESS,this.vehicles.ZENTORNO,this.vehicles.JESTER,this.vehicles.TURISMOR,this.vehicles.ALPHA,this.vehicles.KHAMEL,this.vehicles.HOTKNIFE,this.vehicles.ELEGY2,this.vehicles
         .ZTYPE,this.vehicles.STINGER,this.vehicles.STINGERG,this.vehicles.JB700,this.vehicles.CHEETAH,this.vehicles.ENTITYXF,this.vehicles.ADDER,this.vehicles.MONROE,this.vehicles.COGCABRI,this.vehicles.VACCA,this.vehicles.BULLET,this.vehicles.CARBONIZ,this.vehicles.COQUETTE,this.vehicles.FELTZER,this.vehicles.INFERNUS,this.vehicles.NINEF,this.vehicles.NINEF2,this.vehicles.RAPIDGT,this.vehicles.RAPIDGT2,this.vehicles.VOLTIC_TLESS,this.vehicles.COMET2,this.vehicles.SURANO_CONVERTABLE,this.vehicles.BANSHEE],LMS_4DOOR:[this.vehicles.SENTINEL5,this.vehicles.BALLER8,this.vehicles.ALEUTIAN,this.vehicles.OMNISEGT,this.vehicles.ASTRON2,this.vehicles.BALLER7,this.vehicles.ASTRON,this.vehicles.CINQUEMILA,this.vehicles.JUBILEE,this.vehicles.DEITY,this.vehicles.TAILGATER2,this.vehicles.VSTR,this.vehicles.KOMODA,this.vehicles.REBLA,this.vehicles.NOVAK,this.vehicles.JUGULAR,this.vehicles.TOROS,this.vehicles.FREECRAWLER,this.vehicles.STAFFORD,this.vehicles.NEON,this.vehicles.REVOLTER,this.vehicles.RAIDEN,this
         .vehicles.XLS,this.vehicles.WINDSOR2,this.vehicles.ROOSEVELT2,this.vehicles.ROOSEVELT,this.vehicles.COG55,this.vehicles.COGNOSC,this.vehicles.BALLER3,this.vehicles.BALLER4,this.vehicles.SCHAFTER3,this.vehicles.SCHAFTER4,this.vehicles.HUNTLEY,this.vehicles.EXEMPLAR,this.vehicles.SUPERD],LMS_MOTORCYCLES:[this.vehicles.POWERSURGE,this.vehicles.REEVER,this.vehicles.SHINOBI,this.vehicles.STRYDER,this.vehicles.RROCKET,this.vehicles.SHOTARO,this.vehicles.HAKUCHOU2,this.vehicles.VINDICATOR,this.vehicles.LECTRO,this.vehicles.THRUST,this.vehicles.CARBON],LMS_OPENWHEEL:[this.vehicles.OPENWHEEL1,this.vehicles.OPENWHEEL2,this.vehicles.FORMULA,this.vehicles.FORMULA2]};
      }
      else
      {
         this.categoryOrder = ["LMS_VEHICLES"];
         this.vehicles = {LMS_VEHICLES:[this.vehicles.BRAWLER,this.vehicles.CHINO,this.vehicles.COQUETTE3,this.vehicles.T20,this.vehicles.VINDICATOR,this.vehicles.OSIRIS,this.vehicles.FELTZER3,this.vehicles.VIRGO,this.vehicles.WINDSOR,this.vehicles.COQUETTE2,this.vehicles.COQUETTE2_TLESS,this.vehicles.TURISMOR,this.vehicles.ZENTORNO,this.vehicles.HOTKNIFE,this.vehicles.CARBON,this.vehicles.ZTYPE,this.vehicles.STINGER,this.vehicles.JB700,this.vehicles.CHEETAH,this.vehicles.ENTITYXF,this.vehicles.ADDER,this.vehicles.MONROE,this.vehicles.COGCABRI,this.vehicles.VACCA]};
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
   function updateTabbedBackground(contentItem, page)
   {
      super.updateTabbedBackground(contentItem,page);
      page.panel._height = page.background._height - page.panel._y - page.footer._height;
      var _loc5_ = page.redBG.pattern._height - 16;
      var _loc3_;
      var _loc4_;
      while(page.redBG._height < page.background._height)
      {
         _loc3_ = page.redBG.getNextHighestDepth();
         _loc4_ = page.redBG.pattern.duplicateMovieClip("pattern" + _loc3_,_loc3_,{_y:_loc5_});
         _loc5_ += _loc4_._height - 16;
      }
   }
   function initHomePage(newPage)
   {
      super.initHomePage(newPage);
      if(newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      var _loc3_;
      if(newPage)
      {
         _loc3_ = this.CONTENT.home;
         _loc3_.headerTextLine1.textAutoSize = "fit";
         this.setLocalisedText(_loc3_.headerTextLine1,"LGM_PG1_HEADER_LINE_1");
         this.setLocalisedText(_loc3_.headerTextLine2,"LGM_PG1_HEADER_LINE_2");
         _loc3_.headerTextLine2._y = _loc3_.headerTextLine1._y + _loc3_.headerTextLine1.textHeight + 5;
      }
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc3_ = this.CONTENT.details;
      var _loc2_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc2_);
      if(this.currentVehicle.buyItNow && this.currentVehicle.price >= 0 && this.currentVehicle.secondaryPrice >= 0)
      {
         this.initBuyItNowDetailsPage(_loc2_,this.currentVehicle,newPage,"buyItNow");
      }
      else
      {
         this.initStandardDetailsPage(pageName,newPage);
      }
   }
   function initStandardDetailsPage(pageName, newPage)
   {
      var _loc2_ = this.CONTENT.details;
      this.dataTextScope.length = 0;
      this.priceSortDirection = -1;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.selectedOption = -1;
      this.selectedStyle = -1;
      var _loc8_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc8_);
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
      this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + this.currentVehicle.name);
      this.initStats(_loc2_);
      _loc2_.descriptionText._y = 238;
      _loc2_.optionsHeaderText._y = _loc2_.descriptionText._y + _loc2_.descriptionText._height + 16;
      _loc2_.options._y = _loc2_.optionsHeaderText._y + _loc2_.optionsHeaderText._height + 10;
      _loc2_.statsHeaderText._y = !_loc2_.options._visible ? _loc2_.optionsHeaderText._y : _loc2_.options._y + _loc2_.options._height + 16;
      _loc2_.stats._y = _loc2_.statsHeaderText._y + _loc2_.statsHeaderText._height + 5;
      var _loc5_ = _loc2_.stats._y + _loc2_.stats._height + 16;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc2_[this.PURCHASE_PAGE + "_" + (_loc3_ + 1)]._y = _loc5_;
         _loc3_ = _loc3_ + 1;
      }
      _loc2_.purchaseButton._y = _loc5_;
      var _loc7_ = _loc2_.purchaseButton._y + _loc2_.purchaseButton._height + 20;
      var _loc6_ = 0;
      if(_loc7_ > _loc2_.subHeader._y)
      {
         _loc6_ = _loc7_ - _loc2_.subHeader._y;
         _loc2_.subHeader._y += _loc6_;
         _loc2_.priceSortButton._y += _loc6_;
         _loc2_.filterDropDown._y += _loc6_;
      }
      if(this.isMP)
      {
         _loc6_ += _loc2_.priceSortButton._height - 15;
         _loc2_.priceSortButton._y = _loc2_.subHeader._y - 9;
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
      _loc2_.logo.gotoAndStop("NONE");
      _loc2_.logo.gotoAndStop(this.currentVehicle.brand);
      this.setLocalisedText(_loc2_.nameText,this.currentVehicle.name);
      if(_loc2_.logo._width > 0)
      {
         _loc2_.nameText._x = _loc2_.logo._x + _loc2_.logo._width + 15;
      }
      if(!this.isMP)
      {
         if(this.currentVehicle.name == "VINDICATOR" || this.currentVehicle.name == "LECTRO")
         {
            this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + "ALT_" + this.currentVehicle.name);
         }
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
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,currentVehicle.name);
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
      this.initStats(_loc2_);
      var _loc4_ = this.initOptions(_loc2_);
      this.initBuyItNowPriceButtons(_loc2_,_loc4_);
      this.initNormalPriceButtons(_loc2_,_loc4_);
      _loc2_.descriptionText.autoSize = "left";
      this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + currentVehicle.name);
      _loc2_.logo.gotoAndStop("NONE");
      _loc2_.logo.gotoAndStop(currentVehicle.brand);
      this.setLocalisedText(_loc2_.nameText,currentVehicle.name);
      if(_loc2_.logo._width > 0)
      {
         _loc2_.nameText._x = _loc2_.logo._x + _loc2_.logo._width + 15;
      }
      if(!this.isMP)
      {
         if(currentVehicle.name == "VINDICATOR" || currentVehicle.name == "LECTRO")
         {
            this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + "ALT_" + currentVehicle.name);
         }
      }
      _loc2_.descriptionText._y = 238;
      _loc2_.optionsHeaderText._y = _loc2_.descriptionText._y + _loc2_.descriptionText._height + 16;
      _loc2_.options._y = _loc2_.optionsHeaderText._y + _loc2_.optionsHeaderText._height + 10;
      _loc2_.statsHeaderText._y = !_loc2_.options._visible ? _loc2_.optionsHeaderText._y : _loc2_.options._y + _loc2_.options._height + 16;
      _loc2_.stats._y = _loc2_.statsHeaderText._y + _loc2_.statsHeaderText._height + 5;
      var _loc5_ = _loc2_.stats._y + _loc2_.stats._height + 16;
      var _loc3_;
      if(currentVehicle.buyItNow)
      {
         _loc3_ = 1;
         while(_loc3_ <= _loc4_)
         {
            _loc2_["BUYITNOWSTOCK_A" + _loc3_]._y = _loc5_;
            _loc3_ = _loc3_ + 1;
         }
         if(currentVehicle.secondaryPrice > 0)
         {
            _loc5_ += _loc2_.BUYITNOWSTOCK_1._height + 18;
         }
         _loc3_ = 1;
         while(_loc3_ <= _loc4_)
         {
            _loc2_["BUYITNOWSTOCK_B" + _loc3_]._y = _loc5_;
            _loc3_ = _loc3_ + 1;
         }
         _loc5_ += _loc2_.BUYITNOWSTOCK_1._height + 18;
      }
      var _loc8_ = _loc5_ + 20;
      var _loc7_ = 0;
      if(_loc8_ > _loc2_.subHeader._y)
      {
         _loc7_ = _loc8_ - _loc2_.subHeader._y;
         _loc2_.subHeader._y += _loc7_;
         _loc2_.priceSortButton._y += _loc7_;
         _loc2_.filterDropDown._y += _loc7_;
      }
      if(this.isMP)
      {
         _loc7_ += _loc2_.priceSortButton._height - 15;
         _loc2_.priceSortButton._y = _loc2_.subHeader._y - 9;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc7_);
      this.initSortingButtons(_loc2_,2 * _loc4_);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
   }
   function initVehicleButtons(page, yOffset)
   {
      if(this.isMP)
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = 315;
         this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET = 787;
         this.initTabbedVehicleButtons(page,yOffset);
      }
      else
      {
         super.initVehicleButtons(page,yOffset);
      }
   }
   function initSortingButtons(page, numOptions)
   {
      if(this.isMP)
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = 315;
         this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET = 787;
         page.subHeaderText._visible = false;
         page.priceSortButton._visible = true;
         page.priceSortButton._y = page.headerBar._y - page.priceSortButton._height;
         page.filterDropDown._visible = false;
      }
      else
      {
         page.subHeaderText._visible = true;
         page.priceSortButton._visible = true;
         page.filterDropDown._visible = false;
      }
      super.initSortingButtons(page,numOptions);
   }
   function initNormalPriceButtons(page, numOptions)
   {
      var _loc2_;
      var _loc5_ = page.BUYITNOWSTOCK_1;
      var _loc3_ = numOptions - 1;
      var _loc6_;
      var _loc7_;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc5_.duplicateMovieClip("BUYITNOWSTOCK_A" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         if(this.currentVehicle.secondaryPrice > 0)
         {
            _loc2_.onColour = this.purchaseButtonOffColour;
            _loc2_.offColour = this.purchaseButtonOffColour;
            _loc2_._alpha = 50;
            _loc6_ = _loc2_._width;
            if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice > 0 && this.currentVehicle.salePrice != this.currentVehicle.price)
            {
               _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.price);
               _loc2_.priceText.text = this.formatPrice(this.currentVehicle.salePrice);
               _loc7_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
               _loc2_.originalPriceText.autoSize = "left";
               _loc2_.priceText.autoSize = "left";
               _loc2_.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
               _loc2_.originalPriceText._y = _loc2_.priceText._y + 5;
               _loc2_.priceText._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText.textWidth + 10;
               _loc2_.reductionLine._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText._width;
               _loc2_.reductionLine._y = _loc2_.originalPriceText._y + 7;
               _loc2_.reductionLine._width = _loc2_.originalPriceText._width;
            }
            else
            {
               _loc2_.priceText.text = this.formatPrice(this.currentVehicle.price);
               _loc2_.reductionLine._visible = false;
            }
            _loc2_.padlock._visible = !this.currentVehicle.price1Unlocked;
            this.setLocalisedText(_loc2_.buyItNowText,"LMS_NORMAL_PRICE");
            _loc2_.disabled = numOptions > 1;
         }
         else
         {
            _loc2_._visible = false;
            page.buyItNowText._visible = false;
         }
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc5_._visible = false;
   }
   function initBuyItNowPriceButtons(page, numOptions)
   {
      var _loc2_;
      var _loc5_ = page.BUYITNOWSTOCK_2;
      var _loc3_ = numOptions - 1;
      var _loc6_;
      var _loc7_;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc5_.duplicateMovieClip("BUYITNOWSTOCK_B" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         _loc2_.onColour = this.purchaseButtonOffColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_._alpha = 50;
         _loc6_ = _loc2_._width;
         if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0 && this.currentVehicle.secondarySalePrice != this.currentVehicle.secondaryPrice)
         {
            _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc2_.priceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
            _loc7_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
            _loc2_.originalPriceText.autoSize = "left";
            _loc2_.priceText.autoSize = "left";
            _loc2_.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
            _loc2_.originalPriceText._y = _loc2_.priceText._y + 5;
            _loc2_.priceText._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText.textWidth + 10;
            _loc2_.reductionLine._x = _loc2_.originalPriceText._x + _loc2_.originalPriceText._width;
            _loc2_.reductionLine._y = _loc2_.originalPriceText._y + 7;
            _loc2_.reductionLine._width = _loc2_.originalPriceText._width;
         }
         else
         {
            _loc2_.priceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc2_.reductionLine._visible = false;
         }
         _loc2_.padlock._visible = !this.currentVehicle.price2Unlocked;
         this.setLocalisedText(_loc2_.buyItNowText,"LMS_BIN_PRICE");
         _loc2_.disabled = numOptions > 1;
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc5_._visible = false;
   }
   function initStats(page)
   {
      page.statsHeaderText.autoSize = "left";
      this.setLocalisedText(page.statsHeaderText,this.STATS_HEADER_LABEL);
      this.setStatLine(page.stats.topSpeedLabel,"WEB_VEHICLE_TOP_SPEED",page.stats.topSpeed,this.currentVehicle.topSpeed);
      this.setStatLine(page.stats.accelerationLabel,"WEB_VEHICLE_ACCELERATION",page.stats.acceleration,this.currentVehicle.acceleration);
      this.setStatLine(page.stats.brakingLabel,"WEB_VEHICLE_BRAKING",page.stats.braking,this.currentVehicle.braking);
      this.setStatLine(page.stats.tractionLabel,"WEB_VEHICLE_TRACTION",page.stats.traction,this.currentVehicle.traction);
   }
   function setStatLine(txt, label, bar, value)
   {
      txt.textAutoSize = "shrink";
      this.setLocalisedText(txt,label);
      value *= 500;
      bar.bar4._xscale = Math.min(100,Math.max(0,value - 400));
      bar.bar3._xscale = Math.min(100,Math.max(0,value - 300));
      bar.bar2._xscale = Math.min(100,Math.max(0,value - 200));
      bar.bar1._xscale = Math.min(100,Math.max(0,value - 100));
      bar.bar0._xscale = Math.min(100,Math.max(0,value));
   }
   function initOutcomePage(headerText, bodyText, soldLabel, pauseBeforeShowing)
   {
      super.initOutcomePage(headerText,bodyText,soldLabel,pauseBeforeShowing);
      var _loc3_ = this.CONTENT.purchase;
      _loc3_.logo.gotoAndStop("NONE");
      _loc3_.logo.gotoAndStop(this.currentVehicle.brand);
      this.setLocalisedText(_loc3_.nameText,this.currentVehicle.name);
      if(_loc3_.logo._width > 0)
      {
         _loc3_.nameText._x = _loc3_.logo._x + _loc3_.logo._width + 15;
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
      var _loc5_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc4_ = link.slice(0,_loc5_);
      var _loc6_ = link.slice(_loc5_ + 1);
      if(_loc4_ == "BUYITNOWSTOCK")
      {
         if(_loc6_.charAt(0) == "A" && this.currentVehicle.price1Unlocked)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc6_.charAt(0) == "B" && this.currentVehicle.price2Unlocked)
         {
            this.hasSelectedBuyItNow = true;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
      }
      else if(_loc4_ == "priceSortButton")
      {
         if(this.isMP)
         {
            this.sortTab(this.SORT_PRICE,this.priceSortDirection + 17);
         }
         else
         {
            this.sortVehicleButtons(this.SORT_PRICE,this.priceSortDirection + 17);
         }
      }
      else
      {
         super.goToAnchor(link);
      }
   }
   function setOptionsButtons(selectedOption)
   {
      super.setOptionsButtons(selectedOption);
      var _loc6_ = this.CONTENT.details;
      var _loc8_ = !this.currentVehicle.livery ? this.NUM_COLOUR_OPTIONS : this.currentVehicle.livery.length;
      var _loc9_;
      var _loc10_;
      if(this.currentVehicle.livery)
      {
         _loc9_ = this.currentVehicle.price;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.secondaryPrice != 0)
            {
               _loc9_ = this.currentVehicle.secondaryPrice;
            }
         }
         if(_loc9_ == 0)
         {
            _loc6_.priceText.text = "";
         }
         else
         {
            _loc6_.priceText.text = !isNaN(_loc9_) ? this.formatPrice(_loc9_) : _loc9_;
         }
         _loc10_ = this.currentVehicle.salePrice;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.secondarySalePrice != 0)
            {
               _loc10_ = this.currentVehicle.secondarySalePrice;
            }
         }
         if(_loc10_ == 0)
         {
            _loc6_.reducedPriceText.text = "";
         }
         else
         {
            _loc6_.reducedPriceText.text = !isNaN(_loc10_) ? this.formatPrice(_loc10_) : _loc10_;
         }
      }
      var _loc3_;
      var _loc4_;
      var _loc5_;
      if(this.currentVehicle.buyItNow)
      {
         if(this.currentVehicle.colourways)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               if(this.currentVehicle.secondaryPrice > 0)
               {
                  _loc4_ = _loc6_["BUYITNOWSTOCK_A" + (_loc3_ + 1)];
                  _loc5_ = selectedOption == _loc3_;
                  _loc4_.disabled = !_loc5_;
                  _loc4_._alpha = !_loc5_ ? 50 : 100;
                  _loc4_._visible = _loc5_;
               }
               _loc4_ = _loc6_["BUYITNOWSTOCK_B" + (_loc3_ + 1)];
               _loc5_ = selectedOption == _loc3_;
               _loc4_.disabled = !_loc5_;
               _loc4_._alpha = !_loc5_ ? 50 : 100;
               _loc4_._visible = _loc5_;
               _loc3_ = _loc3_ + 1;
            }
         }
         else
         {
            _loc6_.BUYITNOWSTOCK_1.disabled = false;
            _loc6_.BUYITNOWSTOCK_1._alpha = 100;
            _loc6_.BUYITNOWSTOCK_2.disabled = false;
            _loc6_.BUYITNOWSTOCK_2._alpha = 100;
         }
      }
   }
}
