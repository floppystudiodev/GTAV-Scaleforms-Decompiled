class com.rockstargames.gtav.web.foreclosures.MapPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var markerDataSet;
   var bunkerDataSet;
   var hangarDataSet;
   var baseDataSet;
   var nightclubDataSet;
   var arcadeDataSet;
   var autoShopDataSet;
   var salvageYardDataSet;
   var bailOfficeDataSet;
   var markers;
   var mapMoveX;
   var mapMoveY;
   var mapScaleStep;
   var mapIsBeingDragged;
   var mapIsZoomingIn;
   var mapIsZoomingOut;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var safeZoneBottom;
   var scrollWheelValue;
   var view;
   var website;
   var markerData;
   var progressPanel;
   var nextPageName;
   var mapDragX0;
   var mapDragY0;
   var cursorDragX0;
   var cursorDragY0;
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 1.25;
   static var MAP_MOVE_SPEED = 20;
   static var FILTER_CLUBHOUSES = 1;
   static var FILTER_BUNKERS = 2;
   static var FILTER_HANGARS = 4;
   static var FILTER_BASES = 8;
   static var FILTER_NIGHTCLUBS = 16;
   static var FILTER_ARCADES = 32;
   static var FILTER_AUTO_SHOPS = 64;
   static var FILTER_SALVAGE_YARDS = 128;
   static var FILTER_BAIL_OFFICES = 256;
   static var FILTER_GARMENT_FACTORY = 512;
   static var FILTER_MCKENZIE_HANGAR = 1024;
   function MapPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"mapPage",pageName,isFirstPage,progressPanel,header);
      this.markerDataSet = false;
      this.bunkerDataSet = false;
      this.hangarDataSet = false;
      this.baseDataSet = false;
      this.nightclubDataSet = false;
      this.arcadeDataSet = false;
      this.autoShopDataSet = false;
      this.salvageYardDataSet = false;
      this.bailOfficeDataSet = false;
      this.markers = [];
      this.mapMoveX = 0;
      this.mapMoveY = 0;
      this.mapScaleStep = 0;
      this.mapIsBeingDragged = false;
      this.mapIsZoomingIn = false;
      this.mapIsZoomingOut = false;
      this.safeZoneLeft = website.displayConfig.safeLeft * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      this.safeZoneRight = website.displayConfig.safeRight * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      this.safeZoneTop = website.displayConfig.safeTop * com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT + 148;
      this.safeZoneBottom = website.displayConfig.safeBottom * com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT;
      this.scrollWheelValue = 0;
      this.view._alpha = 100;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(header.label,"FORECLOSURES_CLUBHOUSE_MAP");
      var _loc6_ = header.label.getTextFormat();
      _loc6_.letterSpacing = 3;
      header.label.setTextFormat(_loc6_);
      progressPanel.initOverview();
      progressPanel.hide();
      if(website.selectedClubhouseID != -1)
      {
         this.showClubhouseDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedBunkerID != -1)
      {
         this.showBunkerDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedHangarID != -1)
      {
         this.showHangarDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedBaseID != -1)
      {
         this.showBaseDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedNightclubID != -1)
      {
         this.showNightclubDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedArcadeID != -1)
      {
         this.showArcadeDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedAutoShopID != -1)
      {
         this.showAutoShopDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedSalvageYardID != -1)
      {
         this.showSalvageYardDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedBailOfficeID != -1)
      {
         this.showBailOfficeDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedGarmentFactoryID != -1)
      {
         this.showGarmentFactoryDetails(true);
         progressPanel.restartSlideshow();
      }
      else if(website.selectedMcKenzieHangarID != -1)
      {
         this.showMcKenzieHangarDetails(true);
         progressPanel.restartSlideshow();
      }
      this.initFilterButtons();
   }
   function initFilterButtons()
   {
      this.initFilterButton(this.view.filter_clubhouses,"FORECLOSURES_TAB_CLUBHOUSES",0);
      this.initFilterButton(this.view.filter_bunkers,"FORECLOSURES_TAB_BUNKERS",0);
      this.initFilterButton(this.view.filter_hangars,"FCHNGR_TAB",0);
      this.initFilterButton(this.view.filter_bases,"FCBASE_TAB",1);
      this.initFilterButton(this.view.filter_nightclubs,"FCNIGHTCLUB_TAB",1);
      this.initFilterButton(this.view.filter_arcades,"FCARCADE_TAB",1);
      this.initFilterButton(this.view.filter_autoShops,"FCAUTOSHOP_TAB",1);
      this.initFilterButton(this.view.filter_salvageYards,"FCSALVAGE_TAB",2);
      this.initFilterButton(this.view.filter_bailOffices,"FCBAILOFFICE_TAB",2);
      this.initFilterButton(this.view.filter_garmentFactory,"FCGARMENT_TAB",3);
      this.initFilterButton(this.view.filter_mcKenzieHangar,"FCMCKENZIE_TAB",3);
   }
   function initFilterButton(buttonView, label, row)
   {
      var _loc3_ = 10;
      var _loc4_ = 56 + _loc3_;
      buttonView.onColour = 16777215;
      buttonView.offColour = 14737632;
      buttonView.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(buttonView.btnTxt,label);
      buttonView.bg._width = buttonView.btnTxt.textWidth + _loc3_;
      buttonView.btnTxt._x = 0.5 * (buttonView.bg._width - buttonView.btnTxt._width);
      buttonView._y = _loc4_ + (buttonView.bg._height + _loc3_) * row;
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function arrangeFilterButtons(hasClubhouses, hasBunkers, hasHangars, hasBases, hasNighclubs, hasArcades, hasAutoShops, hasSalvageYards, hasBailOffices, hasGarmentFactory, hasMcKenzieHangar)
   {
      var _loc3_ = 10;
      var _loc2_ = undefined;
      _loc2_ = this.safeZoneRight - _loc3_;
      if(hasGarmentFactory)
      {
         this.view.filter_garmentFactory._x = _loc2_ - this.view.filter_garmentFactory._width;
         _loc2_ -= this.view.filter_garmentFactory._width + _loc3_;
      }
      else
      {
         this.view.filter_garmentFactory.enabled = false;
         this.view.filter_garmentFactory._visible = false;
         this.view.filter_garmentFactory._y = -100;
      }
      if(hasMcKenzieHangar)
      {
         this.view.filter_mcKenzieHangar._x = _loc2_ - this.view.filter_mcKenzieHangar._width;
         _loc2_ -= this.view.filter_mcKenzieHangar._width + _loc3_;
      }
      else
      {
         this.view.filter_mcKenzieHangar.enabled = false;
         this.view.filter_mcKenzieHangar._visible = false;
         this.view.filter_mcKenzieHangar._y = -100;
      }
      _loc2_ = this.safeZoneRight - _loc3_;
      if(hasBailOffices)
      {
         this.view.filter_bailOffices._x = _loc2_ - this.view.filter_bailOffices._width;
         _loc2_ -= this.view.filter_bailOffices._width + _loc3_;
      }
      else
      {
         this.view.filter_bailOffices.enabled = false;
         this.view.filter_bailOffices._visible = false;
         this.view.filter_bailOffices._y = -100;
      }
      if(hasSalvageYards)
      {
         this.view.filter_salvageYards._x = _loc2_ - this.view.filter_salvageYards._width;
         _loc2_ -= this.view.filter_salvageYards._width + _loc3_;
      }
      else
      {
         this.view.filter_salvageYards.enabled = false;
         this.view.filter_salvageYards._visible = false;
         this.view.filter_salvageYards._y = -100;
      }
      _loc2_ = this.safeZoneRight - _loc3_;
      if(hasAutoShops)
      {
         this.view.filter_autoShops._x = _loc2_ - this.view.filter_autoShops._width;
         _loc2_ -= this.view.filter_autoShops._width + _loc3_;
      }
      else
      {
         this.view.filter_autoShops.enabled = false;
         this.view.filter_autoShops._visible = false;
         this.view.filter_autoShops._y = -100;
      }
      if(hasArcades)
      {
         this.view.filter_arcades._x = _loc2_ - this.view.filter_arcades._width;
         _loc2_ -= this.view.filter_arcades._width + _loc3_;
      }
      else
      {
         this.view.filter_arcades.enabled = false;
         this.view.filter_arcades._visible = false;
         this.view.filter_arcades._y = -100;
      }
      if(hasNighclubs)
      {
         this.view.filter_nightclubs._x = _loc2_ - this.view.filter_nightclubs._width;
         _loc2_ -= this.view.filter_nightclubs._width + _loc3_;
      }
      else
      {
         this.view.filter_nightclubs.enabled = false;
         this.view.filter_nightclubs._visible = false;
         this.view.filter_nightclubs._y = -100;
      }
      if(hasBases)
      {
         this.view.filter_bases._x = _loc2_ - this.view.filter_bases._width;
      }
      else
      {
         this.view.filter_bases.enabled = false;
         this.view.filter_bases._visible = false;
         this.view.filter_bases._y = -100;
      }
      _loc2_ = this.safeZoneRight - _loc3_;
      if(hasHangars)
      {
         this.view.filter_hangars._x = _loc2_ - this.view.filter_hangars._width;
         _loc2_ -= this.view.filter_hangars._width + _loc3_;
      }
      else
      {
         this.view.filter_hangars.enabled = false;
         this.view.filter_hangars._visible = false;
         this.view.filter_hangars._y = -100;
      }
      if(hasBunkers)
      {
         this.view.filter_bunkers._x = _loc2_ - this.view.filter_bunkers._width;
         _loc2_ -= this.view.filter_bunkers._width + _loc3_;
      }
      else
      {
         this.view.filter_bunkers.enabled = false;
         this.view.filter_bunkers._visible = false;
         this.view.filter_bunkers._y = -100;
      }
      if(hasClubhouses)
      {
         this.view.filter_clubhouses._x = _loc2_ - this.view.filter_clubhouses._width;
         _loc2_ -= this.view.filter_clubhouses._width + _loc3_;
      }
      else
      {
         this.view.filter_clubhouses.enabled = false;
         this.view.filter_clubhouses._visible = false;
         this.view.filter_clubhouses._y = -100;
      }
   }
   function setMarkerData(clubhouseData, bunkerData, hangarData, baseData, nightclubData, arcadeData, autoShopData, salvageYardData, bailOfficesData, garmentFactory, mcKenzieHangar)
   {
      if(this.markerDataSet)
      {
         return undefined;
      }
      var _loc26_ = false;
      var _loc32_ = false;
      var _loc23_ = false;
      var _loc25_ = false;
      var _loc27_ = false;
      var _loc28_ = false;
      var _loc30_ = false;
      var _loc29_ = false;
      var _loc24_ = false;
      var _loc31_ = false;
      var _loc33_ = false;
      this.markerData = [].concat(clubhouseData).concat(bunkerData).concat(hangarData).concat(baseData).concat(nightclubData).concat(arcadeData).concat(autoShopData).concat(salvageYardData).concat(bailOfficesData);
      if(garmentFactory != null)
      {
         this.markerData.push(garmentFactory);
      }
      if(mcKenzieHangar != null)
      {
         this.markerData.push(mcKenzieHangar);
      }
      var _loc3_ = 0;
      var _loc5_ = this.markerData.length;
      while(_loc3_ < _loc5_)
      {
         var _loc9_ = this.markerData[_loc3_].id;
         var _loc10_ = this.markerData[_loc3_].type < 2;
         var _loc7_ = this.markerData[_loc3_].type == 2;
         var _loc11_ = this.markerData[_loc3_].type == 3;
         var _loc18_ = this.markerData[_loc3_].type == 4;
         var _loc13_ = this.markerData[_loc3_].type == 5;
         var _loc12_ = this.markerData[_loc3_].type == 6;
         var _loc15_ = this.markerData[_loc3_].type == 7;
         var _loc17_ = this.markerData[_loc3_].type == 8;
         var _loc8_ = this.markerData[_loc3_].type == 9;
         var _loc14_ = this.markerData[_loc3_].type == 10;
         var _loc16_ = this.markerData[_loc3_].type == 11;
         var _loc2_ = this.view.markers.getNextHighestDepth();
         if(_loc10_)
         {
            _loc26_ = true;
            var _loc6_ = "clubhouseMarker_" + _loc9_;
            var _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerClubhouse.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc7_)
         {
            _loc32_ = true;
            _loc6_ = "bunkerMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerBunker.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc11_)
         {
            _loc23_ = true;
            _loc6_ = "hangarMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerHangar.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc18_)
         {
            _loc25_ = true;
            _loc6_ = "baseMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerBase.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc13_)
         {
            _loc27_ = true;
            _loc6_ = "nightclubMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerNightclub.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc12_)
         {
            _loc28_ = true;
            _loc6_ = "arcadeMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerArcade.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc15_)
         {
            _loc30_ = true;
            _loc6_ = "autoShopMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerAutoShop.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc17_)
         {
            _loc29_ = true;
            _loc6_ = "salvageYardMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerSalvageYard.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc8_)
         {
            _loc24_ = true;
            _loc6_ = "bailOfficeMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerBailOffice.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc14_)
         {
            _loc31_ = true;
            _loc6_ = "garmentFactoryMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerGarmentFactory.duplicateMovieClip(_loc6_,_loc2_);
         }
         else if(_loc16_)
         {
            _loc33_ = true;
            _loc6_ = "mcKenzieHangarMarker_" + _loc9_;
            _loc4_ = this.view.markers[_loc6_] || this.view.markers.markerMcKenzieHangar.duplicateMovieClip(_loc6_,_loc2_);
         }
         if(_loc9_ == this.website.selectedClubhouseID || _loc9_ == this.website.selectedBunkerID || _loc9_ == this.website.selectedHangarID || _loc9_ == this.website.selectedBaseID || _loc9_ == this.website.selectedNightclubID || _loc9_ == this.website.selectedArcadeID || _loc9_ == this.website.selectedAutoShopID || _loc9_ == this.website.selectedSalvageYardID || _loc9_ == this.website.selectedBailOfficeID || _loc9_ == this.website.selectedGarmentFactoryID || _loc9_ == this.website.selectedMcKenzieHangarID)
         {
            _loc4_.gotoAndStop(!this.markerData[_loc3_].isOwned ? "unownedActive" : "ownedActive");
         }
         else
         {
            _loc4_.gotoAndStop(!this.markerData[_loc3_].isOwned ? "unownedInactive" : "ownedInactive");
         }
         _loc4_.starterPackIcon._visible = this.markerData[_loc3_].isInStarterPack;
         this.markers[_loc9_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = this.markerData.length - 1;
      while(_loc3_ >= 0)
      {
         _loc9_ = this.markerData[_loc3_].id;
         this.website.dataTextScope.push(this.markers[_loc9_].btnTxt);
         _loc3_ = _loc3_ - 1;
      }
      this.updateMarkers();
      _loc3_ = 0;
      _loc5_ = this.markerData.length;
      while(_loc3_ < _loc5_)
      {
         _loc9_ = this.markerData[_loc3_].id;
         _loc4_ = this.markers[_loc9_];
         _loc4_._xscale = _loc4_._yscale = 1;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,0.2,{delay:(_loc5_ - _loc3_) * 0.03,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         _loc3_ = _loc3_ + 1;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.markerDataSet = true;
      var _loc36_ = this.website.getSelectedClubhouse();
      var _loc37_ = this.website.getSelectedBunker();
      var _loc41_ = this.website.getSelectedHangar();
      var _loc39_ = this.website.getSelectedBase();
      var _loc42_ = this.website.getSelectedNightclub();
      var _loc38_ = this.website.getSelectedArcade();
      var _loc34_ = this.website.getSelectedAutoShop();
      var _loc44_ = this.website.getSelectedSalvageYard();
      var _loc35_ = this.website.getSelectedBailOffice();
      garmentFactory = this.website.getSelectedGarmentFactory();
      var _loc40_ = this.website.getSelectedMcKenzieHangar();
      this.setNextPage(_loc36_,_loc37_,_loc41_,_loc39_,_loc42_,_loc38_,_loc34_,_loc44_,_loc35_,garmentFactory,_loc40_);
      this.arrangeFilterButtons(_loc26_,_loc32_,_loc23_,_loc25_,_loc27_,_loc28_,_loc30_,_loc29_,_loc24_,_loc31_,_loc33_);
   }
   function handleClick(type, id)
   {
      this.resetMarkers();
      if(type == "clubhouseMarker")
      {
         var _loc14_ = parseInt(id);
         if(_loc14_ != this.website.selectedClubhouseID)
         {
            this.website.setSelectedClubhouse(_loc14_);
            this.showClubhouseDetails(false);
         }
         var _loc18_ = this.website.getClubhouseByID(_loc14_);
         if(_loc18_)
         {
            var _loc4_ = this.markers[_loc14_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc18_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc18_.isInStarterPack;
            }
         }
         this.setNextPage(_loc18_,null,null,null,null,null,null,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "bunkerMarker")
      {
         var _loc6_ = parseInt(id);
         if(_loc6_ != this.website.selectedBunkerID)
         {
            this.website.setSelectedBunker(_loc6_);
            this.showBunkerDetails(false);
         }
         var _loc19_ = this.website.getBunkerByID(_loc6_);
         if(_loc19_)
         {
            _loc4_ = this.markers[_loc6_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc19_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc19_.isInStarterPack;
            }
         }
         this.setNextPage(null,_loc19_,null,null,null,null,null,null,null,null,null);
         this.website.isInBunkerFlow = true;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "hangarMarker")
      {
         var _loc11_ = parseInt(id);
         if(_loc11_ != this.website.selectedHangarID)
         {
            this.website.setSelectedHangar(_loc11_);
            this.showHangarDetails(false);
         }
         var _loc22_ = this.website.getHangarByID(_loc11_);
         if(_loc22_)
         {
            _loc4_ = this.markers[_loc11_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc22_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc22_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,_loc22_,null,null,null,null,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = true;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "baseMarker")
      {
         var _loc9_ = parseInt(id);
         if(_loc9_ != this.website.selectedBaseID)
         {
            this.website.setSelectedBase(_loc9_);
            this.showBaseDetails(false);
         }
         var _loc21_ = this.website.getBaseByID(_loc9_);
         if(_loc21_)
         {
            _loc4_ = this.markers[_loc9_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc21_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc21_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,_loc21_,null,null,null,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = true;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "nightclubMarker")
      {
         var _loc5_ = parseInt(id);
         if(_loc5_ != this.website.selectedNightclubID)
         {
            this.website.setSelectedNightclub(_loc5_);
            this.showNightclubDetails(false);
         }
         var _loc23_ = this.website.getNightclubByID(_loc5_);
         if(_loc23_)
         {
            _loc4_ = this.markers[_loc5_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc23_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc23_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,_loc23_,null,null,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = true;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "arcadeMarker")
      {
         var _loc13_ = parseInt(id);
         if(_loc13_ != this.website.selectedArcadeID)
         {
            this.website.setSelectedArcade(_loc13_);
            this.showArcadeDetails(false);
         }
         var _loc20_ = this.website.getArcadeByID(_loc13_);
         if(_loc20_)
         {
            _loc4_ = this.markers[_loc13_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc20_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc20_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,_loc20_,null,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = true;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "autoShopMarker")
      {
         var _loc12_ = parseInt(id);
         if(_loc12_ != this.website.selectedAutoShopID)
         {
            this.website.setSelectedAutoShop(_loc12_);
            this.showAutoShopDetails(false);
         }
         var _loc16_ = this.website.getAutoShopByID(_loc12_);
         if(_loc16_)
         {
            _loc4_ = this.markers[_loc12_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc16_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc16_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,null,_loc16_,null,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = true;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "salvageYardMarker")
      {
         var _loc7_ = parseInt(id);
         if(_loc7_ != this.website.selectedSalvageYardID)
         {
            this.website.setSelectedSalvageYard(_loc7_);
            this.showSalvageYardDetails(false);
         }
         var _loc26_ = this.website.getSalvageYardByID(_loc7_);
         if(_loc26_)
         {
            _loc4_ = this.markers[_loc7_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc26_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc26_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,null,null,_loc26_,null,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = true;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "bailOfficeMarker")
      {
         var _loc8_ = parseInt(id);
         if(_loc8_ != this.website.selectedBailOfficeID)
         {
            this.website.setSelectedBailOffice(_loc8_);
            this.showBailOfficeDetails(false);
         }
         var _loc17_ = this.website.getBailOfficeByID(_loc8_);
         if(_loc17_)
         {
            _loc4_ = this.markers[_loc8_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc17_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc17_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,null,null,null,_loc17_,null,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = true;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "garmentFactoryMarker")
      {
         var _loc15_ = parseInt(id);
         if(_loc15_ != this.website.selectedGarmentFactoryID)
         {
            this.website.setSelectedGarmentFactory(_loc15_);
            this.showGarmentFactoryDetails(false);
         }
         var _loc24_ = this.website.getGarmentFactoryByID(_loc15_);
         if(_loc24_)
         {
            _loc4_ = this.markers[_loc15_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc24_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc24_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,null,null,null,null,_loc24_,null);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = true;
         this.website.isInMcKenzieHangarFlow = false;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedMcKenzieHangar(-1);
      }
      else if(type == "mcKenzieHangarMarker")
      {
         var _loc10_ = parseInt(id);
         if(_loc10_ != this.website.selectedMcKenzieHangarID)
         {
            this.website.setSelectedMcKenzieHangar(_loc10_);
            this.showMcKenzieHangarDetails(false);
         }
         var _loc25_ = this.website.getMcKenzieHangarByID(_loc10_);
         if(_loc25_)
         {
            _loc4_ = this.markers[_loc10_];
            if(_loc4_)
            {
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc25_.isOwned ? "unownedActive" : "ownedActive");
               _loc4_.starterPackIcon._visible = _loc25_.isInStarterPack;
            }
         }
         this.setNextPage(null,null,null,null,null,null,null,null,null,null,_loc25_);
         this.website.isInBunkerFlow = false;
         this.website.isInHangarFlow = false;
         this.website.isInBaseFlow = false;
         this.website.isInNightclubFlow = false;
         this.website.isInArcadeFlow = false;
         this.website.isInAutoShopFlow = false;
         this.website.isInSalvageYardFlow = false;
         this.website.isInBailOfficeFlow = false;
         this.website.isInGarmentFactoryFlow = false;
         this.website.isInMcKenzieHangarFlow = true;
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedGarmentFactory(-1);
      }
      else if(type == "nextButton")
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(type == "filter")
      {
         if(id == "clubhouses")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CLUBHOUSES;
         }
         else if(id == "bunkers")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BUNKERS;
         }
         else if(id == "hangars")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HANGARS;
         }
         else if(id == "bases")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BASES;
         }
         else if(id == "nightclubs")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_NIGHTCLUBS;
         }
         else if(id == "arcades")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_ARCADES;
         }
         else if(id == "autoShops")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_AUTO_SHOPS;
         }
         else if(id == "salvageYards")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_SALVAGE_YARDS;
         }
         else if(id == "bailOffices")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BAIL_OFFICES;
         }
         else if(id == "garmentFactory")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_GARMENT_FACTORY;
         }
         else if(id == "mcKenzieHangar")
         {
            this.website.mapFilters ^= com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_MCKENZIE_HANGAR;
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CLUBHOUSES)
         {
            this.website.setSelectedClubhouse(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BUNKERS)
         {
            this.website.setSelectedBunker(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HANGARS)
         {
            this.website.setSelectedHangar(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BASES)
         {
            this.website.setSelectedBase(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_NIGHTCLUBS)
         {
            this.website.setSelectedNightclub(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_ARCADES)
         {
            this.website.setSelectedArcade(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_AUTO_SHOPS)
         {
            this.website.setSelectedAutoShop(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_SALVAGE_YARDS)
         {
            this.website.setSelectedSalvageYard(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BAIL_OFFICES)
         {
            this.website.setSelectedBailOffice(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_GARMENT_FACTORY)
         {
            this.website.setSelectedGarmentFactory(-1);
         }
         if(!this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_MCKENZIE_HANGAR)
         {
            this.website.setSelectedMcKenzieHangar(-1);
         }
         if(this.website.selectedClubhouseID != -1)
         {
            this.showClubhouseDetails(true);
         }
         else if(this.website.selectedBunkerID != -1)
         {
            this.showBunkerDetails(true);
         }
         else if(this.website.selectedHangarID != -1)
         {
            this.showHangarDetails(true);
         }
         else if(this.website.selectedBaseID != -1)
         {
            this.showBaseDetails(true);
         }
         else if(this.website.selectedNightclubID != -1)
         {
            this.showNightclubDetails(true);
         }
         else if(this.website.selectedArcadeID != -1)
         {
            this.showArcadeDetails(true);
         }
         else if(this.website.selectedAutoShopID != -1)
         {
            this.showAutoShopDetails(true);
         }
         else if(this.website.selectedSalvageYardID != -1)
         {
            this.showSalvageYardDetails(true);
         }
         else if(this.website.selectedBailOfficeID != -1)
         {
            this.showBailOfficeDetails(true);
         }
         else if(this.website.selectedGarmentFactoryID != -1)
         {
            this.showGarmentFactoryDetails(true);
         }
         else if(this.website.selectedMcKenzieHangarID != -1)
         {
            this.showMcKenzieHangarDetails(true);
         }
         else
         {
            this.progressPanel.hide();
         }
         if(this.website.selectedBunkerID != -1)
         {
            _loc4_ = this.markers[this.website.selectedBunkerID];
            if(_loc4_)
            {
               _loc19_ = this.website.getBunkerByID(this.website.selectedBunkerID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc19_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc19_.isInStarterPack;
            }
         }
         else if(this.website.selectedClubhouseID != -1)
         {
            _loc4_ = this.markers[this.website.selectedClubhouseID];
            if(_loc4_)
            {
               _loc18_ = this.website.getClubhouseByID(this.website.selectedClubhouseID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc18_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc18_.isInStarterPack;
            }
         }
         else if(this.website.selectedHangarID != -1)
         {
            _loc4_ = this.markers[this.website.selectedHangarID];
            if(_loc4_)
            {
               _loc22_ = this.website.getHangarByID(this.website.selectedHangarID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc22_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc22_.isInStarterPack;
            }
         }
         else if(this.website.selectedBaseID != -1)
         {
            _loc4_ = this.markers[this.website.selectedBaseID];
            if(_loc4_)
            {
               _loc21_ = this.website.getBaseByID(this.website.selectedBaseID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc21_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc21_.isInStarterPack;
            }
         }
         else if(this.website.selectedNightclubID != -1)
         {
            _loc4_ = this.markers[this.website.selectedNightclubID];
            if(_loc4_)
            {
               _loc23_ = this.website.getNightclubByID(this.website.selectedNightclubID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc23_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc23_.isInStarterPack;
            }
         }
         else if(this.website.selectedArcadeID != -1)
         {
            _loc4_ = this.markers[this.website.selectedArcadeID];
            if(_loc4_)
            {
               _loc20_ = this.website.getArcadeByID(this.website.selectedArcadeID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc20_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc20_.isInStarterPack;
            }
         }
         else if(this.website.selectedAutoShopID != -1)
         {
            _loc4_ = this.markers[this.website.selectedAutoShopID];
            if(_loc4_)
            {
               _loc16_ = this.website.getAutoShopByID(this.website.selectedAutoShopID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc16_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc16_.isInStarterPack;
            }
         }
         else if(this.website.selectedSalvageYardID != -1)
         {
            _loc4_ = this.markers[this.website.selectedSalvageYardID];
            if(_loc4_)
            {
               _loc26_ = this.website.getSalvageYardByID(this.website.selectedSalvageYardID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc26_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc26_.isInStarterPack;
            }
         }
         else if(this.website.selectedBailOfficeID != -1)
         {
            _loc4_ = this.markers[this.website.selectedBailOfficeID];
            if(_loc4_)
            {
               _loc17_ = this.website.getBailOfficeByID(this.website.selectedBailOfficeID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc17_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc17_.isInStarterPack;
            }
         }
         else if(this.website.selectedGarmentFactoryID != -1)
         {
            _loc4_ = this.markers[this.website.selectedGarmentFactoryID];
            if(_loc4_)
            {
               _loc24_ = this.website.getGarmentFactoryByID(this.website.selectedGarmentFactoryID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc24_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc24_.isInStarterPack;
            }
         }
         else if(this.website.selectedMcKenzieHangarID != -1)
         {
            _loc4_ = this.markers[this.website.selectedMcKenzieHangarID];
            if(_loc4_)
            {
               _loc25_ = this.website.getMcKenzieHangarByID(this.website.selectedMcKenzieHangarID);
               _loc4_.swapDepths(_loc4_._parent.getNextHighestDepth());
               _loc4_.gotoAndStop(!_loc25_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc4_.starterPackIcon._visible = _loc25_.isInStarterPack;
            }
         }
         this.updateMarkers();
      }
   }
   function setNextPage(clubhouse, bunker, hangar, base, nightclub, arcade, autoShop, salvageYard, bailOffice, garmentFactory, mcKenzieHangar)
   {
      if(clubhouse != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MURAL_PAGE.name;
      }
      else if(bunker != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_STYLE_PAGE.name;
      }
      else if(hangar != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_STYLE_PAGE.name;
      }
      else if(base != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_STYLE_PAGE.name;
      }
      else if(nightclub != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_STYLE_PAGE.name;
      }
      else if(arcade != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_STYLE_PAGE.name;
      }
      else if(autoShop != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STYLE_PAGE.name;
      }
      else if(salvageYard != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SALVAGE_YARD_TINT_PAGE.name;
      }
      else if(bailOffice != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STYLE_PAGE.name;
      }
      else if(garmentFactory != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GARMENT_FACTORY_PAGE.name;
      }
      else if(mcKenzieHangar != null)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MCKENZIE_HANGAR_PAGE.name;
      }
   }
   function handleLT()
   {
      this.mapScaleStep = -0.5 * com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_STEP;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
      this.mapIsZoomingOut = true;
      this.updateMapView();
   }
   function handleRT()
   {
      this.mapScaleStep = 0.5 * com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_STEP;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
      this.mapIsZoomingIn = true;
      this.updateMapView();
   }
   function handleLTRelease()
   {
      this.mapIsZoomingOut = false;
      if(!this.mapIsZoomingIn)
      {
         this.mapScaleStep = 0;
      }
      this.updateMapView();
   }
   function handleRTRelease()
   {
      this.mapIsZoomingIn = false;
      if(!this.mapIsZoomingOut)
      {
         this.mapScaleStep = 0;
      }
      this.updateMapView();
   }
   function handleRB()
   {
      if(this.website.selectedClubhouseID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedBunkerID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedHangarID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedBaseID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedNightclubID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedArcadeID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedAutoShopID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedSalvageYardID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedBailOfficeID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedGarmentFactoryID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
      else if(this.website.selectedMcKenzieHangarID != -1)
      {
         this.progressPanel.stopSlideshow();
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
   }
   function handleAnalogStickInput(isLeftStick, x, y, isScrollWheel)
   {
      if(!isLeftStick)
      {
         if(isScrollWheel)
         {
            if(y < 0 && y <= this.scrollWheelValue)
            {
               this.scrollWheelValue = y;
               this.handleRT();
            }
            else if(y > 0 && y >= this.scrollWheelValue)
            {
               this.scrollWheelValue = y;
               this.handleLT();
            }
            else
            {
               this.scrollWheelValue = 0;
               this.handleRTRelease();
            }
            this.mapScaleStep = 0;
         }
         else
         {
            this.mapMoveX = (- com.rockstargames.gtav.web.foreclosures.MapPage.MAP_MOVE_SPEED) * x / 150;
            this.mapMoveY = (- com.rockstargames.gtav.web.foreclosures.MapPage.MAP_MOVE_SPEED) * y / 150;
            this.updateMapView();
         }
      }
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.resetMarkers();
      var _loc3_ = this.website.browser.CURSOR._x;
      var _loc2_ = this.website.browser.CURSOR._y;
      if(_loc3_ > this.safeZoneLeft && _loc3_ < this.safeZoneRight && _loc2_ > this.safeZoneTop && _loc2_ < this.safeZoneBottom)
      {
         this.progressPanel.hide();
         this.website.setSelectedClubhouse(-1);
         this.website.setSelectedBunker(-1);
         this.website.setSelectedHangar(-1);
         this.website.setSelectedBase(-1);
         this.website.setSelectedNightclub(-1);
         this.website.setSelectedArcade(-1);
         this.website.setSelectedAutoShop(-1);
         this.website.setSelectedSalvageYard(-1);
         this.website.setSelectedBailOffice(-1);
         this.website.setSelectedGarmentFactory(-1);
         this.website.setSelectedMcKenzieHangar(-1);
         if(inputIsMouseClick)
         {
            this.mapIsBeingDragged = true;
            this.mapDragX0 = this.view.map._x;
            this.mapDragY0 = this.view.map._y;
            this.cursorDragX0 = _loc3_;
            this.cursorDragY0 = _loc2_;
            this.updateMapView();
         }
      }
   }
   function handleMouseRelease()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.mapIsBeingDragged = false;
   }
   function dispose()
   {
      var _loc3_ = 0;
      var _loc4_ = this.markers.length;
      while(_loc3_ < _loc4_)
      {
         if(this.markers[_loc3_])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.markers[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
   function updateMapView()
   {
      if(this.mapIsBeingDragged)
      {
         this.dragMap();
      }
      else
      {
         this.moveMap();
      }
      this.scaleMap();
      this.updateMarkers();
      if(this.mapMoveX != 0 || this.mapMoveY != 0 || this.mapScaleStep != 0 || this.mapIsBeingDragged)
      {
         this.view.map._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.map,0.01,{onCompleteScope:this,onComplete:this.updateMapView});
      }
   }
   function dragMap()
   {
      var _loc3_ = this.website.browser.CURSOR._x - this.cursorDragX0;
      var _loc2_ = this.website.browser.CURSOR._y - this.cursorDragY0;
      var _loc4_ = this.mapDragX0 + _loc3_;
      var _loc5_ = this.mapDragY0 + _loc2_;
      this.moveMapWithinLimits(_loc4_,_loc5_,_loc3_,_loc2_);
   }
   function moveMap()
   {
      var _loc2_ = this.view.map._x + this.mapMoveX;
      var _loc3_ = this.view.map._y + this.mapMoveY;
      this.moveMapWithinLimits(_loc2_,_loc3_,this.mapMoveX,this.mapMoveY);
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = this.view.map.transform.matrix.clone();
   }
   function moveMapWithinLimits(xNew, yNew, dx, dy)
   {
      var _loc4_ = 98;
      var _loc6_ = 0.5 * (com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH - this.view.map._width);
      var _loc5_ = 0.5 * (com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT - _loc4_ - this.view.map._height) + _loc4_;
      var _loc9_ = 0.5 * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH - this.view.map._width;
      var _loc7_ = 0.5 * com.rockstargames.gtav.web.foreclosures.Page.STAGE_WIDTH;
      var _loc10_ = com.rockstargames.gtav.web.foreclosures.Page.STAGE_HEIGHT - this.view.map._height - _loc4_;
      var _loc8_ = _loc4_;
      if(dx > 0)
      {
         if(xNew <= _loc6_ || xNew >= _loc9_ && xNew <= _loc7_)
         {
            this.view.map._x = xNew;
         }
      }
      else if(xNew >= _loc6_ || xNew >= _loc9_ && xNew <= _loc7_)
      {
         this.view.map._x = xNew;
      }
      if(dy > 0)
      {
         if(yNew <= _loc5_ || yNew >= _loc10_ && yNew <= _loc8_)
         {
            this.view.map._y = yNew;
         }
      }
      else if(yNew >= _loc5_ || yNew >= _loc10_ && yNew <= _loc8_)
      {
         this.view.map._y = yNew;
      }
   }
   function scaleMap()
   {
      var _loc2_ = this.view.map.transform.matrix;
      var _loc3_ = this.mapScaleStep + 1;
      var _loc4_ = _loc2_.a * _loc3_;
      if(_loc4_ > com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.web.foreclosures.MapPage.MAP_SCALE_MIN / _loc2_.a;
      }
      _loc2_.translate(- com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_X,- com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_Y);
      _loc2_.scale(_loc3_,_loc3_);
      _loc2_.translate(com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_X,com.rockstargames.gtav.web.foreclosures.Page.STAGE_CENTRE_Y);
      this.view.map.transform.matrix = _loc2_;
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = _loc2_.clone();
   }
   function updateMarkers()
   {
      var _loc11_ = this.view.map._x;
      var _loc10_ = this.view.map._y;
      var _loc9_ = this.view.map.transform.matrix.a;
      var _loc2_ = 0;
      var _loc5_ = this.markerData.length;
      while(_loc2_ < _loc5_)
      {
         var _loc6_ = this.markerData[_loc2_].id;
         var _loc3_ = this.markers[_loc6_];
         if(_loc3_)
         {
            var _loc8_ = _loc9_ * this.markerData[_loc2_].x + _loc11_;
            var _loc7_ = _loc9_ * this.markerData[_loc2_].y + _loc10_;
            _loc3_._x = _loc8_;
            _loc3_._y = _loc7_;
            if(_loc3_._xscale == 100 && (this.isHiddenByProgressPanel(_loc3_) || this.isOffScreen(_loc3_)))
            {
               _loc3_.disabled = true;
               _loc3_._visible = false;
            }
            else
            {
               var _loc4_ = this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CLUBHOUSES && this.markerData[_loc2_].type < 2 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BUNKERS && this.markerData[_loc2_].type == 2 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HANGARS && this.markerData[_loc2_].type == 3 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BASES && this.markerData[_loc2_].type == 4 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_NIGHTCLUBS && this.markerData[_loc2_].type == 5 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_ARCADES && this.markerData[_loc2_].type == 6 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_AUTO_SHOPS && this.markerData[_loc2_].type == 7 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_SALVAGE_YARDS && this
               .markerData[_loc2_].type == 8 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BAIL_OFFICES && this.markerData[_loc2_].type == 9 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_GARMENT_FACTORY && this.markerData[_loc2_].type == 10 || this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_MCKENZIE_HANGAR && this.markerData[_loc2_].type == 11;
               _loc3_.disabled = !_loc4_;
               _loc3_._visible = _loc4_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.view.filter_clubhouses._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_CLUBHOUSES) ? 80 : 100;
      this.view.filter_bunkers._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BUNKERS) ? 80 : 100;
      this.view.filter_hangars._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_HANGARS) ? 80 : 100;
      this.view.filter_bases._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BASES) ? 80 : 100;
      this.view.filter_nightclubs._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_NIGHTCLUBS) ? 80 : 100;
      this.view.filter_arcades._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_ARCADES) ? 80 : 100;
      this.view.filter_autoShops._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_AUTO_SHOPS) ? 80 : 100;
      this.view.filter_salvageYards._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_SALVAGE_YARDS) ? 80 : 100;
      this.view.filter_bailOffices._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_BAIL_OFFICES) ? 80 : 100;
      this.view.filter_garmentFactory._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_GARMENT_FACTORY) ? 80 : 100;
      this.view.filter_mcKenzieHangar._alpha = !(this.website.mapFilters & com.rockstargames.gtav.web.foreclosures.MapPage.FILTER_MCKENZIE_HANGAR) ? 80 : 100;
   }
   function resetMarkers()
   {
      var _loc2_ = 0;
      var _loc4_ = this.markerData.length;
      while(_loc2_ < _loc4_)
      {
         var _loc5_ = this.markerData[_loc2_].id;
         var _loc3_ = this.markers[_loc5_];
         if(_loc3_)
         {
            _loc3_.gotoAndStop(!this.markerData[_loc2_].isOwned ? "unownedInactive" : "ownedInactive");
            _loc3_.starterPackIcon._visible = this.markerData[_loc2_].isInStarterPack;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function isHiddenByProgressPanel(marker)
   {
      if(this.progressPanel.isHidden)
      {
         return false;
      }
      var _loc3_ = marker.getBounds(_root);
      return _loc3_.xMin >= this.progressPanel.left && _loc3_.xMax <= this.progressPanel.right && _loc3_.yMin >= this.progressPanel.top && _loc3_.yMax <= this.progressPanel.bottom;
   }
   function isOffScreen(marker)
   {
      var _loc3_ = marker.getBounds(_root);
      return _loc3_.xMax < this.safeZoneLeft || _loc3_.xMin > this.safeZoneRight || _loc3_.yMax < this.safeZoneTop || _loc3_.yMin > this.safeZoneBottom;
   }
   function showClubhouseDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedClubhouse();
      this.progressPanel.showOverview(_loc2_,showImmediately);
   }
   function showBunkerDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedBunker();
      this.progressPanel.showBunkerOverview(_loc2_,showImmediately);
   }
   function showHangarDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedHangar();
      this.progressPanel.showHangarOverview(_loc2_,showImmediately);
   }
   function showBaseDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedBase();
      this.progressPanel.showBaseOverview(_loc2_,showImmediately);
   }
   function showNightclubDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedNightclub();
      this.progressPanel.showNightclubOverview(_loc2_,showImmediately);
   }
   function showArcadeDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedArcade();
      this.progressPanel.showArcadeOverview(_loc2_,showImmediately);
   }
   function showAutoShopDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedAutoShop();
      this.progressPanel.showAutoShopOverview(_loc2_,showImmediately);
   }
   function showSalvageYardDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedSalvageYard();
      this.progressPanel.showSalvageYardOverview(_loc2_,showImmediately);
   }
   function showBailOfficeDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedBailOffice();
      this.progressPanel.showBailOfficeOverview(_loc2_,showImmediately);
   }
   function showGarmentFactoryDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedGarmentFactory();
      this.progressPanel.showBasicPropertyOverview(_loc2_,showImmediately);
   }
   function showMcKenzieHangarDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedMcKenzieHangar();
      this.progressPanel.showBasicPropertyOverview(_loc2_,showImmediately);
   }
}
