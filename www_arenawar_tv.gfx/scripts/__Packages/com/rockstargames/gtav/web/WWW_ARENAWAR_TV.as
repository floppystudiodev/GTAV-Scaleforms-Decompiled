class com.rockstargames.gtav.web.WWW_ARENAWAR_TV extends com.rockstargames.ui.core.BaseWebsite
{
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var videoDisabled;
   var initialised;
   var forceReinitialisation;
   var PAGE_NAMES;
   var browser;
   var isMP;
   var displayConfig;
   var imageManager;
   var pageContainer;
   var CONTENT;
   var progressPanel;
   var CAN_STORE_PAGE;
   var vehicles;
   var styleOption;
   var graphicsOption;
   var colourOption;
   var expansionFloorB1Option;
   var expansionFloorB2Option;
   var mechanicA;
   var mechanicB;
   var personalQuarters;
   var selectedVehicleId;
   var currPage;
   var dataTextScope;
   var initialPropertyIsOwned;
   var dataProviderUI;
   static var PAGES = {SPLASH_PAGE:{name:"PAGE1",pageClass:com.rockstargames.gtav.web.arena.pages.SplashPage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_D_CONSTRUCTION",pageClass:com.rockstargames.gtav.web.arena.pages.UnderConstructionPage},WORKSHOP_STYLE_PAGE:{name:"OFFICE_D_STYLE",pageClass:com.rockstargames.gtav.web.arena.pages.WorkshopStylePage},WORKSHOP_GRAPHICS_PAGE:{name:"WORKSHOP_D_GRAPHICS",pageClass:com.rockstargames.gtav.web.arena.pages.WorkshopGraphicsPage},WORKSHOP_COLOUR_PAGE:{name:"WORKSHOP_D_COLOR",pageClass:com.rockstargames.gtav.web.arena.pages.WorkshopColourPage},EXPANSION_FLOOR_B1_PAGE:{name:"EXPANSION_D_FLOOR_D_B1",pageClass:com.rockstargames.gtav.web.arena.pages.ExpansionFloorB1Page},EXPANSION_FLOOR_B2_PAGE:{name:"EXPANSION_D_FLOOR_D_B2",pageClass:com.rockstargames.gtav.web.arena.pages.ExpansionFloorB2Page},MECHANIC_PAGE:{name:"MECHANIC",pageClass:com.rockstargames.gtav.web.arena.pages.MechanicPage},PERSONAL_QUARTERS_PAGE:{name:"PERSONAL_D_QUARTERS",pageClass:com.rockstargames
   .gtav.web.arena.pages.PersonalQuartersPage},SUMMARY_PAGE:{name:"SUMMARY",pageClass:com.rockstargames.gtav.web.arena.pages.SummaryPage},PROPERTY_PURCHASE_PROCESSING_PAGE:{name:"PURCHASE_D_PROCESSING",pageClass:com.rockstargames.gtav.web.arena.pages.PurchaseProcessingPage},PURCHASE_FAILED_PAGE:{name:"PURCHASE_D_FAILED",pageClass:com.rockstargames.gtav.web.arena.pages.PurchaseFailedPage},PROPERTY_PURCHASE_COMPLETE_PAGE:{name:"PROPERTY_D_PURCHASED",pageClass:com.rockstargames.gtav.web.arena.pages.PropertyPurchasedPage},VEHICLE_PURCHASE_COMPLETE_PAGE:{name:"VEHICLE_D_PURCHASED",pageClass:com.rockstargames.gtav.web.arena.pages.VehiclePurchasedPage},WAYPOINT_SET:{name:"WAYPOINT_D_SET",pageClass:com.rockstargames.gtav.web.arena.pages.WaypointSetPage},ARENA_READY_VEHICLES_PAGE:{name:"ARENA_D_READY_D_VEHICLES",pageClass:com.rockstargames.gtav.web.arena.pages.ArenaReadyPage},UPGRADEABLE_VEHICLES_PAGE:{name:"UPGRADEABLE_D_VEHICLES",pageClass:com.rockstargames.gtav.web.arena.pages.UpgradeablePage},VEHICLE_DETAILS_PAGE:{name:"VEHICLE_D_DETAILS",pageClass:com
   .rockstargames.gtav.web.arena.pages.VehicleDetailsPage},VEHICLE_PURCHASE_PROCESSING_PAGE:{name:"PURCHASE_D_PENDING",pageClass:com.rockstargames.gtav.web.arena.pages.PurchaseProcessingPage}};
   static var VEHICLE_DETAILS_PAGE_PREFIX = "VEHICLE_D_DETAILS_D_";
   static var OWNED_GARAGE_DATA_INDEX = 3;
   static var GARAGE_COSTS_DATA_INDEX = 4;
   static var GARAGE_SALE_COSTS_DATA_INDEX = 5;
   static var NUM_STYLE_OPTIONS = 3;
   static var NUM_GRAPHICS_OPTIONS = 9;
   static var NUM_COLOUR_OPTIONS = 9;
   static var NUM_EXPANSION_OPTIONS = 9;
   static var NUM_MECHANIC_A_OPTIONS = 1;
   static var NUM_MECHANIC_B_OPTIONS = 1;
   static var NUM_PERSONAL_QUARTERS_OPTIONS = 1;
   static var BASE_PRICE_COST_OFFSET = 0;
   static var STYLE_COST_OFFSET = 1;
   static var GRAPHICS_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.STYLE_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_STYLE_OPTIONS;
   static var COLOUR_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GRAPHICS_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_GRAPHICS_OPTIONS;
   static var EXPANSION_B1_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.COLOUR_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_COLOUR_OPTIONS;
   static var EXPANSION_B2_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.EXPANSION_B1_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_EXPANSION_OPTIONS;
   static var MECHANIC_A_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.EXPANSION_B2_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_EXPANSION_OPTIONS;
   static var MECHANIC_B_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.MECHANIC_A_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_MECHANIC_A_OPTIONS;
   static var PERSONAL_QUARTERS_COST_OFFSET = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.MECHANIC_B_COST_OFFSET + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_MECHANIC_B_OPTIONS;
   function WWW_ARENAWAR_TV()
   {
      super();
      _global.gfxExtensions = true;
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 0;
      this.videoDisabled = false;
      this.initialised = false;
      this.forceReinitialisation = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.initVehicles();
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.displayConfig = this.browser.getConfig();
      this.imageManager = new com.rockstargames.gtav.web.arena.ImageManager("WEB_BROWSER");
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      var _loc8_ = this.CONTENT.attachMovie("progressPanel","progressPanel",this.CONTENT.getNextHighestDepth(),{_x:236,_y:-70});
      this.progressPanel = new com.rockstargames.gtav.web.arena.ProgressPanel(_loc8_,this);
      this.browser.SET_TITLEBAR_TEXT(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.browser.TOOLBAR.titlebarText,"ARENA_TOOLBAR_MESSAGE"),14474460);
      this.PAGE_NAMES[1] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SPLASH_PAGE.name;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UNDER_CONSTRUCTION_PAGE.name;
      this.PAGE_NAMES[3] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_STYLE_PAGE.name;
      this.PAGE_NAMES[4] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_GRAPHICS_PAGE.name;
      this.PAGE_NAMES[5] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_COLOUR_PAGE.name;
      this.PAGE_NAMES[6] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B1_PAGE.name;
      this.PAGE_NAMES[7] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B2_PAGE.name;
      this.PAGE_NAMES[8] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.MECHANIC_PAGE.name;
      this.PAGE_NAMES[9] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PERSONAL_QUARTERS_PAGE.name;
      this.PAGE_NAMES[10] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SUMMARY_PAGE.name;
      this.PAGE_NAMES[11] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.ARENA_READY_VEHICLES_PAGE.name;
      this.PAGE_NAMES[12] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PROPERTY_PURCHASE_PROCESSING_PAGE.name;
      this.PAGE_NAMES[13] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PURCHASE_FAILED_PAGE.name;
      this.PAGE_NAMES[14] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PROPERTY_PURCHASE_COMPLETE_PAGE.name;
      this.PAGE_NAMES[15] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.VEHICLE_PURCHASE_COMPLETE_PAGE.name;
      this.PAGE_NAMES[16] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WAYPOINT_SET.name;
      this.PAGE_NAMES[17] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.VEHICLE_PURCHASE_PROCESSING_PAGE.name;
      this.PAGE_NAMES[18] = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UPGRADEABLE_VEHICLES_PAGE.name;
      this.CAN_STORE_PAGE[1] = true;
      var _loc5_ = 2;
      while(_loc5_ <= 17)
      {
         this.CAN_STORE_PAGE[_loc5_] = false;
         _loc5_ = _loc5_ + 1;
      }
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[18] = true;
      _loc5_ = 0;
      while(_loc5_ < this.vehicles.length)
      {
         var _loc3_ = this.vehicles[_loc5_].id;
         var _loc4_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.VEHICLE_DETAILS_PAGE_PREFIX + _loc3_;
         this.PAGE_NAMES[_loc3_] = _loc4_;
         this.CAN_STORE_PAGE[_loc3_] = false;
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES[_loc4_] = {name:_loc4_,pageClass:com.rockstargames.gtav.web.arena.pages.VehicleDetailsPage};
         _loc5_ = _loc5_ + 1;
      }
      this.styleOption = -1;
      this.graphicsOption = -1;
      this.colourOption = -1;
      this.expansionFloorB1Option = -1;
      this.expansionFloorB2Option = -1;
      this.mechanicA = -1;
      this.mechanicB = -1;
      this.personalQuarters = -1;
      this.selectedVehicleId = -1;
   }
   function initVehicles()
   {
      this.vehicles = [];
      var _loc2_ = undefined;
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 21;
      _loc2_.nameLabel = "CERBERUS";
      _loc2_.descriptionLabel = "MBA_CERBERUS1_DESC";
      _loc2_.thumbnailTexture = "CERBERUS1";
      _loc2_.stockTexture = "CERBERUS1_B";
      _loc2_.upgradeTexture = "CERBERUS1_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 1;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 22;
      _loc2_.nameLabel = "CERBERUS2";
      _loc2_.descriptionLabel = "MBA_CERBERUS2_DESC";
      _loc2_.thumbnailTexture = "CERBERUS2";
      _loc2_.stockTexture = "CERBERUS2_B";
      _loc2_.upgradeTexture = "CERBERUS2_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 2;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 23;
      _loc2_.nameLabel = "CERBERUS3";
      _loc2_.descriptionLabel = "MBA_CERBERUS3_DESC";
      _loc2_.thumbnailTexture = "CERBERUS3";
      _loc2_.stockTexture = "CERBERUS3_B";
      _loc2_.upgradeTexture = "CERBERUS3_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 3;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 24;
      _loc2_.nameLabel = "BRUTUS";
      _loc2_.descriptionLabel = "MBA_BRUTUS1_DESC";
      _loc2_.thumbnailTexture = "BRUTUS1";
      _loc2_.stockTexture = "BRUTUS1_B";
      _loc2_.upgradeTexture = "BRUTUS1_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 1;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 25;
      _loc2_.nameLabel = "BRUTUS2";
      _loc2_.descriptionLabel = "MBA_BRUTUS2_DESC";
      _loc2_.thumbnailTexture = "BRUTUS2";
      _loc2_.stockTexture = "BRUTUS2_B";
      _loc2_.upgradeTexture = "BRUTUS2_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 2;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 26;
      _loc2_.nameLabel = "BRUTUS3";
      _loc2_.descriptionLabel = "MBA_BRUTUS3_DESC";
      _loc2_.thumbnailTexture = "BRUTUS3";
      _loc2_.stockTexture = "BRUTUS3_B";
      _loc2_.upgradeTexture = "BRUTUS3_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 3;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 27;
      _loc2_.nameLabel = "SCARAB";
      _loc2_.descriptionLabel = "MBA_SCARAB1_DESC";
      _loc2_.thumbnailTexture = "SCARAB1";
      _loc2_.stockTexture = "SCARAB1_B";
      _loc2_.upgradeTexture = "SCARAB1_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 1;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 28;
      _loc2_.nameLabel = "SCARAB2";
      _loc2_.descriptionLabel = "MBA_SCARAB2_DESC";
      _loc2_.thumbnailTexture = "SCARAB2";
      _loc2_.stockTexture = "SCARAB2_B";
      _loc2_.upgradeTexture = "SCARAB2_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 2;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 29;
      _loc2_.nameLabel = "SCARAB3";
      _loc2_.descriptionLabel = "MBA_SCARAB3_DESC";
      _loc2_.thumbnailTexture = "SCARAB3";
      _loc2_.stockTexture = "SCARAB3_B";
      _loc2_.upgradeTexture = "SCARAB3_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 3;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 30;
      _loc2_.nameLabel = "IMPERATOR";
      _loc2_.descriptionLabel = "MBA_IMPERATOR1_DESC";
      _loc2_.thumbnailTexture = "IMPERATOR1";
      _loc2_.stockTexture = "IMPERATOR1_B";
      _loc2_.upgradeTexture = "IMPERATOR1_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 1;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 31;
      _loc2_.nameLabel = "IMPERATOR2";
      _loc2_.descriptionLabel = "MBA_IMPERATOR2_DESC";
      _loc2_.thumbnailTexture = "IMPERATOR2";
      _loc2_.stockTexture = "IMPERATOR2_B";
      _loc2_.upgradeTexture = "IMPERATOR2_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 2;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 32;
      _loc2_.nameLabel = "IMPERATOR3";
      _loc2_.descriptionLabel = "MBA_IMPERATOR3_DESC";
      _loc2_.thumbnailTexture = "IMPERATOR3";
      _loc2_.stockTexture = "IMPERATOR3_B";
      _loc2_.upgradeTexture = "IMPERATOR3_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 3;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 33;
      _loc2_.nameLabel = "ZR380";
      _loc2_.descriptionLabel = "MBA_ZR3801_DESC";
      _loc2_.thumbnailTexture = "ZR3801";
      _loc2_.stockTexture = "ZR3801_B";
      _loc2_.upgradeTexture = "ZR3801_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 1;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 34;
      _loc2_.nameLabel = "ZR3802";
      _loc2_.descriptionLabel = "MBA_ZR3802_DESC";
      _loc2_.thumbnailTexture = "ZR3802";
      _loc2_.stockTexture = "ZR3802_B";
      _loc2_.upgradeTexture = "ZR3802_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 2;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 35;
      _loc2_.nameLabel = "ZR3803";
      _loc2_.descriptionLabel = "MBA_ZR3803_DESC";
      _loc2_.thumbnailTexture = "ZR3803";
      _loc2_.stockTexture = "ZR3803_B";
      _loc2_.upgradeTexture = "ZR3803_C";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.theme = 3;
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 36;
      _loc2_.nameLabel = "RLOADER2";
      _loc2_.descriptionLabel = "MBA_RLOADER_DESC";
      _loc2_.thumbnailTexture = "RLOADER";
      _loc2_.stockTexture = "RLOADER_B";
      _loc2_.upgradeTexturePrefix = "MONSTER_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 37;
      _loc2_.nameLabel = "GLENDALE";
      _loc2_.descriptionLabel = "MBA_GLENDALE_DESC";
      _loc2_.thumbnailTexture = "GLENDALE";
      _loc2_.stockTexture = "GLENDALE_B";
      _loc2_.upgradeTexturePrefix = "BRUISER_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 4;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 38;
      _loc2_.nameLabel = "SLAMVAN";
      _loc2_.descriptionLabel = "MBA_SLAMVAN_DESC";
      _loc2_.thumbnailTexture = "SLAMVAN";
      _loc2_.stockTexture = "SLAMVAN_B";
      _loc2_.upgradeTexturePrefix = "SLAMVAN_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 39;
      _loc2_.nameLabel = "DOMINATO";
      _loc2_.descriptionLabel = "MBA_DOMINATO_DESC";
      _loc2_.thumbnailTexture = "DOMINATO";
      _loc2_.stockTexture = "DOMINATO_B";
      _loc2_.upgradeTexturePrefix = "DOMINATO_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 40;
      _loc2_.nameLabel = "IMPALER";
      _loc2_.descriptionLabel = "MBA_IMPALER_DESC";
      _loc2_.thumbnailTexture = "IMPALER";
      _loc2_.stockTexture = "IMPALER_B";
      _loc2_.upgradeTexturePrefix = "IMPALER_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 41;
      _loc2_.nameLabel = "ISSI3";
      _loc2_.descriptionLabel = "MBA_ISSI3_DESC";
      _loc2_.thumbnailTexture = "ISSI3";
      _loc2_.stockTexture = "ISSI3_B";
      _loc2_.upgradeTexturePrefix = "ISSI3_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 2;
      this.vehicles.push(_loc2_);
      _loc2_ = new com.rockstargames.gtav.web.arena.Vehicle();
      _loc2_.id = 42;
      _loc2_.nameLabel = "GARGOYLE";
      _loc2_.descriptionLabel = "MBA_GARGOYLE_DESC";
      _loc2_.thumbnailTexture = "GARGOYLE";
      _loc2_.stockTexture = "GARGOYLE_B";
      _loc2_.upgradeTexturePrefix = "DEATHBIKE_C_";
      _loc2_.textureDictionary = "MBA_VEHICLES";
      _loc2_.numSeats = 1;
      this.vehicles.push(_loc2_);
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
      this.currPage = new PageClass(this,this.pageContainer,pageName,_loc2_,this.progressPanel);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.browser.SUPRESS_HISTORY(false);
      this.currPage.setDisabledButtons();
      if(this.currPage.name == com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SPLASH_PAGE.name)
      {
         this.initialPropertyIsOwned = this.propertyIsOwned;
         com.rockstargames.gtav.web.arena.pages.SplashPage(this.currPage).update();
         this.forceReinitialisation = false;
      }
      else if(this.currPage.name == com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.ARENA_READY_VEHICLES_PAGE.name)
      {
         if(this.forceReinitialisation && !newPage)
         {
            this.forceReinitialisation = false;
            this.setPage(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.ARENA_READY_VEHICLES_PAGE.name,com.rockstargames.gtav.web.arena.pages.ArenaReadyPage);
         }
      }
      else if(this.currPage.name == com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UPGRADEABLE_VEHICLES_PAGE.name)
      {
         if(this.forceReinitialisation && !newPage)
         {
            this.forceReinitialisation = false;
            this.setPage(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UPGRADEABLE_VEHICLES_PAGE.name,com.rockstargames.gtav.web.arena.pages.UpgradeablePage);
         }
      }
      else if(this.currPage.name == com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PURCHASE_FAILED_PAGE.name)
      {
         com.rockstargames.gtav.web.arena.pages.PurchaseFailedPage(this.currPage).update();
      }
      if(!this.initialised)
      {
         if(this.propertyIsOwned)
         {
            this.styleOption = this.purchasedStyleOption;
            this.graphicsOption = this.purchasedGraphicsOption;
            this.colourOption = this.purchasedColourOption;
            this.expansionFloorB1Option = this.purchasedExpansionFloorB1Option;
            this.expansionFloorB2Option = this.purchasedExpansionFloorB2Option;
            this.mechanicA = this.purchasedMechanicA;
            this.mechanicB = this.purchasedMechanicB;
            this.personalQuarters = this.purchasedPersonalQuarters;
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
         this.setPage(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES)
      {
         if(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES[_loc3_].pageClass);
            break;
         }
      }
   }
   function SET_PRICES(id, tradePrice, buyItNowPrice, a, tradeSalePrice, buyItNowSalePrice, award, tradePriceAvailable, buyItNowPriceAvailable)
   {
      if(buyItNowPrice == undefined)
      {
         buyItNowPrice = -1;
      }
      if(award == undefined)
      {
         award = -1;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.vehicles.length)
      {
         var _loc2_ = this.vehicles[_loc3_];
         if(_loc2_.id == id)
         {
            _loc2_.tradePrice = tradePrice;
            _loc2_.buyItNowPrice = buyItNowPrice;
            _loc2_.tradeSalePrice = tradeSalePrice;
            _loc2_.buyItNowSalePrice = buyItNowSalePrice;
            _loc2_.tradePriceAvailable = tradePriceAvailable;
            _loc2_.buyItNowPriceAvailable = buyItNowPriceAvailable;
            _loc2_.award = award;
            break;
         }
         _loc3_ = _loc3_ + 1;
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
      this.vehicles = null;
      this.imageManager.dispose();
      this.imageManager = null;
      this.progressPanel.dispose();
      this.progressPanel = null;
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
      this.progressPanel.handleClick(_loc5_,_loc4_) || this.currPage.handleClick(_loc5_,_loc4_);
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
   function get propertyIsOwned()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][0] != -1 && this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][0] != undefined && !isNaN(this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][0]);
   }
   function get purchasedStyleOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][0];
   }
   function get purchasedGraphicsOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][1];
   }
   function get purchasedColourOption()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][2];
   }
   function get purchasedExpansionFloorB1Option()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][3];
   }
   function get purchasedExpansionFloorB2Option()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][4];
   }
   function get purchasedMechanicA()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][5];
   }
   function get purchasedMechanicB()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][6];
   }
   function get purchasedPersonalQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.OWNED_GARAGE_DATA_INDEX][7];
   }
   function getPropertyBaseCost(getSaleCost)
   {
      if(this.propertyIsOwned)
      {
         return 0;
      }
      var _loc3_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_ARENAWAR_TV.BASE_PRICE_COST_OFFSET];
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX][com.rockstargames.gtav.web.WWW_ARENAWAR_TV.BASE_PRICE_COST_OFFSET];
      return !(getSaleCost && _loc2_ != -1) ? _loc3_ : _loc2_;
   }
   function getStyleCost(selection, getSaleCost)
   {
      var _loc3_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      var _loc2_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.STYLE_COST_OFFSET + selection;
      return this.dataProviderUI[_loc3_][_loc2_];
   }
   function getGraphicsCost(selection, getSaleCost)
   {
      var _loc3_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      var _loc2_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GRAPHICS_COST_OFFSET + selection;
      return this.dataProviderUI[_loc3_][_loc2_];
   }
   function getColourCost(selection, getSaleCost)
   {
      var _loc3_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      var _loc2_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.COLOUR_COST_OFFSET + selection;
      return this.dataProviderUI[_loc3_][_loc2_];
   }
   function getExpansionFloorB1Cost(selection, getSaleCost)
   {
      if(selection == 0)
      {
         return 0;
      }
      var _loc3_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      var _loc2_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.EXPANSION_B1_COST_OFFSET + selection - 1;
      return this.dataProviderUI[_loc3_][_loc2_];
   }
   function getExpansionFloorB2Cost(selection, getSaleCost)
   {
      if(selection == 0)
      {
         return 0;
      }
      var _loc3_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      var _loc2_ = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.EXPANSION_B2_COST_OFFSET + selection - 1;
      return this.dataProviderUI[_loc3_][_loc2_];
   }
   function getMechanicACost(getSaleCost)
   {
      var _loc2_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      return this.dataProviderUI[_loc2_][com.rockstargames.gtav.web.WWW_ARENAWAR_TV.MECHANIC_A_COST_OFFSET];
   }
   function getMechanicBCost(getSaleCost)
   {
      var _loc2_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      return this.dataProviderUI[_loc2_][com.rockstargames.gtav.web.WWW_ARENAWAR_TV.MECHANIC_B_COST_OFFSET];
   }
   function getPersonalQuartersCost(getSaleCost)
   {
      var _loc2_ = !getSaleCost ? com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_COSTS_DATA_INDEX : com.rockstargames.gtav.web.WWW_ARENAWAR_TV.GARAGE_SALE_COSTS_DATA_INDEX;
      return this.dataProviderUI[_loc2_][com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PERSONAL_QUARTERS_COST_OFFSET];
   }
   function dispatchPropertySelections()
   {
      if(this.styleOption == -1)
      {
         this.styleOption = 0;
      }
      if(this.graphicsOption == -1)
      {
         this.graphicsOption = 0;
      }
      if(this.colourOption == -1)
      {
         this.colourOption = 0;
      }
      if(this.expansionFloorB1Option == -1)
      {
         this.expansionFloorB1Option = 0;
      }
      if(this.expansionFloorB2Option == -1)
      {
         this.expansionFloorB2Option = 0;
      }
      if(this.mechanicA == -1)
      {
         this.mechanicA = 0;
      }
      if(this.mechanicB == -1)
      {
         this.mechanicB = 0;
      }
      if(this.personalQuarters == -1)
      {
         this.personalQuarters = 0;
      }
      var _loc9_ = 2;
      var _loc4_ = 5;
      var _loc11_ = 4;
      var _loc5_ = 5;
      var _loc6_ = 5;
      var _loc10_ = 1;
      var _loc7_ = 1;
      var _loc8_ = 1;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.styleOption << _loc2_;
      _loc2_ += _loc9_;
      _loc3_ |= this.graphicsOption << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= this.colourOption << _loc2_;
      _loc2_ += _loc11_;
      _loc3_ |= this.expansionFloorB1Option << _loc2_;
      _loc2_ += _loc5_;
      _loc3_ |= this.expansionFloorB2Option << _loc2_;
      _loc2_ += _loc6_;
      _loc3_ |= this.mechanicA << _loc2_;
      _loc2_ += _loc10_;
      _loc3_ |= this.mechanicB << _loc2_;
      _loc2_ += _loc7_;
      _loc3_ |= this.personalQuarters << _loc2_;
      _loc2_ += _loc8_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.ARENA_GARAGE,_loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("ARENA PROPERTY DATA OUT");
      com.rockstargames.ui.utils.Debug.log("STYLE OPTION: " + this.styleOption);
      com.rockstargames.ui.utils.Debug.log("GRAPHICS OPTION: " + this.graphicsOption);
      com.rockstargames.ui.utils.Debug.log("COLOUR OPTION: " + this.colourOption);
      com.rockstargames.ui.utils.Debug.log("EXPANSION FLOOR B1: " + this.expansionFloorB1Option);
      com.rockstargames.ui.utils.Debug.log("EXPANSION FLOOR B2: " + this.expansionFloorB2Option);
      com.rockstargames.ui.utils.Debug.log("MECHANIC A: " + this.mechanicA);
      com.rockstargames.ui.utils.Debug.log("MECHANIC B: " + this.mechanicB);
      com.rockstargames.ui.utils.Debug.log("PERSONAL QUARTERS: " + this.personalQuarters);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
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
   static function resizeAsianText(tf)
   {
      tf.verticalAlign = "center";
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      tf.setTextFormat(_loc1_);
   }
}
