class com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM extends com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM_WRAPPER
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
   var SORT_PRICE_LABEL;
   var STATS_HEADER_LABEL;
   var SUCCESS_PAGE;
   var TOOLBAR_LABEL;
   var USE_SEPARATE_DETAIL_IMAGES;
   var VEHICLE_BUTTON_ROW_HEIGHT;
   var VEHICLE_COLOURS;
   var _name;
   var addVehicleImage;
   var browser;
   var categoryOrder;
   var chopperInterior;
   var chopperProgressPanel;
   var chopperSlideshow;
   var chopperTerminal;
   var chopperTurret;
   var chopperVehicle;
   var chopperWeapon;
   var currChopperPage;
   var currChopperPageType;
   var currHackerPage;
   var currHackerPageType;
   var currSubPage;
   var currSubPageType;
   var currTruckPage;
   var currTruckPageType;
   var currentFilter;
   var currentPage;
   var currentPageInitialised;
   var currentVehicle;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayConfig;
   var dropDownButtonOffColour;
   var dropDownButtonOnColour;
   var favourUpperCase;
   var filterDropDown;
   var formatPrice;
   var getVehicleFromId;
   var hackerDecal;
   var hackerDrone;
   var hackerMissile;
   var hackerProgressPanel;
   var hackerSlideshow;
   var hackerTint;
   var hackerWeapon;
   var hackerWorkshop;
   var hasSelectedBuyItNow;
   var imageManager;
   var initFailedPage;
   var initPurchasePage;
   var initSortingButtons;
   var initVehicleButtons;
   var isMP;
   var populateTextCount;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var selectedOption;
   var selectedStyle;
   var setLocalisedText;
   var showOutcomePageMessage;
   var sortButtonOffColour;
   var sortButtonOnColour;
   var subColour;
   var subFlag;
   var subHelicopter;
   var subMiniSub;
   var subMissiles;
   var subProgressPanel;
   var subSlideshow;
   var subSonar;
   var subWorkshop;
   var truckCab;
   var truckColour;
   var truckModule1;
   var truckModule2;
   var truckModule2Prev;
   var truckModule3;
   var truckModule3Prev;
   var truckPopup;
   var truckProgressPanel;
   var truckSlideshow;
   var vehicleMCs;
   var vehicles;
   static var NUM_FLAG_OPTIONS = 25;
   static var TRUCK_ID = 10;
   static var CHOPPER_ID = 15;
   static var HACKER_ID = 18;
   static var SUB_ID = 25;
   static var AWARDS_ID = 32;
   static var TRUCK_CAB_PAGE = "TRUCK_D_CAB";
   static var TRUCK_MODULE_1_PAGE = "TRUCK_D_MODULE_D_1";
   static var TRUCK_MODULE_2_PAGE = "TRUCK_D_MODULE_D_2";
   static var TRUCK_MODULE_3_PAGE = "TRUCK_D_MODULE_D_3";
   static var TRUCK_COLOUR_PAGE = "TRUCK_D_COLOR";
   static var TRUCK_SUMMARY_PAGE = "TRUCK_D_SUMMARY";
   static var TRUCK_PURCHASE_PAGE = "TRUCK_D_PURCHASE";
   static var TRUCK_PURCHASE_SUCCESS_PAGE = "TRUCK_D_PURCHASE_OK";
   static var TRUCK_PURCHASE_FAILED_PAGE = "TRUCK_D_PURCHASE_FAIL";
   static var CHOPPER_INTERIOR_PAGE = "AVENGER_D_INTERIOR";
   static var CHOPPER_TURRET_PAGE = "AVENGER_D_TURRET";
   static var CHOPPER_TERMINAL_PAGE = "AVENGER_D_TERMINAL";
   static var CHOPPER_VEHICLE_PAGE = "AVENGER_D_VEHICLE_D_WORKSHOP";
   static var CHOPPER_WEAPON_PAGE = "AVENGER_D_WEAPON_D_WORKSHOP";
   static var CHOPPER_SUMMARY_PAGE = "AVENGER_D_SUMMARY";
   static var CHOPPER_PURCHASE_PAGE = "AVENGER_D_BUY";
   static var CHOPPER_PURCHASE_SUCCESS_PAGE = "AVENGER_D_BUY_D_OK";
   static var CHOPPER_PURCHASE_FAILED_PAGE = "AVENGER_D_BUY_D_FAIL";
   static var HACKER_TINT_PAGE = "HACKERTRUCK_D_TINT";
   static var HACKER_DECAL_PAGE = "HACKERTRUCK_D_DECAL";
   static var HACKER_MISSILE_PAGE = "HACKERTRUCK_D_TURRET_D_STATION";
   static var HACKER_DRONE_PAGE = "HACKERTRUCK_D_DRONE_D_STATION";
   static var HACKER_WEAPON_PAGE = "HACKERTRUCK_D_WEAPON_D_WORKSHOP";
   static var HACKER_WORKSHOP_PAGE = "HACKERTRUCK_D_VEHICLE_D_WORKSHOP";
   static var HACKER_SUMMARY_PAGE = "HACKERTRUCK_D_SUMMARY";
   static var HACKER_PURCHASE_PAGE = "HACKERTRUCK_D_BUY";
   static var HACKER_PURCHASE_SUCCESS_PAGE = "HACKERTRUCK_D_SOLD";
   static var HACKER_PURCHASE_FAILED_PAGE = "HACKERTRUCK_D_NOSALE";
   static var SUB_COLOUR_PAGE = "SUB_D_COLOR";
   static var SUB_FLAG_PAGE = "SUB_D_FLAG";
   static var SUB_SONAR_PAGE = "SUB_D_SONAR";
   static var SUB_MISSILES_PAGE = "SUB_D_GUIDED_D_MISSILES";
   static var SUB_WORKSHOP_PAGE = "SUB_D_WEAPON_D_WORKSHOP";
   static var SUB_VEHICLES_PAGE = "SUB_D_VEHICLES";
   static var SUB_SUMMARY_PAGE = "SUB_D_SUMMARY";
   static var SUB_PURCHASE_PAGE = "SUB_D_PURCHASE";
   static var SUB_PURCHASE_SUCCESS_PAGE = "SUB_D_PURCHASE_OK";
   static var SUB_PURCHASE_FAILED_PAGE = "SUB_D_PURCHASE_FAIL";
   function WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM()
   {
      super();
      this._name = "WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM";
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 0;
      this.purchaseButtonOffColour = 16777215;
      this.sortButtonOnColour = 0;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 0;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = true;
      this.DETAILS_PAGE = "DETAILS";
      this.PURCHASE_PAGE = "PURCHASESTOCK";
      this.TOOLBAR_LABEL = "CANDC_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "CANDC_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "CANDC_PG1_BODY1";
      this.BUY_NOW_LABEL = "CANDC_BUYNOW";
      this.SORT_PRICE_LABEL = "CANDC_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "CANDC_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "CANDC_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "CANDC_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "CANDC_STATS_HEADER";
      this.FILTER_ALL_LABEL = "CANDC_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "CANDC_";
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = 235;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.hasSelectedBuyItNow = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.imageManager = new com.rockstargames.gtav.web.warstock.ImageManager();
      this.displayConfig = this.browser.getConfig();
      this.truckProgressPanel = new com.rockstargames.gtav.web.warstock.TruckProgressPanel(this.CONTENT.truckProgressPanel,this);
      this.truckProgressPanel.hide();
      this.truckPopup = new com.rockstargames.gtav.web.warstock.TruckPopup(this.CONTENT.truckPopup,this.browser.getConfig().screenWidth,this.browser.getConfig().screenHeight);
      this.truckPopup.hide();
      this.chopperProgressPanel = new com.rockstargames.gtav.web.warstock.ChopperProgressPanel(this.CONTENT.chopperProgressPanel,this);
      this.chopperProgressPanel.hide();
      this.hackerProgressPanel = new com.rockstargames.gtav.web.warstock.HackerProgressPanel(this.CONTENT.hackerProgressPanel,this);
      this.hackerProgressPanel.hide();
      this.subProgressPanel = new com.rockstargames.gtav.web.warstock.SubProgressPanel(this.CONTENT.subProgressPanel,this);
      this.subProgressPanel.hide();
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      var _loc3_;
      var _loc2_;
      if(success)
      {
         _loc3_ = parseInt(id.substring(id.lastIndexOf("_") + 1));
         _loc2_ = this.getVehicleFromId(_loc3_);
         _loc2_.txdLoaded = true;
         if(this.vehicleMCs[_loc2_.id])
         {
            this.displayImage(_loc2_,this.vehicleMCs[_loc2_.id]);
         }
         if(_loc2_ == this.currentVehicle)
         {
            this.displayImage(_loc2_,this.CONTENT.details || this.CONTENT.purchase);
         }
      }
      this.imageManager.textureLoaded(txd);
   }
   function CLEANUP()
   {
      if(this.currTruckPage)
      {
         this.currTruckPage.dispose();
         this.currTruckPage = null;
      }
      if(this.truckSlideshow)
      {
         this.truckSlideshow.dispose();
         this.truckSlideshow = null;
      }
      if(this.currChopperPage)
      {
         this.currChopperPage.dispose();
         this.currChopperPage = null;
      }
      if(this.chopperSlideshow)
      {
         this.chopperSlideshow.dispose();
         this.chopperSlideshow = null;
      }
      if(this.currHackerPage)
      {
         this.currHackerPage.dispose();
         this.currHackerPage = null;
      }
      if(this.hackerSlideshow)
      {
         this.hackerSlideshow.dispose();
         this.hackerSlideshow = null;
      }
      if(this.currSubPage)
      {
         this.currSubPage.dispose();
         this.currSubPage = null;
      }
      if(this.subSlideshow)
      {
         this.subSlideshow.dispose();
         this.subSlideshow = null;
      }
      this.imageManager.dispose();
      this.imageManager = null;
      this.truckProgressPanel.dispose();
      this.truckProgressPanel = null;
      this.truckPopup.dispose();
      this.truckPopup = null;
      this.chopperProgressPanel.dispose();
      this.chopperProgressPanel = null;
      this.hackerProgressPanel.dispose();
      this.hackerProgressPanel = null;
      this.subProgressPanel.dispose();
      this.subProgressPanel = null;
      super.CLEANUP();
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["CANDC_PG1_HEADER2","CANDC_VEHICLES"];
         this.vehicles = {CANDC_PG1_HEADER2:[this.vehicles.STOCKADE4,this.vehicles.POLICEB2,this.vehicles.TITAN2,this.vehicles.CARGOBOB5,this.vehicles.POLCOQUTT4,this.vehicles.POLFCTION2,this.vehicles.TACO,this.vehicles.PREDATOR,this.vehicles.POLCARACAR,this.vehicles.POLTERMINU,this.vehicles.POLIMPALER6,this.vehicles.POLDOM10,this.vehicles.POLGREENW,this.vehicles.POLDORADO,this.vehicles.POLIMPALER5,this.vehicles.POLGAUNTLET,this.vehicles.BENSON2,this.vehicles.PRANGER,this.vehicles.BOXVILLE6,this.vehicles.POLICE4,this.vehicles.POLICE5,this.vehicles.RIOT,this.vehicles.CONADA2,this.vehicles.RAIJU,this.vehicles.STREAMER216,this.vehicles.TAXI,this.vehicles.BRICKADE2,this.vehicles.IGNUS2,this.vehicles.VERUS,this.vehicles.DINGHY5,this.vehicles.SQUADDIE,this.vehicles.VETIR,this.vehicles.MANCHEZ2,this.vehicles.WINKY,this.vehicles.PATROLBOAT,this.vehicles.ALKONOST,this.vehicles.ANNIHLATOR2,this.vehicles.TOREADOR,this.vehicles.AVISA,this.vehicles.SPARROW3,this.vehicles.ZHABA,this.vehicles.JB7002,this.vehicles
         .MINITANK,this.vehicles.FIRETRUK,this.vehicles.BURRITO2,this.vehicles.STOCKADE,this.vehicles.BOXVILLE,this.vehicles.LGUARD,this.vehicles.BLAZER2,this.vehicles.MENACER,this.vehicles.SCRAMJET,this.vehicles.OPPRESSOR2,this.vehicles.STRIKEFORCE,this.vehicles.POUNDER2,this.vehicles.MULE4,this.vehicles.CARACARA,this.vehicles.DELUXO,this.vehicles.THRUSTER,this.vehicles.KHANJALI,this.vehicles.STROMBERG,this.vehicles.RIOT2,this.vehicles.AKULA,this.vehicles.VOLATOL,this.vehicles.BARRAGE,this.vehicles.CHERNOBOG,this.vehicles.LAZER,this.vehicles.HUNTER,this.vehicles.NOKOTA,this.vehicles.VIGILANTE,this.vehicles.PYRO,this.vehicles.MOGUL,this.vehicles.BOMBUSHKA,this.vehicles.STARLING,this.vehicles.ROGUE,this.vehicles.MOLOTOK,this.vehicles.TULA,this.vehicles.ARDENT,this.vehicles.NIGHTSHARK,this.vehicles.APC,this.vehicles.DUNE3,this.vehicles.HALFTRACK,this.vehicles.OPPRESSOR,this.vehicles.TAMPA3,this.vehicles.TRSMALL2,this.vehicles.BALLISTIC_EQUIP,this.vehicles.INSURGENT,this.vehicles.TECHNICAL,this.vehicles
         .DUNE5,this.vehicles.PHANTOM2,this.vehicles.TECHNICAL2,this.vehicles.BLAZER5,this.vehicles.BOXVILLE5,this.vehicles.WASTLNDR,this.vehicles.RUINER2,this.vehicles.VOLTIC2,this.vehicles.BRICKADE,this.vehicles.CARGOBOB,this.vehicles.CARGOBOB2,this.vehicles.LIMO2,this.vehicles.INSURGENT2,this.vehicles.HYDRA,this.vehicles.VALKYRIE,this.vehicles.MULE3,this.vehicles.BOXVILLE4,this.vehicles.SAVAGE,this.vehicles.MESA3,this.vehicles.PBUS],CANDC_VEHICLES:[this.vehicles.DUKES2,this.vehicles.MARSHALL,this.vehicles.MONSTER,this.vehicles.DUBSTA3,this.vehicles.RHINO,this.vehicles.BARRACKS,this.vehicles.BUZZARD,this.vehicles.CRUSADER,this.vehicles.AIRBUS,this.vehicles.JOURNEY,this.vehicles.COACH,this.vehicles.BUS,this.vehicles.MULE,this.vehicles.RENTBUS,this.vehicles.DUMP]};
      }
      else
      {
         this.categoryOrder = ["CANDC_VEHICLES"];
         this.vehicles = {CANDC_VEHICLES:[this.vehicles.DUKES2,this.vehicles.MARSHALL,this.vehicles.DUBSTA3,this.vehicles.RHINO,this.vehicles.BARRACKS,this.vehicles.CARGOBOB,this.vehicles.BUZZARD,this.vehicles.CRUSADER]};
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = this.SUCCESS_PAGE;
      this.PAGE_NAMES[12] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[13] = this.FAILED_PAGE;
      this.PAGE_NAMES[14] = this.ERROR_PAGE;
      this.PAGE_NAMES[54] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_CAB_PAGE;
      this.PAGE_NAMES[55] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_1_PAGE;
      this.PAGE_NAMES[56] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_2_PAGE;
      this.PAGE_NAMES[57] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_3_PAGE;
      this.PAGE_NAMES[58] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_COLOUR_PAGE;
      this.PAGE_NAMES[59] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_SUMMARY_PAGE;
      this.PAGE_NAMES[60] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_PAGE;
      this.PAGE_NAMES[61] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_SUCCESS_PAGE;
      this.PAGE_NAMES[62] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_FAILED_PAGE;
      this.PAGE_NAMES[83] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE;
      this.PAGE_NAMES[84] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE;
      this.PAGE_NAMES[85] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE;
      this.PAGE_NAMES[86] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_WEAPON_PAGE;
      this.PAGE_NAMES[87] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_SUMMARY_PAGE;
      this.PAGE_NAMES[88] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_PAGE;
      this.PAGE_NAMES[89] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_SUCCESS_PAGE;
      this.PAGE_NAMES[90] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_FAILED_PAGE;
      this.PAGE_NAMES[163] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE;
      this.PAGE_NAMES[101] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_TINT_PAGE;
      this.PAGE_NAMES[102] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE;
      this.PAGE_NAMES[103] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_MISSILE_PAGE;
      this.PAGE_NAMES[104] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE;
      this.PAGE_NAMES[105] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE;
      this.PAGE_NAMES[106] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE;
      this.PAGE_NAMES[107] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_SUMMARY_PAGE;
      this.PAGE_NAMES[108] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_PAGE;
      this.PAGE_NAMES[109] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_SUCCESS_PAGE;
      this.PAGE_NAMES[110] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_FAILED_PAGE;
      this.PAGE_NAMES[138] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_COLOUR_PAGE;
      this.PAGE_NAMES[139] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_FLAG_PAGE;
      this.PAGE_NAMES[140] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SONAR_PAGE;
      this.PAGE_NAMES[141] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_MISSILES_PAGE;
      this.PAGE_NAMES[142] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_WORKSHOP_PAGE;
      this.PAGE_NAMES[143] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_VEHICLES_PAGE;
      this.PAGE_NAMES[144] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SUMMARY_PAGE;
      this.PAGE_NAMES[145] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_PAGE;
      this.PAGE_NAMES[146] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_SUCCESS_PAGE;
      this.PAGE_NAMES[147] = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_FAILED_PAGE;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[54] = false;
      this.CAN_STORE_PAGE[55] = false;
      this.CAN_STORE_PAGE[56] = false;
      this.CAN_STORE_PAGE[57] = false;
      this.CAN_STORE_PAGE[58] = false;
      this.CAN_STORE_PAGE[59] = false;
      this.CAN_STORE_PAGE[60] = false;
      this.CAN_STORE_PAGE[61] = false;
      this.CAN_STORE_PAGE[62] = false;
      this.CAN_STORE_PAGE[83] = false;
      this.CAN_STORE_PAGE[84] = false;
      this.CAN_STORE_PAGE[85] = false;
      this.CAN_STORE_PAGE[86] = false;
      this.CAN_STORE_PAGE[87] = false;
      this.CAN_STORE_PAGE[88] = false;
      this.CAN_STORE_PAGE[89] = false;
      this.CAN_STORE_PAGE[90] = false;
      this.CAN_STORE_PAGE[101] = false;
      this.CAN_STORE_PAGE[102] = false;
      this.CAN_STORE_PAGE[103] = false;
      this.CAN_STORE_PAGE[104] = false;
      this.CAN_STORE_PAGE[105] = false;
      this.CAN_STORE_PAGE[106] = false;
      this.CAN_STORE_PAGE[107] = false;
      this.CAN_STORE_PAGE[108] = false;
      this.CAN_STORE_PAGE[109] = false;
      this.CAN_STORE_PAGE[110] = false;
      this.CAN_STORE_PAGE[138] = false;
      this.CAN_STORE_PAGE[139] = false;
      this.CAN_STORE_PAGE[140] = false;
      this.CAN_STORE_PAGE[141] = false;
      this.CAN_STORE_PAGE[142] = false;
      this.CAN_STORE_PAGE[143] = false;
      this.CAN_STORE_PAGE[144] = false;
      this.CAN_STORE_PAGE[145] = false;
      this.CAN_STORE_PAGE[146] = false;
      this.CAN_STORE_PAGE[147] = false;
      this.CAN_STORE_PAGE[163] = false;
   }
   function updateBackground(contentItem, page)
   {
      super.updateBackground(contentItem,page);
      page.panel._height = page.background._height - page.panel._y - page.footer._height;
   }
   function initStats(page)
   {
   }
   function displayImage(vehicle, container)
   {
      var _loc6_ = container.vehicleImage._width - 4;
      var _loc5_ = container.vehicleImage._height - 4;
      var _loc2_ = vehicle.name;
      if(vehicle.livery)
      {
         _loc2_ += "_" + vehicle.livery[Math.max(0,this.selectedOption)];
      }
      else if(vehicle.flags && this.currentPage != this.HOME_PAGE && container._parent == this.CONTENT)
      {
         if(this.selectedOption == -1)
         {
            _loc2_ += "_FLAG8";
         }
         else
         {
            _loc2_ += "_FLAG" + this.selectedOption;
         }
      }
      if(this.USE_SEPARATE_DETAIL_IMAGES && this.currentPage != this.HOME_PAGE && container._parent == this.CONTENT)
      {
         _loc2_ += "_" + this.DETAILS_PAGE_IMAGE_SUFFIX;
      }
      container.vehicleImage.htmlText = "<img src=\'img://" + vehicle.txd + "/" + _loc2_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc6_ + "\' height=\'" + _loc5_ + "\'/>";
   }
   function goToAnchor(link)
   {
      var _loc6_ = Math.max(0,link.lastIndexOf("_")) || link.length;
      var _loc4_ = link.slice(0,_loc6_);
      var _loc5_ = link.slice(_loc6_ + 1);
      var _loc10_;
      var _loc7_;
      var _loc9_;
      var _loc8_;
      if(link == "truck_banner")
      {
         _loc10_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][5] === true;
         if(!_loc10_)
         {
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_CAB_PAGE);
         }
      }
      else if(link == "chopper_banner")
      {
         _loc7_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][4] === true;
         if(!_loc7_)
         {
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE);
         }
      }
      else if(link == "hacker_banner")
      {
         _loc9_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][6] === true;
         if(!_loc9_)
         {
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_TINT_PAGE);
         }
      }
      else if(link == "sub_banner")
      {
         _loc8_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][7] === true;
         if(!_loc8_)
         {
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_COLOUR_PAGE);
         }
      }
      else if(link.indexOf("TRUCK") == 0)
      {
         this.browser.GO_TO_WEBPAGE(this._name + "_S_" + link);
      }
      else if(this.currentPage.indexOf("TRUCK") == 0)
      {
         this.currTruckPage.handleClick(_loc4_,_loc5_);
      }
      else if(link.indexOf("AVENGER") == 0)
      {
         this.browser.GO_TO_WEBPAGE(this._name + "_S_" + link);
      }
      else if(this.currentPage.indexOf("AVENGER") == 0)
      {
         this.currChopperPage.handleClick(_loc4_,_loc5_);
      }
      else if(link.indexOf("HACKER") == 0)
      {
         this.browser.GO_TO_WEBPAGE(this._name + "_S_" + link);
      }
      else if(this.currentPage.indexOf("HACKER") == 0)
      {
         this.currHackerPage.handleClick(_loc4_,_loc5_);
      }
      else if(link.indexOf("SUB") == 0)
      {
         this.browser.GO_TO_WEBPAGE(this._name + "_S_" + link);
      }
      else if(this.currentPage.indexOf("SUB") == 0)
      {
         this.currSubPage.handleClick(_loc4_,_loc5_);
      }
      else if(_loc4_ == "SECUROSERVSTOCK" || _loc4_ == "BUYITNOWSTOCK")
      {
         if(_loc5_ == 1 && this.currentVehicle.price1Unlocked)
         {
            this.hasSelectedBuyItNow = false;
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + this.PURCHASE_PAGE);
         }
         else if(_loc5_ == 2 && this.currentVehicle.price2Unlocked)
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
   function displayPage(pageName)
   {
      if(pageName == this.HOME_PAGE)
      {
         this.truckSlideshow.dispose();
         this.truckSlideshow = null;
         this.chopperSlideshow.dispose();
         this.chopperSlideshow = null;
         this.hackerSlideshow.dispose();
         this.hackerSlideshow = null;
         this.subSlideshow.dispose();
         this.subSlideshow = null;
      }
      if(pageName != this.currentPage)
      {
         if(this.currTruckPage)
         {
            this.currTruckPage.dispose();
            this.currTruckPage = null;
         }
         else if(this.currChopperPage)
         {
            this.currChopperPage.dispose();
            this.currChopperPage = null;
         }
         else if(this.currHackerPage)
         {
            this.currHackerPage.dispose();
            this.currHackerPage = null;
         }
         else if(this.currSubPage)
         {
            this.currSubPage.dispose();
            this.currSubPage = null;
         }
      }
      if(pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_CAB_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_1_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_2_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_3_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_COLOUR_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_SUMMARY_PAGE)
      {
         this.truckProgressPanel.show();
      }
      else
      {
         this.truckProgressPanel.hide();
      }
      if(pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_WEAPON_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_SUMMARY_PAGE)
      {
         this.chopperProgressPanel.show();
      }
      else
      {
         this.chopperProgressPanel.hide();
      }
      if(pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_TINT_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_MISSILE_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_SUMMARY_PAGE)
      {
         this.hackerProgressPanel.show();
      }
      else
      {
         this.hackerProgressPanel.hide();
      }
      if(pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_COLOUR_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_FLAG_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SONAR_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_MISSILES_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_WORKSHOP_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_VEHICLES_PAGE || pageName == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SUMMARY_PAGE)
      {
         this.subProgressPanel.show();
      }
      else
      {
         this.subProgressPanel.hide();
      }
      super.displayPage(pageName);
   }
   function handleLB()
   {
      if(this.currTruckPage && this.currTruckPage.prevPageName && !this.truckPopup.isShowing)
      {
         this.browser.GO_TO_WEBPAGE(this.currTruckPage.prevPageName);
      }
      else if(this.currChopperPage && this.currChopperPage.prevPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currChopperPage.prevPageName);
      }
      else if(this.currHackerPage && this.currHackerPage.prevPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currHackerPage.prevPageName);
      }
      else if(this.currSubPage && this.currSubPage.prevPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currSubPage.prevPageName);
      }
   }
   function handleRB()
   {
      if(this.currTruckPage && this.currTruckPage.nextPageName && !this.truckPopup.isShowing)
      {
         this.browser.GO_TO_WEBPAGE(this.currTruckPage.nextPageName);
      }
      else if(this.currChopperPage && this.currChopperPage.nextPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currChopperPage.nextPageName);
      }
      else if(this.currHackerPage && this.currHackerPage.nextPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currHackerPage.nextPageName);
      }
      else if(this.currSubPage && this.currSubPage.nextPageName)
      {
         this.browser.GO_TO_WEBPAGE(this.currSubPage.nextPageName);
      }
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
      var _loc5_;
      if(this.currentPage != pageName)
      {
         this.populateTextCount = 1;
         this.currentPageInitialised = false;
         for(var _loc6_ in this.vehicles)
         {
            _loc3_ = this.vehicles[_loc6_];
            _loc2_ = 0;
            _loc5_ = _loc3_.length;
            while(_loc2_ < _loc5_)
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
            this.currTruckPageType = null;
            this.currChopperPageType = null;
            this.currHackerPageType = null;
            this.currSubPageType = null;
            this.initHomePage(newPage);
            break;
         case this.DETAILS_PAGE:
            this.currTruckPageType = null;
            this.currChopperPageType = null;
            this.currHackerPageType = null;
            this.currSubPageType = null;
            this.initDetailsPage(_loc8_,newPage);
            break;
         case this.PURCHASE_PAGE:
            this.currTruckPageType = null;
            this.currChopperPageType = null;
            this.currHackerPageType = null;
            this.currSubPageType = null;
            this.initPurchasePage();
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_CAB_PAGE:
            this.showTruckPage(this.CONTENT.cab,com.rockstargames.gtav.web.warstock.TruckCabPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_1_PAGE:
            this.showTruckPage(this.CONTENT.module1,com.rockstargames.gtav.web.warstock.TruckModule1Page,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_2_PAGE:
            this.showTruckPage(this.CONTENT.module2,com.rockstargames.gtav.web.warstock.TruckModule2Page,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_3_PAGE:
            this.showTruckPage(this.CONTENT.module3,com.rockstargames.gtav.web.warstock.TruckModule3Page,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_COLOUR_PAGE:
            this.showTruckPage(this.CONTENT.colour,com.rockstargames.gtav.web.warstock.TruckColourPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_SUMMARY_PAGE:
            this.showTruckPage(this.CONTENT.summary,com.rockstargames.gtav.web.warstock.TruckSummaryPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_PAGE:
            this.showTruckPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.TruckPurchasePendingPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_FAILED_PAGE:
            this.showTruckPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.TruckPurchaseFailedPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_SUCCESS_PAGE:
            this.showTruckPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.TruckPurchaseSuccessPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE:
            this.showChopperPage(this.CONTENT.interior,com.rockstargames.gtav.web.warstock.ChopperInteriorPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE:
            this.showChopperPage(this.CONTENT.turret,com.rockstargames.gtav.web.warstock.ChopperTurretPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE:
            this.showChopperPage(this.CONTENT.terminal,com.rockstargames.gtav.web.warstock.ChopperTerminalPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE:
            this.showChopperPage(this.CONTENT.vehicle,com.rockstargames.gtav.web.warstock.ChopperVehiclePage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_WEAPON_PAGE:
            this.showChopperPage(this.CONTENT.weapon,com.rockstargames.gtav.web.warstock.ChopperWeaponPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_SUMMARY_PAGE:
            this.showChopperPage(this.CONTENT.summary,com.rockstargames.gtav.web.warstock.ChopperSummaryPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_PAGE:
            this.showChopperPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.ChopperPurchasePendingPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_FAILED_PAGE:
            this.showChopperPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.ChopperPurchaseFailedPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_SUCCESS_PAGE:
            this.showChopperPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.ChopperPurchaseSuccessPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_TINT_PAGE:
            this.showHackerPage(this.CONTENT.tint,com.rockstargames.gtav.web.warstock.HackerTintPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE:
            this.showHackerPage(this.CONTENT.decal,com.rockstargames.gtav.web.warstock.HackerDecalPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_MISSILE_PAGE:
            this.showHackerPage(this.CONTENT.missile,com.rockstargames.gtav.web.warstock.HackerMissilePage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE:
            this.showHackerPage(this.CONTENT.drone,com.rockstargames.gtav.web.warstock.HackerDronePage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE:
            this.showHackerPage(this.CONTENT.weapon,com.rockstargames.gtav.web.warstock.HackerWeaponPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE:
            this.showHackerPage(this.CONTENT.workshop,com.rockstargames.gtav.web.warstock.HackerWorkshopPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_SUMMARY_PAGE:
            this.showHackerPage(this.CONTENT.summary,com.rockstargames.gtav.web.warstock.HackerSummaryPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_PAGE:
            this.showHackerPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.HackerPurchasePendingPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_FAILED_PAGE:
            this.showHackerPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.HackerPurchaseFailedPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_SUCCESS_PAGE:
            this.showHackerPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.HackerPurchaseSuccessPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_COLOUR_PAGE:
            this.showSubPage(this.CONTENT.colour,com.rockstargames.gtav.web.warstock.SubColourPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_FLAG_PAGE:
            this.showSubPage(this.CONTENT.flag,com.rockstargames.gtav.web.warstock.SubFlagPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SONAR_PAGE:
            this.showSubPage(this.CONTENT.sonar,com.rockstargames.gtav.web.warstock.SubSonarPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_MISSILES_PAGE:
            this.showSubPage(this.CONTENT.missiles,com.rockstargames.gtav.web.warstock.SubMissilesPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_WORKSHOP_PAGE:
            this.showSubPage(this.CONTENT.workshop,com.rockstargames.gtav.web.warstock.SubWorkshopPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_VEHICLES_PAGE:
            this.showSubPage(this.CONTENT.vehicles,com.rockstargames.gtav.web.warstock.SubVehiclesPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SUMMARY_PAGE:
            this.showSubPage(this.CONTENT.summary,com.rockstargames.gtav.web.warstock.SubSummaryPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_PAGE:
            this.showSubPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.SubPurchasePendingPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_FAILED_PAGE:
            this.showSubPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.SubPurchaseFailedPage,pageName);
            break;
         case com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_SUCCESS_PAGE:
            this.showSubPage(this.CONTENT.purchase,com.rockstargames.gtav.web.warstock.SubPurchaseSuccessPage,pageName);
            break;
         case this.SUCCESS_PAGE:
            this.currTruckPageType = null;
            this.currChopperPageType = null;
            this.currHackerPageType = null;
            this.currSubPageType = null;
            this.initSuccessPage(newPage);
            break;
         case this.FAILED_PAGE:
         case this.ERROR_PAGE:
            this.currTruckPageType = null;
            this.currChopperPageType = null;
            this.currHackerPageType = null;
            this.currSubPageType = null;
            this.initFailedPage(newPage);
         default:
            return;
      }
   }
   function showTruckPage(pageView, PageClass, type)
   {
      if(this.currTruckPageType != type)
      {
         this.currTruckPageType = type;
         this.currTruckPage = new PageClass(pageView,this,this.truckProgressPanel);
         this.dataTextScope = [].concat(this.currTruckPage.buttons).concat(this.truckPopup.buttons);
         this.truckPopup.hide();
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         this.CONTENT.BOUNDING_BOX._height = pageView.panel._height;
         this.browser.RESIZE_WEBSITE();
      }
      else if(type == "TRUCK_D_PURCHASE_FAIL")
      {
         com.rockstargames.gtav.web.warstock.TruckPurchaseFailedPage(this.currTruckPage).showMessage();
      }
   }
   function showTruckPopup(message)
   {
      if(this.currTruckPage)
      {
         this.currTruckPage.disable();
         this.truckProgressPanel.disable();
         this.truckPopup.show(message);
      }
   }
   function hideTruckPopup()
   {
      if(this.currTruckPage)
      {
         this.currTruckPage.enable();
         this.truckProgressPanel.enable();
      }
      this.truckPopup.hide();
   }
   function showChopperPage(pageView, PageClass, type)
   {
      if(this.currChopperPageType != type)
      {
         this.currChopperPageType = type;
         this.currChopperPage = new PageClass(pageView,this,this.chopperProgressPanel);
         this.dataTextScope = [].concat(this.currChopperPage.buttons);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         this.CONTENT.BOUNDING_BOX._height = pageView.panel._height;
         this.browser.RESIZE_WEBSITE();
      }
      else if(type == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_FAILED_PAGE)
      {
         com.rockstargames.gtav.web.warstock.ChopperPurchaseFailedPage(this.currChopperPage).showMessage();
      }
   }
   function showHackerPage(pageView, PageClass, type)
   {
      if(this.currHackerPageType != type)
      {
         this.currHackerPageType = type;
         this.currHackerPage = new PageClass(pageView,this,this.hackerProgressPanel);
         this.dataTextScope = [].concat(this.currHackerPage.buttons);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         this.CONTENT.BOUNDING_BOX._height = pageView.panel._height;
         this.browser.RESIZE_WEBSITE();
      }
      else if(type == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_FAILED_PAGE)
      {
         com.rockstargames.gtav.web.warstock.HackerPurchaseFailedPage(this.currHackerPage).showMessage();
      }
   }
   function showSubPage(pageView, PageClass, type)
   {
      if(this.currSubPageType != type)
      {
         this.currSubPageType = type;
         this.currSubPage = new PageClass(pageView,this,this.subProgressPanel);
         this.dataTextScope = [].concat(this.currSubPage.buttons);
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         this.CONTENT.BOUNDING_BOX._height = pageView.panel._height;
         this.browser.RESIZE_WEBSITE();
      }
      else if(type == com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_FAILED_PAGE)
      {
         com.rockstargames.gtav.web.warstock.SubPurchaseFailedPage(this.currSubPage).showMessage();
      }
   }
   function get purchasedTruckCab()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][0];
   }
   function get purchasedTruckModule1()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][1];
   }
   function get purchasedTruckModule2()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][2];
   }
   function get purchasedTruckModule3()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][3];
   }
   function get purchasedTruckColour()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][4];
   }
   function getBasePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 1][0];
   }
   function getBaseSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 2][0];
   }
   function getBuyFromPrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 1][1];
   }
   function getBuyFromSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 2][1];
   }
   function getCabCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 1][index + 2];
   }
   function getCabSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 2][index + 2];
   }
   function getModuleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 1][index];
   }
   function getModuleSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 2][index];
   }
   function getColourCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 3][index];
   }
   function getColourSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID + 4][index];
   }
   function initTruckDefaultSelections()
   {
      this.truckCab = this.purchasedTruckCab == -1 ? 0 : this.purchasedTruckCab;
      this.truckModule1 = this.purchasedTruckModule1 == -1 ? 2 : this.purchasedTruckModule1;
      this.truckModule2 = this.purchasedTruckModule2 == -1 ? 1 : this.purchasedTruckModule2;
      this.truckModule3 = this.purchasedTruckModule3 == -1 ? 1 : this.purchasedTruckModule3;
      this.truckColour = this.purchasedTruckColour == -1 ? 0 : this.purchasedTruckColour;
      this.truckModule2Prev = this.truckModule2;
      this.truckModule3Prev = this.truckModule3;
   }
   function dispatchPlayerTruckSelections()
   {
      if(this.truckCab == -1)
      {
         this.truckCab = 0;
      }
      if(this.truckModule1 == -1)
      {
         this.truckModule1 = 2;
      }
      if(this.truckModule2 == -1)
      {
         this.truckModule2 = 1;
      }
      if(this.truckModule3 == -1)
      {
         this.truckModule3 = 1;
      }
      if(this.truckColour == -1)
      {
         this.truckColour = 0;
      }
      var _loc4_ = 4;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.truckCab << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.truckModule1 << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.truckModule2 << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.truckModule3 << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.truckColour << _loc2_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.TRUCK,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM::dispatchPlayerTruckSelections");
      com.rockstargames.ui.utils.Debug.log("truckCab: " + this.truckCab);
      com.rockstargames.ui.utils.Debug.log("truckModule1: " + this.truckModule1);
      com.rockstargames.ui.utils.Debug.log("truckModule2: " + this.truckModule2);
      com.rockstargames.ui.utils.Debug.log("truckModule3: " + this.truckModule3);
      com.rockstargames.ui.utils.Debug.log("truckColour: " + this.truckColour);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("bitField: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      this.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_PURCHASE_PAGE);
   }
   function get purchasedChopperInterior()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][0];
   }
   function get purchasedChopperTurret()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][1];
   }
   function get purchasedChopperVehicle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][2];
   }
   function get purchasedChopperWeapon()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][3];
   }
   function get purchasedChopperTerminal()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][5] != undefined ? this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][5] : -1;
   }
   function getChopperBasePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][0];
   }
   function getChopperBaseSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][0];
   }
   function getChopperBuyFromPrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][1];
   }
   function getChopperBuyFromSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][1];
   }
   function getChopperTurretCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][2];
   }
   function getChopperTurretSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][2];
   }
   function getChopperVehicleCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][3];
   }
   function getChopperVehicleSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][3];
   }
   function getChopperWeaponCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][4];
   }
   function getChopperWeaponSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][4];
   }
   function getChopperInteriorCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][index + 5];
   }
   function getChopperInteriorSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][index + 5];
   }
   function getChopperTerminalCost(index)
   {
      return !(index == 1 && this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][14] != undefined) ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 1][14];
   }
   function getChopperTerminalSaleCost(index)
   {
      return !(index == 1 && this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][14] != undefined) ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID + 2][14];
   }
   function initChopperDefaultSelections()
   {
      this.chopperInterior = this.purchasedChopperInterior == -1 ? 0 : this.purchasedChopperInterior;
      this.chopperTurret = this.purchasedChopperTurret == -1 ? 0 : this.purchasedChopperTurret;
      this.chopperVehicle = this.purchasedChopperVehicle == -1 ? 0 : this.purchasedChopperVehicle;
      this.chopperWeapon = this.purchasedChopperWeapon == -1 ? 0 : this.purchasedChopperWeapon;
      this.chopperTerminal = this.purchasedChopperTerminal == -1 ? 0 : this.purchasedChopperTerminal;
   }
   function dispatchPlayerChopperSelections()
   {
      if(this.chopperInterior == -1)
      {
         this.chopperInterior = 0;
      }
      if(this.chopperTurret == -1)
      {
         this.chopperTurret = 0;
      }
      if(this.chopperVehicle == -1)
      {
         this.chopperVehicle = 0;
      }
      if(this.chopperWeapon == -1)
      {
         this.chopperWeapon = 0;
      }
      if(this.chopperTerminal == -1)
      {
         this.chopperTerminal = 0;
      }
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.chopperTurret << _loc2_;
      _loc2_ = _loc2_ + 1;
      _loc3_ |= this.chopperVehicle << _loc2_;
      _loc2_ = _loc2_ + 1;
      _loc3_ |= this.chopperWeapon << _loc2_;
      _loc2_ = _loc2_ + 1;
      _loc3_ |= this.chopperInterior << _loc2_;
      _loc2_ += 4;
      _loc3_ |= this.chopperTerminal << _loc2_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CHOPPER,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM::dispatchPlayerChopperSelections");
      com.rockstargames.ui.utils.Debug.log("chopperInterior: " + this.chopperInterior);
      com.rockstargames.ui.utils.Debug.log("chopperTurret: " + this.chopperTurret);
      com.rockstargames.ui.utils.Debug.log("chopperVehicle: " + this.chopperVehicle);
      com.rockstargames.ui.utils.Debug.log("chopperWeapon: " + this.chopperWeapon);
      com.rockstargames.ui.utils.Debug.log("chopperTerminal: " + this.chopperTerminal);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("bitField: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      this.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_PURCHASE_PAGE);
   }
   function get purchasedHackerTint()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][0];
   }
   function get purchasedHackerDecal()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][1];
   }
   function get purchasedHackerMissile()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][2];
   }
   function get purchasedHackerDrone()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][3];
   }
   function get purchasedHackerWeapon()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][4];
   }
   function get purchasedHackerWorkshop()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][5];
   }
   function getHackerBasePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][0];
   }
   function getHackerBaseSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][0];
   }
   function getHackerBuyFromPrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][1];
   }
   function getHackerBuyFromSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][1];
   }
   function getHackerMissileCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][2];
   }
   function getHackerMissileSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][2];
   }
   function getHackerDroneCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][3];
   }
   function getHackerDroneSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][3];
   }
   function getHackerWeaponCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][4];
   }
   function getHackerWeaponSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][4];
   }
   function getHackerWorkshopCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][5];
   }
   function getHackerWorkshopSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][5];
   }
   function getHackerTintCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 1][index + 6];
   }
   function getHackerTintSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 2][index + 6];
   }
   function getHackerDecalCost(index)
   {
      return index >= 12 ? this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 4][index - 12] : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 3][index];
   }
   function getHackerDecalSaleCost(index)
   {
      return index >= 12 ? this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 6][index - 12] : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID + 5][index];
   }
   function initHackerDefaultSelections()
   {
      this.hackerTint = this.purchasedHackerTint == -1 ? 0 : this.purchasedHackerTint;
      this.hackerDecal = this.purchasedHackerDecal == -1 ? 0 : this.purchasedHackerDecal;
      this.hackerMissile = this.purchasedHackerMissile == -1 ? 0 : this.purchasedHackerMissile;
      this.hackerDrone = this.purchasedHackerDrone == -1 ? 0 : this.purchasedHackerDrone;
      this.hackerWeapon = this.purchasedHackerWeapon == -1 ? 0 : this.purchasedHackerWeapon;
      this.hackerWorkshop = this.purchasedHackerWorkshop == -1 ? 0 : this.purchasedHackerWorkshop;
   }
   function dispatchPlayerHackerSelections()
   {
      if(this.hackerTint == -1)
      {
         this.hackerTint = 0;
      }
      if(this.hackerDecal == -1)
      {
         this.hackerDecal = 0;
      }
      if(this.hackerMissile == -1)
      {
         this.hackerMissile = 0;
      }
      if(this.hackerDrone == -1)
      {
         this.hackerDrone = 0;
      }
      if(this.hackerWeapon == -1)
      {
         this.hackerWeapon = 0;
      }
      if(this.hackerWorkshop == -1)
      {
         this.hackerWorkshop = 0;
      }
      var _loc7_ = 4;
      var _loc4_ = 5;
      var _loc6_ = 1;
      var _loc8_ = 1;
      var _loc9_ = 1;
      var _loc5_ = 1;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.hackerTint << _loc2_;
      _loc2_ += _loc7_;
      _loc3_ |= this.hackerDecal << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.hackerMissile << _loc2_;
      _loc2_ += _loc6_;
      _loc3_ |= this.hackerDrone << _loc2_;
      _loc2_ += _loc8_;
      _loc3_ |= this.hackerWeapon << _loc2_;
      _loc2_ += _loc9_;
      _loc3_ |= this.hackerWorkshop << _loc2_;
      _loc2_ += _loc5_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CHOPPER,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM::dispatchPlayerHackerSelections");
      com.rockstargames.ui.utils.Debug.log("hackerTint: " + this.hackerTint);
      com.rockstargames.ui.utils.Debug.log("hackerDecal: " + this.hackerDecal);
      com.rockstargames.ui.utils.Debug.log("hackerMissile: " + this.hackerMissile);
      com.rockstargames.ui.utils.Debug.log("hackerDrone: " + this.hackerDrone);
      com.rockstargames.ui.utils.Debug.log("hackerWeapon: " + this.hackerWeapon);
      com.rockstargames.ui.utils.Debug.log("hackerWorkshop: " + this.hackerWorkshop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("bitField: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      this.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_PURCHASE_PAGE);
   }
   function get purchasedSubColour()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][0];
   }
   function get purchasedSubFlag()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][1];
   }
   function get purchasedSubSonar()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][2];
   }
   function get purchasedSubMissiles()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][3];
   }
   function get purchasedSubWorkshop()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][4];
   }
   function get purchasedSubHelicopter()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][5];
   }
   function get purchasedSubMiniSub()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][6];
   }
   function getSubBasePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][0];
   }
   function getSubBaseSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][0];
   }
   function getSubBuyFromPrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][1];
   }
   function getSubBuyFromSalePrice()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][1];
   }
   function getSubSonarCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][2];
   }
   function getSubSonarSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][2];
   }
   function getSubMissilesCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][3];
   }
   function getSubMissilesSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][3];
   }
   function getSubWorkshopCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][4];
   }
   function getSubWorkshopSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][4];
   }
   function getSubHelicopterCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][5];
   }
   function getSubHelicopterSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][5];
   }
   function getSubMiniSubCost(index)
   {
      return index != 1 ? 0 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 1][6];
   }
   function getSubMiniSubSaleCost(index)
   {
      return index != 1 ? -1 : this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 2][6];
   }
   function getSubColourCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 3][index];
   }
   function getSubColourSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 4][index];
   }
   function getSubFlagCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 5][index];
   }
   function getSubFlagSaleCost(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID + 6][index];
   }
   function initSubDefaultSelections()
   {
      this.subColour = this.purchasedSubColour == -1 ? 0 : this.purchasedSubColour;
      this.subFlag = this.purchasedSubFlag == -1 ? 0 : this.purchasedSubFlag;
      this.subSonar = this.purchasedSubSonar == -1 ? 0 : this.purchasedSubSonar;
      this.subMissiles = this.purchasedSubMissiles == -1 ? 0 : this.purchasedSubMissiles;
      this.subWorkshop = this.purchasedSubWorkshop == -1 ? 0 : this.purchasedSubWorkshop;
      this.subHelicopter = this.purchasedSubHelicopter == -1 ? 0 : this.purchasedSubHelicopter;
      this.subMiniSub = this.purchasedSubMiniSub == -1 ? 0 : this.purchasedSubMiniSub;
   }
   function dispatchPlayerSubSelections()
   {
      if(this.subColour == -1)
      {
         this.subColour = 0;
      }
      if(this.subFlag == -1)
      {
         this.subFlag = 0;
      }
      if(this.subSonar == -1)
      {
         this.subSonar = 0;
      }
      if(this.subMissiles == -1)
      {
         this.subMissiles = 0;
      }
      if(this.subWorkshop == -1)
      {
         this.subWorkshop = 0;
      }
      if(this.subHelicopter == -1)
      {
         this.subHelicopter = 0;
      }
      if(this.subMiniSub == -1)
      {
         this.subMiniSub = 0;
      }
      var _loc10_ = 5;
      var _loc9_ = 6;
      var _loc5_ = 1;
      var _loc6_ = 1;
      var _loc7_ = 1;
      var _loc4_ = 1;
      var _loc8_ = 1;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.subColour << _loc2_;
      _loc2_ += _loc10_;
      _loc3_ |= this.subFlag << _loc2_;
      _loc2_ += _loc9_;
      _loc3_ |= this.subSonar << _loc2_;
      _loc2_ += _loc5_;
      _loc3_ |= this.subMissiles << _loc2_;
      _loc2_ += _loc6_;
      _loc3_ |= this.subWorkshop << _loc2_;
      _loc2_ += _loc7_;
      _loc3_ |= this.subHelicopter << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.subMiniSub << _loc2_;
      _loc2_ += _loc8_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CHOPPER,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM::dispatchPlayerSubSelections");
      com.rockstargames.ui.utils.Debug.log("subColour: " + this.subColour);
      com.rockstargames.ui.utils.Debug.log("subFlag: " + this.subFlag);
      com.rockstargames.ui.utils.Debug.log("subSonar: " + this.subSonar);
      com.rockstargames.ui.utils.Debug.log("subMissiles: " + this.subMissiles);
      com.rockstargames.ui.utils.Debug.log("subWorkshop: " + this.subWorkshop);
      com.rockstargames.ui.utils.Debug.log("subHelicopter: " + this.subHelicopter);
      com.rockstargames.ui.utils.Debug.log("subMiniSub: " + this.subMiniSub);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("bitField: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      this.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_PURCHASE_PAGE);
   }
   function getActiveButtonID()
   {
      return this.browser.GET_CURRENT_ROLLOVER();
   }
   function initHomePage(newPage)
   {
      this.initTruckDefaultSelections();
      this.initChopperDefaultSelections();
      this.initHackerDefaultSelections();
      this.initSubDefaultSelections();
      var _loc7_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID] != undefined;
      var _loc8_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID] != undefined;
      var _loc6_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID] != undefined;
      var _loc5_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID] != undefined;
      if(_loc5_ && !this.currentPageInitialised)
      {
         this.initSubBanner();
      }
      if(_loc7_ && !this.currentPageInitialised)
      {
         this.initTruckBanner(_loc6_,_loc5_);
      }
      if(_loc8_ && !this.currentPageInitialised)
      {
         this.initChopperBanner(_loc6_,_loc5_);
      }
      if(_loc6_ && !this.currentPageInitialised)
      {
         this.initHackerBanner(_loc5_);
      }
      super.initHomePage(newPage);
      var _loc4_;
      var _loc3_;
      if(_loc8_)
      {
         _loc4_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.dataTextScope.length)
         {
            if(this.dataTextScope[_loc3_] == this.CONTENT.home.chopper_banner.btnTxt)
            {
               _loc4_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(!_loc4_)
         {
            this.dataTextScope.unshift(this.CONTENT.home.chopper_banner.btnTxt);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         }
      }
      if(_loc7_)
      {
         _loc4_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.dataTextScope.length)
         {
            if(this.dataTextScope[_loc3_] == this.CONTENT.home.truck_banner.btnTxt)
            {
               _loc4_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(!_loc4_)
         {
            this.dataTextScope.unshift(this.CONTENT.home.truck_banner.btnTxt);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         }
      }
      if(_loc6_)
      {
         _loc4_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.dataTextScope.length)
         {
            if(this.dataTextScope[_loc3_] == this.CONTENT.home.hacker_banner.btnTxt)
            {
               _loc4_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(!_loc4_)
         {
            this.dataTextScope.unshift(this.CONTENT.home.hacker_banner.btnTxt);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         }
      }
      if(_loc5_)
      {
         _loc4_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.dataTextScope.length)
         {
            if(this.dataTextScope[_loc3_] == this.CONTENT.home.sub_banner.btnTxt)
            {
               _loc4_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(!_loc4_)
         {
            this.dataTextScope.unshift(this.CONTENT.home.sub_banner.btnTxt);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         }
      }
      if(this.purchasedChopperTurret == 1)
      {
         this.chopperProgressPanel.permaDisableButton(1);
      }
      if(this.purchasedChopperVehicle == 1)
      {
         this.chopperProgressPanel.permaDisableButton(2);
      }
      if(this.purchasedChopperWeapon == 1)
      {
         this.chopperProgressPanel.permaDisableButton(3);
      }
      if(this.purchasedChopperTerminal == 1)
      {
         this.chopperProgressPanel.permaDisableButton(4);
      }
      if(this.purchasedHackerMissile == 1)
      {
         this.hackerProgressPanel.permaDisableButton(2);
      }
      if(this.purchasedHackerDrone == 1)
      {
         this.hackerProgressPanel.permaDisableButton(3);
      }
      if(this.purchasedHackerWeapon == 1)
      {
         this.hackerProgressPanel.permaDisableButton(4);
      }
      if(this.purchasedHackerWorkshop == 1)
      {
         this.hackerProgressPanel.permaDisableButton(5);
      }
      if(this.purchasedSubSonar == 1)
      {
         this.subProgressPanel.permaDisableButton(2);
      }
      if(this.purchasedSubMissiles == 1)
      {
         this.subProgressPanel.permaDisableButton(3);
      }
      if(this.purchasedSubWorkshop == 1)
      {
         this.subProgressPanel.permaDisableButton(4);
      }
   }
   function initTruckBanner(useSmallLayout, allowForSubBanner)
   {
      var _loc3_ = this.CONTENT.home;
      var _loc9_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_ID][5] === true;
      var _loc4_ = !allowForSubBanner ? 0 : 290;
      var _loc2_;
      if(useSmallLayout)
      {
         _loc2_ = _loc3_.attachMovie("truckBannerSmall","truck_banner",_loc3_.getNextHighestDepth(),{_x:786,_y:_loc3_.panel._y + _loc4_ + 155});
      }
      else
      {
         _loc2_ = _loc3_.attachMovie("truckBanner","truck_banner",_loc3_.getNextHighestDepth(),{_x:644,_y:_loc3_.panel._y + _loc4_ + 20});
      }
      var _loc10_ = this.purchasedTruckCab != -1;
      _loc2_.heading.textAutoSize = "shrink";
      this.setLocalisedText(_loc2_.heading,"CANDC_TRUCK_TITLE",false);
      if(!useSmallLayout)
      {
         _loc2_.message.text = "";
         _loc2_.bigMessage.textAutoSize = "shrink";
         this.setLocalisedText(_loc2_.bigMessage,"CANDC_TRUCK_BANNER",false);
      }
      this.setLocalisedText(_loc2_.buyFrom,!_loc10_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE_FROM",true);
      var _loc7_ = _loc2_.buyFrom.textWidth;
      var _loc6_ = this.getBuyFromPrice();
      var _loc5_ = this.getBuyFromSalePrice();
      _loc2_.buyFrom.appendText(": $" + this.formatNumber(_loc6_));
      if(_loc5_ >= 0 && _loc5_ < _loc6_)
      {
         _loc2_.reductionLine._x = _loc2_.buyFrom._x + _loc2_.buyFrom.textWidth + 4;
         _loc2_.reductionLine._width = _loc2_.buyFrom.textWidth - _loc7_ - 6;
         if(_loc5_ == 0)
         {
            _loc2_.buyFrom.text += " " + this.setLocalisedText(_loc2_.buyFrom,"CLUB_FREE");
         }
         else
         {
            _loc2_.buyFrom.appendText(" $" + this.formatNumber(_loc5_));
         }
         _loc2_.reductionLine._visible = true;
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      _loc2_.padlock._visible = _loc9_;
      if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][3] > 0)
      {
         _loc2_.award.gotoAndStop(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][3]);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.truckSlideshow = new com.rockstargames.gtav.web.warstock.Slideshow(this.imageManager,_loc2_);
      if(useSmallLayout)
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = Math.max(this.HOME_PAGE_VEHICLE_BUTTON_OFFSET,_loc3_.panel._y + _loc2_._height + _loc4_ + 172);
         this.truckSlideshow.show("CANDC_TRUCK",["BANNER_0_SML","BANNER_1_SML","BANNER_2_SML","BANNER_3_SML","BANNER_4_SML","BANNER_5_SML"],0,null,0.75);
      }
      else
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = _loc3_.panel._y + _loc2_._height + _loc4_ + 40;
         this.truckSlideshow.show("CANDC_TRUCK",["BANNER_0","BANNER_1","BANNER_2","BANNER_3","BANNER_4","BANNER_5"]);
      }
   }
   function initChopperBanner(useSmallLayout, allowForSubBanner)
   {
      var _loc3_ = this.CONTENT.home;
      var _loc4_ = !allowForSubBanner ? 0 : 290;
      var _loc7_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_ID][4] === true;
      var _loc2_;
      if(useSmallLayout)
      {
         _loc2_ = _loc3_.attachMovie("chopperBannerSmall","chopper_banner",_loc3_.getNextHighestDepth(),{_x:786,_y:_loc3_.panel._y + _loc4_ + 20});
      }
      else
      {
         _loc2_ = _loc3_.attachMovie("chopperBanner","chopper_banner",_loc3_.getNextHighestDepth(),{_x:236,_y:_loc3_.panel._y + _loc4_ + 20});
      }
      var _loc10_ = this.purchasedChopperInterior != -1;
      _loc2_.heading.textAutoSize = "shrink";
      this.setLocalisedText(_loc2_.heading,"CANDC_CHOPPER_TITLE",false);
      if(!useSmallLayout)
      {
         _loc2_.message.text = "";
         _loc2_.bigMessage.textAutoSize = "shrink";
         this.setLocalisedText(_loc2_.bigMessage,"CANDC_CHOPPER_BANNER",false);
      }
      this.setLocalisedText(_loc2_.buyFrom,!_loc10_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE_FROM",true);
      var _loc8_ = _loc2_.buyFrom.textWidth;
      var _loc6_ = this.getChopperBuyFromPrice();
      var _loc5_ = this.getChopperBuyFromSalePrice();
      _loc2_.buyFrom.appendText(": $" + this.formatNumber(_loc6_));
      if(_loc5_ >= 0 && _loc5_ < _loc6_)
      {
         _loc2_.reductionLine._x = _loc2_.buyFrom._x + _loc2_.buyFrom.textWidth + 4;
         _loc2_.reductionLine._width = _loc2_.buyFrom.textWidth - _loc8_ - 6;
         if(_loc5_ == 0)
         {
            _loc2_.buyFrom.text += " " + this.setLocalisedText(_loc2_.buyFrom,"CLUB_FREE");
         }
         else
         {
            _loc2_.buyFrom.appendText(" $" + this.formatNumber(_loc5_));
         }
         _loc2_.reductionLine._visible = true;
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      _loc2_.padlock._visible = _loc7_;
      if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][2] > 0)
      {
         _loc2_.award.gotoAndStop(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][2]);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.chopperSlideshow = new com.rockstargames.gtav.web.warstock.Slideshow(this.imageManager,_loc2_);
      if(useSmallLayout)
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = Math.max(this.HOME_PAGE_VEHICLE_BUTTON_OFFSET,_loc3_.panel._y + _loc2_._height + _loc4_ + 172);
         this.chopperSlideshow.show("CANDC_CHOPPER",["BANNER_0_SML","BANNER_1_SML","BANNER_2_SML","BANNER_3_SML","BANNER_4_SML","BANNER_5_SML"],0,null,0.5);
      }
      else
      {
         this.HOME_PAGE_VEHICLE_BUTTON_OFFSET = _loc3_.panel._y + _loc2_._height + _loc4_ + 40;
         this.chopperSlideshow.show("CANDC_CHOPPER",["BANNER_0","BANNER_1","BANNER_2","BANNER_3","BANNER_4","BANNER_5"],0,null,0.5);
      }
   }
   function initHackerBanner(allowForSubBanner)
   {
      var _loc4_ = this.CONTENT.home;
      var _loc8_ = !allowForSubBanner ? 0 : 290;
      var _loc7_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_ID][6] === true;
      var _loc2_ = _loc4_.attachMovie("hackerBanner","hacker_banner",_loc4_.getNextHighestDepth(),{_x:236,_y:_loc4_.panel._y + _loc8_ + 20});
      var _loc9_ = this.purchasedHackerTint != -1;
      _loc2_.heading.textAutoSize = "shrink";
      this.setLocalisedText(_loc2_.heading,"CANDC_HACKER_TITLE",false);
      this.setLocalisedText(_loc2_.buyFrom,!_loc9_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE_FROM",true);
      var _loc6_ = _loc2_.buyFrom.textWidth;
      var _loc5_ = this.getHackerBuyFromPrice();
      var _loc3_ = this.getHackerBuyFromSalePrice();
      _loc2_.buyFrom.appendText(": $" + this.formatNumber(_loc5_));
      if(_loc3_ >= 0 && _loc3_ < _loc5_)
      {
         _loc2_.reductionLine._x = _loc2_.buyFrom._x + _loc2_.buyFrom.textWidth + 4;
         _loc2_.reductionLine._width = _loc2_.buyFrom.textWidth - _loc6_ - 6;
         if(_loc3_ == 0)
         {
            _loc2_.buyFrom.text += " " + this.setLocalisedText(_loc2_.buyFrom,"CLUB_FREE");
         }
         else
         {
            _loc2_.buyFrom.appendText(" $" + this.formatNumber(_loc3_));
         }
         _loc2_.reductionLine._visible = true;
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      _loc2_.padlock._visible = _loc7_;
      if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][1] > 0)
      {
         _loc2_.award.gotoAndStop(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][1]);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.hackerSlideshow = new com.rockstargames.gtav.web.warstock.Slideshow(this.imageManager,_loc2_);
      this.hackerSlideshow.show("CANDC_HACKER",["BANNER0","BANNER1","BANNER2","BANNER3","BANNER4","BANNER5"],0,null,0.25);
   }
   function initSubBanner()
   {
      var _loc4_ = this.CONTENT.home;
      var _loc7_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_ID][7] === true;
      var _loc2_ = _loc4_.attachMovie("subBanner","sub_banner",_loc4_.getNextHighestDepth(),{_x:236,_y:_loc4_.panel._y + 20});
      var _loc8_ = this.purchasedSubColour != -1;
      _loc2_.heading.textAutoSize = "shrink";
      this.setLocalisedText(_loc2_.heading,"CANDC_SUB_TITLE",false);
      this.setLocalisedText(_loc2_.buyFrom,!_loc8_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE_FROM",true);
      var _loc6_ = _loc2_.buyFrom.textWidth;
      var _loc5_ = this.getSubBuyFromPrice();
      var _loc3_ = this.getSubBuyFromSalePrice();
      _loc2_.buyFrom.appendText(": $" + this.formatNumber(_loc5_));
      if(_loc3_ >= 0 && _loc3_ < _loc5_)
      {
         _loc2_.reductionLine._x = _loc2_.buyFrom._x + _loc2_.buyFrom.textWidth + 4;
         _loc2_.reductionLine._width = _loc2_.buyFrom.textWidth - _loc6_ - 6;
         if(_loc3_ == 0)
         {
            _loc2_.buyFrom.text += " " + this.setLocalisedText(_loc2_.buyFrom,"CLUB_FREE");
         }
         else
         {
            _loc2_.buyFrom.appendText(" $" + this.formatNumber(_loc3_));
         }
         _loc2_.reductionLine._visible = true;
      }
      else
      {
         _loc2_.reductionLine._visible = false;
      }
      _loc2_.padlock._visible = _loc7_;
      if(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][0] > 0)
      {
         _loc2_.award.gotoAndStop(this.dataProviderUI[com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.AWARDS_ID][0]);
         _loc2_.award._visible = true;
      }
      else
      {
         _loc2_.award._visible = false;
      }
      this.subSlideshow = new com.rockstargames.gtav.web.warstock.Slideshow(this.imageManager,_loc2_);
      this.subSlideshow.show("CANDC_SUB",["BANNER0","BANNER1","BANNER2","BANNER3","BANNER4","BANNER5"],0,null,0);
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc5_ = this.CONTENT.details;
      var _loc3_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc3_);
      if(this.currentVehicle.securoserv)
      {
         this.initBuyItNowDetailsPage(_loc3_,this.currentVehicle,newPage,"securoserv");
      }
      else if(this.currentVehicle.buyItNow && this.currentVehicle.price >= 0 && this.currentVehicle.secondaryPrice >= 0)
      {
         this.initBuyItNowDetailsPage(_loc3_,this.currentVehicle,newPage,"buyItNow");
      }
      else
      {
         super.initDetailsPage(pageName,newPage);
         if(this.currentVehicle.flags)
         {
            this.setOptionsButtons(8);
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
      var _loc6_;
      var _loc7_;
      if(currentVehicle.secondaryPrice > 0)
      {
         _loc2_.SECUROSERVSTOCK_2.onColour = this.purchaseButtonOffColour;
         _loc2_.SECUROSERVSTOCK_2.offColour = this.purchaseButtonOffColour;
         _loc6_ = _loc2_.SECUROSERVSTOCK_2._width;
         if(currentVehicle.secondarySalePrice != undefined && currentVehicle.secondarySalePrice >= 0 && currentVehicle.secondarySalePrice != currentVehicle.secondaryPrice)
         {
            _loc2_.SECUROSERVSTOCK_2.originalPriceText.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc2_.SECUROSERVSTOCK_2.priceText.text = this.formatPrice(currentVehicle.secondarySalePrice);
            _loc7_ = _loc2_.SECUROSERVSTOCK_2.originalPriceText.textWidth + _loc2_.SECUROSERVSTOCK_2.priceText.textWidth + 10;
            _loc2_.SECUROSERVSTOCK_2.originalPriceText.autoSize = "left";
            _loc2_.SECUROSERVSTOCK_2.priceText.autoSize = "left";
            _loc2_.SECUROSERVSTOCK_2.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
            _loc2_.SECUROSERVSTOCK_2.originalPriceText._y = _loc2_.SECUROSERVSTOCK_2.priceText._y + 5;
            _loc2_.SECUROSERVSTOCK_2.priceText._x = _loc2_.SECUROSERVSTOCK_2.originalPriceText._x + _loc2_.SECUROSERVSTOCK_2.originalPriceText.textWidth + 10;
            _loc2_.SECUROSERVSTOCK_2.reductionLine._x = _loc2_.SECUROSERVSTOCK_2.originalPriceText._x + _loc2_.SECUROSERVSTOCK_2.originalPriceText._width;
            _loc2_.SECUROSERVSTOCK_2.reductionLine._y = _loc2_.SECUROSERVSTOCK_2.originalPriceText._y + 7;
            _loc2_.SECUROSERVSTOCK_2.reductionLine._width = _loc2_.SECUROSERVSTOCK_2.originalPriceText._width;
         }
         else
         {
            _loc2_.SECUROSERVSTOCK_2.priceText.text = this.formatPrice(currentVehicle.secondaryPrice);
            _loc2_.SECUROSERVSTOCK_2.reductionLine._visible = false;
         }
         _loc2_.SECUROSERVSTOCK_2.padlock._visible = !currentVehicle.price2Unlocked;
         this.setLocalisedText(_loc2_.SECUROSERVSTOCK_2.buyItNowText,this.BUY_NOW_LABEL);
         this.dataTextScope.unshift(_loc2_.SECUROSERVSTOCK_2.btnTxt);
      }
      else
      {
         _loc2_.SECUROSERVSTOCK_2._visible = false;
         _loc2_.buyItNowText._visible = false;
      }
      _loc2_.SECUROSERVSTOCK_1.onColour = this.purchaseButtonOffColour;
      _loc2_.SECUROSERVSTOCK_1.offColour = this.purchaseButtonOffColour;
      _loc6_ = _loc2_.SECUROSERVSTOCK_1._width;
      if(currentVehicle.salePrice != undefined && currentVehicle.salePrice >= 0 && currentVehicle.salePrice != currentVehicle.price)
      {
         _loc2_.SECUROSERVSTOCK_1.originalPriceText.text = this.formatPrice(currentVehicle.price);
         _loc2_.SECUROSERVSTOCK_1.priceText.text = this.formatPrice(currentVehicle.salePrice);
         _loc7_ = _loc2_.SECUROSERVSTOCK_1.originalPriceText.textWidth + _loc2_.SECUROSERVSTOCK_1.priceText.textWidth + 10;
         _loc2_.SECUROSERVSTOCK_1.originalPriceText.autoSize = "left";
         _loc2_.SECUROSERVSTOCK_1.priceText.autoSize = "left";
         _loc2_.SECUROSERVSTOCK_1.originalPriceText._x = 0.5 * (_loc6_ - _loc7_);
         _loc2_.SECUROSERVSTOCK_1.originalPriceText._y = _loc2_.SECUROSERVSTOCK_1.priceText._y + 5;
         _loc2_.SECUROSERVSTOCK_1.priceText._x = _loc2_.SECUROSERVSTOCK_1.originalPriceText._x + _loc2_.SECUROSERVSTOCK_1.originalPriceText.textWidth + 10;
         _loc2_.SECUROSERVSTOCK_1.reductionLine._x = _loc2_.SECUROSERVSTOCK_1.originalPriceText._x + _loc2_.SECUROSERVSTOCK_1.originalPriceText._width;
         _loc2_.SECUROSERVSTOCK_1.reductionLine._y = _loc2_.SECUROSERVSTOCK_1.originalPriceText._y + 7;
         _loc2_.SECUROSERVSTOCK_1.reductionLine._width = _loc2_.SECUROSERVSTOCK_1.originalPriceText._width;
      }
      else
      {
         _loc2_.SECUROSERVSTOCK_1.priceText.text = this.formatPrice(currentVehicle.price);
         _loc2_.SECUROSERVSTOCK_1.reductionLine._visible = false;
      }
      _loc2_.SECUROSERVSTOCK_1.padlock.gotoAndStop(frame);
      _loc2_.SECUROSERVSTOCK_1.padlock._visible = !currentVehicle.price1Unlocked;
      this.setLocalisedText(_loc2_.SECUROSERVSTOCK_1.buyItNowText,!currentVehicle.buyItNow ? "CANDC_TRADE_PRICE" : "CANDC_NORMAL_PRICE");
      this.dataTextScope.unshift(_loc2_.SECUROSERVSTOCK_1.btnTxt);
      _loc2_.descriptionText.autoSize = "left";
      this.setLocalisedText(_loc2_.descriptionText,this.DESCRIPTION_LABEL_PREFIX + currentVehicle.name);
      this.initOptions(_loc2_);
      var _loc4_ = _loc2_.SECUROSERVSTOCK_1._y;
      if(_loc2_.SECUROSERVSTOCK_1._visible)
      {
         _loc4_ += _loc2_.SECUROSERVSTOCK_1._height + 18;
      }
      if(_loc2_.SECUROSERVSTOCK_2._visible)
      {
         _loc2_.SECUROSERVSTOCK_2._y = _loc4_;
         _loc4_ += _loc2_.SECUROSERVSTOCK_2._height + 18;
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
   function initOptions(page)
   {
      page.optionsHeaderText.autoSize = "left";
      var _loc5_;
      var _loc2_;
      if(this.currentVehicle.livery)
      {
         this.setLocalisedText(page.optionsHeaderText,this.LIVERY_HEADER_LABEL);
         page.options.gotoAndStop("LIVERY");
         _loc5_ = this.currentVehicle.livery.length;
         _loc2_ = _loc5_;
         while(_loc2_ < 8)
         {
            page.options["liveryText" + _loc2_]._x = page.options["liveryText" + _loc2_]._y = 0;
            page.options["optionsButton_" + _loc2_]._x = page.options["optionsButton_" + _loc2_]._y = 0;
            page.options["optionsButton_" + _loc2_]._visible = false;
            _loc2_ = _loc2_ + 1;
         }
      }
      else if(this.currentVehicle.flags)
      {
         this.setLocalisedText(page.optionsHeaderText,"CANDC_FLAGS_HEADER");
         page.options.gotoAndStop("FLAGS");
         _loc5_ = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.NUM_FLAG_OPTIONS;
      }
      else if(this.currentVehicle.colourways)
      {
         this.setLocalisedText(page.optionsHeaderText,"LGM_COLOUR");
         _loc5_ = this.NUM_COLOUR_OPTIONS;
      }
      else
      {
         page.options._visible = false;
      }
      _loc2_ = 0;
      var _loc4_;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = page.options["optionsButton_" + _loc2_];
         _loc4_.selected._visible = false;
         if(_loc4_.swatch)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc4_.swatch,this.VEHICLE_COLOURS[_loc2_][0],this.VEHICLE_COLOURS[_loc2_][1],this.VEHICLE_COLOURS[_loc2_][2],100);
         }
         if(this.currentVehicle.livery)
         {
            this.setLocalisedText(page.options["liveryText" + _loc2_],this.currentVehicle.livery[_loc2_]);
         }
         if(_loc4_.flags)
         {
            _loc4_.flags.gotoAndStop(_loc2_ + 1);
         }
         this.dataTextScope.push(_loc4_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_;
   }
   function initSelectedOption(page)
   {
      var _loc2_;
      if(this.selectedOption == -1)
      {
         page.selectedOption._visible = false;
      }
      else if(this.currentVehicle.livery)
      {
         page.selectedOption.gotoAndStop("LIVERY");
         this.setLocalisedText(page.selectedOption.liveryText,this.currentVehicle.livery[this.selectedOption]);
      }
      else if(this.currentVehicle.flags)
      {
         page.selectedOption.gotoAndStop("FLAGS");
         _loc2_ = page.selectedOption.optionsButton;
         _loc2_.selected._visible = false;
         _loc2_.flags.gotoAndStop(this.selectedOption + 1);
      }
      else if(this.currentVehicle.colourways)
      {
         _loc2_ = page.selectedOption.optionsButton;
         _loc2_.selected._visible = false;
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.swatch,this.VEHICLE_COLOURS[this.selectedOption][0],this.VEHICLE_COLOURS[this.selectedOption][1],this.VEHICLE_COLOURS[this.selectedOption][2],100);
      }
   }
   function setOptionsButtons(selectedOption)
   {
      var _loc7_ = this.CONTENT.details;
      var _loc8_;
      if(this.currentVehicle.livery)
      {
         _loc8_ = this.currentVehicle.livery.length;
      }
      else if(this.currentVehicle.flags)
      {
         _loc8_ = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.NUM_FLAG_OPTIONS;
      }
      else
      {
         _loc8_ = this.NUM_COLOUR_OPTIONS;
      }
      var _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc8_)
      {
         _loc5_ = _loc7_.options["optionsButton_" + _loc2_];
         _loc5_.disabled = _loc2_ == selectedOption;
         _loc5_.selected._visible = _loc2_ == selectedOption;
         _loc3_ = _loc7_[this.PURCHASE_PAGE + "_" + (_loc2_ + 1)];
         _loc4_ = selectedOption == _loc2_;
         _loc3_.disabled = !_loc4_;
         _loc3_._alpha = !_loc4_ ? 50 : 100;
         _loc3_._visible = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      this.selectedOption = selectedOption;
      if(this.currentVehicle.livery)
      {
         this.addVehicleImage(this.currentVehicle,_loc7_);
      }
      else if(this.currentVehicle.flags)
      {
         this.addVehicleImage(this.currentVehicle,_loc7_);
      }
   }
   function initVehicleButton(vehicle, container, x, y)
   {
      var _loc3_ = super.initVehicleButton(vehicle,container,x,y);
      if(!this.isMP && vehicle.name == "CARGOBOB")
      {
         _loc3_.header.dlcText.text = "";
      }
      return _loc3_;
   }
   function initSuccessPage(newPage)
   {
      var _loc2_ = "";
      var _loc3_;
      if(this.currentVehicle.id == 63)
      {
         _loc3_ = this.setLocalisedText(this.CONTENT.purchase.bodyText,"CANDC_BEQUIP_PURCHASED");
      }
      else
      {
         _loc3_ = this.setLocalisedText(this.CONTENT.purchase.bodyText,this.DESCRIPTION_LABEL_PREFIX + "PURCHASED");
      }
      this.initOutcomePage(_loc2_,_loc3_,"WEB_SOLD");
      this.showOutcomePageMessage();
   }
   function initOutcomePage(headerText, bodyText, soldLabel)
   {
      super.initOutcomePage(headerText,bodyText,soldLabel);
      var _loc3_ = this.CONTENT.purchase;
      if((this.currentVehicle.securoserv || this.currentVehicle.buyItNow) && this.hasSelectedBuyItNow)
      {
         if(this.currentVehicle.secondarySalePrice != undefined && this.currentVehicle.secondarySalePrice > 0)
         {
            _loc3_.priceText.text = this.formatPrice(this.currentVehicle.secondaryPrice);
            _loc3_.reductionLine._width = _loc3_.priceText.textWidth + 5;
            _loc3_.reducedPriceText._x = _loc3_.priceText._x - _loc3_.priceText.textWidth - 20;
            _loc3_.reducedPriceText.text = this.formatPrice(this.currentVehicle.secondarySalePrice);
         }
         else
         {
            _loc3_.priceText.text = !isNaN(this.currentVehicle.secondaryPrice) ? this.formatPrice(this.currentVehicle.secondaryPrice) : this.currentVehicle.secondaryPrice;
            _loc3_.reductionLine._visible = false;
         }
      }
   }
   function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
}
