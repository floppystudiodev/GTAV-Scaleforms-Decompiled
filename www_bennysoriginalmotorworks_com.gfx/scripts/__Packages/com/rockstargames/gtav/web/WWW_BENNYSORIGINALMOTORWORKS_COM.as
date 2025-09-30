class com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM extends com.rockstargames.gtav.web.vehicleSites.VehicleWebsite
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
   var NUM_VEHICLE_BUTTON_COLUMNS;
   var PAGE_NAMES;
   var PURCHASE_PAGE;
   var SORT_FADE_IN_DELAY;
   var SORT_FADE_IN_DURATION;
   var SORT_NEW_IN_LABEL;
   var SORT_PRICE_LABEL;
   var STATS_HEADER_LABEL;
   var SUCCESS_PAGE;
   var TOOLBAR_LABEL;
   var USE_SEPARATE_DETAIL_IMAGES;
   var VEHICLE_BUTTON_COLUMNS;
   var VEHICLE_BUTTON_ROW_HEIGHT;
   var VEHICLE_COLOURS;
   var _name;
   var addVehicleImage;
   var browser;
   var categoryOrder;
   var currentFilter;
   var currentPage;
   var currentPageInitialised;
   var currentShowroomImage;
   var currentVehicle;
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
   var initFailedPage;
   var initSelectedOption;
   var initSortingButtons;
   var initSuccessPage;
   var isMP;
   var persistentYPosition;
   var playerRank;
   var polaroidVehicles;
   var populateTextCount;
   var priceSortDirection;
   var pricesSet;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var selectedOption;
   var setLocalisedText;
   var setOptionsButtons;
   var showroomVehicles;
   var sortButtonOffColour;
   var sortButtonOnColour;
   var vehicleMCs;
   var videoDisabled;
   static var FIND_US_PAGE;
   static var SHOWROOM_PAGE;
   static var STOCK_PAGE;
   static var NUM_SHOWROOM_CARS = 2;
   static var NUM_SHOWROOM_THUMBNAILS = 4;
   static var STOCK_PAGE_VEHICLE_BUTTON_OFFSET = 306;
   static var TOP_NAV_TEXT_WIDTH = 130;
   static var TOP_NAV_TEXT_WIDTH_ASIAN = 115;
   static var SHOW_VIDEO = false;
   static var BRAND_ALBANY = "ALBANY";
   static var BRAND_ANNIS = "ANNIS";
   static var BRAND_BENEFAC = "BENEFAC";
   static var BRAND_BF = "BF";
   static var BRAND_BRAVADO = "BRAVADO";
   static var BRAND_DECLASSE = "DECLASSE";
   static var BRAND_DEWBAUCH = "DEWBAUCH";
   static var BRAND_DUNDREARY = "DUNDREAR";
   static var BRAND_GROTTI = "GROTTI";
   static var BRAND_KARIN = "KARIN";
   static var BRAND_OBEY = "OBEY";
   static var BRAND_PEGASSI = "PEGASSI";
   static var BRAND_PFISTER = "PFISTER";
   static var BRAND_PRINCIPE = "PRINCIPLE";
   static var BRAND_PROGEN = "PROGEN";
   static var BRAND_TRUFFADE = "TRUFFADE";
   static var BRAND_UBERMACH = "UBERMACH";
   static var BRAND_VAPID = "VAPID";
   static var BRAND_WILLARD = "WILLARD";
   static var TXD_DEFAULT = "LSC_DEFAULT";
   static var TXD_JAN2016 = "LSC_JAN2016";
   static var TXD_LOWRIDER2 = "LSC_LOWRIDER2";
   static var TXD_IMPORT_EXPORT = "LSC_DLC_IMPORT_EXPORT";
   static var TXD_SUMMER2020 = "LSC_DLC_SUMMER2020";
   static var TXD_SUM2 = "LSC_DLC_SUM2";
   static var DRIVE_REAR = "REAR";
   static var DRIVE_FRONT = "FRONT";
   static var DRIVE_ALL = "ALL";
   var vehicles = {CHINO2:{id:15,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_VAPID,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"CHINO",showStar:false,topSpeed:0.6975,acceleration:0.525,braking:0.2,traction:0.6273},PRIMO2:{id:16,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_ALBANY,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"PRIMO",showStar:false,topSpeed:0.7512,acceleration:0.5,braking:0.3,traction:0.7121},MOONBEAM2:{id:17,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DECLASSE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM
   .DRIVE_REAR,colourways:true,unmodifiedName:"MOONBEAM",showStar:false,topSpeed:0.6707,acceleration:0.525,braking:0.1333,traction:0.6061},MINIVAN2:{id:18,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_VAPID,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_ALL,colourways:true,unmodifiedName:"MINIVAN",showStar:false,topSpeed:0.6707,acceleration:0.375,braking:0.15,traction:0.5833},FACTION2:{id:19,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_WILLARD,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"FACTION",showStar:false,crossLink:[29,19],hideForCrossLink:true,topSpeed:0.7512,acceleration:0.7,braking:0.2667,traction:0.6818},BUCCANEER2:{id:20,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM
   .BRAND_ALBANY,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"BUCCANEE",showStar:false,topSpeed:0.7834,acceleration:0.7,braking:0.2667,traction:0.6515},VOODOO:{id:21,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DECLASSE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_DEFAULT,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"VOODOO",showStar:false,topSpeed:0.6975,acceleration:0.425,braking:0.083,traction:0.5606},VIRGO2:{id:22,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DUNDREARY,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"VIRGO",showStar:false,topSpeed:0.719,acceleration:0.5275,braking:0.24,traction:0.6364},TORNADO5:{id:23,brand:com
   .rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DECLASSE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"TORNADO",showStar:false,topSpeed:0.6975,acceleration:0.4025,braking:0.085,traction:0.5606},SABREGT2:{id:24,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DECLASSE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"SABREGT",showStar:false,topSpeed:0.7512,acceleration:0.705,braking:0.2733,traction:0.6848},SULTAN2:{id:26,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_KARIN,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_JAN2016,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_ALL,colourways:true,unmodifiedName:"SULTAN",showStar:false,topSpeed:0.778,acceleration:0.65,braking:0.133,traction:0.712},BANSHEE2:{id:27,brand:com
   .rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_BRAVADO,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_JAN2016,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"BANSHEE",showStar:false,topSpeed:0.794,acceleration:0.85,braking:0.3333,traction:0.7333},SLAMVAN3:{id:28,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_VAPID,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:4,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"SLAMVAN",showStar:false,topSpeed:0.7243,acceleration:0.6125,braking:0.2,traction:0.5},FACTION3:{id:29,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_WILLARD,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_LOWRIDER2,gears:5,drive:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.DRIVE_REAR,colourways:true,unmodifiedName:"FACTION",showStar:false,crossLink:[29,19],customisedLabel:"LSC_CUSTOM_FACTION",topSpeed:0.7512,acceleration:0.7,braking:0.2667,traction:0.6818},ITALIGTB2:{id:30,brand:com
   .rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_PROGEN,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"ITALIGTB",showStar:false,topSpeed:0.8542,acceleration:0.85,braking:0.4,traction:0.8133},NERO2:{id:31,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_TRUFFADE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"NERO",showStar:false,topSpeed:0.8596,acceleration:0.8501,braking:0.3667,traction:0.8106},DIABLOUS2:{id:32,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_PRINCIPE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"DIABLOUS",showStar:false,topSpeed:0.7651,acceleration:0.8,braking:0.4167,traction:0.6061},FCR2:{id:33,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_PEGASSI,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM
   .TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"FCR",showStar:false,topSpeed:0.7522,acceleration:0.775,braking:0.4167,traction:0.6515},ELEGY:{id:34,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_ANNIS,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"ELEGY2",showStar:false,topSpeed:0.7941,acceleration:0.825,braking:0.3333,traction:0.8182},COMET3:{id:35,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_PFISTER,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"COMET2",showStar:false,topSpeed:0.8156,acceleration:0.85,braking:0.2667,traction:0.9005},SPECTER2:{id:36,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DEWBAUCH,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_IMPORT_EXPORT,colourways:true,unmodifiedName:"SPECTER",showStar:false,topSpeed:0.8327,acceleration:0.825,braking:0.3667,traction:0.8586},MANANA:{id:37,brand:com
   .rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_ALBANY,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUMMER2020,colourways:true,unmodifiedName:"MANANA",showStar:true,topSpeed:0.6975,acceleration:0.4,braking:0.0833,traction:0.5909},YOUGA2:{id:38,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_BRAVADO,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUMMER2020,colourways:true,unmodifiedName:"YOUGA",showStar:true,topSpeed:0.6439,acceleration:0.35,braking:0.1,traction:0.5455},GLENDALE:{id:39,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_BENEFAC,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUMMER2020,colourways:true,unmodifiedName:"GLENDALE",showStar:true,topSpeed:0.7887,acceleration:0.5875,braking:0.2167,traction:0.6212},GAUNTLET3:{id:40,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_BRAVADO,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM
   .TXD_SUMMER2020,colourways:true,unmodifiedName:"GAUNTLET",showStar:true,topSpeed:0.7619,acceleration:0.7,braking:0.3,traction:0.7576},YOSEMITE:{id:41,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_DECLASSE,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUMMER2020,colourways:true,unmodifiedName:"YOSEMITE",showStar:true,topSpeed:0.7351,acceleration:0.7125,braking:0.25,traction:0.7197},PEYOTE:{id:42,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_VAPID,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUMMER2020,colourways:true,unmodifiedName:"PEYOTE",showStar:true,topSpeed:0.6975,acceleration:0.4,braking:0.0833,traction:0.5606},WEEVIL:{id:43,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_BF,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUM2,colourways:true,unmodifiedName:"WEEVIL",showStar:true,topSpeed:0.7243,acceleration:0.47,braking:0.0867,traction:0.5394},SENTINEL3:{id:44,brand:com
   .rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_UBERMACH,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUM2,colourways:true,unmodifiedName:"SENTINEL3",showStar:true,topSpeed:0.7512,acceleration:0.6625,braking:0.2667,traction:0.6818},BRIOSO2:{id:45,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_GROTTI,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUM2,colourways:true,unmodifiedName:"BRIOSO2",showStar:true,topSpeed:0.617,acceleration:0.4475,braking:0.0833,traction:0.5712},TENF:{id:46,brand:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.BRAND_OBEY,txd:com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TXD_SUM2,colourways:true,unmodifiedName:"TENF",showStar:true,topSpeed:0.855,acceleration:0.8862,braking:0.3667,traction:1}};
   function WWW_BENNYSORIGINALMOTORWORKS_COM()
   {
      super();
      this._name = "WWW_BENNYSORIGINALMOTORWORKS_COM";
      this.defaultButtonOnColour = 16756736;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 16777215;
      this.sortButtonOnColour = 16777215;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 16777215;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = false;
      this.videoDisabled = false;
      this.DETAILS_PAGE = "DETAILS";
      this.PURCHASE_PAGE = "PURCHASE";
      com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOWROOM_PAGE = "SHOWROOM";
      com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.STOCK_PAGE = "STOCK";
      com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.FIND_US_PAGE = "FIND_D_US";
      this.TOOLBAR_LABEL = "LSC_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "LSC_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "LSC_PG1_BODY1";
      this.BUY_NOW_LABEL = "LSC_BUYNOW";
      this.SORT_PRICE_LABEL = "LSC_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "LSC_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "LSC_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "LSC_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "LSC_STATS_HEADER";
      this.FILTER_ALL_LABEL = "LSC_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "LSC_";
      this.DETAILS_PAGE_VEHICLE_BUTTON_OFFSET = 1090;
      this.VEHICLE_BUTTON_ROW_HEIGHT = 298;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.persistentYPosition = 0;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.displayConfig = this.browser.getConfig();
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["LSC_VEHICLES"];
         this.showroomVehicles = [this.vehicles.DIABLOUS2,this.vehicles.ELEGY];
         this.polaroidVehicles = [this.vehicles.VOODOO,this.vehicles.MOONBEAM2,this.vehicles.BUCCANEER2];
         this.vehicles = {LSC_VEHICLES:[this.vehicles.TENF,this.vehicles.WEEVIL,this.vehicles.SENTINEL3,this.vehicles.BRIOSO2,this.vehicles.GAUNTLET3,this.vehicles.YOUGA2,this.vehicles.GLENDALE,this.vehicles.YOSEMITE,this.vehicles.PEYOTE,this.vehicles.MANANA,this.vehicles.SPECTER2,this.vehicles.ITALIGTB2,this.vehicles.FCR2,this.vehicles.COMET3,this.vehicles.NERO2,this.vehicles.DIABLOUS2,this.vehicles.ELEGY,this.vehicles.FACTION2,this.vehicles.FACTION3,this.vehicles.SLAMVAN3,this.vehicles.MINIVAN2,this.vehicles.VIRGO2,this.vehicles.TORNADO5,this.vehicles.SABREGT2,this.vehicles.SULTAN2,this.vehicles.BANSHEE2,this.vehicles.CHINO2,this.vehicles.PRIMO2,this.vehicles.MOONBEAM2,this.vehicles.BUCCANEER2,this.vehicles.VOODOO]};
      }
      else
      {
         this.categoryOrder = ["LSC_VEHICLES"];
         this.showroomVehicles = [this.vehicles.CHINO2,this.vehicles.VOODOO];
         this.polaroidVehicles = [this.vehicles.VOODOO,this.vehicles.MOONBEAM2,this.vehicles.BUCCANEER2];
         this.vehicles = {LSC_VEHICLES:[this.vehicles.CHINO2]};
      }
   }
   function setCommonPageIDs()
   {
      this.PAGE_NAMES[1] = this.HOME_PAGE;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOWROOM_PAGE;
      this.PAGE_NAMES[3] = com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.STOCK_PAGE;
      this.PAGE_NAMES[4] = com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.FIND_US_PAGE;
      this.PAGE_NAMES[12] = this.PURCHASE_PAGE;
      this.PAGE_NAMES[13] = this.FAILED_PAGE;
      this.PAGE_NAMES[14] = this.ERROR_PAGE;
      this.PAGE_NAMES[25] = this.SUCCESS_PAGE;
      this.CAN_STORE_PAGE[12] = false;
      this.CAN_STORE_PAGE[13] = false;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[25] = false;
   }
   function DISABLE_VIDEO(videoDisabled)
   {
      if(com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOW_VIDEO)
      {
         this.videoDisabled = videoDisabled;
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      var _loc5_;
      var _loc2_;
      var _loc4_;
      if(success)
      {
         _loc5_ = parseInt(id.substring(id.lastIndexOf("_") + 1));
         _loc2_ = this.getVehicleFromId(_loc5_);
         _loc2_.txdLoaded = true;
         if(id.indexOf("showroom") != -1)
         {
            _loc4_ = id.substring(id.lastIndexOf("-") + 1);
            if(_loc4_ == "showroom")
            {
               this.displayImage(_loc2_,this.CONTENT.showroom);
            }
            else
            {
               this.displayImage(_loc2_,this.CONTENT.showroom[_loc4_]);
            }
         }
         if(id.indexOf("photo") != -1)
         {
            _loc4_ = id.substring(id.lastIndexOf("-") + 1);
            this.displayImage(_loc2_,this.CONTENT.home[_loc4_]);
         }
         else if(this.vehicleMCs[_loc2_.id])
         {
            this.displayImage(_loc2_,this.vehicleMCs[_loc2_.id]);
         }
         if(_loc2_ == this.currentVehicle)
         {
            this.displayImage(_loc2_,this.CONTENT.details || this.CONTENT.purchase);
         }
      }
   }
   function SET_PRICES(id, price, secondaryPrice, reductionType, salePrice, secondarySalePrice, award)
   {
      super.SET_PRICES(id,price,secondaryPrice,reductionType,salePrice,secondaryPrice,award);
      var _loc3_ = this.getVehicleFromId(id);
      var _loc4_;
      if(_loc3_ && _loc3_.crossLink)
      {
         if(_loc3_.crossLink[0] != id)
         {
            _loc4_ = this.getVehicleFromId(_loc3_.crossLink[0]);
         }
         else
         {
            _loc4_ = this.getVehicleFromId(_loc3_.crossLink[1]);
         }
         if(_loc4_)
         {
            if(price != _loc4_.price)
            {
               _loc4_.secondaryPrice = price;
               _loc3_.secondaryPrice = _loc4_.price;
            }
         }
      }
      if(_loc3_.showStar && _loc3_.price != -1 && this.CONTENT.home)
      {
         this.initTopMenu(this.CONTENT.home,"home");
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = this.persistentYPosition;
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
         for(var _loc7_ in this.vehicles)
         {
            _loc3_ = this.vehicles[_loc7_];
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
         case com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOWROOM_PAGE:
            this.initShowroomPage(newPage);
            break;
         case com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.STOCK_PAGE:
            this.initStockPage(newPage);
            break;
         case com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.FIND_US_PAGE:
            this.initFindUsPage(newPage);
            break;
         case this.DETAILS_PAGE:
            this.initDetailsPage(_loc8_,newPage);
            break;
         case this.PURCHASE_PAGE:
            this.initPurchasePage(newPage);
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
   function goToAnchor(link)
   {
      if(link.indexOf("crossLinkButton") != -1)
      {
         this.persistentYPosition = this.CONTENT._y;
      }
      else
      {
         this.persistentYPosition = 0;
      }
      var _loc4_;
      if(link.indexOf("showroomCarButton") == 0)
      {
         _loc4_ = parseInt(link.substring(17));
         link = "showroomCarButton";
      }
      else if(link.indexOf("showroomThumbnailButton") == 0)
      {
         _loc4_ = parseInt(link.substring(23));
         link = "showroomThumbnailButton";
      }
      switch(link)
      {
         case "homeButton":
            this.browser.GO_TO_WEBPAGE(this._name);
            break;
         case "showroomButton":
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOWROOM_PAGE);
            break;
         case "stockButton":
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.STOCK_PAGE);
            break;
         case "findUsButton":
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.FIND_US_PAGE);
            break;
         default:
            super.goToAnchor(link);
            break;
         case "vehicleWipe":
            this.playWipeAnimation();
            break;
         case "showroomCarButton":
            this.setShowroomCar(_loc4_);
            break;
         case "showroomThumbnailButton":
            this.setShowroomImage(_loc4_);
         case "setWaypointButton":
            return;
      }
   }
   function initHomePage(newPage)
   {
      var _loc2_ = this.CONTENT.home;
      if(!this.currentPageInitialised)
      {
         _loc2_.topMenu.homeButton._visible = false;
         _loc2_.topMenu.showroomButton._visible = false;
         _loc2_.topMenu.stockButton._visible = false;
         _loc2_.topMenu.findUsButton._visible = false;
      }
      if(this.browser.player != 1)
      {
         this.CONTENT.gotoAndStop("MAINTENANCE");
         _loc2_ = this.CONTENT.maintenance;
         this.setLocalisedText(_loc2_.ucTitle,"LSC_MAINTENANCE_TITLE",true);
         this.CONTENT.BOUNDING_BOX._height = _loc2_.background._height = _loc2_.footer._y + _loc2_.footer._height;
         this.browser.RESIZE_WEBSITE();
         return undefined;
      }
      if(!com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.SHOW_VIDEO)
      {
         _loc2_.videoButton.disabled = true;
         _loc2_.videoButton._visible = false;
         _loc2_.noVideo._visible = false;
      }
      if(newPage && this.currentPageInitialised)
      {
         return undefined;
      }
      var _loc3_;
      var _loc4_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         if(this.videoDisabled)
         {
            _loc2_.videoButton._y = -500;
            _loc2_.noVideo.verticalAlign = "center";
            this.setLocalisedText(_loc2_.noVideo.message,"LSC_NO_VIDEO",true);
         }
         else
         {
            this.setLocalisedText(_loc2_.videoButton.btnTxt,"LSC_WATCH_VIDEO",true);
            this.dataTextScope.push(_loc2_.videoButton.btnTxt);
            _loc2_.videoButton.btnTxt.textAutoSize = "shrink";
         }
         this.initTopMenu(_loc2_,"home");
         _loc3_ = 0;
         _loc4_ = this.polaroidVehicles.length;
         while(_loc3_ < _loc4_)
         {
            this.addHomePageImage(this.polaroidVehicles[_loc3_],_loc2_["photo" + _loc3_]);
            _loc3_ = _loc3_ + 1;
         }
         this.initHomeButton(_loc2_.showroomButton,"LSC_SHOWROOM","LSC_SHOWROOM_DESCRIPTION");
         this.initHomeButton(_loc2_.stockButton,"LSC_STOCK","LSC_STOCK_DESCRIPTION");
         this.initHomeButton(_loc2_.findUsButton,"LSC_FIND_US","LSC_FIND_US_DESCRIPTION");
         if(_loc2_.showroomButton._x + _loc2_.showroomButton._width > 494)
         {
            _loc2_.showroomButton._x = 494 - _loc2_.showroomButton._width;
         }
         if(_loc2_.showroomButton._y + _loc2_.showroomButton._height > _loc2_.car._y)
         {
            _loc2_.car._y = _loc2_.showroomButton._y + _loc2_.showroomButton._height + 20;
         }
         if(_loc2_.findUsButton._y + _loc2_.findUsButton._height > _loc2_.map._y)
         {
            _loc2_.map._y = _loc2_.findUsButton._y + _loc2_.findUsButton._height + 20;
         }
         if(_loc2_.footer._y - (_loc2_.stockButton._y + _loc2_.stockButton._height) < -52)
         {
            _loc2_.footer._y = _loc2_.stockButton._y + _loc2_.stockButton._height - 52;
         }
         if(_loc2_.footer._y - _loc2_.map._y < 40)
         {
            _loc2_.footer._y = _loc2_.map._y + 40;
         }
      }
      if(this.pricesSet && !this.currentPageInitialised)
      {
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
         _loc2_.topMenu.homeButton._visible = true;
         _loc2_.topMenu.showroomButton._visible = true;
         _loc2_.topMenu.stockButton._visible = true;
         _loc2_.topMenu.findUsButton._visible = true;
         this.currentPageInitialised = true;
      }
      this.CONTENT.BOUNDING_BOX._height = _loc2_.background._height = _loc2_.footer._y + _loc2_.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function initHomeButton(button, titleLabel, descriptionLabel)
   {
      button.btnTxt.autoSize = "left";
      button.description.autoSize = "left";
      this.setLocalisedText(button.btnTxt,titleLabel,true);
      this.setLocalisedText(button.description,descriptionLabel,false);
      button.arrow._x = button.btnTxt._x + button.btnTxt._width;
      this.dataTextScope.push(button.btnTxt);
   }
   function addHomePageImage(vehicle, container)
   {
      var _loc3_;
      if(vehicle.txdLoaded)
      {
         this.displayImage(vehicle,container);
      }
      else
      {
         _loc3_ = this.DETAILS_PAGE + "_" + vehicle.id + "-" + container._name;
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",vehicle.txd,_loc3_,true);
         vehicle.txdRequested = true;
      }
   }
   function initShowroomPage(newPage)
   {
      var _loc3_ = this.CONTENT.showroom;
      var _loc2_;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.vehicleMCs.length = 0;
         this.initTopMenu(_loc3_,"showroom");
         _loc2_ = 0;
         while(_loc2_ < this.showroomVehicles.length)
         {
            this.addVehicleImage(this.showroomVehicles[_loc2_],_loc3_["showroomCarButton" + _loc2_]);
            this.vehicleMCs[this.showroomVehicles[_loc2_].id] = _loc3_["showroomCarButton" + _loc2_];
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.NUM_SHOWROOM_THUMBNAILS)
         {
            this.dataTextScope.push(_loc3_["showroomThumbnailButton" + _loc2_].btnTxt);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.NUM_SHOWROOM_CARS)
         {
            this.dataTextScope.push(_loc3_["showroomCarButton" + _loc2_].btnTxt);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_.label.textAutoSize = "shrink";
         this.setLocalisedText(_loc3_.label,"LSC_FEATURE_CAR",true);
         this.setLocalisedText(_loc3_.title,"LSC_PROJECT_CARS",true);
         this.setShowroomCar(0);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
      this.CONTENT.BOUNDING_BOX._height = _loc3_.background._height = _loc3_.footer._y + _loc3_.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function setShowroomCar(index)
   {
      this.currentVehicle = this.showroomVehicles[index];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.NUM_SHOWROOM_THUMBNAILS)
      {
         this.addShowroomImage(this.currentVehicle,this.CONTENT.showroom["showroomThumbnailButton" + _loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.setShowroomImage(0);
   }
   function setShowroomImage(index)
   {
      this.currentShowroomImage = index;
      this.addShowroomImage(this.currentVehicle,this.CONTENT.showroom);
   }
   function addShowroomImage(vehicle, container)
   {
      var _loc3_;
      if(vehicle.txdLoaded)
      {
         this.displayImage(vehicle,container);
      }
      else
      {
         _loc3_ = this.DETAILS_PAGE + "_" + vehicle.id + "-" + container._name;
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",vehicle.txd,_loc3_,true);
         vehicle.txdRequested = true;
      }
   }
   function initStockPage(newPage)
   {
      var _loc2_ = this.CONTENT.stock;
      this.initTopMenu(_loc2_,"stock");
      if(!this.currentPageInitialised)
      {
         this.initVehicleButtons(_loc2_,com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.STOCK_PAGE_VEHICLE_BUTTON_OFFSET);
         this.initSortingButtons(_loc2_);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
      this.CONTENT.BOUNDING_BOX._height = _loc2_.background._height = _loc2_.footer._y + _loc2_.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function playWipeAnimation()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.details);
      this.CONTENT.details.vehicleWipe.animation.play();
      this.CONTENT.details.vehicleWipe.mask.play();
   }
   function initFindUsPage(newPage)
   {
      var _loc2_ = this.CONTENT.findUs;
      if(newPage)
      {
         this.dataTextScope.length = 0;
         this.initTopMenu(_loc2_,"findUs");
      }
      _loc2_.title.autoSize = "left";
      this.setLocalisedText(_loc2_.title,"LSC_FIND_US",true);
      _loc2_.address.autoSize = "left";
      this.setLocalisedText(_loc2_.address,"LSC_ADDRESS",false);
      _loc2_.setWaypointButton.btnTxt.textAutoSize = "shrink";
      _loc2_.setWaypointButton.onColour = this.defaultButtonOnColour;
      _loc2_.setWaypointButton.offColour = 1532072;
      this.setLocalisedText(_loc2_.setWaypointButton.btnTxt,"LSC_SET_WAYPOINT",true);
      if(newPage)
      {
         this.dataTextScope.push(_loc2_.setWaypointButton.btnTxt);
      }
      _loc2_.address._y = _loc2_.setWaypointButton._y - _loc2_.address._height - 20;
      _loc2_.title._y = _loc2_.address._y - 40;
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
      this.CONTENT.BOUNDING_BOX._height = _loc2_.background._height = _loc2_.footer._y + _loc2_.footer._height;
      this.browser.RESIZE_WEBSITE();
   }
   function initDetailsPage(pageName, newPage)
   {
      var _loc2_ = this.CONTENT.details;
      var _loc3_ = false;
      var _loc4_;
      var _loc5_;
      if(this.currentVehicle.crossLink)
      {
         _loc4_ = this.getVehicleFromId(this.currentVehicle.crossLink[0]);
         _loc5_ = this.getVehicleFromId(this.currentVehicle.crossLink[1]);
         _loc3_ = _loc4_.price >= 0 && _loc5_.price >= 0;
      }
      if(_loc3_)
      {
         _loc2_.gotoAndStop("crossLink");
      }
      this.dataTextScope.length = 0;
      this.priceSortDirection = -1;
      this.currentFilter = this.FILTER_ALL_LABEL;
      this.selectedOption = -1;
      var _loc6_ = parseInt(pageName.substr(this.DETAILS_PAGE.length));
      this.currentVehicle = this.getVehicleFromId(_loc6_);
      this.initTopMenu(_loc2_,"stock");
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
      this.addVehicleImage(this.currentVehicle,_loc2_.vehicleWipe);
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
      var _loc7_ = this.initOptions(_loc2_) || 1;
      this.initStats(_loc2_);
      this.initPurchaseButtons(_loc2_,_loc7_,_loc2_.line2._width);
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
      if(_loc3_)
      {
         this.setLocalisedText(_loc2_.crossLinkHeaderText,this.DESCRIPTION_LABEL_PREFIX + "SELECT_STYLE");
         this.setLocalisedText(_loc2_.crossLinkText0,_loc4_.name);
         _loc2_.crossLinkButton_0.disabled = this.currentVehicle.crossLink[0] == this.currentVehicle.id;
         _loc2_.crossLinkButton_0.selected._visible = this.currentVehicle.crossLink[0] == this.currentVehicle.id;
         this.dataTextScope.push(_loc2_.crossLinkButton_0.btnTxt);
         this.setLocalisedText(_loc2_.crossLinkText1,_loc5_.name);
         _loc2_.crossLinkButton_1.disabled = this.currentVehicle.crossLink[1] == this.currentVehicle.id;
         _loc2_.crossLinkButton_1.selected._visible = this.currentVehicle.crossLink[1] == this.currentVehicle.id;
         this.dataTextScope.push(_loc2_.crossLinkButton_1.btnTxt);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.currentPageInitialised = true;
      if(this.currentVehicle.livery)
      {
         this.setOptionsButtons(0);
      }
   }
   function initPurchaseButtons(page, numOptions, maxWidth)
   {
      var _loc2_;
      var _loc7_;
      var _loc3_ = numOptions - 1;
      var _loc6_;
      while(_loc3_ >= 0)
      {
         _loc2_ = page.purchaseButton.duplicateMovieClip(this.PURCHASE_PAGE + "_" + (_loc3_ + 1),page.getNextHighestDepth(),{_x:page.purchaseButton._x,_y:page.purchaseButton._y});
         _loc2_._visible = _loc3_ == 0;
         _loc2_.disabled = numOptions > 1;
         _loc2_._alpha = numOptions <= 1 ? 100 : 50;
         _loc2_.btnTxt.autoSize = "left";
         _loc2_.btnTxt.htmlText = this.setLocalisedText(_loc2_.label,this.BUY_NOW_LABEL);
         _loc2_.label.autoSize = "left";
         _loc6_ = !(this.currentVehicle.reduction == 3 && this.currentVehicle.salePrice) ? this.currentVehicle.price : this.currentVehicle.salePrice;
         _loc2_.label.htmlText = this.setLocalisedText(_loc2_.label,this.BUY_NOW_LABEL) + " <font color=\'#FFFFFF\'>" + this.formatPrice(_loc6_) + "</font>";
         _loc2_.arrow._x = _loc2_.label._width + 10;
         _loc2_.onColour = 16777215;
         _loc2_.offColour = this.defaultButtonOnColour;
         if(_loc2_._width > maxWidth)
         {
            _loc2_._xscale = _loc2_._yscale = 100 * maxWidth / _loc2_._width;
         }
         _loc7_ = _loc2_.btnTxt;
         this.dataTextScope.unshift(_loc7_);
         _loc3_ = _loc3_ - 1;
      }
      page.purchaseButton._visible = false;
   }
   function initStats(page)
   {
      page.nameText.text = this.setLocalisedText(page.nameText,this.currentVehicle.brand,true) + " " + this.setLocalisedText(page.nameText,this.currentVehicle.unmodifiedName,true);
      if(this.currentVehicle.price != 0)
      {
         page.priceText.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(this.currentVehicle.price) : this.currentVehicle.price;
      }
      page.customisedLabel.verticalAlign = "center";
      page.customisedLabel.textAutoSize = "shrink";
      if(this.currentVehicle.customisedLabel)
      {
         this.setLocalisedText(page.customisedLabel,this.currentVehicle.customisedLabel,true);
      }
      else
      {
         this.setLocalisedText(page.customisedLabel,"LSC_CUSTOMISED_VEHICLE",true);
      }
      page.vehicleWipe.stockLabel.textAutoSize = "shrink";
      this.setLocalisedText(page.vehicleWipe.stockLabel,"LSC_STOCK_VEHICLE",true);
      page.optionsHeaderText.textAutoSize = "shrink";
      this.setLocalisedText(page.optionsHeaderText,"LGM_COLOUR");
      this.dataTextScope.push(page.vehicleWipe.btnTxt);
      page.descriptionText.autoSize = "left";
      this.setLocalisedText(page.descriptionText,this.DESCRIPTION_LABEL_PREFIX + this.currentVehicle.name,false);
      page.instructionsText.autoSize = "center";
      this.setLocalisedText(page.instructionsText,"LSC_INSTRUCTIONS");
      this.setLocalisedText(page.statsHeaderText,this.STATS_HEADER_LABEL);
      this.setStatLine(page.stats.topSpeedLabel,"WEB_VEHICLE_TOP_SPEED",page.stats.topSpeed,this.currentVehicle.topSpeed);
      this.setStatLine(page.stats.accelerationLabel,"WEB_VEHICLE_ACCELERATION",page.stats.acceleration,this.currentVehicle.acceleration);
      this.setStatLine(page.stats.brakingLabel,"WEB_VEHICLE_BRAKING",page.stats.braking,this.currentVehicle.braking);
      this.setStatLine(page.stats.tractionLabel,"WEB_VEHICLE_TRACTION",page.stats.traction,this.currentVehicle.traction);
      page.statsHeaderText._y = page.descriptionText._y + page.descriptionText._height + 20;
      page.stats._y = page.statsHeaderText._y + page.statsHeaderText._height + 7;
      page.line3._y = Math.max(1090,Math.max(page.stats._y + page.stats._height + 20,page.instructionsText._y + page.instructionsText._height + 20));
      page.subHeader._y = page.line3._y + 6;
      this.initVehicleButtons(page,page.subHeader._y + 70);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(page,2,{onComplete:this.playWipeAnimation,onCompleteScope:this});
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
   function initPurchasePage(newPage)
   {
      var _loc3_ = this.CONTENT.purchase;
      this.dataTextScope.length = 0;
      super.initPurchasePage();
      _loc3_ = this.CONTENT.purchase;
      _loc3_.nameText.text = _loc3_.nameText.text.toUpperCase();
   }
   function initOutcomePage(headerText, bodyText, soldLabel)
   {
      if(headerText == undefined)
      {
         headerText = "";
      }
      if(bodyText == undefined)
      {
         bodyText = "";
      }
      if(soldLabel == undefined)
      {
         soldLabel = "";
      }
      var _loc2_ = this.CONTENT.purchase;
      this.dataTextScope.length = 0;
      _loc2_.nameText.text = this.setLocalisedText(_loc2_.nameText,this.currentVehicle.brand,true) + " " + this.setLocalisedText(_loc2_.nameText,this.currentVehicle.unmodifiedName,true);
      _loc2_.priceText.text = !isNaN(this.currentVehicle.price) ? this.formatPrice(this.currentVehicle.price) : this.currentVehicle.price;
      if(this.currentVehicle.reduction == 3)
      {
         _loc2_.reductionLine._width = _loc2_.priceText.textWidth + 5;
         _loc2_.reducedPriceText._x = _loc2_.priceText._x - _loc2_.priceText.textWidth - 20;
         _loc2_.reducedPriceText.text = !isNaN(this.currentVehicle.salePrice) ? this.formatPrice(this.currentVehicle.salePrice) : this.currentVehicle.salePrice;
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
      this.initTopMenu(_loc2_,"purchase");
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function initTopMenu(page, selected)
   {
      var _loc7_ = [];
      var _loc6_ = false;
      var _loc3_;
      var _loc2_;
      var _loc4_;
      for(var _loc9_ in this.vehicles)
      {
         _loc3_ = this.vehicles[_loc9_];
         _loc2_ = 0;
         _loc4_ = _loc3_.length;
         while(_loc2_ < _loc4_)
         {
            if(_loc3_[_loc2_].showStar && _loc3_[_loc2_].price != -1)
            {
               _loc6_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.initMenuButton(page.topMenu.homeButton,"LSC_HOME",selected == "home",_loc7_,false);
      this.initMenuButton(page.topMenu.showroomButton,"LSC_SHOWROOM",selected == "showroom",_loc7_,false);
      this.initMenuButton(page.topMenu.stockButton,"LSC_STOCK",selected == "stock",_loc7_,_loc6_);
      this.initMenuButton(page.topMenu.findUsButton,"LSC_FIND_US",selected == "findUs",_loc7_,false);
      _loc7_.sort(Array.NUMERIC | Array.DESCENDING);
      var _loc8_;
      if(this.displayConfig.isAsian == 1 && !this.displayConfig.isWideScreen)
      {
         _loc8_ = Math.min(100,100 * com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TOP_NAV_TEXT_WIDTH_ASIAN / _loc7_[0]);
      }
      else
      {
         _loc8_ = Math.min(100,100 * com.rockstargames.gtav.web.WWW_BENNYSORIGINALMOTORWORKS_COM.TOP_NAV_TEXT_WIDTH / _loc7_[0]);
      }
      page.topMenu.homeButton._xscale = page.topMenu.homeButton._yscale = _loc8_;
      page.topMenu.showroomButton._xscale = page.topMenu.showroomButton._yscale = _loc8_;
      page.topMenu.stockButton._xscale = page.topMenu.stockButton._yscale = _loc8_;
      page.topMenu.findUsButton._xscale = page.topMenu.findUsButton._yscale = _loc8_;
      var _loc11_ = 200;
      var _loc10_ = !(this.displayConfig.isAsian == 1 && !this.displayConfig.isWideScreen) ? 20 : 0;
      page.topMenu.showroomButton._x = - _loc11_ - 0.5 * page.topMenu.showroomButton._width;
      page.topMenu.homeButton._x = page.topMenu.showroomButton._x - _loc10_ - 0.5 * (page.topMenu.showroomButton._width + page.topMenu.homeButton._width);
      page.topMenu.stockButton._x = _loc11_ + 0.5 * page.topMenu.stockButton._width;
      page.topMenu.findUsButton._x = page.topMenu.stockButton._x + _loc10_ + 0.5 * (page.topMenu.stockButton._width + page.topMenu.findUsButton._width);
   }
   function initMenuButton(button, label, isSelected, widths, showStar)
   {
      button.btnTxt.autoSize = "center";
      this.setLocalisedText(button.btnTxt,label,true);
      if(isSelected)
      {
         button.gotoAndStop("SELECT");
         button.btnTxt.textColor = this.defaultButtonOnColour;
      }
      else
      {
         this.dataTextScope.push(button.btnTxt);
      }
      button.star._visible = showStar;
      button.star._x = 0.5 * button.btnTxt.textWidth;
      widths.push(button.btnTxt._width);
   }
   function displayImage(vehicle, container)
   {
      var _loc6_ = container.vehicleImage._width - 4;
      var _loc5_ = container.vehicleImage._height - 4;
      var _loc3_ = vehicle.name;
      if(vehicle.livery && container._parent == this.CONTENT)
      {
         _loc3_ += "_" + vehicle.livery[Math.max(0,this.selectedOption)];
      }
      if(container._name == "vehicleWipe" || container._name.indexOf("purchase") != -1)
      {
         _loc3_ += "_A";
      }
      else if(container._name.indexOf("showroomCarButton") == 0)
      {
         _loc3_ += "_S";
      }
      else if(container._name == "showroom")
      {
         _loc3_ += "_" + this.currentShowroomImage;
      }
      else if(container._name.indexOf("showroomThumbnailButton") == 0)
      {
         _loc3_ += "_T" + container._name.substring(23);
      }
      else if(this.USE_SEPARATE_DETAIL_IMAGES && this.currentPage != this.HOME_PAGE && container._parent == this.CONTENT)
      {
         _loc3_ += "_" + this.DETAILS_PAGE_IMAGE_SUFFIX;
      }
      container.vehicleImage.htmlText = "<img src=\'img://" + vehicle.txd + "/" + _loc3_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc6_ + "\' height=\'" + _loc5_ + "\'/>";
   }
   function initVehicleButtons(page, yOffset)
   {
      var _loc12_ = page.getNextHighestDepth();
      super.initVehicleButtons(page,yOffset);
      var _loc3_ = 0;
      var _loc6_;
      var _loc5_;
      var _loc4_;
      for(var _loc14_ in this.vehicleMCs)
      {
         _loc6_ = this.VEHICLE_BUTTON_COLUMNS[_loc3_ % this.NUM_VEHICLE_BUTTON_COLUMNS];
         _loc5_ = this.VEHICLE_BUTTON_ROW_HEIGHT * int(_loc3_ / this.NUM_VEHICLE_BUTTON_COLUMNS) + yOffset;
         _loc4_ = page.attachMovie("polaroidShadow","polaroidShadow" + _loc3_,page.getNextHighestDepth(),{_x:_loc6_,_y:_loc5_});
         _loc4_.swapDepths(_loc12_++);
         _loc4_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,this.SORT_FADE_IN_DURATION,{_alpha:100,delay:this.SORT_FADE_IN_DELAY * _loc3_});
         _loc3_ = _loc3_ + 1;
      }
   }
   function initVehicleButton(vehicle, container, x, y)
   {
      var _loc4_ = this.DETAILS_PAGE + "_" + vehicle.id;
      var _loc2_ = container.attachMovie("vehicleButton",_loc4_,container.getNextHighestDepth());
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.btnTxt.text = this.setLocalisedText(_loc2_.btnTxt,vehicle.brand,true) + (_loc2_.btnTxt.text.length <= 0 ? "" : " ") + this.setLocalisedText(_loc2_.btnTxt,vehicle.unmodifiedName,true);
      _loc2_.star._visible = vehicle.showStar;
      _loc2_.onColour = 0;
      _loc2_.offColour = 0;
      _loc2_.btnTxt._alpha = 30;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_.btnTxt,6);
      if(vehicle.price == 0)
      {
         _loc2_.outOfStock.outOfStockText.textAutoSize = "shrink";
         _loc2_.outOfStock.outOfStockText.autoSize = "center";
         this.setLocalisedText(_loc2_.outOfStock.outOfStockText,"WEB_OUTOFSTOCK",this.favourUpperCase);
         _loc2_.btnTxt.textColor = 0;
      }
      else
      {
         _loc2_.outOfStock._visible = false;
         _loc2_.priceText.text = !isNaN(vehicle.price) ? this.formatPrice(vehicle.price) : vehicle.price;
         if(vehicle.secondaryPrice && vehicle.secondaryPrice != -1 && vehicle.reduction != 3)
         {
            if(vehicle.price != vehicle.secondaryPrice)
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
               _loc2_.promo.line._width = _loc2_.priceText.textWidth + 10;
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
         this.setLocalisedText(_loc2_.header.dlcText,vehicle.dlc,true);
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
   function initOptions(page)
   {
      var _loc8_ = super.initOptions(page);
      var _loc3_ = 0;
      var _loc4_;
      var _loc6_;
      var _loc7_;
      var _loc5_;
      while(_loc3_ < _loc8_)
      {
         _loc4_ = page.options["swatch" + _loc3_];
         _loc4_._rotation = Math.random() * 360;
         if(this.currentVehicle.swatches)
         {
            _loc6_ = this.currentVehicle.swatches[_loc3_] >> 16 & 0xFF;
            _loc7_ = this.currentVehicle.swatches[_loc3_] >> 8 & 0xFF;
            _loc5_ = this.currentVehicle.swatches[_loc3_] & 0xFF;
            com.rockstargames.ui.utils.Colour.Colourise(_loc4_,_loc6_,_loc7_,_loc5_,100);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc4_,this.VEHICLE_COLOURS[_loc3_][0],this.VEHICLE_COLOURS[_loc3_][1],this.VEHICLE_COLOURS[_loc3_][2],100);
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc8_;
   }
   function updateBackground(contentItem, page)
   {
      if(contentItem == undefined)
      {
         return undefined;
      }
      var _loc3_ = Math.max(contentItem._y + 146,720);
      page.footer._y = _loc3_;
      this.CONTENT.BOUNDING_BOX._height = page.background._height = _loc3_ + page.footer._height;
      this.browser.RESIZE_WEBSITE();
      page.panel._height = page.background._height - page.panel._y - page.footer._height;
   }
}
