class com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM extends com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var IS_SITE_DYNAMIC;
   var PAGE_NAMES;
   var arcadeToMarkAsPurchased;
   var arcades;
   var autoShopToMarkAsPurchased;
   var autoShops;
   var bailOfficeToMarkAsPurchased;
   var bailOffices;
   var baseToMarkAsPurchased;
   var bases;
   var browser;
   var bunkerToMarkAsPurchased;
   var bunkers;
   var carWash;
   var carWashToMarkAsPurchased;
   var clubhouseToMarkAsPurchased;
   var clubhouses;
   var currPage;
   var dataProviderUI;
   var dataTextScope;
   var displayConfig;
   var garmentFactory;
   var garmentFactoryToMarkAsPurchased;
   var hangarToMarkAsPurchased;
   var hangars;
   var header;
   var helitours;
   var helitoursToMarkAsPurchased;
   var imageManager;
   var isInArcadeFlow;
   var isInAutoShopFlow;
   var isInBailOfficeFlow;
   var isInBaseFlow;
   var isInBunkerFlow;
   var isInCarWashFlow;
   var isInGarmentFactoryFlow;
   var isInHangarFlow;
   var isInHelitoursFlow;
   var isInMcKenzieHangarFlow;
   var isInNightclubFlow;
   var isInSalvageYardFlow;
   var isInWeedShopFlow;
   var isMP;
   var mapFilters;
   var mcKenzieHangar;
   var mcKenzieHangarToMarkAsPurchased;
   var nightclubToMarkAsPurchased;
   var nightclubs;
   var pageContainer;
   var progressPanel;
   var salvageYardToMarkAsPurchased;
   var salvageYards;
   var videoDisabled;
   var weedShop;
   var weedShopToMarkAsPurchased;
   static var PAGES = {SPLASH_PAGE:{name:"PAGE1",pageClass:com.rockstargames.gtav.web.foreclosures.SplashPage},MAP_PAGE:{name:"PROPERTIES",pageClass:com.rockstargames.gtav.web.foreclosures.MapPage},STYLE_PAGE:{name:"STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.StylePage},MURAL_PAGE:{name:"MURAL",pageClass:com.rockstargames.gtav.web.foreclosures.MuralPage},NAME_PAGE:{name:"CLUB_D_NAME",pageClass:com.rockstargames.gtav.web.foreclosures.NamePage},GUN_LOCKER_PAGE:{name:"GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.foreclosures.GunLockerPage},BIKE_SHOP_PAGE:{name:"BIKE_D_SHOP",pageClass:com.rockstargames.gtav.web.foreclosures.BikeShopPage},SUMMARY_PAGE:{name:"SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.SummaryPage},PURCHASE_PAGE:{name:"PURCHASE",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},SUCCESS_PAGE:{name:"PURCHASE_D_SUCCESS",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},FAILED_PAGE:{name:"PURCHASE_D_FAILED",pageClass:com.rockstargames
   .gtav.web.foreclosures.PurchasePage},ERROR_PAGE:{name:"PURCHASE_D_ERROR",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},WAYPOINT_SET:{name:"WAYPOINT_D_SET",pageClass:com.rockstargames.gtav.web.foreclosures.PurchasePage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_CONSTRUCTION",pageClass:com.rockstargames.gtav.web.foreclosures.UnderConstructionPage},EMBLEM_PAGE:{name:"CLUB_D_EMBLEM",pageClass:com.rockstargames.gtav.web.foreclosures.EmblemPage},BUNKER_STYLE_PAGE:{name:"BUNKER_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerStylePage},BUNKER_QUARTERS_PAGE:{name:"PERSONAL_D_QUARTERS",pageClass:com.rockstargames.gtav.web.foreclosures.PersonalQuartersPage},BUNKER_FIRING_RANGE_PAGE:{name:"SHOOTING_D_RANGE",pageClass:com.rockstargames.gtav.web.foreclosures.FiringRangePage},BUNKER_GUN_LOCKER_PAGE:{name:"BUNKER_D_GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerGunLockerPage},BUNKER_TRANSPORTATION_PAGE:{name:"TRANSPORTATION",pageClass:com.rockstargames
   .gtav.web.foreclosures.TransportationPage},BUNKER_SUMMARY_PAGE:{name:"BUNKER_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.BunkerSummaryPage},HANGAR_FLOORING_PAGE:{name:"HANGAR_D_FLOORING",pageClass:com.rockstargames.gtav.web.foreclosures.HangarFlooringPage},HANGAR_STYLE_PAGE:{name:"HANGAR_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.HangarStylePage},HANGAR_LIGHTING_PAGE:{name:"HANGAR_D_LIGHTING",pageClass:com.rockstargames.gtav.web.foreclosures.HangarLightingPage},HANGAR_QUARTERS_PAGE:{name:"HANGAR_D_QUARTERS",pageClass:com.rockstargames.gtav.web.foreclosures.HangarQuartersPage},HANGAR_FURNITURE_PAGE:{name:"HANGAR_D_FURNITURE",pageClass:com.rockstargames.gtav.web.foreclosures.HangarFurniturePage},HANGAR_WORKSHOP_PAGE:{name:"HANGAR_D_WORKSHOP",pageClass:com.rockstargames.gtav.web.foreclosures.HangarWorkshopPage},HANGAR_SUMMARY_PAGE:{name:"HANGAR_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.HangarSummaryPage},BASE_STYLE_PAGE:{name:"BASE_D_STYLE",pageClass:com
   .rockstargames.gtav.web.foreclosures.BaseStylePage},BASE_GRAPHICS_PAGE:{name:"BASE_D_GRAPHICS",pageClass:com.rockstargames.gtav.web.foreclosures.BaseGraphicsPage},BASE_WEAPON_PAGE:{name:"BASE_D_WEAPON",pageClass:com.rockstargames.gtav.web.foreclosures.BaseWeaponPage},BASE_SECURITY_PAGE:{name:"BASE_D_SECURITY",pageClass:com.rockstargames.gtav.web.foreclosures.BaseSecurityPage},BASE_LOUNGE_PAGE:{name:"BASE_D_LOUNGE",pageClass:com.rockstargames.gtav.web.foreclosures.BaseLoungePage},BASE_QUARTERS_PAGE:{name:"BASE_D_QUARTERS",pageClass:com.rockstargames.gtav.web.foreclosures.BaseQuartersPage},BASE_SUMMARY_PAGE:{name:"BASE_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.BaseSummaryPage},NIGHTCLUB_STYLE_PAGE:{name:"NIGHTCLUB_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubStylePage},NIGHTCLUB_LIGHTING_PAGE:{name:"NIGHTCLUB_D_LIGHTING",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubLightingPage},NIGHTCLUB_NAME_PAGE:{name:"NIGHTCLUB_D_NAME",pageClass:com
   .rockstargames.gtav.web.foreclosures.NightclubNamePage},NIGHTCLUB_STORAGE_PAGE:{name:"NIGHTCLUB_D_STORAGE",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubStoragePage},NIGHTCLUB_DANCERS_PAGE:{name:"NIGHTCLUB_D_DANCERS",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubDancersPage},NIGHTCLUB_DRY_ICE_PAGE:{name:"NIGHTCLUB_D_DRYICE",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubDryIcePage},NIGHTCLUB_SUMMARY_PAGE:{name:"NIGHTCLUB_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.NightclubSummaryPage},ARCADE_STYLE_PAGE:{name:"ARCADE_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeStylePage},ARCADE_MURAL_PAGE:{name:"ARCADE_D_MURAL",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeMuralPage},ARCADE_FLOOR_PAGE:{name:"ARCADE_D_FLOOR",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeFloorPage},ARCADE_NEONS_PAGE:{name:"ARCADE_D_NEON_D_ART",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeNeonsPage},ARCADE_EXTRAS_PAGE:{name:"ARCADE_D_EXTRAS",pageClass:com
   .rockstargames.gtav.web.foreclosures.ArcadeExtrasPage},ARCADE_GARAGE_PAGE:{name:"ARCADE_D_GARAGE",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeGaragePage},ARCADE_SUMMARY_PAGE:{name:"ARCADE_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.ArcadeSummaryPage},AUTO_SHOP_STYLE_PAGE:{name:"AUTO_D_SHOP_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopStylePage},AUTO_SHOP_TINT_PAGE:{name:"AUTO_D_SHOP_D_TINT",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopTintPage},AUTO_SHOP_EMBLEM_PAGE:{name:"AUTO_D_SHOP_D_EMBLEM",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopEmblemPage},AUTO_SHOP_STAFF_PAGE:{name:"AUTO_D_SHOP_D_STAFF",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage},AUTO_SHOP_EXTRAS_PAGE:{name:"AUTO_D_SHOP_D_EXTRAS",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopExtrasPage},AUTO_SHOP_MEMBERSHIP_PAGE:{name:"AUTO_D_SHOP_D_MEMBERSHIP",pageClass:com.rockstargames.gtav.web.foreclosures.AutoShopMembershipPage},AUTO_SHOP_SUMMARY_PAGE:{name:"AUTO_D_SHOP_D_SUMMARY",pageClass:com
   .rockstargames.gtav.web.foreclosures.AutoShopSummaryPage},SALVAGE_YARD_TINT_PAGE:{name:"SALVAGE_D_YARD_D_TINT",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardTintPage},SALVAGE_YARD_REPAIR_BAY_PAGE:{name:"SALVAGE_D_YARD_D_GET_D_TRADE_D_RATES",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardRepairBayPage},SALVAGE_YARD_TOW_TRUCK_PAGE:{name:"SALVAGE_D_YARD_D_TOW_D_TRUCK",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardTowTruckPage},SALVAGE_YARD_WALL_SAFE_PAGE:{name:"SALVAGE_D_YARD_D_WALL_D_SAFE",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardWallSafePage},SALVAGE_YARD_STAFF_PAGE:{name:"SALVAGE_D_YARD_D_STAFF",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardStaffPage},SALVAGE_YARD_SUMMARY_PAGE:{name:"SALVAGE_D_YARD_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.SalvageYardSummaryPage},BAIL_OFFICE_STAFF_PAGE:{name:"BAIL_D_OFFICE_D_STAFF",pageClass:com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage},BAIL_OFFICE_QUARTERS_PAGE:{name:"BAIL_D_OFFICE_D_QUARTERS",pageClass:com
   .rockstargames.gtav.web.foreclosures.BailOfficeQuartersPage},BAIL_OFFICE_GUN_LOCKER_PAGE:{name:"BAIL_D_OFFICE_D_GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.foreclosures.BailOfficeGunLockerPage},BAIL_OFFICE_TRANSPORTER_PAGE:{name:"BAIL_D_OFFICE_D_TRANSPORTER",pageClass:com.rockstargames.gtav.web.foreclosures.BailOfficeTransporterPage},BAIL_OFFICE_SUMMARY_PAGE:{name:"BAIL_D_OFFICE_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.BailOfficeSummaryPage},BAIL_OFFICE_STYLE_PAGE:{name:"BAIL_D_OFFICE_D_STYLE",pageClass:com.rockstargames.gtav.web.foreclosures.BailOfficeStylePage},GARMENT_FACTORY_PAGE:{name:"GARMENT_D_FACTORY",pageClass:com.rockstargames.gtav.web.foreclosures.BasicPropertyPage},MCKENZIE_HANGAR_PAGE:{name:"MCKENZIE_D_HANGAR",pageClass:com.rockstargames.gtav.web.foreclosures.BasicPropertyPage},CAR_WASH_TINT_PAGE:{name:"CAR_D_WASH_D_TINT",pageClass:com.rockstargames.gtav.web.foreclosures.CarWashTintPage},CAR_WASH_SUMMARY_PAGE:{name:"CAR_D_WASH_D_SUMMARY",pageClass:com
   .rockstargames.gtav.web.foreclosures.CarWashSummaryPage},HELITOURS_TINT_PAGE:{name:"HELITOURS_D_TINT",pageClass:com.rockstargames.gtav.web.foreclosures.HelitoursTintPage},HELITOURS_SUMMARY_PAGE:{name:"HELITOURS_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.HelitoursSummaryPage},WEED_SHOP_TINT_PAGE:{name:"WEED_D_SHOP_D_TINT",pageClass:com.rockstargames.gtav.web.foreclosures.WeedShopTintPage},WEED_SHOP_SUMMARY_PAGE:{name:"WEED_D_SHOP_D_SUMMARY",pageClass:com.rockstargames.gtav.web.foreclosures.WeedShopSummaryPage}};
   function FORECLOSURES_MAZE_D_BANK_COM()
   {
      super();
      this.isInBunkerFlow = false;
      this.isInHangarFlow = false;
      this.isInBaseFlow = false;
      this.isInNightclubFlow = false;
      this.isInArcadeFlow = false;
      this.isInAutoShopFlow = false;
      this.isInSalvageYardFlow = false;
      this.isInBailOfficeFlow = false;
      this.isInGarmentFactoryFlow = false;
      this.isInMcKenzieHangarFlow = false;
      this.isInCarWashFlow = false;
      this.isInHelitoursFlow = false;
      this.isInWeedShopFlow = false;
      this.videoDisabled = false;
      this.setSelectedClubhouse(-1);
      this.setSelectedBunker(-1);
      this.setSelectedHangar(-1);
      this.setSelectedBase(-1);
      this.setSelectedNightclub(-1);
      this.setSelectedArcade(-1);
      this.setSelectedAutoShop(-1);
      this.setSelectedSalvageYard(-1);
      this.setSelectedBailOffice(-1);
      this.setSelectedGarmentFactory(-1);
      this.setSelectedMcKenzieHangar(-1);
      this.setSelectedCarWash(-1);
      this.setSelectedHelitours(-1);
      this.setSelectedWeedShop(-1);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      this.browser.SUPRESS_HISTORY(false);
      if(this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.MAP_DATA_INDEX][0] == undefined)
      {
         if(this.mapFilters == -1)
         {
            this.mapFilters = com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CLUBHOUSES | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BUNKERS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HANGARS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BASES | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_NIGHTCLUBS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_ARCADES | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_AUTO_SHOPS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_SALVAGE_YARDS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BAIL_OFFICES | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_GARMENT_FACTORY | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_MCKENZIE_HANGAR | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CAR_WASH | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HELITOURS | com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_WEED_SHOP;
         }
      }
      else
      {
         this.mapFilters = this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.MAP_DATA_INDEX][0];
      }
      var _loc2_;
      var _loc3_;
      var _loc6_;
      var _loc4_;
      var _loc7_;
      var _loc17_;
      var _loc10_;
      var _loc8_;
      var _loc13_;
      var _loc15_;
      var _loc5_;
      var _loc11_;
      var _loc14_;
      var _loc12_;
      var _loc9_;
      var _loc16_;
      var _loc18_;
      if(this.currPage.name == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name)
      {
         this.clubhouses.length = 0;
         this.bunkers.length = 0;
         this.hangars.length = 0;
         this.bases.length = 0;
         this.nightclubs.length = 0;
         this.arcades.length = 0;
         this.autoShops.length = 0;
         this.salvageYards.length = 0;
         this.bailOffices.length = 0;
         this.garmentFactory = null;
         this.mcKenzieHangar = null;
         this.carWash = null;
         this.helitours = null;
         this.weedShop = null;
         _loc2_ = 3;
         _loc3_ = this.dataProviderUI.length;
         while(_loc2_ < _loc3_)
         {
            if(!(_loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_CLUBHOUSE_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER
            .OWNED_GARMENT_FACTORY_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_CAR_WASH_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HELITOURS_DATA_INDEX || _loc2_ == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_WEED_SHOP_DATA_INDEX))
            {
               if(this.dataProviderUI[_loc2_])
               {
                  _loc6_ = this.dataProviderUI[_loc2_][2] < 2;
                  _loc4_ = this.dataProviderUI[_loc2_][2] == 2;
                  _loc7_ = this.dataProviderUI[_loc2_][2] == 3;
                  _loc17_ = this.dataProviderUI[_loc2_][2] == 4;
                  _loc10_ = this.dataProviderUI[_loc2_][2] == 5;
                  _loc8_ = this.dataProviderUI[_loc2_][2] == 6;
                  _loc13_ = this.dataProviderUI[_loc2_][2] == 7;
                  _loc15_ = this.dataProviderUI[_loc2_][2] == 8;
                  _loc5_ = this.dataProviderUI[_loc2_][2] == 9;
                  _loc11_ = this.dataProviderUI[_loc2_][2] == 10;
                  _loc14_ = this.dataProviderUI[_loc2_][2] == 11;
                  _loc12_ = this.dataProviderUI[_loc2_][2] == 12;
                  _loc9_ = this.dataProviderUI[_loc2_][2] == 13;
                  _loc16_ = this.dataProviderUI[_loc2_][2] == 14;
                  if(_loc6_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[0][0];
                     this.clubhouses.push(new com.rockstargames.gtav.web.foreclosures.Clubhouse(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc4_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][0];
                     this.bunkers.push(new com.rockstargames.gtav.web.foreclosures.Bunker(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc7_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][0];
                     this.hangars.push(new com.rockstargames.gtav.web.foreclosures.Hangar(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc17_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][0];
                     this.bases.push(new com.rockstargames.gtav.web.foreclosures.Base(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc10_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][0];
                     this.nightclubs.push(new com.rockstargames.gtav.web.foreclosures.Nightclub(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc8_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][0];
                     this.arcades.push(new com.rockstargames.gtav.web.foreclosures.Arcade(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc13_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][0];
                     this.autoShops.push(new com.rockstargames.gtav.web.foreclosures.AutoShop(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc15_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][0];
                     this.salvageYards.push(new com.rockstargames.gtav.web.foreclosures.SalvageYard(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc5_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][0];
                     this.bailOffices.push(new com.rockstargames.gtav.web.foreclosures.BailOffice(this.dataProviderUI[_loc2_],_loc18_));
                  }
                  else if(_loc11_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_GARMENT_FACTORY_DATA_INDEX][0];
                     this.garmentFactory = new com.rockstargames.gtav.web.foreclosures.BasicProperty(this.dataProviderUI[_loc2_],_loc18_);
                  }
                  else if(_loc14_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_MCKENZIE_HANGAR_DATA_INDEX][0];
                     this.mcKenzieHangar = new com.rockstargames.gtav.web.foreclosures.BasicProperty(this.dataProviderUI[_loc2_],_loc18_);
                  }
                  else if(_loc12_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_CAR_WASH_DATA_INDEX][0];
                     this.carWash = new com.rockstargames.gtav.web.foreclosures.CarWash(this.dataProviderUI[_loc2_],_loc18_);
                  }
                  else if(_loc9_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HELITOURS_DATA_INDEX][0];
                     this.helitours = new com.rockstargames.gtav.web.foreclosures.Helitours(this.dataProviderUI[_loc2_],_loc18_);
                  }
                  else if(_loc16_)
                  {
                     _loc18_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_WEED_SHOP_DATA_INDEX][0];
                     this.weedShop = new com.rockstargames.gtav.web.foreclosures.WeedShop(this.dataProviderUI[_loc2_],_loc18_);
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
         com.rockstargames.gtav.web.foreclosures.MapPage(this.currPage).setMarkerData(this.clubhouses,this.bunkers,this.hangars,this.bases,this.nightclubs,this.arcades,this.autoShops,this.salvageYards,this.bailOffices,this.garmentFactory,this.mcKenzieHangar,this.carWash,this.helitours,this.weedShop);
      }
      this.currPage.setDisabledButtons();
   }
   function displayPage(pageName)
   {
      if(this.currPage.name == pageName)
      {
         return undefined;
      }
      if(!this.isMP)
      {
         this.setPage(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      for(var _loc3_ in com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES)
      {
         if(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES[_loc3_].pageClass);
            break;
         }
      }
   }
   function CLEANUP()
   {
      this.imageManager.dispose();
      this.imageManager = null;
      this.progressPanel.dispose();
      this.progressPanel = null;
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.currPage = null;
      this.clubhouses = null;
      this.bunkers = null;
      this.hangars = null;
      this.bases = null;
      this.nightclubs = null;
      this.arcades = null;
      this.autoShops = null;
      this.salvageYards = null;
      this.bailOffices = null;
      this.garmentFactory = null;
      this.mcKenzieHangar = null;
      this.carWash = null;
      this.helitours = null;
      this.weedShop = null;
      this.clubhouseToMarkAsPurchased = null;
      this.bunkerToMarkAsPurchased = null;
      this.hangarToMarkAsPurchased = null;
      this.baseToMarkAsPurchased = null;
      this.nightclubToMarkAsPurchased = null;
      this.arcadeToMarkAsPurchased = null;
      this.autoShopToMarkAsPurchased = null;
      this.salvageYardToMarkAsPurchased = null;
      this.bailOfficeToMarkAsPurchased = null;
      this.garmentFactoryToMarkAsPurchased = null;
      this.mcKenzieHangarToMarkAsPurchased = null;
      this.carWashToMarkAsPurchased = null;
      this.helitoursToMarkAsPurchased = null;
      this.weedShopToMarkAsPurchased = null;
      super.CLEANUP();
   }
   function showTradeInAlert()
   {
      return this.CONTENT.attachMovie("tradeInAlert","tradeInAlert",this.CONTENT.getNextHighestDepth());
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.displayConfig = this.browser.getConfig();
      this.imageManager = new com.rockstargames.gtav.web.foreclosures.ImageManager();
      this.clubhouses = [];
      this.bunkers = [];
      this.hangars = [];
      this.bases = [];
      this.nightclubs = [];
      this.arcades = [];
      this.autoShops = [];
      this.salvageYards = [];
      this.bailOffices = [];
      this.PAGE_NAMES[1] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SPLASH_PAGE.name;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.PAGE_NAMES[3] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MURAL_PAGE.name;
      this.PAGE_NAMES[4] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.STYLE_PAGE.name;
      this.PAGE_NAMES[5] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NAME_PAGE.name;
      this.PAGE_NAMES[6] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[7] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BIKE_SHOP_PAGE.name;
      this.PAGE_NAMES[8] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUMMARY_PAGE.name;
      this.PAGE_NAMES[9] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name;
      this.PAGE_NAMES[10] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name;
      this.PAGE_NAMES[11] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.FAILED_PAGE.name;
      this.PAGE_NAMES[12] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ERROR_PAGE.name;
      this.PAGE_NAMES[13] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.WAYPOINT_SET.name;
      this.PAGE_NAMES[14] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.EMBLEM_PAGE.name;
      this.PAGE_NAMES[15] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_STYLE_PAGE.name;
      this.PAGE_NAMES[16] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_QUARTERS_PAGE.name;
      this.PAGE_NAMES[17] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_FIRING_RANGE_PAGE.name;
      this.PAGE_NAMES[18] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[19] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_TRANSPORTATION_PAGE.name;
      this.PAGE_NAMES[20] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_SUMMARY_PAGE.name;
      this.PAGE_NAMES[21] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FLOORING_PAGE.name;
      this.PAGE_NAMES[22] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_STYLE_PAGE.name;
      this.PAGE_NAMES[23] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_LIGHTING_PAGE.name;
      this.PAGE_NAMES[24] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_QUARTERS_PAGE.name;
      this.PAGE_NAMES[25] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FURNITURE_PAGE.name;
      this.PAGE_NAMES[26] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_WORKSHOP_PAGE.name;
      this.PAGE_NAMES[27] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      this.PAGE_NAMES[28] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_STYLE_PAGE.name;
      this.PAGE_NAMES[29] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_GRAPHICS_PAGE.name;
      this.PAGE_NAMES[30] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_WEAPON_PAGE.name;
      this.PAGE_NAMES[31] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SECURITY_PAGE.name;
      this.PAGE_NAMES[32] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_LOUNGE_PAGE.name;
      this.PAGE_NAMES[33] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_QUARTERS_PAGE.name;
      this.PAGE_NAMES[34] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SUMMARY_PAGE.name;
      this.PAGE_NAMES[35] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_STYLE_PAGE.name;
      this.PAGE_NAMES[36] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_LIGHTING_PAGE.name;
      this.PAGE_NAMES[37] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_NAME_PAGE.name;
      this.PAGE_NAMES[38] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_STORAGE_PAGE.name;
      this.PAGE_NAMES[39] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DANCERS_PAGE.name;
      this.PAGE_NAMES[40] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DRY_ICE_PAGE.name;
      this.PAGE_NAMES[41] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.PAGE_NAMES[42] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_STYLE_PAGE.name;
      this.PAGE_NAMES[43] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_MURAL_PAGE.name;
      this.PAGE_NAMES[44] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_FLOOR_PAGE.name;
      this.PAGE_NAMES[46] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_NEONS_PAGE.name;
      this.PAGE_NAMES[45] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_EXTRAS_PAGE.name;
      this.PAGE_NAMES[47] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_GARAGE_PAGE.name;
      this.PAGE_NAMES[48] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      this.PAGE_NAMES[49] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STYLE_PAGE.name;
      this.PAGE_NAMES[50] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_TINT_PAGE.name;
      this.PAGE_NAMES[51] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EMBLEM_PAGE.name;
      this.PAGE_NAMES[52] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STAFF_PAGE.name;
      this.PAGE_NAMES[53] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EXTRAS_PAGE.name;
      this.PAGE_NAMES[54] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_MEMBERSHIP_PAGE.name;
      this.PAGE_NAMES[55] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      this.PAGE_NAMES[56] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TINT_PAGE.name;
      this.PAGE_NAMES[57] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_REPAIR_BAY_PAGE.name;
      this.PAGE_NAMES[58] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TOW_TRUCK_PAGE.name;
      this.PAGE_NAMES[59] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_WALL_SAFE_PAGE.name;
      this.PAGE_NAMES[60] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_STAFF_PAGE.name;
      this.PAGE_NAMES[61] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_SUMMARY_PAGE.name;
      this.PAGE_NAMES[62] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STAFF_PAGE.name;
      this.PAGE_NAMES[63] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_QUARTERS_PAGE.name;
      this.PAGE_NAMES[64] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[65] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_TRANSPORTER_PAGE.name;
      this.PAGE_NAMES[66] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_SUMMARY_PAGE.name;
      this.PAGE_NAMES[67] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STYLE_PAGE.name;
      this.PAGE_NAMES[68] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GARMENT_FACTORY_PAGE.name;
      this.PAGE_NAMES[69] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MCKENZIE_HANGAR_PAGE.name;
      this.PAGE_NAMES[70] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.CAR_WASH_TINT_PAGE.name;
      this.PAGE_NAMES[71] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.CAR_WASH_SUMMARY_PAGE.name;
      this.PAGE_NAMES[72] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HELITOURS_TINT_PAGE.name;
      this.PAGE_NAMES[73] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HELITOURS_SUMMARY_PAGE.name;
      this.PAGE_NAMES[74] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.WEED_SHOP_SUMMARY_PAGE.name;
      this.PAGE_NAMES[75] = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.WEED_SHOP_TINT_PAGE.name;
      var _loc3_ = 2;
      while(_loc3_ <= 75)
      {
         this.CAN_STORE_PAGE[_loc3_] = false;
         _loc3_ = _loc3_ + 1;
      }
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("progressPanel","progressPanel",this.CONTENT.getNextHighestDepth(),{_x:200});
      this.progressPanel = new com.rockstargames.gtav.web.foreclosures.ProgressPanel(_loc4_,this);
      this.header = this.CONTENT.attachMovie("websiteHeader","websiteHeader",this.CONTENT.getNextHighestDepth());
      this.header._y = - this.header._height;
      this.browser.SET_TITLEBAR_TEXT(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.CONTENT.websiteHeader.titlebar,"FORECLOSURES_TOOLBAR_MESSAGE"),14474460);
   }
   function setPage(pageName, PageClass)
   {
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.dataTextScope.length = 0;
      var _loc2_ = this.currPage == undefined;
      this.currPage = new PageClass(this,this.pageContainer,pageName,_loc2_,this.progressPanel,this.header);
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         if(tf.html)
         {
            tf.htmlText = label;
         }
         else
         {
            tf.text = label;
         }
      }
      else
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(tf,label);
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = 1;
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
}
