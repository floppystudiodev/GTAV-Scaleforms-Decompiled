class com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER extends com.rockstargames.ui.core.BaseWebsite
{
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var mapFilters;
   var imageManager;
   var videoDisabled;
   var currPage;
   var _selectedClubhouseID;
   var wall;
   var hanging;
   var furniture;
   var mural;
   var font;
   var fontColour;
   var emblem;
   var hideSignage;
   var gunLocker;
   var bikeShop;
   var clubhouses;
   var dataProviderUI;
   var clubhouseToMarkAsPurchased;
   var _selectedBunkerID;
   var bunkerStyle;
   var quarters;
   var firingRange;
   var bunkerGunLocker;
   var transportation;
   var bunkers;
   var bunkerToMarkAsPurchased;
   var _selectedHangarID;
   var hangarStyle;
   var hangarLighting;
   var hangarDecal;
   var hangarFurniture;
   var hangarQuarters;
   var hangarWorkshop;
   var hangars;
   var hangarToMarkAsPurchased;
   var _selectedBaseID;
   var baseStyle;
   var baseGraphics;
   var baseWeapon;
   var baseSecurity;
   var baseLounge;
   var baseQuarters;
   var baseWindow;
   var bases;
   var baseToMarkAsPurchased;
   var _selectedNightclubID;
   var nightclubStyle;
   var nightclubLighting;
   var nightclubDancers;
   var nightclubStorage;
   var nightclubGarage;
   var nightclubName;
   var nightclubDryIce;
   var nightclubs;
   var nightclubToMarkAsPurchased;
   var _selectedArcadeID;
   var arcadeFloor;
   var arcadeStyle;
   var arcadeMural;
   var arcadeQuarters;
   var arcadeGarage;
   var arcadeNeon;
   var arcadeHighScores;
   var arcades;
   var arcadeToMarkAsPurchased;
   var _selectedAutoShopID;
   var autoShopStyle;
   var autoShopTint;
   var autoShopEmblem;
   var autoShopName;
   var autoShopStaff1;
   var autoShopStaff2;
   var autoShopCarLift;
   var autoShopQuarters;
   var autoShopMembership;
   var autoShops;
   var autoShopToMarkAsPurchased;
   var _selectedSalvageYardID;
   var salvageYardTint;
   var salvageYardRepairBay;
   var salvageYardTowTruck;
   var salvageYardWallSafe;
   var salvageYardStaff;
   var salvageYards;
   var salvageYardToMarkAsPurchased;
   var _selectedBailOfficeID;
   var bailOfficeStaff1;
   var bailOfficeStaff2;
   var bailOfficeQuarters;
   var bailOfficeGunLocker;
   var bailOfficeTransporter;
   var bailOfficeStyle;
   var bailOffices;
   var bailOfficeToMarkAsPurchased;
   var numBaseStyles = 9;
   var numBaseLounges = 3;
   static var OWNED_CLUBHOUSE_DATA_INDEX = 0;
   static var OWNED_BUNKER_DATA_INDEX = 15;
   static var OWNED_HANGAR_DATA_INDEX = 47;
   static var OWNED_BASE_DATA_INDEX = 60;
   static var OWNED_NIGHTCLUB_DATA_INDEX = 70;
   static var OWNED_ARCADE_DATA_INDEX = 90;
   static var OWNED_AUTO_SHOP_DATA_INDEX = 100;
   static var OWNED_SALVAGE_YARD_DATA_INDEX = 106;
   static var OWNED_BAIL_OFFICE_DATA_INDEX = 112;
   static var MAP_DATA_INDEX = 118;
   function FORECLOSURES_MAZE_D_BANK_COM_WRAPPER()
   {
      super();
      _global.gfxExtensions = true;
      this.defaultButtonOnColour = 3355443;
      this.defaultButtonOffColour = 0;
      this.mapFilters = -1;
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      this.imageManager.textureLoaded(txd);
   }
   function DISABLE_VIDEO(isDisabled)
   {
      this.videoDisabled = isDisabled !== false;
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
   function setSelectedClubhouse(id)
   {
      this._selectedClubhouseID = id;
      if(id == this.purchasedClubhouseID && id != -1)
      {
         this.wall = this.purchasedWall;
         this.hanging = this.purchasedHanging;
         this.furniture = this.purchasedFurniture;
         this.mural = this.purchasedMural;
         this.font = this.purchasedFont;
         this.fontColour = this.purchasedFontColour;
         this.emblem = this.purchasedEmblem;
         this.hideSignage = this.purchasedHideSignage;
         this.gunLocker = this.purchasedGunLocker;
         this.bikeShop = this.purchasedBikeShop;
      }
      else
      {
         this.wall = -1;
         this.hanging = -1;
         this.furniture = -1;
         this.mural = -1;
         this.font = -1;
         this.fontColour = -1;
         this.emblem = -1;
         this.hideSignage = -1;
         this.gunLocker = -1;
         this.bikeShop = -1;
      }
   }
   function get selectedClubhouseID()
   {
      return this._selectedClubhouseID;
   }
   function getSelectedClubhouse()
   {
      if(this._selectedClubhouseID == -1)
      {
         return null;
      }
      return this.getClubhouseByID(this._selectedClubhouseID);
   }
   function getClubhouseByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.clubhouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.clubhouses[_loc2_].id == id)
         {
            return this.clubhouses[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getSelectedClubhouseType()
   {
      if(this._selectedClubhouseID == -1)
      {
         return 0;
      }
      return this.getClubhouseByID(this._selectedClubhouseID).type;
   }
   function get purchasedClubhouseID()
   {
      return this.dataProviderUI[0][0];
   }
   function get purchasedWall()
   {
      return this.dataProviderUI[0][1];
   }
   function get purchasedHanging()
   {
      return this.dataProviderUI[0][2];
   }
   function get purchasedFurniture()
   {
      return this.dataProviderUI[0][3];
   }
   function get purchasedMural()
   {
      return this.dataProviderUI[0][4];
   }
   function get purchasedFont()
   {
      return this.dataProviderUI[0][5];
   }
   function get purchasedFontColour()
   {
      return this.dataProviderUI[0][6];
   }
   function get purchasedEmblem()
   {
      return this.dataProviderUI[0][7];
   }
   function get purchasedHideSignage()
   {
      return this.dataProviderUI[0][8];
   }
   function get purchasedSignage()
   {
      return this.dataProviderUI[0][9];
   }
   function get signage()
   {
      return this.dataProviderUI[0][10];
   }
   function get purchasedGunLocker()
   {
      return this.dataProviderUI[0][11];
   }
   function get purchasedBikeShop()
   {
      return this.dataProviderUI[0][12];
   }
   function get fontsSupported()
   {
      return this.dataProviderUI[0][13];
   }
   function get crewEmblem()
   {
      return this.dataProviderUI[0][14];
   }
   function dispatchPlayerSelections()
   {
      if(this.wall == -1)
      {
         this.wall = 0;
      }
      if(this.hanging == -1)
      {
         this.hanging = 0;
      }
      if(this.furniture == -1)
      {
         this.furniture = 0;
      }
      if(this.mural == -1)
      {
         this.mural = 0;
      }
      if(this.font == -1)
      {
         this.font = 0;
      }
      if(this.fontColour == -1)
      {
         this.fontColour = 0;
      }
      if(this.emblem == -1)
      {
         this.emblem = !(this.crewEmblem != "" && this.getSelectedClubhouse().getBaseCost() > 0) ? 1 : 0;
      }
      if(this.hideSignage == -1)
      {
         this.hideSignage = 0;
      }
      if(this.gunLocker == -1)
      {
         this.gunLocker = 0;
      }
      if(this.bikeShop == -1)
      {
         this.bikeShop = 0;
      }
      var _loc10_ = 6;
      var _loc13_ = 1;
      var _loc8_ = 1;
      var _loc14_ = 1;
      var _loc16_ = 4;
      var _loc11_ = 4;
      var _loc15_ = 4;
      var _loc12_ = 4;
      var _loc7_ = 1;
      var _loc9_ = 1;
      var _loc17_ = 1;
      var _loc3_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.clubhouses.length;
      while(_loc2_ < _loc4_)
      {
         if(this.clubhouses[_loc2_].id == this._selectedClubhouseID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc3_;
      _loc3_ += _loc10_;
      _loc5_ |= this.wall << _loc3_;
      _loc3_ += _loc13_;
      _loc5_ |= this.hanging << _loc3_;
      _loc3_ += _loc8_;
      _loc5_ |= this.furniture << _loc3_;
      _loc3_ += _loc14_;
      _loc5_ |= this.mural << _loc3_;
      _loc3_ += _loc16_;
      _loc5_ |= this.font << _loc3_;
      _loc3_ += _loc11_;
      _loc5_ |= this.fontColour << _loc3_;
      _loc3_ += _loc15_;
      _loc5_ |= this.emblem << _loc3_;
      _loc3_ += _loc12_;
      _loc5_ |= this.hideSignage << _loc3_;
      _loc3_ += _loc7_;
      _loc5_ |= this.gunLocker << _loc3_;
      _loc3_ += _loc9_;
      _loc5_ |= this.bikeShop << _loc3_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedClubhouse()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.clubhouses.length)
      {
         this.clubhouses[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.clubhouseToMarkAsPurchased.playerHasPurchased();
      this.clubhouseToMarkAsPurchased = null;
   }
   function setSelectedBunker(id)
   {
      this._selectedBunkerID = id;
      if(id == this.purchasedBunkerID && id != -1)
      {
         this.bunkerStyle = this.purchasedBunkerStyle;
         this.quarters = this.purchasedQuarters;
         this.firingRange = this.purchasedFiringRange;
         this.bunkerGunLocker = this.purchasedBunkerGunLocker;
         this.transportation = this.purchasedTransportation;
      }
      else
      {
         this.bunkerStyle = -1;
         this.quarters = -1;
         this.firingRange = -1;
         this.bunkerGunLocker = -1;
         this.transportation = -1;
      }
   }
   function get selectedBunkerID()
   {
      return this._selectedBunkerID;
   }
   function getSelectedBunker()
   {
      if(this._selectedBunkerID == -1)
      {
         return null;
      }
      return this.getBunkerByID(this._selectedBunkerID);
   }
   function getBunkerByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.bunkers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bunkers[_loc2_].id == id)
         {
            return this.bunkers[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedBunkerID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][0];
   }
   function get purchasedBunkerStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][1];
   }
   function get purchasedQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][2];
   }
   function get purchasedFiringRange()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][3];
   }
   function get purchasedBunkerGunLocker()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][4];
   }
   function get purchasedTransportation()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BUNKER_DATA_INDEX][5];
   }
   function dispatchPlayerBunkerSelections()
   {
      if(this.bunkerStyle == -1)
      {
         this.bunkerStyle = 0;
      }
      if(this.quarters == -1)
      {
         this.quarters = 0;
      }
      if(this.firingRange == -1)
      {
         this.firingRange = 0;
      }
      if(this.bunkerGunLocker == -1)
      {
         this.bunkerGunLocker = 0;
      }
      if(this.transportation == -1)
      {
         this.transportation = 0;
      }
      var _loc8_ = 6;
      var _loc11_ = 2;
      var _loc12_ = 1;
      var _loc10_ = 2;
      var _loc9_ = 1;
      var _loc7_ = 2;
      var _loc4_ = 0;
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.bunkers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bunkers[_loc2_].id == this._selectedBunkerID)
         {
            _loc5_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_ |= _loc5_ << _loc4_;
      _loc4_ += _loc8_;
      _loc6_ |= this.bunkerStyle << _loc4_;
      _loc4_ += _loc11_;
      _loc6_ |= this.quarters << _loc4_;
      _loc4_ += _loc12_;
      _loc6_ |= this.firingRange << _loc4_;
      _loc4_ += _loc10_;
      _loc6_ |= this.bunkerGunLocker << _loc4_;
      _loc4_ += _loc9_;
      _loc6_ |= this.transportation << _loc4_;
      _loc4_ += _loc7_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc6_);
   }
   function updateNewlyPurchasedBunker()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.bunkers.length)
      {
         this.bunkers[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.bunkerToMarkAsPurchased.playerHasPurchased();
      this.bunkerToMarkAsPurchased = null;
   }
   function setSelectedHangar(id)
   {
      this._selectedHangarID = id;
      if(id == this.purchasedHangarID && id != -1)
      {
         this.hangarStyle = this.purchasedHangarStyle;
         this.hangarLighting = this.purchasedHangarLighting;
         this.hangarDecal = this.purchasedHangarDecal;
         this.hangarFurniture = this.purchasedHangarFurniture;
         this.hangarQuarters = this.purchasedHangarQuarters;
         this.hangarWorkshop = this.purchasedHangarWorkshop;
      }
      else
      {
         this.hangarStyle = -1;
         this.hangarLighting = -1;
         this.hangarDecal = -1;
         this.hangarFurniture = -1;
         this.hangarQuarters = -1;
         this.hangarWorkshop = -1;
      }
   }
   function get selectedHangarID()
   {
      return this._selectedHangarID;
   }
   function getSelectedHangar()
   {
      if(this._selectedHangarID == -1)
      {
         return null;
      }
      return this.getHangarByID(this._selectedHangarID);
   }
   function getHangarByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.hangars.length;
      while(_loc2_ < _loc3_)
      {
         if(this.hangars[_loc2_].id == id)
         {
            return this.hangars[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedHangarID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][0];
   }
   function get purchasedHangarStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][1];
   }
   function get purchasedHangarLighting()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][2];
   }
   function get purchasedHangarDecal()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][3];
   }
   function get purchasedHangarFurniture()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][4];
   }
   function get purchasedHangarQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][5];
   }
   function get purchasedHangarWorkshop()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_HANGAR_DATA_INDEX][6];
   }
   function dispatchPlayerHangarSelections()
   {
      if(this.hangarStyle == -1)
      {
         this.hangarStyle = 0;
      }
      if(this.hangarLighting == -1)
      {
         this.hangarLighting = 0;
      }
      if(this.hangarDecal == -1)
      {
         this.hangarDecal = 4;
      }
      if(this.hangarFurniture == -1)
      {
         this.hangarFurniture = 0;
      }
      if(this.hangarQuarters == -1)
      {
         this.hangarQuarters = 0;
      }
      if(this.hangarWorkshop == -1)
      {
         this.hangarWorkshop = 0;
      }
      var _loc7_ = 6;
      var _loc11_ = 4;
      var _loc10_ = 2;
      var _loc8_ = 4;
      var _loc13_ = 2;
      var _loc12_ = 2;
      var _loc9_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.hangars.length;
      while(_loc2_ < _loc3_)
      {
         if(this.hangars[_loc2_].id == this._selectedHangarID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.hangarStyle << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.hangarLighting << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.hangarDecal << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.hangarFurniture << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.hangarQuarters << _loc4_;
      _loc4_ += _loc12_;
      _loc5_ |= this.hangarWorkshop << _loc4_;
      _loc4_ += _loc9_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedHangar()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.hangars.length)
      {
         this.hangars[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.hangarToMarkAsPurchased.playerHasPurchased();
      this.hangarToMarkAsPurchased = null;
   }
   function setSelectedBase(id)
   {
      this._selectedBaseID = id;
      if(id == this.purchasedBaseID && id != -1)
      {
         this.baseStyle = this.purchasedBaseStyle;
         this.baseGraphics = this.purchasedBaseGraphics;
         this.baseWeapon = this.purchasedBaseWeapon;
         this.baseSecurity = this.purchasedBaseSecurity;
         this.baseLounge = this.purchasedBaseLounge;
         this.baseQuarters = this.purchasedBaseQuarters;
         this.baseWindow = this.purchasedBaseWindow;
      }
      else
      {
         this.baseStyle = -1;
         this.baseGraphics = -1;
         this.baseWeapon = -1;
         this.baseSecurity = -1;
         this.baseLounge = -1;
         this.baseQuarters = -1;
         this.baseWindow = -1;
      }
   }
   function get selectedBaseID()
   {
      return this._selectedBaseID;
   }
   function getSelectedBase()
   {
      if(this._selectedBaseID == -1)
      {
         return null;
      }
      return this.getBaseByID(this._selectedBaseID);
   }
   function getBaseByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.bases.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bases[_loc2_].id == id)
         {
            return this.bases[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedBaseID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][0];
   }
   function get purchasedBaseStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][1];
   }
   function get purchasedBaseGraphics()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][2];
   }
   function get purchasedBaseWeapon()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][3];
   }
   function get purchasedBaseSecurity()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][4];
   }
   function get purchasedBaseLounge()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][5];
   }
   function get purchasedBaseQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][6];
   }
   function get purchasedBaseWindow()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BASE_DATA_INDEX][7];
   }
   function dispatchPlayerBaseSelections()
   {
      if(this.baseStyle == -1)
      {
         this.baseStyle = 0;
      }
      if(this.baseGraphics == -1)
      {
         this.baseGraphics = 0;
      }
      if(this.baseWeapon == -1)
      {
         this.baseWeapon = 4;
      }
      if(this.baseSecurity == -1)
      {
         this.baseSecurity = 0;
      }
      if(this.baseLounge == -1)
      {
         this.baseLounge = 0;
      }
      if(this.baseQuarters == -1)
      {
         this.baseQuarters = 0;
      }
      if(this.baseWindow == -1)
      {
         this.baseWindow = 0;
      }
      var _loc8_ = 6;
      var _loc9_ = 4;
      var _loc7_ = 4;
      var _loc14_ = 1;
      var _loc10_ = 1;
      var _loc13_ = 2;
      var _loc11_ = 2;
      var _loc12_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.bases.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bases[_loc2_].id == this._selectedBaseID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.baseStyle << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.baseGraphics << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.baseWeapon << _loc4_;
      _loc4_ += _loc14_;
      _loc5_ |= this.baseSecurity << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.baseLounge << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.baseQuarters << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.baseWindow << _loc4_;
      _loc4_ += _loc12_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedBase()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.bases.length)
      {
         this.bases[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.baseToMarkAsPurchased.playerHasPurchased();
      this.baseToMarkAsPurchased = null;
   }
   function setSelectedNightclub(id)
   {
      this._selectedNightclubID = id;
      if(id == this.purchasedNightclubID && id != -1)
      {
         this.nightclubStyle = this.purchasedNightclubStyle;
         this.nightclubLighting = this.purchasedNightclubLighting;
         this.nightclubDancers = this.purchasedNightclubDancers;
         this.nightclubStorage = this.purchasedNightclubStorage;
         this.nightclubGarage = this.purchasedNightclubGarage;
         this.nightclubName = this.purchasedNightclubName;
         this.nightclubDryIce = this.purchasedNightclubDryIce;
      }
      else
      {
         this.nightclubStyle = -1;
         this.nightclubLighting = -1;
         this.nightclubName = this.purchasedNightclubName;
         this.nightclubDancers = -1;
         this.nightclubStorage = this.purchasedNightclubStorage;
         this.nightclubGarage = this.purchasedNightclubGarage;
         this.nightclubDryIce = -1;
      }
   }
   function get selectedNightclubID()
   {
      return this._selectedNightclubID;
   }
   function getSelectedNightclub()
   {
      if(this._selectedNightclubID == -1)
      {
         return null;
      }
      return this.getNightclubByID(this._selectedNightclubID);
   }
   function getNightclubByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.nightclubs.length;
      while(_loc2_ < _loc3_)
      {
         if(this.nightclubs[_loc2_].id == id)
         {
            return this.nightclubs[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedNightclubID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][0];
   }
   function get purchasedNightclubStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][1];
   }
   function get purchasedNightclubDancers()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][3];
   }
   function get purchasedNightclubLighting()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][2];
   }
   function get purchasedNightclubStorage()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][4];
   }
   function get purchasedNightclubGarage()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][5];
   }
   function get purchasedNightclubName()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][6];
   }
   function get purchasedNightclubG4()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][7];
   }
   function get purchasedNightclubDryIce()
   {
      var _loc2_ = this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_NIGHTCLUB_DATA_INDEX][8];
      if(_loc2_ == undefined)
      {
         return !this.getSelectedNightclub().isOwned ? -1 : 0;
      }
      return _loc2_;
   }
   function dispatchPlayerNightclubSelections()
   {
      if(this.nightclubStyle == -1)
      {
         this.nightclubStyle = 0;
      }
      if(this.nightclubLighting == -1)
      {
         this.nightclubLighting = 0;
      }
      if(this.nightclubDancers == -1)
      {
         this.nightclubDancers = 0;
      }
      if(this.nightclubStorage == -1)
      {
         this.nightclubStorage = 0;
      }
      if(this.nightclubGarage == -1)
      {
         this.nightclubGarage = 0;
      }
      if(this.nightclubName == -1)
      {
         this.nightclubName = 0;
      }
      if(this.nightclubDryIce == -1)
      {
         this.nightclubDryIce = 0;
      }
      var _loc7_ = 6;
      var _loc13_ = 2;
      var _loc11_ = 3;
      var _loc12_ = 4;
      var _loc14_ = 3;
      var _loc9_ = 3;
      var _loc10_ = 4;
      var _loc8_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.nightclubs.length;
      while(_loc2_ < _loc3_)
      {
         if(this.nightclubs[_loc2_].id == this._selectedNightclubID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.nightclubStyle << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.nightclubLighting << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.nightclubDancers << _loc4_;
      _loc4_ += _loc12_;
      _loc5_ |= this.nightclubStorage << _loc4_;
      _loc4_ += _loc14_;
      _loc5_ |= this.nightclubGarage << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.nightclubName << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.nightclubDryIce << _loc4_;
      _loc4_ += _loc8_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedNightclub()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.nightclubs.length)
      {
         this.nightclubs[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.nightclubToMarkAsPurchased.playerHasPurchased();
      this.nightclubToMarkAsPurchased = null;
   }
   function setSelectedArcade(id)
   {
      this._selectedArcadeID = id;
      if(id == this.purchasedArcadeID && id != -1)
      {
         this.arcadeFloor = this.purchasedArcadeFloor;
         this.arcadeStyle = this.purchasedArcadeStyle;
         this.arcadeMural = this.purchasedArcadeMural;
         this.arcadeQuarters = this.purchasedArcadeQuarters;
         this.arcadeGarage = this.purchasedArcadeGarage;
         this.arcadeNeon = this.purchasedArcadeNeon;
         this.arcadeHighScores = this.purchasedArcadeHighScores;
      }
      else
      {
         this.arcadeFloor = -1;
         this.arcadeStyle = -1;
         this.arcadeMural = -1;
         this.arcadeQuarters = -1;
         this.arcadeGarage = this.purchasedArcadeGarage;
         this.arcadeNeon = -1;
         this.arcadeHighScores = this.purchasedArcadeHighScores;
      }
   }
   function get selectedArcadeID()
   {
      return this._selectedArcadeID;
   }
   function getSelectedArcade()
   {
      if(this._selectedArcadeID == -1)
      {
         return null;
      }
      return this.getArcadeByID(this._selectedArcadeID);
   }
   function getArcadeByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.arcades.length;
      while(_loc2_ < _loc3_)
      {
         if(this.arcades[_loc2_].id == id)
         {
            return this.arcades[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedArcadeID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][0];
   }
   function get purchasedArcadeFloor()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][1];
   }
   function get purchasedArcadeStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][2];
   }
   function get purchasedArcadeMural()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][3];
   }
   function get purchasedArcadeQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][4];
   }
   function get purchasedArcadeGarage()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][5];
   }
   function get purchasedArcadeNeon()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][6];
   }
   function get purchasedArcadeHighScores()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_ARCADE_DATA_INDEX][7];
   }
   function dispatchPlayerArcadeSelections()
   {
      if(this.arcadeFloor == -1)
      {
         this.arcadeFloor = 0;
      }
      if(this.arcadeStyle == -1)
      {
         this.arcadeStyle = 0;
      }
      if(this.arcadeMural == -1)
      {
         this.arcadeMural = 0;
      }
      if(this.arcadeQuarters == -1)
      {
         this.arcadeQuarters = 0;
      }
      if(this.arcadeGarage == -1)
      {
         this.arcadeGarage = 0;
      }
      if(this.arcadeNeon == -1)
      {
         this.arcadeNeon = 0;
      }
      if(this.arcadeHighScores == -1)
      {
         this.arcadeHighScores = 0;
      }
      var _loc7_ = 6;
      var _loc11_ = 4;
      var _loc10_ = 2;
      var _loc8_ = 4;
      var _loc13_ = 1;
      var _loc9_ = 1;
      var _loc14_ = 4;
      var _loc12_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.arcades.length;
      while(_loc2_ < _loc3_)
      {
         if(this.arcades[_loc2_].id == this._selectedArcadeID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.arcadeFloor << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.arcadeStyle << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.arcadeMural << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.arcadeQuarters << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.arcadeGarage << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.arcadeNeon << _loc4_;
      _loc4_ += _loc14_;
      _loc5_ |= this.arcadeHighScores << _loc4_;
      _loc4_ += _loc12_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedArcade()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.arcades.length)
      {
         this.arcades[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.arcadeToMarkAsPurchased.playerHasPurchased();
      this.arcadeToMarkAsPurchased = null;
   }
   function setSelectedAutoShop(id)
   {
      this._selectedAutoShopID = id;
      if(id == this.purchasedAutoShopID && id != -1)
      {
         this.autoShopStyle = this.purchasedAutoShopStyle;
         this.autoShopTint = this.purchasedAutoShopTint;
         this.autoShopEmblem = this.purchasedAutoShopEmblem;
         this.autoShopName = this.purchasedAutoShopName;
         this.autoShopStaff1 = this.purchasedAutoShopStaff1;
         this.autoShopStaff2 = this.purchasedAutoShopStaff2;
         this.autoShopCarLift = this.purchasedAutoShopCarLift;
         this.autoShopQuarters = this.purchasedAutoShopQuarters;
         this.autoShopMembership = this.purchasedAutoShopMembership;
      }
      else
      {
         this.autoShopStyle = -1;
         this.autoShopTint = -1;
         this.autoShopEmblem = -1;
         this.autoShopName = -1;
         this.autoShopStaff1 = -1;
         this.autoShopStaff2 = -1;
         this.autoShopCarLift = -1;
         this.autoShopQuarters = -1;
         this.autoShopMembership = this.purchasedAutoShopMembership;
      }
   }
   function get selectedAutoShopID()
   {
      return this._selectedAutoShopID;
   }
   function getSelectedAutoShop()
   {
      if(this._selectedAutoShopID == -1)
      {
         return null;
      }
      return this.getAutoShopByID(this._selectedAutoShopID);
   }
   function getAutoShopByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.autoShops.length;
      while(_loc2_ < _loc3_)
      {
         if(this.autoShops[_loc2_].id == id)
         {
            return this.autoShops[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedAutoShopID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][0];
   }
   function get purchasedAutoShopStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][1];
   }
   function get purchasedAutoShopTint()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][2];
   }
   function get purchasedAutoShopEmblem()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][3];
   }
   function get purchasedAutoShopName()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][4];
   }
   function get purchasedAutoShopStaff1()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][5];
   }
   function get purchasedAutoShopStaff2()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][6];
   }
   function get purchasedAutoShopCarLift()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][7];
   }
   function get purchasedAutoShopQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][8];
   }
   function get purchasedAutoShopMembership()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][9];
   }
   function get autoShopCrewName()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][10];
   }
   function get autoShopCrewEmblem()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][11] != undefined ? this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_AUTO_SHOP_DATA_INDEX][11] : "";
   }
   function dispatchPlayerAutoShopSelections()
   {
      if(this.autoShopStyle == -1)
      {
         this.autoShopStyle = 0;
      }
      if(this.autoShopTint == -1)
      {
         this.autoShopTint = 0;
      }
      if(this.autoShopEmblem == -1)
      {
         this.autoShopEmblem = this.autoShopCrewEmblem != "" ? 0 : 1;
      }
      if(this.autoShopName == -1)
      {
         this.autoShopName = 0;
      }
      if(this.autoShopStaff1 == -1)
      {
         this.autoShopStaff1 = 0;
      }
      if(this.autoShopStaff2 == -1)
      {
         this.autoShopStaff2 = 0;
      }
      if(this.autoShopCarLift == -1)
      {
         this.autoShopCarLift = 0;
      }
      if(this.autoShopQuarters == -1)
      {
         this.autoShopQuarters = 0;
      }
      if(this.autoShopMembership == -1)
      {
         this.autoShopMembership = 0;
      }
      var _loc12_ = 3;
      var _loc11_ = 4;
      var _loc14_ = 4;
      var _loc10_ = 4;
      var _loc8_ = 1;
      var _loc7_ = 1;
      var _loc9_ = 1;
      var _loc15_ = 1;
      var _loc13_ = 1;
      var _loc16_ = 1;
      var _loc3_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.autoShops.length;
      while(_loc2_ < _loc4_)
      {
         if(this.autoShops[_loc2_].id == this._selectedAutoShopID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc3_;
      _loc3_ += _loc12_;
      _loc5_ |= this.autoShopStyle << _loc3_;
      _loc3_ += _loc11_;
      _loc5_ |= this.autoShopTint << _loc3_;
      _loc3_ += _loc14_;
      _loc5_ |= this.autoShopEmblem << _loc3_;
      _loc3_ += _loc10_;
      _loc5_ |= this.autoShopName << _loc3_;
      _loc3_ += _loc8_;
      _loc5_ |= this.autoShopStaff1 << _loc3_;
      _loc3_ += _loc7_;
      _loc5_ |= this.autoShopStaff2 << _loc3_;
      _loc3_ += _loc9_;
      _loc5_ |= this.autoShopCarLift << _loc3_;
      _loc3_ += _loc15_;
      _loc5_ |= this.autoShopQuarters << _loc3_;
      _loc3_ += _loc13_;
      _loc5_ |= this.autoShopMembership << _loc3_;
      _loc3_ += _loc16_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedAutoShop()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.autoShops.length)
      {
         this.autoShops[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.autoShopToMarkAsPurchased.playerHasPurchased();
      this.autoShopToMarkAsPurchased = null;
   }
   function setSelectedSalvageYard(id)
   {
      this._selectedSalvageYardID = id;
      if(id == this.purchasedSalvageYardID && id != -1)
      {
         this.salvageYardTint = this.purchasedSalvageYardTint;
         this.salvageYardRepairBay = this.purchasedSalvageYardRepairBay;
         this.salvageYardTowTruck = this.purchasedSalvageYardTowTruck;
         this.salvageYardWallSafe = this.purchasedSalvageYardWallSafe;
         this.salvageYardStaff = this.purchasedSalvageYardStaff;
      }
      else
      {
         this.salvageYardTint = -1;
         this.salvageYardRepairBay = -1;
         this.salvageYardTowTruck = -1;
         this.salvageYardWallSafe = -1;
         this.salvageYardStaff = -1;
      }
   }
   function get selectedSalvageYardID()
   {
      return this._selectedSalvageYardID;
   }
   function getSelectedSalvageYard()
   {
      if(this._selectedSalvageYardID == -1)
      {
         return null;
      }
      return this.getSalvageYardByID(this._selectedSalvageYardID);
   }
   function getSalvageYardByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.salvageYards.length;
      while(_loc2_ < _loc3_)
      {
         if(this.salvageYards[_loc2_].id == id)
         {
            return this.salvageYards[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedSalvageYardID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][0];
   }
   function get purchasedSalvageYardTint()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][1];
   }
   function get purchasedSalvageYardRepairBay()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][2];
   }
   function get purchasedSalvageYardTowTruck()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][3];
   }
   function get purchasedSalvageYardWallSafe()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][4];
   }
   function get purchasedSalvageYardStaff()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_SALVAGE_YARD_DATA_INDEX][5];
   }
   function dispatchPlayerSalvageYardSelections()
   {
      if(this.salvageYardTint == -1)
      {
         this.salvageYardTint = 0;
      }
      if(this.salvageYardRepairBay == -1)
      {
         this.salvageYardRepairBay = 0;
      }
      if(this.salvageYardTowTruck == -1)
      {
         this.salvageYardTowTruck = 0;
      }
      if(this.salvageYardWallSafe == -1)
      {
         this.salvageYardWallSafe = 0;
      }
      if(this.salvageYardStaff == -1)
      {
         this.salvageYardStaff = 0;
      }
      var _loc8_ = 3;
      var _loc10_ = 4;
      var _loc11_ = 1;
      var _loc7_ = 2;
      var _loc9_ = 1;
      var _loc12_ = 1;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.salvageYards.length;
      while(_loc2_ < _loc3_)
      {
         if(this.salvageYards[_loc2_].id == this._selectedSalvageYardID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.salvageYardTint << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.salvageYardRepairBay << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.salvageYardTowTruck << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.salvageYardWallSafe << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.salvageYardStaff << _loc4_;
      _loc4_ += _loc12_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
   }
   function updateNewlyPurchasedSalvageYard()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.salvageYards.length)
      {
         this.salvageYards[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.salvageYardToMarkAsPurchased.playerHasPurchased();
      this.salvageYardToMarkAsPurchased = null;
   }
   function setSelectedBailOffice(id)
   {
      this._selectedBailOfficeID = id;
      if(id == this.purchasedBailOfficeID && id != -1)
      {
         this.bailOfficeStaff1 = this.purchasedBailOfficeStaff1;
         this.bailOfficeStaff2 = this.purchasedBailOfficeStaff2;
         this.bailOfficeQuarters = this.purchasedBailOfficeQuarters;
         this.bailOfficeGunLocker = this.purchasedBailOfficeGunLocker;
         this.bailOfficeTransporter = this.purchasedBailOfficeTransporter;
         this.bailOfficeStyle = this.purchasedBailOfficeStyle;
      }
      else
      {
         this.bailOfficeStaff1 = -1;
         this.bailOfficeStaff2 = -1;
         this.bailOfficeQuarters = -1;
         this.bailOfficeGunLocker = -1;
         this.bailOfficeTransporter = -1;
         this.bailOfficeStyle = -1;
      }
   }
   function get selectedBailOfficeID()
   {
      return this._selectedBailOfficeID;
   }
   function getSelectedBailOffice()
   {
      if(this._selectedBailOfficeID == -1)
      {
         return null;
      }
      return this.getBailOfficeByID(this._selectedBailOfficeID);
   }
   function getBailOfficeByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.bailOffices.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bailOffices[_loc2_].id == id)
         {
            return this.bailOffices[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function get purchasedBailOfficeID()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][0];
   }
   function get purchasedBailOfficeStaff1()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][1];
   }
   function get purchasedBailOfficeStaff2()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][2];
   }
   function get purchasedBailOfficeQuarters()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][3];
   }
   function get purchasedBailOfficeGunLocker()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][4];
   }
   function get purchasedBailOfficeTransporter()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][5];
   }
   function get purchasedBailOfficeStyle()
   {
      return this.dataProviderUI[com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM_WRAPPER.OWNED_BAIL_OFFICE_DATA_INDEX][6];
   }
   function dispatchPlayerBailOfficeSelections()
   {
      if(this.bailOfficeStaff1 == -1)
      {
         this.bailOfficeStaff2 = 0;
      }
      if(this.bailOfficeStaff2 == -1)
      {
         this.bailOfficeStaff2 = 0;
      }
      if(this.bailOfficeQuarters == -1)
      {
         this.bailOfficeQuarters = 0;
      }
      if(this.bailOfficeGunLocker == -1)
      {
         this.bailOfficeGunLocker = 0;
      }
      if(this.bailOfficeTransporter == -1)
      {
         this.bailOfficeTransporter = 0;
      }
      if(this.bailOfficeStyle == -1)
      {
         this.bailOfficeStyle = 0;
      }
      var _loc11_ = 3;
      var _loc7_ = 1;
      var _loc8_ = 1;
      var _loc13_ = 1;
      var _loc10_ = 1;
      var _loc9_ = 1;
      var _loc12_ = 2;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.bailOffices.length;
      while(_loc2_ < _loc3_)
      {
         if(this.bailOffices[_loc2_].id == this._selectedBailOfficeID)
         {
            _loc6_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ |= _loc6_ << _loc4_;
      _loc4_ += _loc11_;
      _loc5_ |= this.bailOfficeStaff1 << _loc4_;
      _loc4_ += _loc7_;
      _loc5_ |= this.bailOfficeStaff2 << _loc4_;
      _loc4_ += _loc8_;
      _loc5_ |= this.bailOfficeQuarters << _loc4_;
      _loc4_ += _loc13_;
      _loc5_ |= this.bailOfficeGunLocker << _loc4_;
      _loc4_ += _loc10_;
      _loc5_ |= this.bailOfficeTransporter << _loc4_;
      _loc4_ += _loc9_;
      _loc5_ |= this.bailOfficeStyle << _loc4_;
      _loc4_ += _loc12_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("FORECLOSURES_MAZE_D_BANK_COM: BAIL OFFICE DATA OUT");
      com.rockstargames.ui.utils.Debug.log("    [BAIL OFFICE ID: " + this._selectedBailOfficeID + "]");
      com.rockstargames.ui.utils.Debug.log("BAIL OFFICE INDEX: " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("STAFF1: " + this.bailOfficeStaff1);
      com.rockstargames.ui.utils.Debug.log("STAFF2: " + this.bailOfficeStaff2);
      com.rockstargames.ui.utils.Debug.log("QUARTERS: " + this.bailOfficeQuarters);
      com.rockstargames.ui.utils.Debug.log("GUN LOCKER: " + this.bailOfficeGunLocker);
      com.rockstargames.ui.utils.Debug.log("TRANSPORTER: " + this.bailOfficeTransporter);
      com.rockstargames.ui.utils.Debug.log("STYLE: " + this.bailOfficeStyle);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
      com.rockstargames.ui.utils.Debug.log("BIT FIELD: " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************");
   }
   function updateNewlyPurchasedBailOffice()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.bailOffices.length)
      {
         this.bailOffices[_loc2_].playerHasSold();
         _loc2_ = _loc2_ + 1;
      }
      this.bailOfficeToMarkAsPurchased.playerHasPurchased();
      this.bailOfficeToMarkAsPurchased = null;
   }
}
