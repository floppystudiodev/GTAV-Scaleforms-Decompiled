class com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM extends com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM_WRAPPER
{
   var BUY_NOW_LABEL;
   var CAN_STORE_PAGE;
   var CONTENT;
   var DESCRIPTION_HEADER_LABEL;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_IMAGE_SUFFIX;
   var DETAILS_PAGE_VEHICLE_BUTTON_OFFSET;
   var DROP_DOWN_HEADER_OFFSET;
   var DROP_DOWN_ITEM_SPACING;
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
   static var PARTY_BUS_DATA_SLOT = 10;
   function WWW_SOUTHERNSANANDREASSUPERAUTOS_COM()
   {
      super();
      this._name = "WWW_SOUTHERNSANANDREASSUPERAUTOS_COM";
      this.defaultButtonOnColour = 0;
      this.defaultButtonOffColour = 0;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 16777215;
      this.sortTabOffColour = 0;
      this.sortButtonOnColour = 0;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 0;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = false;
      this.DETAILS_PAGE = "CARDETAILS";
      this.PURCHASE_PAGE = "PURCHASECAR";
      this.TOOLBAR_LABEL = "SSS_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "SSS_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "SSS_PG1_BODY1";
      this.BUY_NOW_LABEL = "SSS_BUYNOW";
      this.SORT_PRICE_LABEL = "SSSA_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "SSSA_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "SSSA_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "SSSA_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "SSSA_STATS_HEADER";
      this.FILTER_ALL_LABEL = "SSSA_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "SSS_";
      this.DROP_DOWN_ITEM_SPACING = 39;
      this.DROP_DOWN_HEADER_OFFSET = 44;
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.hasSelectedBuyItNow = true;
   }
   function filterVehicles()
   {
      var _loc6_;
      var _loc7_;
      var _loc4_;
      var _loc2_;
      var _loc3_;
      var _loc5_;
      if(this.isMP)
      {
         this.categoryOrder = ["SSSA_EXCLUSIVE","SSSA_2DOOR","SSSA_4DOOR","SSSA_OFFROAD","SSSA_LUXURY","SSSA_MOTORBIKES","SSSA_KARTS"];
         this.vehicles = {SSSA_EXCLUSIVE:[this.vehicles.DRIFTL352,this.vehicles.L352,this.vehicles.MINIMUS,this.vehicles.TAMPA4,this.vehicles.HARDY,this.vehicles.WOODLANDER,this.vehicles.URANUS,this.vehicles.FIREBOLT,this.vehicles.CHAVOSV6],SSSA_2DOOR:[this.vehicles.DRIFTL352,this.vehicles.L352,this.vehicles.TAMPA4,this.vehicles.URANUS,this.vehicles.FIREBOLT,this.vehicles.DOMINATOR10,this.vehicles.YOSEMITE4,this.vehicles.DOMINATOR9,this.vehicles.VIGERO3,this.vehicles.FR36,this.vehicles.GAUNTLET6,this.vehicles.CLIQUE2,this.vehicles.MONSTROCITI,this.vehicles.RATEL,this.vehicles.L35,this.vehicles.BOOR,this.vehicles.EVERON2,this.vehicles.TAHOMA,this.vehicles.TULIP2,this.vehicles.POSTLUDE,this.vehicles.KANJOSJ,this.vehicles.VIGERO2,this.vehicles.RUINER4,this.vehicles.S95,this.vehicles.ARBITERGT,this.vehicles.PREVION,this.vehicles.SULTAN3,this.vehicles.DOMINATOR7,this.vehicles.DOMINATOR8,this.vehicles.FUTO2,this.vehicles.REMUS,this.vehicles.CALICO,this.vehicles.WARRENER2,this.vehicles.RT3000,this.vehicles
         .BRIOSO2,this.vehicles.SLAMTRUCK,this.vehicles.WEEVIL,this.vehicles.PENUMBRA2,this.vehicles.CLUB,this.vehicles.DUKES3,this.vehicles.KANJO,this.vehicles.YOSEMITE2,this.vehicles.RETINUE2,this.vehicles.ASBO,this.vehicles.PEYOTE2,this.vehicles.ZION3,this.vehicles.GAUNTLET4,this.vehicles.NEBULA,this.vehicles.GAUNTLET3,this.vehicles.ISSI7,this.vehicles.IMPALER,this.vehicles.VAMOS,this.vehicles.BLISTA3,this.vehicles.FUTO,this.vehicles.RUINER,this.vehicles.ROMERO,this.vehicles.PRAIRIE,this.vehicles.MICHELLI,this.vehicles.DOMINATOR3,this.vehicles.ISSI3,this.vehicles.ELLIE,this.vehicles.FAGALOA,this.vehicles.HOTRING,this.vehicles.HERMES,this.vehicles.SENTINEL3,this.vehicles.YOSEMITE,this.vehicles.RETINUE,this.vehicles.TORNADO6,this.vehicles.OMNIS,this.vehicles.TROPOS,this.vehicles.BRIOSO,this.vehicles.TAMPA2,this.vehicles.STALION2,this.vehicles.DOMINATOR2,this.vehicles.GAUNTLET2,this.vehicles.TAMPA,this.vehicles.LURCHER,this.vehicles.RLOADER2,this.vehicles.SLAMVAN,this.vehicles.MASSACRO2,this.vehicles
         .JESTER2,this.vehicles.PIGALLE,this.vehicles.BLADE,this.vehicles.RHAPSODY,this.vehicles.PANTO,this.vehicles.SURFER,this.vehicles.YOUGA,this.vehicles.PICADOR,this.vehicles.DOMINATO,this.vehicles.F620,this.vehicles.FUSILADE,this.vehicles.PENUMBRA,this.vehicles.SENTINEL,this.vehicles.SENTINEL_CONVERTABLE,this.vehicles.RLOADER,this.vehicles.DUKES,this.vehicles.BLISTA2,this.vehicles.STALLION,this.vehicles.SCHWARZE,this.vehicles.ZION,this.vehicles.ZION2,this.vehicles.GAUNTLET,this.vehicles.VIGERO,this.vehicles.ISSI2],SSSA_OFFROAD:[this.vehicles.DRAUGUR,this.vehicles.PATRIOT3,this.vehicles.OUTLAW,this.vehicles.VAGRANT,this.vehicles.HELLION,this.vehicles.CARACARA2,this.vehicles.KAMACHO,this.vehicles.RIATA,this.vehicles.TROPHY,this.vehicles.TROPHY2,this.vehicles.RALLYTRUCK,this.vehicles.SEMINOLE,this.vehicles.RUMPO,this.vehicles.KALAHARI_TOPLESS,this.vehicles.REBEL2,this.vehicles.RANCHERX,this.vehicles.BIFTA,this.vehicles.KALAHARI,this.vehicles.SANDKIN2,this.vehicles.BODHI2,this.vehicles.DUNE,this
         .vehicles.REBEL,this.vehicles.SADLER,this.vehicles.SANDKING,this.vehicles.BFINJECT,this.vehicles.BISON],SSSA_4DOOR:[this.vehicles.MINIMUS,this.vehicles.HARDY,this.vehicles.WOODLANDER,this.vehicles.CHAVOSV6,this.vehicles.VORSCHLAG,this.vehicles.CASTIGATOR,this.vehicles.TERMINUS,this.vehicles.IMPALER5,this.vehicles.CAVALCADE3,this.vehicles.DORADO,this.vehicles.ASTEROPE2,this.vehicles.IMPALER6,this.vehicles.VIVANITE,this.vehicles.BRIGHAM,this.vehicles.EUDORA,this.vehicles.ISSI8,this.vehicles.SURFER3,this.vehicles.JOURNEY2,this.vehicles.RHINEHART,this.vehicles.GREENWOOD,this.vehicles.BUFFALO4,this.vehicles.SEMINOLE2,this.vehicles.SUGOI,this.vehicles.SULTAN2,this.vehicles.DYNASTY,this.vehicles.TULIP,this.vehicles.BJXL,this.vehicles.FQ2,this.vehicles.SERRANO,this.vehicles.HABANERO,this.vehicles.CHEBUREK,this.vehicles.STREITER,this.vehicles.YOUGA2,this.vehicles.BUFFALO3,this.vehicles.RUMPO3,this.vehicles.BTYPE2,this.vehicles.GUARDIAN,this.vehicles.GBURRITO2,this.vehicles.KURUMA,this.vehicles.KURUMA2,this
         .vehicles.JACKAL,this.vehicles.ORACLE1,this.vehicles.SCHAFTER2,this.vehicles.SURGE,this.vehicles.WARRENER,this.vehicles.GLENDALE,this.vehicles.REGINA,this.vehicles.PRIMO,this.vehicles.BUFFALO,this.vehicles.BUFFALO2,this.vehicles.TAILGATER,this.vehicles.ASEA,this.vehicles.GRANGER,this.vehicles.INGOT,this.vehicles.INTRUDER,this.vehicles.MINIVAN,this.vehicles.PREMIER,this.vehicles.RADI,this.vehicles.STANIER,this.vehicles.STRATUM,this.vehicles.WASHINGT,this.vehicles.ASTROPE,this.vehicles.PARADISE,this.vehicles.FUGITIVE,this.vehicles.DILETTAN],SSSA_LUXURY:[this.vehicles.GRANGER2,this.vehicles.IWAGEN,this.vehicles.LANDSTLKR2,this.vehicles.EVERON,this.vehicles.PBUS2,this.vehicles.PATRIOT2,this.vehicles.PATRIOT,this.vehicles.CONTENDER,this.vehicles.LANDSTALKER,this.vehicles.GRESLEY,this.vehicles.BOBCATXL,this.vehicles.CAVCADE2,this.vehicles.BALLER2,this.vehicles.CAVCADE,this.vehicles.ROCOTO,this.vehicles.FELON,this.vehicles.FELON2,this.vehicles.ORACLE,this.vehicles.STRETCH],SSSA_MOTORBIKES:[this
         .vehicles.PIZZABOY,this.vehicles.WOLFSBANE,this.vehicles.FAGGIO3,this.vehicles.VORTEX,this.vehicles.BLAZER4,this.vehicles.SANCTUS,this.vehicles.MANCHEZ,this.vehicles.ESSKEY,this.vehicles.NIGHTBLADE,this.vehicles.DEFILER,this.vehicles.AVARUS,this.vehicles.ZOMBIEA,this.vehicles.ZOMBIEB,this.vehicles.CHIMERA,this.vehicles.DAEMON2,this.vehicles.RATBIKE,this.vehicles.BAGGER,this.vehicles.FAGGION,this.vehicles.CLIFFHANGER,this.vehicles.BF400,this.vehicles.GARGOYLE,this.vehicles.ENDURO,this.vehicles.NEMESIS,this.vehicles.HAKUCHOU,this.vehicles.INNOVATION,this.vehicles.SOVEREIGN,this.vehicles.BLAZER3,this.vehicles.SANCHEZ2,this.vehicles.BATI,this.vehicles.BATI2,this.vehicles.RUFFIAN,this.vehicles.VADER,this.vehicles.BLAZER,this.vehicles.PCJ,this.vehicles.SANCHEZ,this.vehicles.FAGGIO,this.vehicles.AKUMA,this.vehicles.DOUBLE,this.vehicles.HEXER],SSSA_KARTS:[this.vehicles.VETO2,this.vehicles.VETO,this.vehicles.RCBANDITO]};
      }
      else
      {
         this.categoryOrder = ["SSSA_EXCLUSIVE","SSSA_2DOOR","SSSA_SPORTS","SSSA_OFFROAD","SSSA_4DOOR","SSSA_LUXURY","SSSA_MOTORBIKES"];
         this.vehicles = {SSSA_EXCLUSIVE:[this.vehicles.BTYPE2,this.vehicles.LURCHER,this.vehicles.RLOADER2,this.vehicles.SLAMVAN,this.vehicles.MASSACRO2,this.vehicles.JESTER2,this.vehicles.DUKES,this.vehicles.BLISTA2,this.vehicles.STALLION,this.vehicles.BLADE,this.vehicles.BIFTA,this.vehicles.PARADISE,this.vehicles.KALAHARI,this.vehicles.KALAHARI_TOPLESS,this.vehicles.INNOVATION],SSSA_2DOOR:[this.vehicles.SCHWARZE,this.vehicles.ZION,this.vehicles.GAUNTLET,this.vehicles.VIGERO,this.vehicles.ISSI2],SSSA_SPORTS:[this.vehicles.INFERNUS,this.vehicles.SURANO,this.vehicles.VACCA,this.vehicles.NINEF,this.vehicles.COMET2,this.vehicles.BANSHEE,this.vehicles.FELTZER],SSSA_OFFROAD:[this.vehicles.BFINJECT,this.vehicles.SANDKING],SSSA_4DOOR:[this.vehicles.FUGITIVE,this.vehicles.DILETTAN],SSSA_LUXURY:[this.vehicles.SUPERD,this.vehicles.EXEMPLAR,this.vehicles.BALLER2,this.vehicles.CAVCADE,this.vehicles.ROCOTO,this.vehicles.FELON,this.vehicles.ORACLE],SSSA_MOTORBIKES:[this.vehicles.BATI,this.vehicles.AKUMA,this
         .vehicles.RUFFIAN,this.vehicles.VADER,this.vehicles.BLAZER,this.vehicles.PCJ,this.vehicles.SANCHEZ,this.vehicles.FAGGIO]};
         _loc6_ = 0;
         _loc7_ = this.categoryOrder.length;
         while(_loc6_ < _loc7_)
         {
            _loc4_ = this.vehicles[this.categoryOrder[_loc6_]];
            _loc2_ = 0;
            _loc3_ = _loc4_.length;
            while(_loc2_ < _loc3_)
            {
               _loc5_ = _loc4_[_loc2_];
               _loc5_.buyItNow = false;
               _loc2_ = _loc2_ + 1;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = this.SUCCESS_PAGE;
      this.PAGE_NAMES[34] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[35] = this.FAILED_PAGE;
      this.PAGE_NAMES[36] = this.ERROR_PAGE;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[34] = false;
      this.CAN_STORE_PAGE[35] = false;
      this.CAN_STORE_PAGE[36] = false;
   }
   function setOptionsButtons(selectedOption)
   {
      super.setOptionsButtons(selectedOption);
      var _loc6_ = this.CONTENT.details;
      var _loc9_ = !this.currentVehicle.livery ? this.NUM_COLOUR_OPTIONS : this.currentVehicle.livery.length;
      var _loc8_;
      var _loc11_;
      if(this.currentVehicle.livery)
      {
         _loc8_ = this.currentVehicle.price;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.secondaryPrice != 0)
            {
               _loc8_ = this.currentVehicle.secondaryPrice;
            }
         }
         if(this.currentVehicle.name == "PBUS2")
         {
            if(_loc8_ < 0)
            {
               _loc8_ = this.currentVehicle.price;
            }
         }
         if(_loc8_ == 0)
         {
            _loc6_.priceText.text = "";
         }
         else
         {
            _loc6_.priceText.text = !isNaN(_loc8_) ? this.formatPrice(_loc8_) : _loc8_;
         }
         _loc11_ = this.currentVehicle.salePrice;
         if(selectedOption != 0)
         {
            if(this.currentVehicle.name == "PBUS2")
            {
               if(this.currentVehicle.secondarySalePrice > 0)
               {
                  _loc11_ = this.currentVehicle.secondarySalePrice;
               }
            }
            else if(this.currentVehicle.secondarySalePrice != 0)
            {
               _loc11_ = this.currentVehicle.secondarySalePrice;
            }
         }
         if(_loc11_ == 0)
         {
            _loc6_.reducedPriceText.text = "";
         }
         else
         {
            _loc6_.reducedPriceText.text = !isNaN(_loc11_) ? this.formatPrice(_loc11_) : _loc11_;
         }
      }
      var _loc3_;
      var _loc4_;
      var _loc5_;
      if(this.currentVehicle.buyItNow)
      {
         if(this.currentVehicle.colourways || this.currentVehicle.livery)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc9_)
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
      var _loc10_;
      var _loc12_;
      if(this.currentVehicle.id == 179)
      {
         _loc10_ = 1;
         _loc12_ = 2;
         _loc3_ = 0;
         while(_loc3_ < 8)
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc10_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc12_)
            {
               _loc6_[this.PURCHASE_PAGE + "_" + (_loc3_ + 1)].disabled = true;
            }
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
         _loc4_ = this.currentVehicle.price;
         if(this.selectedOption != 0)
         {
            if(this.currentVehicle.secondaryPrice != 0)
            {
               _loc4_ = this.currentVehicle.secondaryPrice;
            }
         }
         if(_loc4_ == 0)
         {
            _loc3_.priceText.text = "";
         }
         else
         {
            _loc3_.priceText.text = !isNaN(_loc4_) ? this.formatPrice(_loc4_) : _loc4_;
         }
         _loc5_ = this.currentVehicle.salePrice;
         if(this.selectedOption != 0)
         {
            if(this.currentVehicle.secondarySalePrice != 0)
            {
               _loc5_ = this.currentVehicle.secondarySalePrice;
            }
         }
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
   function goToAnchor(link)
   {
      var _loc7_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc6_ = link.slice(0,_loc7_);
      var _loc4_ = link.slice(_loc7_ + 1);
      var _loc5_;
      var _loc8_;
      if(_loc6_ == "BUYITNOWSTOCK")
      {
         _loc5_ = true;
         _loc8_ = parseInt(_loc4_.substr(1)) - 1;
         if(this.currentVehicle.name == "PBUS2")
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc8_] != 0)
            {
               _loc5_ = false;
            }
         }
         if(_loc4_.charAt(0) == "A" && this.currentVehicle.price1Unlocked && _loc5_)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc4_.charAt(0) == "B" && this.currentVehicle.price2Unlocked && _loc5_)
         {
            this.hasSelectedBuyItNow = true;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
      }
      else if(_loc6_ == "priceSortButton")
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
   function initDetailsPage(pageName, newPage)
   {
      var _loc2_ = this.CONTENT.details;
      var _loc3_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc3_);
      if(pageName == "CARDETAILS179")
      {
         this.initPartyBus();
      }
      if(this.currentVehicle.buyItNow && this.currentVehicle.price >= 0 && this.currentVehicle.secondaryPrice >= 0)
      {
         this.initBuyItNowDetailsPage(_loc3_,this.currentVehicle,newPage,"buyItNow");
      }
      else
      {
         this.initSSSADetailsPage(pageName,newPage);
      }
      if(this.isMP)
      {
         _loc2_.priceSortButton._y = _loc2_.subHeader._y + _loc2_.subHeader._height * 0.5 - _loc2_.priceSortButton._height * 0.5;
      }
   }
   function initSSSADetailsPage(pageName, newPage)
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
      if(this.isMP)
      {
         _loc6_ += _loc2_.priceSortButton._height + 15;
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
   function initPartyBus()
   {
      var _loc8_ = 1;
      var _loc6_ = 2;
      var _loc3_ = this.CONTENT.details;
      var _loc7_ = false;
      _loc3_.award._visible = false;
      var _loc2_ = 0;
      var _loc4_;
      var _loc5_;
      while(_loc2_ < 10)
      {
         if(_loc3_.options["tick" + _loc2_])
         {
            _loc3_.options["tick" + _loc2_].removeMovieClip();
         }
         _loc4_ = _loc3_.options["liveryText" + _loc2_];
         if(_loc4_ != undefined)
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc2_] == _loc8_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc2_] == _loc6_)
            {
               _loc5_ = _loc3_.options.attachMovie("tick","tick" + _loc2_,_loc3_.options.getNextHighestDepth());
               _loc5_._x = _loc4_._x + _loc4_._width - _loc5_._width;
               _loc5_._y = _loc4_._y;
            }
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc2_] == _loc6_)
            {
               this.setLocalisedText(_loc3_.options["liveryText" + _loc2_],"PBUS2_SSA_" + (_loc2_ + 1) + "_EQP");
               this.setOptionsButtons(_loc2_);
               _loc7_ = true;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc7_)
      {
         this.setOptionsButtons(0);
      }
   }
   function initPurchaseButtons(page, numOptions)
   {
      super.initPurchaseButtons(page,numOptions);
      var _loc6_;
      var _loc3_;
      var _loc4_;
      if(this.currentVehicle.name == "PBUS2")
      {
         _loc6_ = 1;
         page = this.CONTENT.details;
         _loc3_ = 0;
         while(_loc3_ < numOptions)
         {
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc6_)
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
      this.initStats(_loc2_);
      var _loc4_ = this.initOptions(_loc2_) || 1;
      this.initBuyItNowPriceButtons(_loc2_,_loc4_);
      this.initNormalPriceButtons(_loc2_,_loc4_);
      _loc2_.descriptionText.autoSize = "left";
      if(currentVehicle.desc)
      {
         this.setLocalisedText(_loc2_.descriptionText,currentVehicle.desc);
      }
      else
      {
         this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + currentVehicle.name);
      }
      _loc2_.options._y = _loc2_.optionsHeaderText._y + _loc2_.optionsHeaderText._height + 5;
      var _loc5_ = !_loc2_.options._visible ? _loc2_.optionsHeaderText._y : _loc2_.options._y + _loc2_.options._height + 18;
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
            _loc5_ += _loc2_.BUYITNOWSTOCK_1._height + 10;
         }
         _loc3_ = 1;
         while(_loc3_ <= _loc4_)
         {
            _loc2_["BUYITNOWSTOCK_B" + _loc3_]._y = _loc5_;
            _loc3_ = _loc3_ + 1;
         }
         _loc5_ += _loc2_.BUYITNOWSTOCK_1._height + 10;
      }
      _loc2_.descriptionText._y = _loc5_;
      _loc2_.statsHeaderText._y = _loc2_.descriptionText._y + _loc2_.descriptionText._height + 16;
      _loc2_.stats._y = _loc2_.statsHeaderText._y + _loc2_.statsHeaderText._height + 5;
      var _loc8_ = _loc2_.stats._y + _loc2_.stats._height + 20;
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
         _loc7_ += _loc2_.priceSortButton._height + 15;
      }
      this.initVehicleButtons(_loc2_,this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET + _loc7_);
      this.initSortingButtons(_loc2_,2 * _loc4_);
      this.dataTextScope.push(_loc2_.PAGE1.btnTxt);
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
   }
   function initOptions(page)
   {
      var _loc4_ = super.initOptions(page);
      var _loc3_;
      if(this.isMP)
      {
         _loc3_ = 0;
         while(_loc3_ < 7)
         {
            this.dataTextScope.unshift(undefined);
            _loc3_ = _loc3_ + 1;
         }
      }
      return _loc4_;
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
         page.priceSortButton._y = page.headerBar._y - page.priceSortButton._height + 5;
         page.filterDropDown._visible = false;
      }
      else
      {
         page.subHeaderText._visible = true;
         page.priceSortButton._visible = true;
         page.filterDropDown._visible = true;
      }
      super.initSortingButtons(page,numOptions);
   }
   function initNormalPriceButtons(page, numOptions)
   {
      var _loc2_;
      var _loc6_ = page.BUYITNOWSTOCK_1;
      var _loc3_ = numOptions - 1;
      var _loc5_;
      var _loc9_;
      var _loc7_;
      var _loc8_;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc6_.duplicateMovieClip("BUYITNOWSTOCK_A" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc6_._x,_y:_loc6_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         if(this.currentVehicle.secondaryPrice > 0)
         {
            _loc2_.onColour = this.purchaseButtonOffColour;
            _loc2_.offColour = this.purchaseButtonOffColour;
            _loc5_ = _loc2_._width;
            if(this.currentVehicle.salePrice != undefined && this.currentVehicle.salePrice > 0 && this.currentVehicle.salePrice != this.currentVehicle.price)
            {
               _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.price);
               _loc2_.priceText.text = this.formatPrice(this.currentVehicle.salePrice);
               _loc9_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
               _loc2_.originalPriceText.autoSize = "left";
               _loc2_.priceText.autoSize = "left";
               _loc2_.originalPriceText._x = 0.5 * (_loc5_ - _loc9_);
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
            this.setLocalisedText(_loc2_.buyItNowText,"SSSA_NORMAL_PRICE");
            _loc2_.disabled = numOptions > 1;
         }
         else
         {
            _loc2_._visible = false;
            page.buyItNowText._visible = false;
         }
         if(this.currentVehicle.name == "PBUS2")
         {
            _loc7_ = 1;
            _loc8_ = 2;
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc8_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc7_)
            {
               this.setLocalisedText(_loc2_.originalPriceText,"ELT_OWNED");
               _loc2_.originalPriceText._x = 0.5 * (_loc5_ - _loc2_.originalPriceText.textWidth) - 10;
               _loc2_.reductionLine._visible = false;
               _loc2_.priceText.text = "";
               _loc2_.buyItNowText.text = "";
               _loc2_.padlock._visible = true;
            }
         }
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc6_._visible = false;
   }
   function initBuyItNowPriceButtons(page, numOptions)
   {
      var _loc2_;
      var _loc6_ = page.BUYITNOWSTOCK_2;
      var _loc3_ = numOptions - 1;
      var _loc5_;
      var _loc9_;
      var _loc7_;
      var _loc8_;
      while(_loc3_ >= 0)
      {
         _loc2_ = _loc6_.duplicateMovieClip("BUYITNOWSTOCK_B" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:_loc6_._x,_y:_loc6_._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.onColour = this.purchaseButtonOnColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         _loc2_.onColour = this.purchaseButtonOffColour;
         _loc2_.offColour = this.purchaseButtonOffColour;
         _loc5_ = _loc2_._width;
         if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0 && this.currentVehicle.secondarySalePrice != this.currentVehicle.secondaryPrice)
         {
            _loc2_.originalPriceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc2_.priceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
            _loc9_ = _loc2_.originalPriceText.textWidth + _loc2_.priceText.textWidth + 10;
            _loc2_.originalPriceText.autoSize = "left";
            _loc2_.priceText.autoSize = "left";
            _loc2_.originalPriceText._x = 0.5 * (_loc5_ - _loc9_);
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
         this.setLocalisedText(_loc2_.buyItNowText,"SSSA_BIN_PRICE");
         _loc2_.disabled = numOptions > 1;
         if(this.currentVehicle.name == "PBUS2")
         {
            _loc7_ = 1;
            _loc8_ = 2;
            if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc8_ || this.dataProviderUI[com.rockstargames.gtav.web.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.PARTY_BUS_DATA_SLOT][_loc3_] == _loc7_)
            {
               this.setLocalisedText(_loc2_.originalPriceText,"ELT_OWNED");
               _loc2_.originalPriceText._x = 0.5 * (_loc5_ - _loc2_.originalPriceText.textWidth) - 10;
               _loc2_.reductionLine._visible = false;
               _loc2_.priceText.text = "";
               _loc2_.buyItNowText.text = "";
               _loc2_.padlock._visible = true;
            }
         }
         this.dataTextScope.unshift(_loc2_.btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      _loc6_._visible = false;
   }
}
