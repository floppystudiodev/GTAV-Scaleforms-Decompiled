class com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT extends com.rockstargames.gtav.web.vehicleSites.VehicleWebsite
{
   var BUY_NOW_LABEL;
   var DESCRIPTION_HEADER_LABEL;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_IMAGE_SUFFIX;
   var FILTER_ALL_LABEL;
   var HOME_PAGE_BODY_LABEL;
   var HOME_PAGE_HEADER_LABEL;
   var LIVERY_HEADER_LABEL;
   var PURCHASE_PAGE;
   var SORT_NEW_IN_LABEL;
   var SORT_PRICE_LABEL;
   var STATS_HEADER_LABEL;
   var TOOLBAR_LABEL;
   var USE_SEPARATE_DETAIL_IMAGES;
   var VEHICLE_BUTTON_ROW_HEIGHT;
   var _name;
   var browser;
   var currentPage;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var dropDownButtonOffColour;
   var dropDownButtonOnColour;
   var favourUpperCase;
   var imageManager;
   var isModifying;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var sortButtonOffColour;
   var sortButtonOnColour;
   var yachtColour;
   var yachtFittings;
   var yachtFlag;
   var yachtLighting;
   var yachtModel;
   var yachtName;
   static var YACHT_HOME_PAGE = "YACHT";
   static var YACHT_MODEL_PAGE = "YACHT_D_MODEL";
   static var YACHT_FITTINGS_PAGE = "YACHT_D_FITTINGS";
   static var YACHT_COLOUR_PAGE = "YACHT_D_COLOR";
   static var YACHT_LIGHTING_PAGE = "YACHT_D_LIGHTING";
   static var YACHT_PERSONALISE_PAGE = "YACHT_D_PERSONALIZE";
   static var YACHT_CHECKOUT_PAGE = "YACHT_D_CHECKOUT";
   static var YACHT_PURCHASE_PAGE = "YACHT_D_PURCHASE";
   static var YACHT_PURCHASE_SUCCESS_PAGE = "YACHT_D_PURCHASE_SUCCESS";
   static var YACHT_PURCHASE_FAILED_PAGE = "YACHT_D_PURCHASE_FAILED";
   static var DATA_COLOUR = 0;
   static var DATA_LIGHTING = 1;
   static var DATA_FLAG = 2;
   static var DATA_MODEL = 3;
   static var DATA_FITTINGS = 4;
   static var DATA_NAME = 5;
   static var DATA_NEW_NAME = 6;
   static var DATA_BASE_COST = 7;
   static var DATA_MODEL_COST = [8,9,10];
   static var DATA_FITTINGS_COST = [11,12];
   static var DATA_LIGHTING_COST = [13,14,15,16,17,18,19,20];
   static var DATA_COLOUR_COST = [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
   static var DATA_FLAG_COST = 41;
   static var DATA_NAME_COST = 42;
   static var DATA_MODEL_SALE_COST = [43,44,45];
   static var DATA_FITTINGS_SALE_COST = [46,47];
   static var DATA_LIGHTING_SALE_COST = [48,49,50,51,52,53,54,55];
   static var DATA_COLOUR_SALE_COST = [56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71];
   static var DATA_FLAG_SALE_COST = 72;
   static var DATA_NAME_SALE_COST = 73;
   static var DATA_REBATE_HOMEPAGE = 74;
   static var DATA_REBATE_MODEL = 75;
   static var DATA_REBATE_FITTINGS = 76;
   static var DATA_REBATE_LIGHTING = 77;
   static var DATA_REBATE_COLOUR = 78;
   static var DATA_REBATE_FLAG = 79;
   static var BANNER_IMAGE = "YACHT_BANNER_";
   static var HOMEPAGE_IMAGE = "YACHT_SLIDE_";
   static var MODEL_IMAGE = "YACHT_MODEL_";
   static var FITTINGS_IMAGE = "YACHT_FITTING_";
   static var COLOUR_IMAGE = "YACHT_COLOUR_";
   static var LIGHTING_IMAGE = "YACHT_LIGHTING_";
   static var FLAG_IMAGE = "YACHT_FLAG_";
   static var BACKGROUNDS_TXD = "DOCK_YACHT_BACKGROUNDS";
   static var BANNER_PAUSE_DURATION = 1.5;
   static var BANNER_FADE_DURATION = 1;
   static var BRAND_NONE = "";
   static var BRAND_LAMPADATI = "LAMPADATI";
   static var TXD_DEFAULT = "DOCK_DEFAULT";
   static var TXD_APARTMENTS = "DOCK_DLC_APARTMENTS";
   static var TXD_EXECUTIVE1 = "DOCK_DLC_EXECUTIVE1";
   static var TXD_HEIST4 = "DOCK_DLC_HEIST4";
   static var DLC_BEACH_BUM = "DOCK_BEACHBUM";
   static var DLC_HEIST = "WEB_HEISTPACK";
   static var DLC_LUXE = "WEB_LUXEPACK";
   static var DLC_LUXE_2 = "WEB_LUXEPACK2";
   static var DLC_APARTMENTS = "WEB_APARTMENTS";
   static var DLC_EXECUTIVE1 = "WEB_EXECUTIVE1PACK";
   static var DLC_HEIST4 = "WEB_HEIST4PACK";
   var vehicles = {MARQUIS:{id:3,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:4},JETMAX:{id:4,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:2},SPEEDER:{id:5,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,dlc:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_BEACH_BUM,seats:4},SQUALO:{id:6,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:2},SUNTRAP:{id:7,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:4},TROPIC:{id:8,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT
   .TXD_DEFAULT,seats:4},SEASHARK:{id:9,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:2},DINGHY3:{id:11,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,dlc:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_HEIST,seats:4,buyItNow:true},TORO:{id:14,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_LAMPADATI,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,dlc:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_LUXE_2,seats:4},SUB2:{id:17,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_DEFAULT,seats:1,desc:"BOATS_DLCSUB2"},TUG:{id:29,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_EXECUTIVE1,dlc:com.rockstargames
   .gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_EXECUTIVE1,seats:1},LONGFIN:{id:30,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_HEIST4,dlc:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_HEIST4,seats:4,buyItNow:true}};
   var customVehicles = {YACHT:{id:18,brand:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.TXD_APARTMENTS,dlc:com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.DLC_APARTMENTS,numColours:16,numFlags:46,numLightingOptions:8,models:["BOAT_YACHT_MODEL_0","BOAT_YACHT_MODEL_1","BOAT_YACHT_MODEL_2"],fittings:["BOAT_YACHT_FITTINGS_CHROME","BOAT_YACHT_FITTINGS_GOLD"],fonts:["BOAT_YACHT_FONT_1","BOAT_YACHT_FONT_2","BOAT_YACHT_FONT_3","BOAT_YACHT_FONT_4"]}};
   function WWW_DOCKTEASE_COM_PARENT()
   {
      super();
      this._name = "WWW_DOCKTEASE_COM";
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 26316;
      this.sortButtonOnColour = 16777215;
      this.sortButtonOffColour = 26316;
      this.dropDownButtonOnColour = 16777215;
      this.dropDownButtonOffColour = 26316;
      this.favourUpperCase = false;
      this.DETAILS_PAGE = "DETAILS";
      this.PURCHASE_PAGE = "PURCHASE";
      this.TOOLBAR_LABEL = "BOATS_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "BOATS_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "BOATS_PG1_BODY1";
      this.BUY_NOW_LABEL = "BOATS_BUYNOW";
      this.SORT_PRICE_LABEL = "BOATS_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "BOATS_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "BOATS_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "BOATS_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "BOATS_STATS_HEADER";
      this.FILTER_ALL_LABEL = "BOATS_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "BOATS_";
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
      this.imageManager = new com.rockstargames.gtav.web.YachtImageManager();
      this.yachtColour = -1;
      this.yachtLighting = -1;
      this.yachtFlag = -1;
      this.yachtModel = -1;
      this.yachtFittings = -1;
      this.yachtName = "";
   }
   function handleLB()
   {
      switch(this.currentPage)
      {
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_MODEL_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_CHECKOUT_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE);
         default:
            return;
      }
   }
   function handleRB()
   {
      switch(this.currentPage)
      {
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_MODEL_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_FITTINGS_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_LIGHTING_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_COLOUR_PAGE:
            this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE);
            break;
         case com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_PERSONALISE_PAGE:
            if(this.isModifying)
            {
               if(this.yachtColour + this.yachtLighting + this.yachtFlag + this.yachtModel + this.yachtFittings != -5 || this.yachtName != "")
               {
                  this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_CHECKOUT_PAGE);
               }
            }
            else if(this.yachtName != "")
            {
               this.browser.GO_TO_WEBPAGE(this._name + "_S_" + com.rockstargames.gtav.web.WWW_DOCKTEASE_COM_PARENT.YACHT_CHECKOUT_PAGE);
            }
         default:
            return;
      }
   }
}
