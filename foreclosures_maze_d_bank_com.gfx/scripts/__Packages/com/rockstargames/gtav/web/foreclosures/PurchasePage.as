class com.rockstargames.gtav.web.foreclosures.PurchasePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var progressPanel;
   var pageName;
   var view;
   var slideshow;
   static var basicPropertyTXD;
   static var ARCADE_TXD = "FORECLOSURES_ARC";
   static var NIGHTCLUB_TXD = "FORECLOSURES_CLUB";
   static var CLUBHOUSE_TXD = "FORECLOSURES_STYLE";
   static var BUNKER_TXD = "FORECLOSURES_BUNKER";
   static var HANGAR_TXD = "FORECLOSURES_HANGAR";
   static var BASE_TXD = "FORECLOSURES_BASE";
   static var AUTO_SHOP_TXD = "FORECLOSURES_AUTO";
   static var SALVAGE_YARD_TXD = "FORECLOSURES_SALVAGE";
   static var BAIL_OFFICE_TXD = "FORECLOSURES_BAIL";
   function PurchasePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"purchasePage",pageName,isFirstPage,progressPanel,header);
      if(website.isInGarmentFactoryFlow)
      {
         this.initBasicProperty(website.getSelectedGarmentFactory());
      }
      else if(website.isInMcKenzieHangarFlow)
      {
         this.initBasicProperty(website.getSelectedMcKenzieHangar());
      }
      else if(website.isInBailOfficeFlow)
      {
         this.initBailOffice();
      }
      else if(website.isInSalvageYardFlow)
      {
         this.initSalvageYard();
      }
      else if(website.isInAutoShopFlow)
      {
         this.initAutoShop();
      }
      else if(website.isInArcadeFlow)
      {
         this.initArcade();
      }
      else if(website.isInNightclubFlow)
      {
         this.initNightclub();
      }
      else if(website.isInBaseFlow)
      {
         this.initBase();
      }
      else if(website.isInHangarFlow)
      {
         this.initHangar();
      }
      else if(website.isInBunkerFlow)
      {
         this.initBunker();
      }
      else
      {
         this.initClubhouse();
      }
   }
   function initClubhouse()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      if(this.website.bikeShop == -1)
      {
         this.website.bikeShop = 0;
      }
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BED_PAGE.name;
      this.progressPanel.setProgressDots(7);
      this.progressPanel.hidePurchaseButton();
      this.initClubhouseSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedClubhouse();
      }
      this.website.setSelectedClubhouse(-1);
   }
   function initClubhouseSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = ["STYLE_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural + "_" + this.website.wall + "_" + this.website.hanging + "_" + this.website.furniture];
         this.website.clubhouseToMarkAsPurchased = this.website.getSelectedClubhouse();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.PurchasePage.CLUBHOUSE_TXD],this.website.purchaseSlideshow);
   }
   function initBunker()
   {
      if(this.website.bunkerStyle == -1)
      {
         this.website.bunkerStyle = 0;
      }
      if(this.website.quarters == -1)
      {
         this.website.quarters = 0;
      }
      if(this.website.firingRange == -1)
      {
         this.website.firingRange = 0;
      }
      if(this.website.bunkerGunLocker == -1)
      {
         this.website.bunkerGunLocker = 0;
      }
      if(this.website.transportation == -1)
      {
         this.website.transportation = 0;
      }
      this.progressPanel.setProgressDots(5);
      this.progressPanel.hidePurchaseButton();
      this.initBunkerSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedBunker();
      }
      this.website.setSelectedBunker(-1);
   }
   function initBunkerSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("STYLE_" + Math.max(1,this.website.bunkerStyle + 1) + "B");
         if(this.website.quarters == 1)
         {
            this.website.purchaseSlideshow.push("QUARTERS");
         }
         if(this.website.firingRange != 0)
         {
            this.website.purchaseSlideshow.push("SHOOTINGB_" + Math.max(1,this.website.firingRange));
         }
         if(this.website.bunkerGunLocker == 1)
         {
            this.website.purchaseSlideshow.push("GUN_LOCKER");
         }
         if(this.website.transportation != 0)
         {
            this.website.purchaseSlideshow.push("TRANSPORTATIONB_" + Math.max(1,this.website.transportation));
         }
         this.website.bunkerToMarkAsPurchased = this.website.getSelectedBunker();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.BUNKER_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initHangar()
   {
      if(this.website.hangarDecal == -1)
      {
         this.website.hangarDecal = 4;
      }
      if(this.website.hangarStyle == -1)
      {
         this.website.hangarStyle = 0;
      }
      if(this.website.hangarLighting == -1)
      {
         this.website.hangarLighting = 0;
      }
      if(this.website.hangarQuarters == -1)
      {
         this.website.hangarQuarters = 0;
      }
      if(this.website.hangarFurniture == -1)
      {
         this.website.hangarFurniture = 0;
      }
      if(this.website.hangarWorkshop == -1)
      {
         this.website.hangarWorkshop = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initHangarSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedHangar();
      }
      this.website.setSelectedHangar(-1);
   }
   function initHangarSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         var _loc4_ = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(this.website.hangarStyle,this.website.hangarLighting) + 1;
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style" + _loc4_);
         this.website.purchaseSlideshow.push("light" + _loc4_);
         this.website.purchaseSlideshow.push("decal" + (this.website.hangarDecal + 1));
         this.website.purchaseSlideshow.push("furniture" + (this.website.hangarFurniture + 1));
         if(this.website.hangarQuarters > 0)
         {
            this.website.purchaseSlideshow.push("quarters" + this.website.hangarQuarters);
         }
         if(this.website.hangarWorkshop > 0)
         {
            this.website.purchaseSlideshow.push("workshop");
         }
         this.website.hangarToMarkAsPurchased = this.website.getSelectedHangar();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.HANGAR_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initBase()
   {
      if(this.website.baseStyle == -1)
      {
         this.website.baseStyle = 0;
      }
      if(this.website.baseGraphics == -1)
      {
         this.website.baseGraphics = 0;
      }
      if(this.website.baseWeapon == -1)
      {
         this.website.baseWeapon = 0;
      }
      if(this.website.baseSecurity == -1)
      {
         this.website.baseSecurity = 0;
      }
      if(this.website.baseLounge == -1)
      {
         this.website.baseLounge = 0;
      }
      if(this.website.baseQuarters == -1)
      {
         this.website.baseQuarters = 0;
      }
      if(this.website.baseWindow == -1)
      {
         this.website.baseWindow = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initBaseSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedBase();
      }
      this.website.setSelectedBase(-1);
   }
   function initBaseSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style" + (this.website.baseStyle + 1));
         var _loc4_ = this.website.baseGraphics * this.website.numBaseStyles + this.website.baseStyle + 1;
         this.website.purchaseSlideshow.push("graphic" + _loc4_);
         if(this.website.baseWeapon > 0)
         {
            this.website.purchaseSlideshow.push("weapon");
         }
         if(this.website.baseSecurity > 0)
         {
            this.website.purchaseSlideshow.push("security");
         }
         _loc4_ = this.website.baseLounge + 1;
         if(this.website.baseWindow == 1)
         {
            _loc4_ += this.website.numBaseLounges;
         }
         this.website.purchaseSlideshow.push("lounge" + _loc4_);
         if(this.website.baseQuarters > 0)
         {
            this.website.purchaseSlideshow.push("quarters" + this.website.baseQuarters);
         }
         this.website.baseToMarkAsPurchased = this.website.getSelectedBase();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.BASE_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initNightclub()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      if(this.website.nightclubLighting == -1)
      {
         this.website.nightclubLighting = 0;
      }
      if(this.website.nightclubName == -1)
      {
         this.website.nightclubName = 0;
      }
      if(this.website.nightclubStorage == -1)
      {
         this.website.nightclubStorage = 0;
      }
      if(this.website.nightclubGarage == -1)
      {
         this.website.nightclubGarage = 0;
      }
      if(this.website.nightclubDancers == -1)
      {
         this.website.nightclubDancers = 0;
      }
      if(this.website.nightclubDryIce == -1)
      {
         this.website.nightclubDryIce = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initNightclubSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedNightclub();
      }
      this.website.setSelectedNightclub(-1);
   }
   function initNightclubSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style" + (this.website.nightclubStyle + 1) + "_1");
         this.website.purchaseSlideshow.push("lighting" + (this.website.nightclubLighting + 1));
         this.website.purchaseSlideshow.push("name" + (this.website.nightclubName + 1));
         this.website.purchaseSlideshow.push("storage");
         if(this.website.nightclubGarage > 0)
         {
            this.website.purchaseSlideshow.push("garage" + this.website.nightclubGarage);
         }
         if(this.website.nightclubDancers > 0)
         {
            this.website.purchaseSlideshow.push("dancers" + this.website.nightclubDancers);
         }
         if(this.website.nightclubDryIce > 0)
         {
            this.website.purchaseSlideshow.push("dry_ice");
         }
         this.website.nightclubToMarkAsPurchased = this.website.getSelectedNightclub();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.NIGHTCLUB_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initArcade()
   {
      if(this.website.arcadeStyle == -1)
      {
         this.website.arcadeStyle = 0;
      }
      if(this.website.arcadeMural == -1)
      {
         this.website.arcadeMural = 0;
      }
      if(this.website.arcadeFloor == -1)
      {
         this.website.arcadeFloor = 0;
      }
      if(this.website.arcadeNeon == -1)
      {
         this.website.arcadeNeon = 0;
      }
      if(this.website.arcadeQuarters == -1)
      {
         this.website.arcadeQuarters = 0;
      }
      if(this.website.arcadeHighScores == -1)
      {
         this.website.arcadeHighScores = 0;
      }
      if(this.website.arcadeGarage == -1)
      {
         this.website.arcadeGarage = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initArcadeSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedArcade();
      }
      this.website.setSelectedArcade(-1);
   }
   function initArcadeSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style_" + (this.website.arcadeStyle + 1));
         var _loc4_ = "mural_" + (this.website.arcadeMural + 1);
         if(this.website.arcadeMural == 0)
         {
            _loc4_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
         }
         this.website.purchaseSlideshow.push(_loc4_);
         _loc4_ = "floor_" + (this.website.arcadeFloor + 1);
         if(this.website.arcadeFloor == 0)
         {
            _loc4_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
         }
         this.website.purchaseSlideshow.push(_loc4_);
         _loc4_ = "neon_" + (this.website.arcadeNeon + 1);
         if(this.website.arcadeNeon == 0)
         {
            _loc4_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
         }
         this.website.purchaseSlideshow.push(_loc4_);
         if(this.website.arcadeHighScores == 1 && this.website.arcadeQuarters == 1)
         {
            this.website.purchaseSlideshow.push("extras_1");
         }
         else if(this.website.arcadeHighScores == 1)
         {
            this.website.purchaseSlideshow.push("extras_2");
         }
         else if(this.website.arcadeQuarters == 1)
         {
            this.website.purchaseSlideshow.push("extras_3");
         }
         if(this.website.arcadeGarage == 1)
         {
            this.website.purchaseSlideshow.push("garage");
         }
         this.website.arcadeToMarkAsPurchased = this.website.getSelectedArcade();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.ARCADE_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initAutoShop()
   {
      if(this.website.autoShopStyle == -1)
      {
         this.website.autoShopStyle = 0;
      }
      if(this.website.autoShopTint == -1)
      {
         this.website.autoShopTint = 0;
      }
      if(this.website.autoShopEmblem == -1)
      {
         this.website.autoShopEmblem = this.website.autoShopCrewEmblem != "" ? 0 : 1;
      }
      if(this.website.autoShopName == -1)
      {
         this.website.autoShopName = 0;
      }
      if(this.website.autoShopStaff1 == -1)
      {
         this.website.autoShopStaff1 = 0;
      }
      if(this.website.autoShopStaff2 == -1)
      {
         this.website.autoShopStaff2 = 0;
      }
      if(this.website.autoShopCarLift == -1)
      {
         this.website.autoShopCarLift = 0;
      }
      if(this.website.autoShopQuarters == -1)
      {
         this.website.autoShopQuarters = 0;
      }
      if(this.website.autoShopMembership == -1)
      {
         this.website.autoShopMembership = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initAutoShopSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedAutoShop();
      }
      this.website.setSelectedAutoShop(-1);
   }
   function initAutoShopSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style_" + (this.website.autoShopStyle + 1));
         this.website.purchaseSlideshow.push("tint_" + (this.website.autoShopTint + 1));
         if(this.website.autoShopStaff1 == 1)
         {
            this.website.purchaseSlideshow.push("staff_1");
         }
         if(this.website.autoShopStaff2 == 1)
         {
            this.website.purchaseSlideshow.push("staff_2");
         }
         if(this.website.autoShopCarLift == 1)
         {
            this.website.purchaseSlideshow.push("carlift");
         }
         if(this.website.autoShopQuarters == 1)
         {
            this.website.purchaseSlideshow.push("quarters");
         }
         if(this.website.autoShopMembership == 1)
         {
            this.website.purchaseSlideshow.push("membership");
         }
         this.website.autoShopToMarkAsPurchased = this.website.getSelectedAutoShop();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.AUTO_SHOP_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initSalvageYard()
   {
      if(this.website.salvageYardTint == -1)
      {
         this.website.salvageYardTint = 0;
      }
      if(this.website.salvageYardRepairBay == -1)
      {
         this.website.salvageYardRepairBay = 0;
      }
      if(this.website.salvageYardTowTruck == -1)
      {
         this.website.salvageYardTowTruck = 0;
      }
      if(this.website.salvageYardWallSafe == -1)
      {
         this.website.salvageYardWallSafe = 0;
      }
      if(this.website.salvageYardStaff == -1)
      {
         this.website.salvageYardStaff = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initSalvageYardSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedSalvageYard();
      }
      this.website.setSelectedSalvageYard(-1);
   }
   function initSalvageYardSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("tint_" + (this.website.salvageYardTint + 1));
         if(this.website.salvageYardRepairBay == 1)
         {
            this.website.purchaseSlideshow.push("repair_bay");
         }
         if(this.website.salvageYardTowTruck == 1)
         {
            this.website.purchaseSlideshow.push("tow_truck");
         }
         else if(this.website.salvageYardTowTruck == 2)
         {
            this.website.purchaseSlideshow.push("tow_truck_b");
         }
         if(this.website.salvageYardWallSafe == 1)
         {
            this.website.purchaseSlideshow.push("wall_safe");
         }
         if(this.website.salvageYardStaff == 1)
         {
            this.website.purchaseSlideshow.push("staff");
         }
         this.website.salvageYardToMarkAsPurchased = this.website.getSelectedSalvageYard();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.SALVAGE_YARD_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initBailOffice()
   {
      if(this.website.bailOfficeStyle == -1)
      {
         this.website.bailOfficeStyle = 0;
      }
      if(this.website.bailOfficeStaff1 == -1)
      {
         this.website.bailOfficeStaff1 = 0;
      }
      if(this.website.bailOfficeStaff2 == -1)
      {
         this.website.bailOfficeStaff2 = 0;
      }
      if(this.website.bailOfficeQuarters == -1)
      {
         this.website.bailOfficeQuarters = 0;
      }
      if(this.website.bailOfficeGunLocker == -1)
      {
         this.website.bailOfficeGunLocker = 0;
      }
      if(this.website.bailOfficeTransporter == -1)
      {
         this.website.bailOfficeTransporter = 0;
      }
      this.progressPanel.setProgressDots(6);
      this.progressPanel.hidePurchaseButton();
      this.initBailOfficeSlideshow();
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.website.updateNewlyPurchasedBailOffice();
      }
      this.website.setSelectedBailOffice(-1);
   }
   function initBailOfficeSlideshow()
   {
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.purchaseSlideshow = [];
         this.website.purchaseSlideshow.push("style_" + (this.website.bailOfficeStyle + 1));
         if(this.website.bailOfficeStaff1 == 1)
         {
            this.website.purchaseSlideshow.push("staff_1");
         }
         if(this.website.bailOfficeStaff2 == 1)
         {
            this.website.purchaseSlideshow.push("staff_2");
         }
         if(this.website.bailOfficeQuarters == 1)
         {
            this.website.purchaseSlideshow.push("quarters");
         }
         if(this.website.bailOfficeGunLocker == 1)
         {
            this.website.purchaseSlideshow.push("gun_locker");
         }
         if(this.website.bailOfficeTransporter == 1)
         {
            this.website.purchaseSlideshow.push("transporter");
         }
         this.website.bailOfficeToMarkAsPurchased = this.website.getSelectedBailOffice();
      }
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.website.purchaseSlideshow.length)
      {
         _loc3_.push(com.rockstargames.gtav.web.foreclosures.PurchasePage.BAIL_OFFICE_TXD);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc3_,this.website.purchaseSlideshow);
   }
   function initBasicProperty(property)
   {
      this.progressPanel.hidePurchaseButton();
      if(property != null)
      {
         com.rockstargames.gtav.web.foreclosures.PurchasePage.basicPropertyTXD = property.txd;
      }
      this.website.purchaseSlideshow = [com.rockstargames.gtav.web.foreclosures.PurchasePage.basicPropertyTXD + "_INT"];
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.PurchasePage.basicPropertyTXD],this.website.purchaseSlideshow);
      this.initButtons();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.website.garmentFactoryToMarkAsPurchased = this.website.getSelectedGarmentFactory();
         this.website.mcKenzieHangarToMarkAsPurchased = this.website.getSelectedMcKenzieHangar();
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,"FORECLOSURES_PURCHASE_HEADING",false);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_PURCHASE_DESCRIPTION",false);
      }
      else
      {
         if(this.website.dataProviderUI[1][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],true);
         }
         if(this.website.dataProviderUI[2][0] != undefined)
         {
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,this.website.dataProviderUI[2][0],true);
         }
      }
      this.website.setSelectedGarmentFactory(-1);
      this.website.setSelectedMcKenzieHangar(-1);
   }
   function initButtons()
   {
      var _loc3_ = 5;
      this.initButton(this.view.waypointButton,"FORECLOSURES_SET_WAYPOINT",_loc3_);
      this.initButton(this.view.mapButton,"FORECLOSURES_RETURN_TO_MAP",_loc3_);
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.PURCHASE_PAGE.name)
      {
         this.view.mapButton._visible = false;
         this.view.mapButton.disabled = true;
      }
      else
      {
         this.view.mapButton._visible = true;
         this.view.mapButton.disabled = false;
      }
      if(this.pageName == com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUCCESS_PAGE.name)
      {
         this.view.waypointButton._visible = true;
         this.view.waypointButton.disabled = false;
      }
      else
      {
         this.view.waypointButton._visible = false;
         this.view.waypointButton.disabled = true;
      }
      if(this.view.mapButton._visible && this.view.waypointButton._visible)
      {
         var _loc2_ = Math.max(this.view.mapButton._width,this.view.waypointButton._width);
         this.view.mapButton.bg._width = _loc2_;
         this.view.mapButton.btnTxt.autoSize = "none";
         this.view.mapButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.bg._width = _loc2_;
         this.view.waypointButton.btnTxt._width = _loc2_ - 2 * _loc3_;
         this.view.waypointButton.btnTxt.autoSize = "none";
         var _loc4_ = (this.view.slideshow._width - 2 * _loc2_) / 3;
         this.view.waypointButton._x = this.view.slideshow._x + _loc4_;
         this.view.mapButton._x = this.view.slideshow._x + this.view.slideshow._width - _loc4_ - _loc2_;
      }
      else if(this.view.mapButton._visible)
      {
         this.view.mapButton._x = 0.5 * (this.view.slideshow._width - this.view.mapButton._width) + this.view.slideshow._x;
      }
      else if(this.view.waypointButton._visible)
      {
         this.view.waypointButton._x = 0.5 * (this.view.slideshow._width - this.view.waypointButton._width) + this.view.slideshow._x;
      }
   }
   function initButton(btn, label, padding)
   {
      var _loc4_ = btn.bg._width;
      btn.onColour = 16777215;
      btn.offColour = 16777215;
      btn.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(btn.btnTxt,label,false);
      this.website.dataTextScope.push(btn.btnTxt);
      btn.btnTxt._x = padding;
      btn.bg._width = btn.btnTxt._width + 2 * padding;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "mapButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name);
            break;
         case "waypointButton":
            this.view.mapButton.disabled = true;
      }
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
