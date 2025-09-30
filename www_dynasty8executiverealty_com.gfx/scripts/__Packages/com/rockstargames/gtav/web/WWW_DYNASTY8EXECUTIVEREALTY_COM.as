class com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var _selectedAgencyID;
   var _selectedOfficeID;
   var agencies;
   var agencyArmory;
   var agencyArt;
   var agencyHighlight;
   var agencyQuarters;
   var agencyToMarkAsPurchased;
   var agencyVehicle;
   var agencyWallpaper;
   var bed;
   var browser;
   var colour;
   var currPage;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayConfig;
   var font;
   var garage1Equipped;
   var garage1Lighting;
   var garage1Number;
   var garage1Style;
   var garage2Equipped;
   var garage2Lighting;
   var garage2Number;
   var garage2Style;
   var garage3Equipped;
   var garage3Lighting;
   var garage3Number;
   var garage3Style;
   var gunLocker;
   var header;
   var imageManager;
   var isMP;
   var modShop;
   var modShopEquipped;
   var officeToMarkAsPurchased;
   var offices;
   var pageContainer;
   var personnel;
   var progressPanel;
   var style;
   var styleWhenLastOnSignagePage;
   var vault;
   static var PAGES = {SPLASH_PAGE:{name:"PAGE1",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SplashPage},MAP_PAGE:{name:"OFFICES",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage},STYLE_PAGE:{name:"DECOR",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.StylePage},PERSONNEL_PAGE:{name:"PERSONNEL",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PersonnelPage},SIGNAGE_PAGE:{name:"ORGANIZATION_D_NAME",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage},GUN_LOCKER_PAGE:{name:"GUN_D_LOCKER",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GunLockerPage},VAULT_PAGE:{name:"SAFE",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.VaultPage},BED_PAGE:{name:"ACCOMMODATION",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.BedPage},SUMMARY_PAGE:{name:"SUMMARY",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SummaryPage},PURCHASE_PAGE:{name:"PURCHASE",pageClass:com.rockstargames
   .gtav.web.dynasty8ExecutiveRealty.PurchasePage},SUCCESS_PAGE:{name:"PURCHASE_D_SUCCESS",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage},FAILED_PAGE:{name:"PURCHASE_D_FAILED",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage},ERROR_PAGE:{name:"PURCHASE_D_ERROR",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage},WAYPOINT_SET:{name:"WAYPOINT_D_SET",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.PurchasePage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_CONSTRUCTION",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.UnderConstructionPage},GARAGE_1_PAGE:{name:"GARAGE_D_LEVEL_D_1",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage1Page},GARAGE_2_PAGE:{name:"GARAGE_D_LEVEL_D_2",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage2Page},GARAGE_3_PAGE:{name:"GARAGE_D_LEVEL_D_3",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage3Page},MOD_SHOP_PAGE:{name:"MOD_D_SHOP",pageClass:com
   .rockstargames.gtav.web.dynasty8ExecutiveRealty.ModShopPage},AGENCY_ART_PAGE:{name:"AGENCY_D_ART",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage},AGENCY_WALLPAPER_PAGE:{name:"AGENCY_D_WALLPAPER",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage},AGENCY_HIGHLIGHT_PAGE:{name:"AGENCY_D_HIGHLIGHT",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage},AGENCY_ARMORY_PAGE:{name:"AGENCY_D_ARMORY",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArmoryPage},AGENCY_QUARTERS_PAGE:{name:"AGENCY_D_PERSONAL_D_QUARTERS",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyQuartersPage},AGENCY_VEHICLE_PAGE:{name:"AGENCY_D_VEHICLE_D_WORKSHOP",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyVehiclePage},AGENCY_SUMMARY_PAGE:{name:"AGENCY_D_SUMMARY",pageClass:com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencySummaryPage}};
   static var OWNED_OFFICE_DATA_INDEX = 0;
   static var OFFICE_DATA_START_INDEX = 3;
   static var OFFICE_DATA_END_INDEX = 6;
   static var OWNED_AGENCY_DATA_INDEX = 7;
   static var AGENCY_DATA_START_INDEX = 8;
   static var AGENCY_DATA_END_INDEX = 11;
   function WWW_DYNASTY8EXECUTIVEREALTY_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.defaultButtonOnColour = 3355443;
      this.defaultButtonOffColour = 0;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.GARAGE_1,0);
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.GARAGE_2,0);
      this.setSelectedOffice(-1);
      this.setSelectedAgency(-1);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      this.browser.SUPRESS_HISTORY(false);
      if(this.currPage.name == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name)
      {
         this.rebuildOfficeData();
         this.rebuildAgencyData();
         com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage(this.currPage).setPropertyData(this.offices,this.agencies);
      }
   }
   function rebuildOfficeData()
   {
      this.offices.length = 0;
      var _loc2_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OFFICE_DATA_START_INDEX;
      var _loc3_;
      var _loc4_;
      while(_loc2_ <= com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OFFICE_DATA_END_INDEX)
      {
         if(this.dataProviderUI[_loc2_])
         {
            _loc3_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[0][0];
            _loc4_ = _loc3_ && this.dataProviderUI[0][11] > 0;
            this.offices.push(new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office(this.dataProviderUI[_loc2_],_loc3_,_loc4_));
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function rebuildAgencyData()
   {
      this.agencies.length = 0;
      var _loc2_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.AGENCY_DATA_START_INDEX;
      var _loc3_;
      while(_loc2_ <= com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.AGENCY_DATA_END_INDEX)
      {
         if(this.dataProviderUI[_loc2_])
         {
            _loc3_ = this.dataProviderUI[_loc2_][0] == this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][0];
            this.agencies.push(new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency(this.dataProviderUI[_loc2_],_loc3_));
         }
         _loc2_ = _loc2_ + 1;
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
         this.setPage(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      if(pageName == com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.WAYPOINT_SET.name && this.currPage.name != com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name)
      {
         return undefined;
      }
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES)
      {
         if(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES[_loc3_].pageClass);
            break;
         }
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      this.imageManager.textureLoaded(txd);
   }
   function CLEANUP()
   {
      this.imageManager.dispose();
      this.progressPanel.dispose();
      if(this.currPage)
      {
         this.currPage.dispose();
      }
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
   function setSelectedOffice(id)
   {
      this._selectedOfficeID = id;
      if(id == this.purchasedOfficeID && id != -1)
      {
         this.style = this.purchasedStyle;
         this.personnel = this.purchasedPersonnel;
         this.font = this.purchasedFont;
         this.colour = this.purchasedColour;
         this.gunLocker = this.purchasedGunLocker;
         this.vault = this.purchasedVault;
         this.bed = this.purchasedBed;
         this.styleWhenLastOnSignagePage = this.purchasedStyle;
         this.garage1Equipped = this.purchasedGarage1Equipped;
         this.garage1Style = this.purchasedGarage1Style;
         this.garage1Lighting = this.purchasedGarage1Lighting;
         this.garage1Number = this.purchasedGarage1Number;
         this.garage2Equipped = this.purchasedGarage2Equipped;
         this.garage2Style = this.purchasedGarage2Style;
         this.garage2Lighting = this.purchasedGarage2Lighting;
         this.garage2Number = this.purchasedGarage2Number;
         this.garage3Equipped = this.purchasedGarage3Equipped;
         this.garage3Style = this.purchasedGarage3Style;
         this.garage3Lighting = this.purchasedGarage3Lighting;
         this.garage3Number = this.purchasedGarage3Number;
         this.modShopEquipped = this.purchasedModShopEquipped;
         this.modShop = this.purchasedModShop;
      }
      else
      {
         this.style = -1;
         this.personnel = -1;
         this.font = -1;
         this.colour = -1;
         this.gunLocker = -1;
         this.vault = -1;
         this.bed = -1;
         this.styleWhenLastOnSignagePage = -1;
         this.garage1Style = -1;
         this.garage1Lighting = -1;
         this.garage1Number = -1;
         this.garage1Equipped = -1;
         this.garage2Style = -1;
         this.garage2Lighting = -1;
         this.garage2Number = -1;
         this.garage2Equipped = -1;
         this.garage3Style = -1;
         this.garage3Lighting = -1;
         this.garage3Number = -1;
         this.garage3Equipped = -1;
         this.modShop = -1;
         this.modShopEquipped = -1;
      }
   }
   function get selectedOfficeID()
   {
      return this._selectedOfficeID;
   }
   function getSelectedOffice()
   {
      if(this._selectedOfficeID == -1)
      {
         return null;
      }
      return this.getOfficeByID(this._selectedOfficeID);
   }
   function getOfficeByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.offices.length;
      while(_loc2_ < _loc3_)
      {
         if(this.offices[_loc2_].id == id)
         {
            return this.offices[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function hasOwnedGarage()
   {
      var _loc2_ = 0;
      var _loc3_ = this.offices.length;
      while(_loc2_ < _loc3_)
      {
         if(this.offices[_loc2_].garageIsOwned)
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function get purchasedOfficeID()
   {
      return this.dataProviderUI[0][0];
   }
   function get purchasedStyle()
   {
      return this.dataProviderUI[0][1];
   }
   function get purchasedPersonnel()
   {
      return this.dataProviderUI[0][2];
   }
   function get purchasedFont()
   {
      return this.dataProviderUI[0][3];
   }
   function get purchasedColour()
   {
      return this.dataProviderUI[0][4];
   }
   function get purchasedSignage()
   {
      return this.dataProviderUI[0][5];
   }
   function get signage()
   {
      return this.dataProviderUI[0][6];
   }
   function get purchasedGunLocker()
   {
      return this.dataProviderUI[0][7];
   }
   function get purchasedVault()
   {
      return this.dataProviderUI[0][8];
   }
   function get purchasedBed()
   {
      return this.dataProviderUI[0][9];
   }
   function get fontsSupported()
   {
      return this.dataProviderUI[0][10];
   }
   function get purchasedGarage1Equipped()
   {
      return Math.max(this.dataProviderUI[0][11],0);
   }
   function get purchasedGarage1Style()
   {
      return this.dataProviderUI[0][12];
   }
   function get purchasedGarage1Lighting()
   {
      return this.dataProviderUI[0][13];
   }
   function get purchasedGarage1Number()
   {
      return this.dataProviderUI[0][14];
   }
   function get purchasedGarage2Equipped()
   {
      return Math.max(this.dataProviderUI[0][15],0);
   }
   function get purchasedGarage2Style()
   {
      return this.dataProviderUI[0][16];
   }
   function get purchasedGarage2Lighting()
   {
      return this.dataProviderUI[0][17];
   }
   function get purchasedGarage2Number()
   {
      return this.dataProviderUI[0][18];
   }
   function get purchasedGarage3Equipped()
   {
      return Math.max(this.dataProviderUI[0][19],0);
   }
   function get purchasedGarage3Style()
   {
      return this.dataProviderUI[0][20];
   }
   function get purchasedGarage3Lighting()
   {
      return this.dataProviderUI[0][21];
   }
   function get purchasedGarage3Number()
   {
      return this.dataProviderUI[0][22];
   }
   function get purchasedModShopEquipped()
   {
      return this.dataProviderUI[0][23];
   }
   function get purchasedModShop()
   {
      return this.dataProviderUI[0][24];
   }
   function dispatchPlayerSelections()
   {
      if(this.style == -1)
      {
         this.style = 0;
      }
      if(this.personnel == -1)
      {
         this.personnel = 0;
      }
      if(this.font == -1)
      {
         this.font = 0;
      }
      if(this.colour == -1)
      {
         this.colour = 0;
      }
      if(this.gunLocker == -1)
      {
         this.gunLocker = 0;
      }
      if(this.vault == -1)
      {
         this.vault = 0;
      }
      if(this.bed == -1)
      {
         this.bed = 0;
      }
      var _loc14_ = 6;
      var _loc12_ = 4;
      var _loc13_ = 1;
      var _loc10_ = 4;
      var _loc15_ = 4;
      var _loc9_ = 1;
      var _loc11_ = 1;
      var _loc16_ = 1;
      var _loc3_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.offices.length;
      while(_loc2_ < _loc4_)
      {
         if(this.offices[_loc2_].id == this._selectedOfficeID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc3_;
      _loc3_ += _loc14_;
      _loc5_ |= this.style << _loc3_;
      _loc3_ += _loc12_;
      _loc5_ |= this.personnel << _loc3_;
      _loc3_ += _loc13_;
      _loc5_ |= this.font << _loc3_;
      _loc3_ += _loc10_;
      _loc5_ |= this.colour << _loc3_;
      _loc3_ += _loc15_;
      _loc5_ |= this.gunLocker << _loc3_;
      _loc3_ += _loc9_;
      _loc5_ |= this.vault << _loc3_;
      _loc3_ += _loc11_;
      _loc5_ |= this.bed << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.OFFICE,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DYNASTY8EXECUTIVEREALTY_COM::OFFICE DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [OFFICE ID: " + this._selectedOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("OFFICE INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.style);
      com.rockstargames.ui.utils.Debug.log("PERSONNEL: " + this.personnel);
      com.rockstargames.ui.utils.Debug.log("FONT: " + this.font);
      com.rockstargames.ui.utils.Debug.log("COLOUR: " + this.colour);
      com.rockstargames.ui.utils.Debug.log("SIGNAGE: " + this.signage);
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.gunLocker);
      com.rockstargames.ui.utils.Debug.log("VAULT: " + this.vault);
      com.rockstargames.ui.utils.Debug.log("BED: " + this.bed);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD [OFFICE]: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      _loc5_ = 0;
      _loc3_ = 18;
      var _loc7_ = Math.max(0,this.purchasedModShopEquipped);
      var _loc8_ = Math.max(0,this.purchasedModShop);
      _loc5_ |= _loc7_ << _loc3_;
      _loc3_ = _loc3_ + 1;
      _loc5_ |= _loc8_ << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.GARAGE_2,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DYNASTY8EXECUTIVEREALTY_COM::MOD SHOP DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [OFFICE ID: " + this._selectedOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("MODSHOP EQUIPPED: " + _loc7_);
      com.rockstargames.ui.utils.Debug.log("MODSHOP STYLE: " + _loc8_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD [MODSHOP]: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function dispatchPlayerGarageSelections()
   {
      if(this.garage1Equipped == -1)
      {
         this.garage1Equipped = 1;
      }
      if(this.garage1Style == -1)
      {
         this.garage1Style = 0;
      }
      if(this.garage1Lighting == -1)
      {
         this.garage1Lighting = 0;
      }
      if(this.garage1Number == -1)
      {
         this.garage1Number = 0;
      }
      if(this.garage2Equipped == -1)
      {
         this.garage2Equipped = 0;
      }
      if(this.garage2Style == -1)
      {
         this.garage2Style = 0;
      }
      if(this.garage2Lighting == -1)
      {
         this.garage2Lighting = 0;
      }
      if(this.garage2Number == -1)
      {
         this.garage2Number = 0;
      }
      if(this.garage3Equipped == -1)
      {
         this.garage3Equipped = 0;
      }
      if(this.garage3Style == -1)
      {
         this.garage3Style = 0;
      }
      if(this.garage3Lighting == -1)
      {
         this.garage3Lighting = 0;
      }
      if(this.garage3Number == -1)
      {
         this.garage3Number = 0;
      }
      if(this.modShopEquipped == -1)
      {
         this.modShopEquipped = 0;
      }
      if(this.modShop == -1)
      {
         this.modShop = 0;
      }
      var _loc11_ = 7;
      var _loc9_ = 2;
      var _loc8_ = 4;
      var _loc10_ = 4;
      var _loc12_ = 5;
      var _loc7_ = 1;
      var _loc3_;
      var _loc4_;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc5_ = this.offices.length;
      while(_loc2_ < _loc5_)
      {
         if(this.offices[_loc2_].id == this._selectedOfficeID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ = 0;
      _loc4_ = 0;
      _loc4_ |= _loc6_ << _loc3_;
      _loc3_ += _loc11_;
      _loc4_ |= this.garage1Equipped << _loc3_;
      _loc3_ += _loc7_;
      _loc4_ |= this.garage1Style << _loc3_;
      _loc3_ += _loc9_;
      _loc4_ |= this.garage1Lighting << _loc3_;
      _loc3_ += _loc8_;
      _loc4_ |= this.garage1Number << _loc3_;
      _loc3_ += _loc10_;
      _loc4_ |= this.garage2Equipped << _loc3_;
      _loc3_ += _loc7_;
      _loc4_ |= this.garage2Style << _loc3_;
      _loc3_ += _loc9_;
      _loc4_ |= this.garage2Lighting << _loc3_;
      _loc3_ += _loc8_;
      _loc4_ |= this.garage2Number << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.GARAGE_1,_loc4_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DYNASTY8EXECUTIVEREALTY_COM::GARAGE DATA OUT (global flag " + com.rockstargames.ui.game.GameGlobals.GARAGE_1 + ")");
      com.rockstargames.ui.utils.Debug.log("    [OFFICE ID: " + this._selectedOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("OFFICE INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 EQUIPPED: " + this.garage1Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 STYLE: " + this.garage1Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 LIGHTING: " + this.garage1Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 NUMBER: " + this.garage1Number);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 EQUIPPED: " + this.garage2Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 STYLE: " + this.garage2Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 LIGHTING: " + this.garage2Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 NUMBER: " + this.garage2Number);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD [GARAGE]: " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      _loc3_ = 0;
      _loc4_ = 0;
      _loc4_ |= _loc6_ << _loc3_;
      _loc3_ += _loc11_;
      _loc4_ |= this.garage3Equipped << _loc3_;
      _loc3_ += _loc7_;
      _loc4_ |= this.garage3Style << _loc3_;
      _loc3_ += _loc9_;
      _loc4_ |= this.garage3Lighting << _loc3_;
      _loc3_ += _loc8_;
      _loc4_ |= this.garage3Number << _loc3_;
      _loc3_ += _loc10_;
      _loc4_ |= this.modShopEquipped << _loc3_;
      _loc3_ += _loc7_;
      _loc4_ |= this.modShop << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.GARAGE_2,_loc4_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DYNASTY8EXECUTIVEREALTY_COM::GARAGE DATA OUT (global flag " + com.rockstargames.ui.game.GameGlobals.GARAGE_2 + ")");
      com.rockstargames.ui.utils.Debug.log("    [OFFICE ID: " + this._selectedOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("OFFICE INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 EQUIPPED: " + this.garage3Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 STYLE: " + this.garage3Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 LIGHTING: " + this.garage3Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 NUMBER: " + this.garage3Number);
      com.rockstargames.ui.utils.Debug.log("MOD SHOP EQUIPPED: " + this.modShopEquipped);
      com.rockstargames.ui.utils.Debug.log("MOD SHOP: " + this.modShop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD [GARAGE]: " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedOffice()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.offices.length)
      {
         this.offices[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.officeToMarkAsPurchased.playerHasPurchased();
      this.officeToMarkAsPurchased = null;
   }
   function setSelectedAgency(id)
   {
      this._selectedAgencyID = id;
      if(id == this.purchasedAgencyID && id != -1)
      {
         this.agencyArt = this.purchasedAgencyArt;
         this.agencyWallpaper = this.purchasedAgencyWallpaper;
         this.agencyHighlight = this.purchasedAgencyHighlight;
         this.agencyVehicle = this.purchasedAgencyVehicle;
         this.agencyArmory = this.purchasedAgencyArmory;
         this.agencyQuarters = this.purchasedAgencyQuarters;
      }
      else
      {
         this.agencyArt = -1;
         this.agencyWallpaper = -1;
         this.agencyHighlight = -1;
         this.agencyVehicle = -1;
         this.agencyArmory = -1;
         this.agencyQuarters = -1;
      }
   }
   function get selectedAgencyID()
   {
      return this._selectedAgencyID;
   }
   function getSelectedAgency()
   {
      if(this._selectedAgencyID == -1)
      {
         return null;
      }
      return this.getAgencyByID(this._selectedAgencyID);
   }
   function getAgencyByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.agencies.length;
      while(_loc2_ < _loc3_)
      {
         if(this.agencies[_loc2_].id == id)
         {
            return this.agencies[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedAgencyID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][0];
   }
   function get purchasedAgencyArt()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][1];
   }
   function get purchasedAgencyWallpaper()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][2];
   }
   function get purchasedAgencyHighlight()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][3];
   }
   function get purchasedAgencyVehicle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][4];
   }
   function get purchasedAgencyArmory()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][5];
   }
   function get purchasedAgencyQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.OWNED_AGENCY_DATA_INDEX][6];
   }
   function dispatchPlayerAgencySelections()
   {
      if(this.agencyArt == -1)
      {
         this.agencyArt = 0;
      }
      if(this.agencyWallpaper == -1)
      {
         this.agencyWallpaper = 0;
      }
      if(this.agencyHighlight == -1)
      {
         this.agencyHighlight = 0;
      }
      if(this.agencyVehicle == -1)
      {
         this.agencyVehicle = 0;
      }
      if(this.agencyArmory == -1)
      {
         this.agencyArmory = 0;
      }
      if(this.agencyQuarters == -1)
      {
         this.agencyQuarters = 0;
      }
      var _loc10_ = 6;
      var _loc7_ = 2;
      var _loc12_ = 4;
      var _loc8_ = 4;
      var _loc13_ = 1;
      var _loc9_ = 1;
      var _loc11_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.agencies.length;
      while(_loc2_ < _loc3_)
      {
         if(this.agencies[_loc2_].id == this._selectedAgencyID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.agencyArt << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.agencyWallpaper << _loc4_;
      _loc4_ += _loc12_;
      _loc5_ |= this.agencyHighlight << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.agencyVehicle << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.agencyArmory << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.agencyQuarters << _loc4_;
      _loc4_ += _loc11_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.OFFICE,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("WWW_DYNASTY8EXECUTIVEREALTY_COM::AGENCY DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [AGENCY ID: " + this._selectedAgencyID + "]");
      com.rockstargames.ui.utils.Debug.log("AGENCY INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("ART: " + this.agencyArt);
      com.rockstargames.ui.utils.Debug.log("WALLPAPER: " + this.agencyWallpaper);
      com.rockstargames.ui.utils.Debug.log("HIGHLIGHT: " + this.agencyHighlight);
      com.rockstargames.ui.utils.Debug.log("VEHICLE: " + this.agencyVehicle);
      com.rockstargames.ui.utils.Debug.log("ARMORY: " + this.agencyArmory);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.agencyQuarters);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD [AGENCY]: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedAgency()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.agencies.length)
      {
         this.agencies[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.agencyToMarkAsPurchased.playerHasPurchased();
      this.agencyToMarkAsPurchased = null;
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
      this.imageManager = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.ImageManager();
      this.offices = [];
      this.agencies = [];
      this.PAGE_NAMES[1] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SPLASH_PAGE.name;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name;
      this.PAGE_NAMES[3] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.STYLE_PAGE.name;
      this.PAGE_NAMES[4] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PERSONNEL_PAGE.name;
      this.PAGE_NAMES[5] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SIGNAGE_PAGE.name;
      this.PAGE_NAMES[6] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GUN_LOCKER_PAGE.name;
      this.PAGE_NAMES[7] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.VAULT_PAGE.name;
      this.PAGE_NAMES[8] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      this.PAGE_NAMES[9] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      this.PAGE_NAMES[10] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PURCHASE_PAGE.name;
      this.PAGE_NAMES[11] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUCCESS_PAGE.name;
      this.PAGE_NAMES[12] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.FAILED_PAGE.name;
      this.PAGE_NAMES[13] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.ERROR_PAGE.name;
      this.PAGE_NAMES[14] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.WAYPOINT_SET.name;
      this.PAGE_NAMES[15] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_1_PAGE.name;
      this.PAGE_NAMES[16] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_2_PAGE.name;
      this.PAGE_NAMES[17] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_3_PAGE.name;
      this.PAGE_NAMES[18] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MOD_SHOP_PAGE.name;
      this.PAGE_NAMES[19] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ART_PAGE.name;
      this.PAGE_NAMES[20] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_WALLPAPER_PAGE.name;
      this.PAGE_NAMES[21] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_HIGHLIGHT_PAGE.name;
      this.PAGE_NAMES[22] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ARMORY_PAGE.name;
      this.PAGE_NAMES[23] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_QUARTERS_PAGE.name;
      this.PAGE_NAMES[24] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_VEHICLE_PAGE.name;
      this.PAGE_NAMES[25] = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      var _loc3_ = 2;
      while(_loc3_ <= 25)
      {
         this.CAN_STORE_PAGE[_loc3_] = false;
         _loc3_ = _loc3_ + 1;
      }
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("progressPanel","progressPanel",this.CONTENT.getNextHighestDepth(),{_x:200});
      this.progressPanel = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.ProgressPanel(_loc4_,this);
      this.header = this.CONTENT.attachMovie("websiteHeader","websiteHeader",this.CONTENT.getNextHighestDepth());
      this.header._y = - this.header._height;
      this.browser.SET_TITLEBAR_TEXT(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.CONTENT.websiteHeader.titlebar,"DYN8_EXEC_TOOLBAR_MESSAGE"),14474460);
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
   function logState()
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.offices.length;
      while(_loc2_ < _loc3_)
      {
         if(this.offices[_loc2_].id == this._selectedOfficeID)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("CURRENT CHOICES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("    [OFFICE ID: " + this._selectedOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("OFFICE INDEX: " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.style);
      com.rockstargames.ui.utils.Debug.log("PERSONNEL: " + this.personnel);
      com.rockstargames.ui.utils.Debug.log("FONT: " + this.font);
      com.rockstargames.ui.utils.Debug.log("COLOUR: " + this.colour);
      com.rockstargames.ui.utils.Debug.log("SIGNAGE: \"" + this.signage + "\"");
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.gunLocker);
      com.rockstargames.ui.utils.Debug.log("VAULT: " + this.vault);
      com.rockstargames.ui.utils.Debug.log("BED: " + this.bed);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 EQUIPPED: " + this.garage1Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 STYLE: " + this.garage1Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 LIGHTING: " + this.garage1Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 1 NUMBER: " + this.garage1Number);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 EQUIPPED: " + this.garage2Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 STYLE: " + this.garage2Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 LIGHTING: " + this.garage2Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 2 NUMBER: " + this.garage2Number);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 EQUIPPED: " + this.garage3Equipped);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 STYLE: " + this.garage3Style);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 LIGHTING: " + this.garage3Lighting);
      com.rockstargames.ui.utils.Debug.log("GARAGE 3 NUMBER: " + this.garage3Number);
      com.rockstargames.ui.utils.Debug.log("MOD SHOP EQUIPPED: " + this.modShopEquipped);
      com.rockstargames.ui.utils.Debug.log("MOD SHOP: " + this.modShop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREVIOUS PURCHASES...");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("PREV OFFICE ID: " + this.purchasedOfficeID);
      com.rockstargames.ui.utils.Debug.log("PREV STYLE: " + this.purchasedStyle);
      com.rockstargames.ui.utils.Debug.log("PREV PERSONNEL: " + this.purchasedPersonnel);
      com.rockstargames.ui.utils.Debug.log("PREV FONT: " + this.purchasedFont);
      com.rockstargames.ui.utils.Debug.log("PREV COLOUR: " + this.purchasedColour);
      com.rockstargames.ui.utils.Debug.log("PREV SIGNAGE: \"" + this.purchasedSignage + "\"");
      com.rockstargames.ui.utils.Debug.log("PREV GUN LOCKER: " + this.purchasedGunLocker);
      com.rockstargames.ui.utils.Debug.log("PREV VAULT: " + this.purchasedVault);
      com.rockstargames.ui.utils.Debug.log("PREV BED: " + this.purchasedBed);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 1 EQUIPPED: " + this.purchasedGarage1Equipped);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 1 STYLE: " + this.purchasedGarage1Style);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 1 LIGHTING: " + this.purchasedGarage1Lighting);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 1 NUMBER: " + this.purchasedGarage1Number);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 2 EQUIPPED: " + this.purchasedGarage2Equipped);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 2 STYLE: " + this.purchasedGarage2Style);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 2 LIGHTING: " + this.purchasedGarage2Lighting);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 2 NUMBER: " + this.purchasedGarage2Number);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 3 EQUIPPED: " + this.purchasedGarage3Equipped);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 3 STYLE: " + this.purchasedGarage3Style);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 3 LIGHTING: " + this.purchasedGarage3Lighting);
      com.rockstargames.ui.utils.Debug.log("PREV GARAGE 3 NUMBER: " + this.purchasedGarage3Number);
      com.rockstargames.ui.utils.Debug.log("PREV MOD SHOP EQUIPPED: " + this.purchasedModShopEquipped);
      com.rockstargames.ui.utils.Debug.log("PREV MOD SHOP: " + this.purchasedModShop);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
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
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(tf,label);
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
