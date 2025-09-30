class com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var barOption;
   var bedroomOption;
   var browser;
   var colourOption;
   var currPage;
   var dataProviderUI;
   var dataTextScope;
   var dealerOption;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayConfig;
   var garageOption;
   var imageManager;
   var initialised;
   var isMP;
   var loungeOption;
   var mediaRoomOption;
   var officeOption;
   var pageContainer;
   var spaOption;
   var styleOption;
   var videoDisabled;
   static var PAGES = {SPLASH_PAGE:{name:"PAGE1",index:1,canStore:true,pageClass:com.rockstargames.gtav.web.casino.pages.SplashPage},CASINO_PAGE:{name:"CASINO",index:2,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.CasinoPage},MEMBERSHIP_PAGE:{name:"MEMBERSHIP",index:3,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.MembershipPage},MEMBERSHIP_PENDING_PAGE:{name:"MEMBERSHIP_D_PENDING",index:4,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.MembershipPendingPage},MEMBERSHIP_FAILED_PAGE:{name:"MEMBERSHIP_D_FAILED",index:5,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.MembershipFailedPage},MEMBERSHIP_SUCCESS_PAGE:{name:"MEMBERSHIP_D_SUCCESS",index:6,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.MembershipSuccessPage},UNUSED_PAGE:{},SUITES_PAGE:{name:"SUITES",index:8,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.SuitesPage},RENOVATE_PAGE:{name:"RENOVATE",index:9,canStore:false,pageClass:com
   .rockstargames.gtav.web.casino.pages.RenovatePage},SUITE_COLOUR_PAGE:{name:"SUITE_D_COLOR",index:10,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.SuiteColourPage},SUITE_STYLE_PAGE:{name:"SUITE_D_STYLE",index:11,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.SuiteStylePage},UNUSED_PAGE:{name:"",index:12,canStore:false,pageClass:null},SUITE_OPTIONS_PAGE:{name:"SUITE_D_OPTIONS",index:13,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage},SUMMARY_PAGE:{name:"SUMMARY",index:14,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.SummaryPage},PURCHASE_PENDING_PAGE:{name:"PURCHASE_D_PENDING",index:15,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.PurchasePendingPage},PURCHASE_FAILED_PAGE:{name:"PURCHASE_D_FAILED",index:16,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.PurchaseFailedPage},PURCHASE_SUCCESS_PAGE:{name:"PURCHASE_D_SUCCESS",index:17,canStore:false,pageClass:com.rockstargames
   .gtav.web.casino.pages.PurchaseSuccessPage},WAYPOINT_SET:{name:"WAYPOINT_D_SET",index:18,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.WaypointSetPage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_D_CONSTRUCTION",index:19,canStore:false,pageClass:com.rockstargames.gtav.web.casino.pages.UnderConstructionPage}};
   static var NUM_COLOUR_OPTIONS = 3;
   static var NUM_STYLE_OPTIONS = 9;
   static var NUM_OPTION_OPTIONS = 9;
   static var OWNED_SUITE_DATA_INDEX = 10;
   static var SUITE_COSTS_DATA_INDEX = 11;
   static var SUITE_SALE_COSTS_DATA_INDEX = 12;
   static var SUITE_PRESET_STYLE_1_DATA_INDEX = 13;
   static var SUITE_PRESET_STYLE_2_DATA_INDEX = 14;
   static var SUITE_PRESET_STYLE_3_DATA_INDEX = 15;
   static var PURCHASED_COLOUR_INDEX = 0;
   static var PURCHASED_STYLE_INDEX = 1;
   static var PURCHASED_LOUNGE_INDEX = 2;
   static var PURCHASED_BAR_INDEX = 3;
   static var PURCHASED_DEALER_INDEX = 4;
   static var PURCHASED_BEDROOM_INDEX = 5;
   static var PURCHASED_MEDIA_ROOM_INDEX = 6;
   static var PURCHASED_SPA_INDEX = 7;
   static var PURCHASED_OFFICE_INDEX = 8;
   static var PURCHASED_GARAGE_INDEX = 9;
   static var PURCHASED_MEMBERSHIP_INDEX = 11;
   static var GAMERTAG_INDEX = 12;
   static var HEADSHOT_INDEX = 13;
   static var SHOW_BANNER_INDEX = 14;
   static var DEALER_LOCKED_INDEX = 15;
   static var PRESET_1_LOCKED_INDEX = 16;
   static var PRESET_2_LOCKED_INDEX = 17;
   static var PRESET_3_LOCKED_INDEX = 18;
   static var BASE_PRICE_COST_OFFSET = 0;
   static var COLOUR_COST_OFFSET = 1;
   static var STYLE_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.COLOUR_COST_OFFSET + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_COLOUR_OPTIONS;
   static var LOUNGE_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.STYLE_COST_OFFSET + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_STYLE_OPTIONS;
   static var BAR_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.LOUNGE_COST_OFFSET + 1;
   static var DEALER_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BAR_COST_OFFSET + 2;
   static var BEDROOM_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.DEALER_COST_OFFSET + 1;
   static var MEDIA_ROOM_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BEDROOM_COST_OFFSET + 1;
   static var SPA_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.MEDIA_ROOM_COST_OFFSET + 1;
   static var OFFICE_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SPA_COST_OFFSET + 1;
   static var GARAGE_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OFFICE_COST_OFFSET + 1;
   static var MEMBERSHIP_COST_OFFSET = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.GARAGE_COST_OFFSET + 1;
   function WWW_THEDIAMONDCASINOANDRESORT_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.initialised = false;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 0;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.videoDisabled = false;
      this.displayConfig = this.browser.getConfig();
      this.imageManager = new com.rockstargames.gtav.web.casino.ImageManager("WEB_BROWSER");
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      this.browser.SET_TITLEBAR_TEXT(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.browser.TOOLBAR.titlebarText,"CASWEB_TOOLBAR_MESSAGE"),14474460);
      this.initPages();
      this.initOptions();
   }
   function initPages()
   {
      var _loc2_;
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES)
      {
         _loc2_ = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES[_loc3_].index;
         this.PAGE_NAMES[_loc2_] = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES[_loc3_].name;
         this.CAN_STORE_PAGE[_loc2_] = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES[_loc3_].canStore;
      }
   }
   function initOptions()
   {
      this.colourOption = -1;
      this.styleOption = -1;
      this.loungeOption = -1;
      this.barOption = -1;
      this.dealerOption = -1;
      this.bedroomOption = -1;
      this.mediaRoomOption = -1;
      this.spaOption = -1;
      this.officeOption = -1;
      this.garageOption = -1;
   }
   function setPage(pageName, PageClass)
   {
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.dataTextScope.length = 0;
      this.CONTENT._y = 0;
      var _loc2_ = this.currPage == undefined;
      this.currPage = new PageClass(this,this.pageContainer,pageName,_loc2_);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.browser.SUPRESS_HISTORY(false);
      this.currPage.setDisabledButtons();
      if(!this.initialised)
      {
         if(this.suiteIsOwned)
         {
            this.colourOption = this.purchasedColourOption;
            this.styleOption = this.purchasedStyleOption;
            this.loungeOption = this.purchasedLoungeOption;
            this.barOption = this.purchasedBarOption;
            this.dealerOption = this.purchasedDealerOption;
            this.bedroomOption = this.purchasedBedroomOption;
            this.mediaRoomOption = this.purchasedMediaRoomOption;
            this.spaOption = this.purchasedSpaOption;
            this.officeOption = this.purchasedOfficeOption;
            this.garageOption = this.purchasedGarageOption;
            this.initialised = true;
         }
      }
   }
   function displayPage(pageName)
   {
      if(this.currPage.name == pageName)
      {
         return undefined;
      }
      if(!this.isMP)
      {
         this.setPage(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES)
      {
         if(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES[_loc3_].pageClass);
            break;
         }
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      this.imageManager.textureLoaded(txd);
   }
   function DISABLE_VIDEO(isDisabled)
   {
      this.videoDisabled = isDisabled !== false;
   }
   function CLEANUP()
   {
      this.imageManager.dispose();
      this.imageManager = null;
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.currPage = null;
      super.CLEANUP();
   }
   function goToAnchor(link)
   {
      var _loc2_ = link.lastIndexOf("_");
      var _loc5_ = _loc2_ != -1 ? link.substring(0,_loc2_) : link;
      var _loc4_ = link.substring(_loc2_ + 1);
      this.currPage.handleClick(_loc5_,_loc4_);
   }
   function handleLB()
   {
      this.currPage.handleLB();
   }
   function handleRB()
   {
      this.currPage.handleRB();
   }
   function handleLT()
   {
      this.currPage.handleLT();
   }
   function handleRT()
   {
      this.currPage.handleRT();
   }
   function handleLTRelease()
   {
      this.currPage.handleLTRelease();
   }
   function handleRTRelease()
   {
      this.currPage.handleRTRelease();
   }
   function handleAnalogStickInput(isLeftStick, x, y, isScrollWheel)
   {
      this.currPage.handleAnalogStickInput(isLeftStick,x,y,isScrollWheel);
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.currPage.handleMouseClick(inputIsMouseClick);
   }
   function handleMouseRelease()
   {
      this.currPage.handleMouseRelease();
   }
   function get suiteIsOwned()
   {
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_COLOUR_INDEX];
      return _loc2_ != -1 && _loc2_ != undefined && !isNaN(_loc2_);
   }
   function get isAMember()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_MEMBERSHIP_INDEX] == 1;
   }
   function get hasMadeColourChoice()
   {
      return this.purchasedColourOption != this.colourOption;
   }
   function get hasMadeStyleChoice()
   {
      return this.purchasedStyleOption != this.styleOption;
   }
   function get hasMadeOptionChoice()
   {
      return this.garageOption != this.purchasedGarageOption || this.bedroomOption != this.purchasedBedroomOption || this.loungeOption != this.purchasedLoungeOption || this.mediaRoomOption != this.purchasedMediaRoomOption || this.barOption != this.purchasedBarOption || this.spaOption != this.purchasedSpaOption || this.dealerOption != this.purchasedDealerOption || this.officeOption != this.purchasedOfficeOption;
   }
   function getPresetData(index)
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM["SUITE_PRESET_STYLE_" + index + "_DATA_INDEX"]];
   }
   function get gamertag()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.GAMERTAG_INDEX];
   }
   function get headshot()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.HEADSHOT_INDEX];
   }
   function get showBanner()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SHOW_BANNER_INDEX];
   }
   function get privateDealerDisabled()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.DEALER_LOCKED_INDEX] === true;
   }
   function get preset1Disabled()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PRESET_1_LOCKED_INDEX] === true;
   }
   function get preset2Disabled()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PRESET_2_LOCKED_INDEX] === true;
   }
   function get preset3Disabled()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PRESET_3_LOCKED_INDEX] === true;
   }
   function get purchasedColourOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_COLOUR_INDEX];
   }
   function get purchasedStyleOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_STYLE_INDEX];
   }
   function get purchasedGarageOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_GARAGE_INDEX];
   }
   function get purchasedBedroomOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_BEDROOM_INDEX];
   }
   function get purchasedLoungeOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_LOUNGE_INDEX];
   }
   function get purchasedMediaRoomOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_MEDIA_ROOM_INDEX];
   }
   function get purchasedBarOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_BAR_INDEX];
   }
   function get purchasedSpaOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_SPA_INDEX];
   }
   function get purchasedDealerOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_DEALER_INDEX];
   }
   function get purchasedOfficeOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OWNED_SUITE_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PURCHASED_OFFICE_INDEX];
   }
   function getSuiteBaseCost(getSaleCost)
   {
      if(this.suiteIsOwned)
      {
         return 0;
      }
      var _loc3_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BASE_PRICE_COST_OFFSET];
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BASE_PRICE_COST_OFFSET];
      return !(getSaleCost && _loc2_ != -1) ? _loc3_ : _loc2_;
   }
   function getMembershipCost(getSaleCost)
   {
      var _loc3_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.MEMBERSHIP_COST_OFFSET];
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.MEMBERSHIP_COST_OFFSET];
      return !getSaleCost ? _loc3_ : _loc2_;
   }
   function getColourCosts(costSums)
   {
      var _loc2_;
      if(this.colourOption != -1 && this.colourOption != this.purchasedColourOption)
      {
         _loc2_ = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.COLOUR_COST_OFFSET + this.colourOption;
         this.getCost(costSums,_loc2_);
      }
   }
   function getColourCost(optionIndex, getSaleCost)
   {
      return this.dataProviderUI[!getSaleCost ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.COLOUR_COST_OFFSET + optionIndex];
   }
   function getStyleCosts(costSums)
   {
      var _loc2_;
      if(this.styleOption != -1 && this.styleOption != this.purchasedStyleOption)
      {
         _loc2_ = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.STYLE_COST_OFFSET + this.styleOption;
         this.getCost(costSums,_loc2_);
      }
   }
   function getStyleCost(optionIndex, getSaleCost)
   {
      return this.dataProviderUI[!getSaleCost ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.STYLE_COST_OFFSET + optionIndex];
   }
   function getLoungeCosts(costSums)
   {
      if(this.loungeOption == 1 && this.purchasedLoungeOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.LOUNGE_COST_OFFSET);
      }
   }
   function getBarCosts(costSums)
   {
      var _loc2_;
      if(this.barOption > 0 && this.barOption != this.purchasedBarOption)
      {
         _loc2_ = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BAR_COST_OFFSET + this.barOption - 1;
         this.getCost(costSums,_loc2_);
      }
   }
   function getBarCost(optionIndex, getSaleCost)
   {
      return this.dataProviderUI[!getSaleCost ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BAR_COST_OFFSET + optionIndex];
   }
   function getDealerCosts(costSums)
   {
      if(this.dealerOption == 1 && this.purchasedDealerOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.DEALER_COST_OFFSET);
      }
   }
   function getBedroomCosts(costSums)
   {
      if(this.bedroomOption == 1 && this.purchasedBedroomOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BEDROOM_COST_OFFSET);
      }
   }
   function getMediaRoomCosts(costSums)
   {
      if(this.mediaRoomOption == 1 && this.purchasedMediaRoomOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.MEDIA_ROOM_COST_OFFSET);
      }
   }
   function getSpaCosts(costSums)
   {
      if(this.spaOption == 1 && this.purchasedSpaOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SPA_COST_OFFSET);
      }
   }
   function getOfficeCosts(costSums)
   {
      if(this.officeOption == 1 && this.purchasedOfficeOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OFFICE_COST_OFFSET);
      }
   }
   function getGarageCosts(costSums)
   {
      if(this.garageOption == 1 && this.purchasedGarageOption != 1)
      {
         this.getCost(costSums,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.GARAGE_COST_OFFSET);
      }
   }
   function getCost(costSums, offset)
   {
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX][offset];
      var _loc3_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][offset];
      costSums.original += _loc2_;
      costSums.actual += _loc3_ != -1 ? _loc3_ : _loc2_;
      costSums.hasPurchase = true;
   }
   function getRawCost(offset, sale)
   {
      return !sale ? this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_COSTS_DATA_INDEX][offset] : this.dataProviderUI[com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SUITE_SALE_COSTS_DATA_INDEX][offset];
   }
   function dispatchSuiteSelections()
   {
      if(this.colourOption == -1)
      {
         this.colourOption = 0;
      }
      if(this.styleOption == -1)
      {
         this.styleOption = 0;
      }
      if(this.garageOption == -1)
      {
         this.garageOption = 0;
      }
      if(this.bedroomOption == -1)
      {
         this.bedroomOption = 0;
      }
      if(this.loungeOption == -1)
      {
         this.loungeOption = 0;
      }
      if(this.mediaRoomOption == -1)
      {
         this.mediaRoomOption = 0;
      }
      if(this.barOption == -1)
      {
         this.barOption = 0;
      }
      if(this.spaOption == -1)
      {
         this.spaOption = 0;
      }
      if(this.dealerOption == -1)
      {
         this.dealerOption = 0;
      }
      if(this.officeOption == -1)
      {
         this.officeOption = 0;
      }
      var _loc6_ = Math.ceil(Math.log(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_COLOUR_OPTIONS) * 1.4426950408889634);
      var _loc5_ = Math.ceil(Math.log(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_STYLE_OPTIONS) * 1.4426950408889634);
      var _loc7_ = 2;
      var _loc4_ = 1;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.colourOption << _loc2_;
      _loc2_ += _loc6_;
      _loc3_ |= this.styleOption << _loc2_;
      _loc2_ += _loc5_;
      _loc3_ |= this.loungeOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.barOption << _loc2_;
      _loc2_ += _loc7_;
      _loc3_ |= this.dealerOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.bedroomOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.mediaRoomOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.spaOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.officeOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.garageOption << _loc2_;
      _loc2_ += _loc4_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.YACHT,_loc3_);
      trace("*****************************************************************");
      trace("CASINO PENTHOUSE DATA OUT");
      trace("STYLE: " + this.styleOption);
      trace("COLOUR: " + this.colourOption);
      trace("GARAGE: " + this.garageOption);
      trace("BEDROOM: " + this.bedroomOption);
      trace("LOUNGE: " + this.loungeOption);
      trace("MEDIA ROOM: " + this.mediaRoomOption);
      trace("BAR: " + this.barOption);
      trace("SPA: " + this.spaOption);
      trace("DEALER: " + this.dealerOption);
      trace("OFFICE: " + this.officeOption);
      trace("*****************************************************************");
      trace("BIT FIELD: " + _loc3_);
      trace("*****************************************************************");
   }
   function setPageHeight(height)
   {
      this.CONTENT.BOUNDING_BOX._height = height;
      this.CONTENT.background._height = height;
      this.browser.RESIZE_WEBSITE();
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, letterSpacing, forceUpperCase, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(tf,label);
      }
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc2_);
   }
   static function formatNumber(value)
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
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   static function resizeAsianText(tf, size)
   {
      if(size == null)
      {
         size = 0.8;
      }
      if(!tf.multiline)
      {
         tf.verticalAlign = "center";
      }
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= size;
      _loc1_.leading = 0;
      tf.setTextFormat(_loc1_);
   }
}
