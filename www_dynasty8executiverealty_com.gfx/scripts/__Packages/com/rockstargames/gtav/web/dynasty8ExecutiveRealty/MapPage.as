class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var nextOfficePageName;
   var nextGaragePageName;
   var nextAgencyPageName;
   var officeDataSet;
   var markers;
   var garageMarkers;
   var mapMoveX;
   var mapMoveY;
   var mapScaleStep;
   var mapIsBeingDragged;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var safeZoneBottom;
   var scrollWheelValue;
   var view;
   var currentFilter;
   var website;
   var officeData;
   var agencyData;
   var progressPanel;
   var mapDragX0;
   var mapDragY0;
   var cursorDragX0;
   var cursorDragY0;
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 1.25;
   static var MAP_MOVE_SPEED = 20;
   function MapPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"mapPage",pageName,isFirstPage,progressPanel,header);
      this.nextOfficePageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.STYLE_PAGE.name;
      this.nextGaragePageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_1_PAGE.name;
      this.nextAgencyPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ART_PAGE.name;
      this.officeDataSet = false;
      this.markers = [];
      this.garageMarkers = [];
      this.mapMoveX = 0;
      this.mapMoveY = 0;
      this.mapScaleStep = 0;
      this.mapIsBeingDragged = false;
      this.safeZoneLeft = website.displayConfig.safeLeft * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      this.safeZoneRight = website.displayConfig.safeRight * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      this.safeZoneTop = website.displayConfig.safeTop * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT + 148;
      this.safeZoneBottom = website.displayConfig.safeBottom * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT;
      this.scrollWheelValue = 0;
      this.view._alpha = 100;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(header.label,"DYN8_EXEC_OFFICE_MAP");
      var _loc5_ = header.label.getTextFormat();
      _loc5_.letterSpacing = 3;
      header.label.setTextFormat(_loc5_);
      progressPanel.initOverview();
      progressPanel.hide();
      website.setSelectedAgency(-1);
      website.setSelectedOffice(-1);
      this.initFilterButtons();
   }
   function initFilterButtons()
   {
      this.initFilterButton(this.view.filter_all,"DYN8_EXEC_TAB_ALL",0);
      this.initFilterButton(this.view.filter_offices,"DYN8_EXEC_TAB_OFFICES",0);
      this.initFilterButton(this.view.filter_agencies,"DYN8_EXEC_TAB_AGENCIES",0);
      this.currentFilter = "all";
   }
   function initFilterButton(buttonView, label, row)
   {
      var _loc3_ = 10;
      var _loc4_ = 56 + _loc3_;
      buttonView.onColour = 16777215;
      buttonView.offColour = 14737632;
      buttonView.btnTxt.autoSize = "left";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(buttonView.btnTxt,label);
      buttonView.background._width = buttonView.btnTxt.textWidth + _loc3_;
      buttonView.btnTxt._x = 0.5 * (buttonView.background._width - buttonView.btnTxt._width);
      buttonView._y = _loc4_ + (buttonView.background._height + _loc3_) * row;
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function arrangeFilterButtons(hasOffices, hasAgencies)
   {
      var _loc3_ = 10;
      var _loc2_ = undefined;
      _loc2_ = this.safeZoneRight - _loc3_;
      if(hasAgencies)
      {
         this.view.filter_agencies._x = _loc2_ - this.view.filter_agencies._width;
         _loc2_ -= this.view.filter_agencies._width + _loc3_;
      }
      else
      {
         this.view.filter_agencies.enabled = false;
         this.view.filter_agencies._visible = false;
         this.view.filter_agencies._y = -100;
      }
      if(hasOffices)
      {
         this.view.filter_offices._x = _loc2_ - this.view.filter_offices._width;
         _loc2_ -= this.view.filter_offices._width + _loc3_;
      }
      else
      {
         this.view.filter_offices.enabled = false;
         this.view.filter_offices._visible = false;
         this.view.filter_offices._y = -100;
      }
      this.view.filter_all._x = _loc2_ - this.view.filter_all._width;
   }
   function setPropertyData(officeData, agencyData)
   {
      if(this.officeDataSet)
      {
         return undefined;
      }
      this.officeData = officeData;
      this.agencyData = agencyData;
      var _loc5_ = 0;
      var _loc7_ = officeData.length;
      while(_loc5_ < _loc7_)
      {
         var _loc4_ = officeData[_loc5_].id;
         var _loc6_ = "officeMarker_" + _loc4_;
         var _loc8_ = this.view.markers[_loc6_] || this.view.markers.marker0.duplicateMovieClip(_loc6_,_loc4_);
         if(_loc4_ != this.website.selectedOfficeID)
         {
            _loc8_._xscale = _loc8_._yscale = 1;
            _loc8_.gotoAndStop(!officeData[_loc5_].isOwned ? "unownedInactive" : "ownedInactive");
            _loc8_.starterPackIcon._visible = officeData[_loc5_].isInStarterPack;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc8_,0.2,{delay:_loc5_ * 0.05,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         this.markers[_loc4_] = _loc8_;
         this.website.dataTextScope.push(_loc8_.btnTxt);
         if(officeData[_loc5_].hasGarage)
         {
            _loc6_ = "garageMarker_" + _loc4_;
            _loc8_ = this.view.markers[_loc6_] || this.view.markers.attachMovie("garageMarker",_loc6_,_loc4_ + 1000);
            _loc8_.disabled = true;
            if(_loc4_ != this.website.selectedOfficeID)
            {
               _loc8_.gotoAndStop(!officeData[_loc5_].garageIsOwned ? "unownedInactive" : "ownedInactive");
            }
            this.garageMarkers[_loc4_] = _loc8_;
            this.website.dataTextScope.push(_loc8_.btnTxt);
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      _loc7_ = agencyData.length;
      while(_loc5_ < _loc7_)
      {
         _loc4_ = agencyData[_loc5_].id;
         _loc6_ = "agencyMarker_" + _loc4_;
         _loc8_ = this.view.markers[_loc6_] || this.view.markers.attachMovie("agencyMarker",_loc6_,_loc4_ + 1100);
         if(_loc4_ != this.website.selectedAgencyID)
         {
            _loc8_._xscale = _loc8_._yscale = 1;
            _loc8_.gotoAndStop(!agencyData[_loc5_].isOwned ? "unownedInactive" : "ownedInactive");
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc8_,0.2,{delay:(_loc5_ + officeData.length) * 0.05,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         this.markers[_loc4_] = _loc8_;
         this.website.dataTextScope.push(_loc8_.btnTxt);
         _loc5_ = _loc5_ + 1;
      }
      this.updateMarkers();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.officeDataSet = true;
      if(this.website.selectedOfficeID != -1)
      {
         var _loc13_ = this.website.getOfficeByID(this.website.selectedOfficeID);
         if(_loc13_)
         {
            if(_loc13_.hasGarage)
            {
               _loc8_ = this.garageMarkers[this.website.selectedOfficeID];
               if(_loc8_)
               {
                  _loc8_.swapDepths(_loc8_._parent.getNextHighestDepth());
                  _loc8_.gotoAndStop(!_loc13_.garageIsOwned ? "unownedActive" : "ownedActive");
                  _loc8_.icon.gotoAndStop(_loc8_.icon._totalframes);
                  _loc8_.disabled = false;
               }
               if(this.website.garageSelected)
               {
                  this.showGarageDetails(true);
               }
            }
            else
            {
               this.showOfficeDetails(true);
            }
            _loc8_ = this.markers[this.website.selectedOfficeID];
            if(_loc8_)
            {
               _loc8_.swapDepths(_loc8_._parent.getNextHighestDepth());
               _loc8_.gotoAndStop(!_loc13_.isOwned ? "unownedActive" : "ownedActive");
               _loc8_.starterPackIcon._visible = _loc13_.isInStarterPack;
               _loc8_.icon.gotoAndStop(_loc8_.icon._totalframes);
            }
         }
      }
      if(this.website.selectedAgencyID != -1)
      {
         var _loc14_ = this.website.getAgencyByID(this.website.selectedAgencyID);
         if(_loc14_)
         {
            this.showAgencyDetails(true);
            _loc8_ = this.markers[this.website.selectedAgencyID];
            if(_loc8_)
            {
               _loc8_.swapDepths(_loc8_._parent.getNextHighestDepth());
               _loc8_.gotoAndStop(!_loc14_.isOwned ? "unownedActive" : "ownedActive");
               _loc8_.icon.gotoAndStop(_loc8_.icon._totalframes);
            }
         }
      }
      _loc5_ = 0;
      _loc7_ = officeData.length;
      while(_loc5_ < _loc7_)
      {
         _loc8_ = this.view.markers["officeMarker_" + officeData[_loc5_].id];
         if(officeData[_loc5_].isOwned)
         {
            _loc8_.swapDepths(this.view.markers.getNextHighestDepth());
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      _loc7_ = agencyData.length;
      while(_loc5_ < _loc7_)
      {
         _loc8_ = this.view.markers["agencyMarker_" + agencyData[_loc5_].id];
         if(agencyData[_loc5_].isOwned)
         {
            _loc8_.swapDepths(this.view.markers.getNextHighestDepth());
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc15_ = officeData.length > 0;
      var _loc16_ = agencyData.length > 0;
      this.arrangeFilterButtons(_loc15_,_loc16_);
   }
   function handleClick(type, id)
   {
      var _loc3_ = undefined;
      var _loc2_ = parseInt(id);
      if(type == "officeMarker")
      {
         this.website.setSelectedAgency(-1);
         if(_loc2_ != this.website.selectedOfficeID)
         {
            this.resetMarkers(false);
            this.website.setSelectedOffice(_loc2_);
            this.showOfficeDetails(false);
         }
         var _loc5_ = this.website.getOfficeByID(_loc2_);
         if(_loc5_)
         {
            if(_loc5_.hasGarage)
            {
               _loc3_ = this.garageMarkers[_loc2_];
               if(_loc3_)
               {
                  _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
                  _loc3_.gotoAndStop(!_loc5_.garageIsOwned ? "unownedActive" : "ownedActive");
                  _loc3_.disabled = false;
               }
            }
            _loc3_ = this.markers[_loc2_];
            if(_loc3_)
            {
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc5_.isOwned ? "unownedActive" : "ownedActive");
               _loc3_.starterPackIcon._visible = _loc5_.isInStarterPack;
            }
            this.showOfficeDetails(true);
         }
         this.website.garageSelected = false;
      }
      else if(type == "agencyMarker")
      {
         this.website.setSelectedOffice(-1);
         if(_loc2_ != this.website.selectedAgencyID)
         {
            this.resetMarkers(false);
            this.website.setSelectedAgency(_loc2_);
            this.showAgencyDetails(false);
         }
         var _loc6_ = this.website.getAgencyByID(_loc2_);
         if(_loc6_)
         {
            _loc3_ = this.markers[_loc2_];
            if(_loc3_)
            {
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc6_.isOwned ? "unownedActive" : "ownedActive");
            }
            this.showAgencyDetails(true);
         }
         this.website.garageSelected = false;
      }
      else if(type == "garageMarker")
      {
         this.website.setSelectedAgency(-1);
         this.resetMarkers(true);
         this.showGarageDetails(false);
         this.website.garageSelected = true;
      }
      else if(type == "nextButton")
      {
         if(this.website.selectedAgencyID != -1)
         {
            this.website.browser.GO_TO_WEBPAGE(this.nextAgencyPageName);
         }
         else
         {
            this.website.browser.GO_TO_WEBPAGE(!this.website.garageSelected ? this.nextOfficePageName : this.nextGaragePageName);
         }
      }
      else if(type == "filter")
      {
         this.currentFilter = id;
         if(this.currentFilter == "offices")
         {
            this.website.setSelectedAgency(-1);
         }
         else if(this.currentFilter == "agencies")
         {
            this.website.setSelectedOffice(-1);
         }
         if(this.website.selectedOfficeID != -1)
         {
            this.showOfficeDetails(true);
         }
         else if(this.website.selectedAgencyID != -1)
         {
            this.showAgencyDetails(true);
         }
         else
         {
            this.progressPanel.hide();
         }
         if(this.website.selectedOfficeID != -1)
         {
            _loc3_ = this.markers[this.website.selectedOfficeID];
            if(_loc3_)
            {
               _loc5_ = this.website.getOfficeByID(this.website.selectedOfficeID);
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc5_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc3_.starterPackIcon._visible = _loc5_.isInStarterPack;
            }
         }
         else if(this.website.selectedAgencyID != -1)
         {
            _loc3_ = this.markers[this.website.selectedAgencyID];
            if(_loc3_)
            {
               _loc6_ = this.website.getAgencyByID(this.website.selectedAgencyID);
               _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
               _loc3_.gotoAndStop(!_loc6_.isOwned ? "unownedActiveNoAnim" : "ownedActiveNoAnim");
               _loc3_.starterPackIcon._visible = false;
            }
         }
         this.updateMarkers();
      }
      else
      {
         this.resetMarkers(false);
      }
   }
   function handleLT()
   {
      this.mapScaleStep = -0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_STEP;
      this.updateMapView();
   }
   function handleRT()
   {
      this.mapScaleStep = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_STEP;
      this.updateMapView();
   }
   function handleLTRelease()
   {
      this.mapScaleStep = 0;
      this.updateMapView();
   }
   function handleRTRelease()
   {
      this.mapScaleStep = 0;
      this.updateMapView();
   }
   function handleRB()
   {
      if(this.website.garageSelected)
      {
         var _loc2_ = this.website.getSelectedOffice();
         if(_loc2_ && _loc2_.isOwned)
         {
            this.website.browser.GO_TO_WEBPAGE(this.nextGaragePageName);
         }
      }
      else if(this.website.selectedOfficeID != -1)
      {
         this.website.browser.GO_TO_WEBPAGE(this.nextOfficePageName);
      }
      else if(this.website.selectedAgencyID != -1)
      {
         this.website.browser.GO_TO_WEBPAGE(this.nextAgencyPageName);
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
            this.mapMoveX = (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_MOVE_SPEED) * x / 150;
            this.mapMoveY = (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_MOVE_SPEED) * y / 150;
            this.updateMapView();
         }
      }
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.resetMarkers(false);
      var _loc3_ = this.website.browser.CURSOR._x;
      var _loc2_ = this.website.browser.CURSOR._y;
      if(_loc3_ > this.safeZoneLeft && _loc3_ < this.safeZoneRight && _loc2_ > this.safeZoneTop && _loc2_ < this.safeZoneBottom)
      {
         this.progressPanel.hide();
         this.website.setSelectedOffice(-1);
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
      _loc3_ = 0;
      _loc4_ = this.garageMarkers.length;
      while(_loc3_ < _loc4_)
      {
         if(this.garageMarkers[_loc3_])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.garageMarkers[_loc3_]);
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
      if(this.view.map._width > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH)
      {
         this.view.map._x = Math.min(0,Math.max(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width,this.mapDragX0 + _loc3_));
      }
      if(this.view.map._height > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT)
      {
         this.view.map._y = Math.min(0,Math.max(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - this.view.map._height,this.mapDragY0 + _loc2_));
      }
   }
   function moveMap()
   {
      var _loc2_ = this.view.map._x + this.mapMoveX;
      var _loc3_ = this.view.map._y + this.mapMoveY;
      var _loc4_ = 98;
      var _loc6_ = 0.5 * (com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width);
      var _loc5_ = 0.5 * (com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - _loc4_ - this.view.map._height) + _loc4_;
      var _loc9_ = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH - this.view.map._width;
      var _loc7_ = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
      var _loc10_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT - this.view.map._height - _loc4_;
      var _loc8_ = _loc4_;
      if(this.mapMoveX > 0)
      {
         if(_loc2_ <= _loc6_ || _loc2_ >= _loc9_ && _loc2_ <= _loc7_)
         {
            this.view.map._x = _loc2_;
         }
      }
      else if(_loc2_ >= _loc6_ || _loc2_ >= _loc9_ && _loc2_ <= _loc7_)
      {
         this.view.map._x = _loc2_;
      }
      if(this.mapMoveY > 0)
      {
         if(_loc3_ <= _loc5_ || _loc3_ >= _loc10_ && _loc3_ <= _loc8_)
         {
            this.view.map._y = _loc3_;
         }
      }
      else if(_loc3_ >= _loc5_ || _loc3_ >= _loc10_ && _loc3_ <= _loc8_)
      {
         this.view.map._y = _loc3_;
      }
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = this.view.map.transform.matrix.clone();
   }
   function scaleMap()
   {
      var _loc2_ = this.view.map.transform.matrix;
      var _loc3_ = this.mapScaleStep + 1;
      var _loc4_ = _loc2_.a * _loc3_;
      if(_loc4_ > com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.MapPage.MAP_SCALE_MIN / _loc2_.a;
      }
      _loc2_.translate(- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
      _loc2_.scale(_loc3_,_loc3_);
      _loc2_.translate(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
      this.view.map.transform.matrix = _loc2_;
      this.website.mapX = this.view.map._x;
      this.website.mapY = this.view.map._y;
      this.website.mapMatrix = _loc2_.clone();
   }
   function updateMarkers()
   {
      var _loc7_ = this.view.map._x;
      var _loc6_ = this.view.map._y;
      var _loc4_ = this.view.map.transform.matrix.a;
      var _loc3_ = 0;
      var _loc8_ = this.officeData.length;
      while(_loc3_ < _loc8_)
      {
         var _loc9_ = this.officeData[_loc3_].id;
         var _loc2_ = this.markers[_loc9_];
         if(_loc2_)
         {
            var _loc11_ = _loc4_ * this.officeData[_loc3_].x + _loc7_;
            var _loc10_ = _loc4_ * this.officeData[_loc3_].y + _loc6_;
            _loc2_._x = _loc11_;
            _loc2_._y = _loc10_;
            var _loc5_ = this.currentFilter == "all" || this.currentFilter == "offices";
            if(this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               _loc2_.disabled = !_loc5_;
               _loc2_._visible = _loc5_;
            }
         }
         _loc2_ = this.garageMarkers[_loc9_];
         if(_loc2_)
         {
            _loc11_ = _loc4_ * this.officeData[_loc3_].x + _loc7_;
            _loc10_ = _loc4_ * this.officeData[_loc3_].y + _loc6_;
            _loc2_._x = _loc11_;
            _loc2_._y = _loc10_;
            _loc5_ = this.currentFilter == "all" || this.currentFilter == "offices";
            if(this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               _loc2_.disabled = _loc9_ != this.website.selectedOfficeID && !_loc5_;
               _loc2_._visible = _loc5_;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      _loc8_ = this.agencyData.length;
      while(_loc3_ < _loc8_)
      {
         _loc9_ = this.agencyData[_loc3_].id;
         _loc2_ = this.markers[_loc9_];
         if(_loc2_)
         {
            _loc11_ = _loc4_ * this.agencyData[_loc3_].x + _loc7_;
            _loc10_ = _loc4_ * this.agencyData[_loc3_].y + _loc6_;
            _loc2_._x = _loc11_;
            _loc2_._y = _loc10_;
            _loc5_ = this.currentFilter == "all" || this.currentFilter == "agencies";
            if(this.isHiddenByProgressPanel(_loc2_) || this.isOffScreen(_loc2_))
            {
               _loc2_.disabled = true;
               _loc2_._visible = false;
            }
            else
            {
               _loc2_.disabled = !_loc5_;
               _loc2_._visible = _loc5_;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.filter_all._alpha = 70;
      this.view.filter_offices._alpha = 70;
      this.view.filter_agencies._alpha = 70;
      this.view["filter_" + this.currentFilter]._alpha = 100;
   }
   function resetMarkers(holdActiveOffice)
   {
      var _loc5_ = this.website.selectedOfficeID;
      var _loc2_ = 0;
      var _loc6_ = this.officeData.length;
      while(_loc2_ < _loc6_)
      {
         var _loc4_ = this.officeData[_loc2_].id;
         var _loc3_ = this.markers[_loc4_];
         if(_loc3_)
         {
            if(!holdActiveOffice || _loc4_ != _loc5_)
            {
               _loc3_.gotoAndStop(!this.officeData[_loc2_].isOwned ? "unownedInactive" : "ownedInactive");
               _loc3_.starterPackIcon._visible = this.officeData[_loc2_].isInStarterPack;
            }
         }
         _loc3_ = this.garageMarkers[_loc4_];
         if(_loc3_)
         {
            if(!holdActiveOffice || _loc4_ != _loc5_)
            {
               _loc3_.gotoAndStop(!this.officeData[_loc2_].garageIsOwned ? "unownedInactive" : "ownedInactive");
               _loc3_.disabled = true;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc6_ = this.agencyData.length;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = this.agencyData[_loc2_].id;
         _loc3_ = this.markers[_loc4_];
         if(_loc3_)
         {
            if(_loc4_ != _loc5_)
            {
               _loc3_.gotoAndStop(!this.agencyData[_loc2_].isOwned ? "unownedInactive" : "ownedInactive");
               _loc3_.starterPackIcon._visible = this.agencyData[_loc2_].isInStarterPack;
            }
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
   function showOfficeDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedOffice();
      this.progressPanel.showOverview(_loc2_,showImmediately);
   }
   function showGarageDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedOffice();
      this.progressPanel.showGarageOverview(_loc2_,showImmediately);
   }
   function showAgencyDetails(showImmediately)
   {
      var _loc2_ = this.website.getSelectedAgency();
      this.progressPanel.showAgencyOverview(_loc2_,showImmediately);
   }
}
