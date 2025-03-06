class com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var cursor;
   var view;
   var officeMarker;
   var markers;
   var controls;
   var warehousePanel;
   var interiorsOverlay;
   var overlay;
   var mapDragActive;
   var app;
   var mapZoomSoundPlaying;
   var mapPanSoundPlaying;
   var safeZoneRight;
   var safeZoneTop;
   var zoomInButton;
   var zoomOutButton;
   var allButton;
   var ownedButton;
   var statsButton;
   var safeZoneLeft;
   var warehousePanelMarker;
   var dragX;
   var dragY;
   var currentFilter;
   var safeZoneBottom;
   var activeMarker;
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 2.5;
   static var MAP_MOVE_SPEED = 20;
   static var ZOOM_IN = 5001;
   static var ZOOM_OUT = 5002;
   static var FILTER_ALL = 5003;
   static var FILTER_OWNED = 5004;
   static var BUY_WAREHOUSE = 5010;
   static var STEAL_VEHICLE = 5006;
   static var OVERLAY_ACCEPT = 5007;
   static var OVERLAY_CANCEL = 5008;
   static var STATS = 5009;
   static var RENOVATE_WAREHOUSE = 5011;
   static var INTERIOR_0 = 5012;
   static var INTERIOR_1 = 5013;
   static var INTERIOR_2 = 5014;
   static var PURCHASE_INTERIOR = 5005;
   static var CANCEL_INTERIOR = 5015;
   static var returningPlayerStatus = -1;
   function ImportExportMapScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"importExportMapScreen");
      this.init();
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.mapLabel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.ownedButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.allButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.zoomInButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.zoomOutButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.warehousePanel);
      this.officeMarker.dispose();
      var _loc3_ = 0;
      while(_loc3_ < this.markers.length)
      {
         this.markers[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      this.markers = null;
      this.controls = null;
      this.warehousePanel.dispose();
      super.dispose();
   }
   function showOverlay(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success, showInteriors)
   {
      if(showInteriors)
      {
         this.showInteriorsOverlay();
      }
      else
      {
         this.interiorsOverlay.hide();
         this.updateMarkers();
         this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
         this.mapDragActive = false;
         this.cursor.setTargetRects(this.overlay.controls);
      }
   }
   function showInteriorsOverlay()
   {
      var _loc2_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      this.updateMarkers();
      this.interiorsOverlay.show(_loc2_.interior0Cost,_loc2_.interior0SaleCost,_loc2_.interior1Cost,_loc2_.interior1SaleCost,_loc2_.interior2Cost,_loc2_.interior2SaleCost,_loc2_.purchasedInterior);
      this.mapDragActive = false;
      this.cursor.setTargetRects(this.interiorsOverlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.interiorsOverlay.hide();
      var _loc2_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      this.warehousePanel.show(_loc2_,this.app.imageManager,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.returningPlayerStatus == 1);
      this.updateFilterButtons(false);
      this.updateMarkers();
   }
   function get warehousePanelShowing()
   {
      return this.view.warehousePanel._visible;
   }
   function onWarehouseListChange()
   {
      var _loc2_ = 0;
      var _loc3_ = this.app.vehicleWarehouses.length;
      while(_loc2_ < _loc3_)
      {
         var _loc5_ = this.app.vehicleWarehouses[_loc2_];
         var _loc4_ = this.view.markers["marker" + _loc2_];
         _loc4_.gotoAndStop(!_loc5_.isOwned ? "unownedInactive" : "ownedInactive");
         _loc2_ = _loc2_ + 1;
      }
   }
   function init()
   {
      this.mapDragActive = false;
      this.mapZoomSoundPlaying = false;
      this.mapPanSoundPlaying = false;
      this.controls = [];
      this.markers = [];
      if(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.returningPlayerStatus == -1)
      {
         com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.returningPlayerStatus = !this.app.returningVehiclePlayer ? 0 : 1;
      }
      this.initMap();
      this.initOfficeMarker();
      this.initWarehouses();
      this.initZoomButtons();
      this.initFilterButtons();
      this.initNavButtons();
      this.initWarehousePanel();
      this.initInteriorsOverlay();
      this.initOverlay();
      this.updateMarkers();
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.showInitialWarehouse();
      this.view._visible = true;
   }
   function initMap()
   {
      this.view.map._x = this.app.mapStartX;
      this.view.map._y = this.app.mapStartY;
      if(this.app.mapStartMatrix)
      {
         this.view.map.transform.matrix = this.app.mapStartMatrix;
      }
      else
      {
         var _loc2_ = this.view.map.transform.matrix;
         var _loc3_ = this.app.mapStartScale / _loc2_.a;
         _loc2_.translate(- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         _loc2_.scale(_loc3_,_loc3_);
         _loc2_.translate(com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         this.view.map.transform.matrix = _loc2_;
      }
      if(this.app.returningVehiclePlayer)
      {
         this.view.map.gotoAndStop(this.view.map._totalframes);
         this.view.grid.gotoAndStop(this.view.grid._totalframes);
      }
   }
   function initOfficeMarker()
   {
      this.officeMarker = new com.rockstargames.gtav.levelDesign.securoserv.Marker(-1,this.view.markers.officeMarker);
      this.flashElementIn(this.view.markers.officeMarker,Math.random() * 0.5 + 0.1,"Map_Warehouse_Owned_Appear");
   }
   function initWarehouses()
   {
      var _loc2_ = 0;
      var _loc6_ = this.app.vehicleWarehouses.length;
      while(_loc2_ < _loc6_)
      {
         var _loc3_ = this.app.vehicleWarehouses[_loc2_];
         var _loc5_ = "marker" + _loc2_;
         var _loc4_ = this.view.markers[_loc5_] || this.view.markers.marker0.duplicateMovieClip(_loc5_,this.view.markers.getNextHighestDepth());
         _loc4_.gotoAndStop(!_loc3_.isOwned ? "unownedInactive" : "ownedInactive");
         _loc3_.markerIndex = this.markers.length;
         this.markers.push(new com.rockstargames.gtav.levelDesign.securoserv.Marker(_loc3_.id,_loc4_));
         this.flashElementIn(_loc4_,Math.random() * 0.5 + 0.1,!_loc3_.isOwned ? "Map_Warehouse_Not_Owned_Appear" : "Map_Warehouse_Owned_Appear");
         _loc2_ = _loc2_ + 1;
      }
   }
   function initZoomButtons()
   {
      var _loc3_ = this.safeZoneRight;
      var _loc2_ = Math.max(this.view.zoomOutButton._y,this.safeZoneTop);
      this.view.zoomOutButton._x = _loc3_ - this.view.zoomOutButton._width;
      this.view.zoomOutButton._y = _loc2_;
      this.view.zoomInButton._x = this.view.zoomOutButton._x - this.view.zoomInButton._width - 1;
      this.view.zoomInButton._y = _loc2_;
      this.zoomInButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.ZOOM_IN,this.view.zoomInButton);
      this.view.zoomInButton.icon.gotoAndStop("plus");
      this.controls.push(this.zoomInButton);
      this.zoomOutButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.ZOOM_OUT,this.view.zoomOutButton);
      this.view.zoomOutButton.icon.gotoAndStop("minus");
      this.controls.push(this.zoomOutButton);
      this.flashElementIn(this.view.zoomInButton,0.5);
      this.flashElementIn(this.view.zoomOutButton,0.6);
   }
   function initFilterButtons()
   {
      this.allButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL,this.view.allButton,"SECUROSERV_ALL");
      this.ownedButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED,this.view.ownedButton,"SECUROSERV_OWNED");
      this.updateFilterButtons(true);
   }
   function updateFilterButtons(initButtonDisplay)
   {
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.app.vehicleWarehouses.length)
      {
         if(this.app.vehicleWarehouses[_loc2_].isOwned)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = [];
      this.addControl(this.allButton);
      _loc4_.push(this.view.allButton);
      if(_loc3_)
      {
         this.addControl(this.ownedButton);
         _loc4_.push(this.view.ownedButton);
         this.view.ownedButton._visible = true;
      }
      else
      {
         this.removeControl(this.ownedButton);
         this.view.ownedButton._visible = false;
      }
      var _loc5_ = 0;
      if(_loc4_.length > 0)
      {
         _loc4_.sortOn("_width",Array.NUMERIC | Array.DESCENDING);
         _loc5_ = _loc4_[0]._width;
      }
      var _loc7_ = this.view.zoomInButton._x - 8 - _loc5_;
      var _loc8_ = Math.max(this.view.ownedButton._y,this.safeZoneTop);
      if(_loc3_)
      {
         this.view.ownedButton._x = _loc7_;
         this.view.ownedButton._y = _loc8_;
         _loc7_ -= 1 + _loc5_;
      }
      this.view.allButton._x = _loc7_;
      this.view.allButton._y = _loc8_;
      this.allButton.width = _loc5_;
      this.ownedButton.width = _loc5_;
      if(initButtonDisplay)
      {
         if(_loc3_)
         {
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED);
         }
         else
         {
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL);
         }
         var _loc6_ = 0.1;
         this.flashElementIn(this.view.allButton,_loc6_);
         _loc6_ += 0.1;
         if(_loc3_)
         {
            this.flashElementIn(this.view.ownedButton,_loc6_);
            _loc6_ += 0.1;
         }
      }
   }
   function initNavButtons()
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(-1,this.view.mapLabel,"SECUROSERV_VEHICLE_MAP");
      _loc2_.setState("on");
      var _loc3_ = Math.max(this.view.statsButton._y,this.safeZoneTop);
      this.statsButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.STATS,this.view.statsButton,"SECUROSERV_SUMMARY_PAGE");
      this.statsButton.setState("off");
      this.view.statsButton._x = this.safeZoneLeft;
      this.view.statsButton._y = _loc3_;
      this.view.mapLabel._y = _loc3_;
      _loc2_.updateBounds();
      this.statsButton.updateBounds();
      if(this.app.returningVehiclePlayer)
      {
         this.view.mapLabel._x = this.view.statsButton._x + 1 + this.view.statsButton._width;
         this.controls.push(this.statsButton);
      }
      else
      {
         this.view.statsButton._visible = false;
         this.view.mapLabel._x = this.view.statsButton._x;
      }
   }
   function initWarehousePanel()
   {
      this.view.warehousePanel._x = this.safeZoneLeft;
      this.view.warehousePanel._y = this.view.statsButton._y + this.view.statsButton.bg._height + 10;
      this.warehousePanel = new com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehousePanel(this.view.warehousePanel,this.app.displayConfig);
      this.warehousePanel.hide();
   }
   function initInteriorsOverlay()
   {
      this.interiorsOverlay = new com.rockstargames.gtav.levelDesign.securoserv.InteriorsOverlay(this.view.interiorsOverlay,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_0,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_1,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_2,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.PURCHASE_INTERIOR,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.CANCEL_INTERIOR,this.app.imageManager);
      this.interiorsOverlay.hide();
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.securoserv.PurchaseOutcomeOverlay(this.view.overlay,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.OVERLAY_ACCEPT,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.OVERLAY_CANCEL);
      this.overlay.hide();
   }
   function showInitialWarehouse()
   {
      if(this.app.selectedWarehouseID != -1)
      {
         var _loc5_ = 0;
         while(_loc5_ < this.markers.length)
         {
            var _loc3_ = this.markers[_loc5_];
            if(_loc3_.id == this.app.selectedWarehouseID)
            {
               var _loc6_ = _loc3_.getView();
               var _loc4_ = {x:0,y:0};
               _loc6_.localToGlobal(_loc4_);
               this.moveMap(com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X - _loc4_.x,com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y - _loc4_.y);
               var _loc2_ = this.app.getVehicleWarehouseByID(_loc3_.id);
               this.showWarehousePanel(_loc2_);
               this.updateMarkers();
               if(_loc2_.isOwned)
               {
                  this.warehousePanelMarker.setState("ownedSelected");
                  this.warehousePanelMarker.initMeter(_loc2_.numVehiclesStored / _loc2_.vehicleCapacity,true);
               }
               else
               {
                  this.warehousePanelMarker.setState("unownedSelected");
               }
               this.warehousePanelMarker.getView().swapDepths(this.view.markers.getNextHighestDepth());
               break;
            }
            _loc5_ = _loc5_ + 1;
         }
      }
   }
   function get isReady()
   {
      return true;
   }
   function updateCooldown(remainingSeconds)
   {
      this.warehousePanel.updateCooldown(remainingSeconds);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.SECUROSERV.ACCEPT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.CANCEL:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RIGHT_MOUSE:
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing && this.view.warehousePanel._visible)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Deselect");
               this.hideWarehousePanel();
               this.updateMarkers();
            }
            else if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing && this.app.returningVehiclePlayer)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Close");
               this.app.showScreen(this.app.IMPORT_EXPORT_STATS_SCREEN);
            }
            else if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Close");
               this.app.showScreen(this.app.BRANCH_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.SCROLL_DOWN_MOUSE:
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               this.scaleMap(-0.5 * com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_STEP);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.SCROLL_UP_MOUSE:
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               this.scaleMap(0.5 * com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_STEP);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LB:
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.prevFilter();
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RB:
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.nextFilter();
            }
      }
   }
   function handleAcceptInput(inputID)
   {
      var _loc2_ = this.app.GET_CURRENT_SELECTION();
      switch(_loc2_)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL:
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.filterWarehouses(_loc2_);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.ZOOM_IN:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.scaleMap(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_STEP);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.ZOOM_OUT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.scaleMap(- com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_STEP);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.OVERLAY_ACCEPT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
            this.checkReturningPlayerStatus();
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.OVERLAY_CANCEL:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Cancel");
            this.checkReturningPlayerStatus();
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.STATS:
            if(this.app.returningVehiclePlayer)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.showScreen(this.app.IMPORT_EXPORT_STATS_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.BUY_WAREHOUSE:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.RENOVATE_WAREHOUSE:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.STEAL_VEHICLE:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Sell");
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_0:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
            this.interiorsOverlay.selectButton(0);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_1:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
            this.interiorsOverlay.selectButton(1);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.INTERIOR_2:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
            this.interiorsOverlay.selectButton(2);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.CANCEL_INTERIOR:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Cancel");
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.PURCHASE_INTERIOR:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Buy");
            break;
         default:
            var _loc3_ = this.app.getVehicleWarehouseByID(_loc2_);
            if(_loc3_ != null)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Select");
               this.showWarehousePanel(_loc3_);
               this.updateMarkers();
               break;
            }
            if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
            {
               this.deselectWarehouse();
               if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE)
               {
                  this.dragX = this.cursor.x;
                  this.dragY = this.cursor.y;
                  this.mapDragActive = true;
               }
            }
            break;
      }
   }
   function handleButtonInputRelease(inputID)
   {
      if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE)
      {
         this.mapDragActive = false;
      }
      this.mapZoomSoundPlaying = false;
      if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
      {
         if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LT || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.RT)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Zoom_End");
         }
      }
   }
   function handleJoystickInput(isLeftStick, x, y)
   {
      if(this.overlay.isShowing || this.interiorsOverlay.isShowing)
      {
         return undefined;
      }
      if(!isLeftStick)
      {
         if(x == 127 && y == 127)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Scroll_End");
            this.mapPanSoundPlaying = false;
         }
         else if(!this.mapPanSoundPlaying)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Scroll_Start");
            this.mapPanSoundPlaying = true;
         }
      }
      x = (x - 128) / 128;
      y = (y - 128) / 128;
      if(!isLeftStick)
      {
         this.moveMap((- com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_MOVE_SPEED) * x,(- com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_MOVE_SPEED) * y);
      }
   }
   function handleMouseInput(x, y)
   {
      if(this.mapDragActive)
      {
         var _loc3_ = this.cursor.x - this.dragX;
         var _loc2_ = this.cursor.y - this.dragY;
         this.moveMap(_loc3_,_loc2_);
         this.dragX = this.cursor.x;
         this.dragY = this.cursor.y;
      }
   }
   function checkReturningPlayerStatus()
   {
      if(this.app.returningVehiclePlayer)
      {
         this.controls.push(this.statsButton);
         this.view.mapLabel._x = this.view.statsButton._x + 1 + this.view.statsButton._width;
         this.view.statsButton._visible = true;
      }
   }
   function filterWarehouses(id)
   {
      var _loc0_ = null;
      if((_loc0_ = id) !== com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED)
      {
         this.allButton.setState("on");
         this.ownedButton.setState("off");
         this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL;
      }
      else
      {
         this.allButton.setState("off");
         this.ownedButton.setState("on");
         this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED;
      }
      this.updateMarkers();
   }
   function prevFilter()
   {
      switch(this.currentFilter)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL:
            if(this.view.ownedButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED:
            if(this.view.allButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL);
               break;
            }
         default:
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL);
      }
   }
   function nextFilter()
   {
      switch(this.currentFilter)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL:
            if(this.view.ownedButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED:
            if(this.view.allButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL);
               break;
            }
         default:
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL);
      }
   }
   function moveMap(dx, dy)
   {
      var _loc2_ = this.view.map._x + dx;
      var _loc3_ = this.view.map._y + dy;
      var _loc5_ = 0.5 * (com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_WIDTH - this.view.map._width);
      var _loc4_ = 0.5 * (com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_HEIGHT - this.view.map._height);
      var _loc8_ = this.safeZoneRight - this.view.map._width;
      var _loc6_ = this.safeZoneLeft;
      var _loc9_ = this.safeZoneBottom - this.view.map._height;
      var _loc7_ = this.safeZoneTop;
      if(dx > 0)
      {
         if(_loc2_ <= _loc5_ || _loc2_ >= _loc8_ && _loc2_ <= _loc6_)
         {
            this.view.map._x = _loc2_;
         }
      }
      else if(_loc2_ >= _loc5_ || _loc2_ >= _loc8_ && _loc2_ <= _loc6_)
      {
         this.view.map._x = _loc2_;
      }
      if(dy > 0)
      {
         if(_loc3_ <= _loc4_ || _loc3_ >= _loc9_ && _loc3_ <= _loc7_)
         {
            this.view.map._y = _loc3_;
         }
      }
      else if(_loc3_ >= _loc4_ || _loc3_ >= _loc9_ && _loc3_ <= _loc7_)
      {
         this.view.map._y = _loc3_;
      }
      this.app.mapStartX = this.view.map._x;
      this.app.mapStartY = this.view.map._y;
      this.app.mapStartMatrix = this.view.map.transform.matrix.clone();
      this.updateMarkers();
   }
   function scaleMap(step)
   {
      var _loc2_ = this.view.map.transform.matrix;
      var _loc3_ = step + 1;
      var _loc4_ = _loc2_.a * _loc3_;
      if(_loc4_ > com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.MAP_SCALE_MIN / _loc2_.a;
      }
      _loc2_.translate(- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
      _loc2_.scale(_loc3_,_loc3_);
      _loc2_.translate(com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
      this.view.map.transform.matrix = _loc2_;
      this.app.mapStartX = this.view.map._x;
      this.app.mapStartY = this.view.map._y;
      this.app.mapStartMatrix = this.view.map.transform.matrix.clone();
      if(!this.mapZoomSoundPlaying)
      {
         this.mapZoomSoundPlaying = true;
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Zoom_Start");
      }
      this.updateMarkers();
   }
   function deselectWarehouse()
   {
      if(!this.cursorIsOverWarehousePanel())
      {
         this.hideWarehousePanel();
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Deselect");
         if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
         {
            this.updateMarkers();
         }
      }
   }
   function cursorIsOverWarehousePanel()
   {
      return this.cursor.x > this.warehousePanel.left && this.cursor.x < this.warehousePanel.right && this.cursor.y > this.warehousePanel.top && this.cursor.y < this.warehousePanel.bottom;
   }
   function updateMarkers()
   {
      var _loc12_ = this.view.map._x;
      var _loc11_ = this.view.map._y;
      var _loc9_ = this.view.map.transform.matrix.a;
      var _loc10_ = [];
      var _loc5_ = 0;
      var _loc6_ = this.app.vehicleWarehouses.length;
      while(_loc5_ < _loc6_)
      {
         var _loc4_ = this.app.vehicleWarehouses[_loc5_];
         var _loc2_ = this.markers[_loc4_.markerIndex];
         var _loc3_ = false;
         var _loc7_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_ALL;
         var _loc8_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.FILTER_OWNED && _loc4_.isOwned;
         if(_loc7_ || _loc8_)
         {
            var _loc14_ = _loc9_ * _loc4_.x + _loc12_;
            var _loc13_ = _loc9_ * _loc4_.y + _loc11_;
            _loc2_.updatePosition(_loc14_,_loc13_);
            if(_loc2_.isOnStage(this.safeZoneLeft,this.safeZoneRight,this.safeZoneTop,this.safeZoneBottom))
            {
               if(!this.markerIsHiddenByWarehousePanel(_loc2_))
               {
                  _loc10_.push(_loc2_);
               }
               else
               {
                  _loc3_ = true;
               }
            }
            else
            {
               _loc3_ = true;
            }
         }
         else
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            _loc2_.updatePosition(-100,-100);
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc14_ = _loc9_ * this.app.playerX + _loc12_;
      _loc13_ = _loc9_ * this.app.playerY + _loc11_;
      this.officeMarker.updatePosition(_loc14_,_loc13_);
      this.updateActiveButtons(_loc10_);
   }
   function showWarehousePanel(warehouse)
   {
      this.app.selectedWarehouseID = warehouse.id;
      if(!this.view.warehousePanel._visible)
      {
         this.view.warehousePanel._visible = true;
         this.flashElementIn(this.view.warehousePanel,0.1);
      }
      this.warehousePanel.show(warehouse,this.app.imageManager,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.returningPlayerStatus == 1);
      if(this.warehousePanelMarker)
      {
         if(this.warehousePanelMarker.id != warehouse.id)
         {
            var _loc5_ = this.app.getVehicleWarehouseByID(this.warehousePanelMarker.id);
            this.warehousePanelMarker.setState(!_loc5_.isOwned ? "unownedInactive" : "ownedInactive");
         }
      }
      var _loc2_ = 0;
      var _loc4_ = this.markers.length;
      while(_loc2_ < _loc4_)
      {
         if(this.markers[_loc2_].id == warehouse.id)
         {
            this.warehousePanelMarker = this.markers[_loc2_];
            if(warehouse.isOwned)
            {
               this.warehousePanelMarker.setState("ownedSelected");
               this.warehousePanelMarker.initMeter(warehouse.numVehiclesStored / warehouse.vehicleCapacity,false);
            }
            else
            {
               this.warehousePanelMarker.setState("unownedSelected");
            }
            this.warehousePanelMarker.getView().swapDepths(this.view.markers.getNextHighestDepth());
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function markerIsHiddenByWarehousePanel(marker)
   {
      return this.view.warehousePanel._visible && marker.left > this.warehousePanel.left && marker.right < this.warehousePanel.right && marker.top > this.warehousePanel.top && marker.bottom < this.warehousePanel.bottom;
   }
   function onTargetChange(targetID)
   {
      var _loc2_ = 0;
      var _loc3_ = this.markers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.markers[_loc2_].id == targetID)
         {
            var _loc4_ = this.markers[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.activeMarker && this.activeMarker != _loc4_ && this.activeMarker != this.warehousePanelMarker)
      {
         var _loc6_ = this.app.getVehicleWarehouseByID(this.activeMarker.id);
         this.activeMarker.setState(!_loc6_.isOwned ? "unownedInactive" : "ownedInactive");
      }
      if(targetID == -1)
      {
         this.activeMarker = null;
      }
      else
      {
         if(_loc4_ != this.activeMarker)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Mouseover");
         }
         this.activeMarker = _loc4_;
         if(this.activeMarker)
         {
            _loc6_ = this.app.getVehicleWarehouseByID(this.activeMarker.id);
            if(this.activeMarker != this.warehousePanelMarker)
            {
               if(_loc6_.isOwned)
               {
                  this.activeMarker.setState("ownedActive");
                  this.activeMarker.initMeter(_loc6_.numVehiclesStored / _loc6_.vehicleCapacity,true);
               }
               else
               {
                  this.activeMarker.setState("unownedActive");
               }
            }
         }
      }
      if(this.warehousePanelMarker)
      {
         this.warehousePanelMarker.bringToFront();
      }
      if(this.activeMarker)
      {
         this.activeMarker.bringToFront();
      }
   }
   function hideWarehousePanel()
   {
      if(this.warehousePanelMarker)
      {
         var _loc2_ = this.app.getVehicleWarehouseByID(this.warehousePanelMarker.id);
         this.warehousePanelMarker.setState(!_loc2_.isOwned ? "unownedInactive" : "ownedInactive");
         this.warehousePanelMarker = null;
      }
      this.warehousePanel.hide();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function addControl(control)
   {
      var _loc2_ = 0;
      var _loc3_ = this.controls.length;
      while(_loc2_ < _loc3_)
      {
         if(this.controls[_loc2_] == control)
         {
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.controls.push(control);
   }
   function removeControl(control)
   {
      var _loc2_ = 0;
      var _loc3_ = this.controls.length;
      while(_loc2_ < _loc3_)
      {
         if(this.controls[_loc2_] == control)
         {
            this.controls.splice(_loc2_,1);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateActiveButtons(activeMarkers)
   {
      this.cursor.setTargetRects(activeMarkers.concat(this.controls).concat(this.warehousePanel.controls));
   }
}
