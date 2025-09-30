class com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM extends com.rockstargames.gtav.web.vehicleSites.VehicleWebsite
{
   var BUY_NOW_LABEL;
   var CAN_STORE_PAGE;
   var DESCRIPTION_HEADER_LABEL;
   var DESCRIPTION_LABEL_PREFIX;
   var DETAILS_PAGE;
   var DETAILS_PAGE_IMAGE_SUFFIX;
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
   var categoryOrder;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var dropDownButtonOffColour;
   var dropDownButtonOnColour;
   var favourUpperCase;
   var isMP;
   var purchaseButtonOffColour;
   var purchaseButtonOnColour;
   var sortButtonOffColour;
   var sortButtonOnColour;
   static var BRAND_NONE = "";
   static var TXD_DEFAULT = "PANDM_DEFAULT";
   static var TXD_2023_01 = "PANDM_DLC_2023_01";
   var vehicles = {BMX:{id:3,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},SCORCHER:{id:4,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},TRIBIKE:{id:5,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},TRIBIKE2:{id:6,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},TRIBIKE3:{id:7,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},CRUISER:{id:8,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_DEFAULT,seats:1},INDUCTOR:{id:9,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com
   .rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_2023_01,seats:1},INDUCTOR2:{id:10,brand:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.BRAND_NONE,txd:com.rockstargames.gtav.web.WWW_PANDMCYCLES_COM.TXD_2023_01,seats:1}};
   function WWW_PANDMCYCLES_COM()
   {
      super();
      this._name = "WWW_PANDMCYCLES_COM";
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 16777215;
      this.purchaseButtonOnColour = 16777215;
      this.purchaseButtonOffColour = 16777215;
      this.sortButtonOnColour = 16777215;
      this.sortButtonOffColour = 16777215;
      this.dropDownButtonOnColour = 16777215;
      this.dropDownButtonOffColour = 16777215;
      this.favourUpperCase = false;
      this.DETAILS_PAGE = "BIKE_D_DETAILS";
      this.PURCHASE_PAGE = "PURCHASEBIKE";
      this.TOOLBAR_LABEL = "PAM_TOOLBAR";
      this.HOME_PAGE_HEADER_LABEL = "PAM_PG1_HEADER";
      this.HOME_PAGE_BODY_LABEL = "PAM_PG1_BODY1";
      this.BUY_NOW_LABEL = "PAM_BUYNOW";
      this.SORT_PRICE_LABEL = "PAM_SORT_PRICE";
      this.SORT_NEW_IN_LABEL = "PAM_SORT_NEW_IN";
      this.DESCRIPTION_HEADER_LABEL = "PAM_DESCRIPTION_HEADER";
      this.LIVERY_HEADER_LABEL = "PAM_LIVERY_HEADER";
      this.STATS_HEADER_LABEL = "PAM_STATS_HEADER";
      this.FILTER_ALL_LABEL = "PAM_ALL";
      this.DESCRIPTION_LABEL_PREFIX = "PAM_";
      this.VEHICLE_BUTTON_ROW_HEIGHT = 236;
      this.USE_SEPARATE_DETAIL_IMAGES = true;
      this.DETAILS_PAGE_IMAGE_SUFFIX = "B";
   }
   function filterVehicles()
   {
      if(this.isMP)
      {
         this.categoryOrder = ["PANDM_BIKES"];
         this.vehicles = {PANDM_BIKES:[this.vehicles.INDUCTOR,this.vehicles.INDUCTOR2,this.vehicles.BMX,this.vehicles.SCORCHER,this.vehicles.TRIBIKE,this.vehicles.TRIBIKE2,this.vehicles.TRIBIKE3,this.vehicles.CRUISER]};
      }
      else
      {
         this.categoryOrder = ["PANDM_BIKES"];
         this.vehicles = {PANDM_BIKES:[this.vehicles.BMX,this.vehicles.SCORCHER,this.vehicles.TRIBIKE,this.vehicles.TRIBIKE2,this.vehicles.TRIBIKE3,this.vehicles.CRUISER]};
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
}
