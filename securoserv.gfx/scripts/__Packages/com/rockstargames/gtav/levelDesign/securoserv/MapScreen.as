class com.rockstargames.gtav.levelDesign.securoserv.MapScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var cursor;
   var view;
   var officeMarker;
   var markers;
   var controls;
   var warehousePanel;
   var overlay;
   var mapDragActive;
   var app;
   var mapZoomSoundPlaying;
   var mapPanSoundPlaying;
   var safeZoneLeft;
   var safeZoneTop;
   var safeZoneRight;
   var zoomInButton;
   var zoomOutButton;
   var allButton;
   var ownedButton;
   var smallButton;
   var mediumButton;
   var largeButton;
   var currentFilter;
   var safeZoneBottom;
   var statsButton;
   var warehousePanelMarker;
   var dragX;
   var dragY;
   var activeMarker;
   static var MAP_SCALE_STEP = 0.1;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 2.5;
   static var MAP_MOVE_SPEED = 20;
   static var ZOOM_IN = 3001;
   static var ZOOM_OUT = 3002;
   static var FILTER_ALL = 3003;
   static var FILTER_SMALL = 3004;
   static var FILTER_MEDIUM = 3005;
   static var FILTER_LARGE = 3006;
   static var BUY_WAREHOUSE = 3007;
   static var SMALL_SHIPMENT = 3008;
   static var MEDIUM_SHIPMENT = 3009;
   static var LARGE_SHIPMENT = 3010;
   static var SELL_CONTRABAND = 3011;
   static var OVERLAY_ACCEPT = 3012;
   static var OVERLAY_CANCEL = 3013;
   static var STATS = 3014;
   static var FILTER_OWNED = 3015;
   function MapScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"mapScreen");
      this.init();
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.mapLabel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.ownedButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.allButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.smallButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.mediumButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.largeButton);
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
   function showOverlay(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.updateMarkers();
      this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
      this.mapDragActive = false;
      this.cursor.setTargetRects(this.overlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      var _loc2_ = this.app.getWarehouseByID(this.app.selectedWarehouseID);
      this.warehousePanel.show(_loc2_,this.app.imageManager);
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
      var _loc3_ = this.app.warehouses.length;
      while(_loc2_ < _loc3_)
      {
         var _loc5_ = this.app.warehouses[_loc2_];
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
      this.initMap();
      this.initOfficeMarker();
      this.initWarehouses();
      this.initWarehousePanel();
      this.initZoomButtons();
      this.initFilterButtons();
      this.initNavButtons();
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
      if(this.app.returningPlayer)
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
      var _loc6_ = this.app.warehouses.length;
      while(_loc2_ < _loc6_)
      {
         var _loc3_ = this.app.warehouses[_loc2_];
         var _loc5_ = "marker" + _loc2_;
         var _loc4_ = this.view.markers[_loc5_] || this.view.markers.marker0.duplicateMovieClip(_loc5_,this.view.markers.getNextHighestDepth());
         _loc4_.gotoAndStop(!_loc3_.isOwned ? "unownedInactive" : "ownedInactive");
         _loc3_.markerIndex = this.markers.length;
         this.markers.push(new com.rockstargames.gtav.levelDesign.securoserv.Marker(_loc3_.id,_loc4_));
         this.flashElementIn(_loc4_,Math.random() * 0.5 + 0.1,!_loc3_.isOwned ? "Map_Warehouse_Not_Owned_Appear" : "Map_Warehouse_Owned_Appear");
         _loc2_ = _loc2_ + 1;
      }
   }
   function initWarehousePanel()
   {
      this.view.warehousePanel._x = this.safeZoneLeft;
      if(this.view.warehousePanel._y < this.safeZoneTop)
      {
         this.view.warehousePanel._y = this.safeZoneTop;
      }
      this.warehousePanel = new com.rockstargames.gtav.levelDesign.securoserv.WarehousePanel(this.view.warehousePanel,this.app.displayConfig);
      this.warehousePanel.hide();
   }
   function initZoomButtons()
   {
      var _loc3_ = this.safeZoneRight;
      var _loc2_ = Math.max(this.view.zoomOutButton._y,this.safeZoneTop);
      this.view.zoomOutButton._x = _loc3_ - this.view.zoomOutButton._width;
      this.view.zoomOutButton._y = _loc2_;
      this.view.zoomInButton._x = this.view.zoomOutButton._x - this.view.zoomInButton._width - 1;
      this.view.zoomInButton._y = _loc2_;
      this.zoomInButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.ZOOM_IN,this.view.zoomInButton);
      this.view.zoomInButton.icon.gotoAndStop("plus");
      this.controls.push(this.zoomInButton);
      this.zoomOutButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.ZOOM_OUT,this.view.zoomOutButton);
      this.view.zoomOutButton.icon.gotoAndStop("minus");
      this.controls.push(this.zoomOutButton);
      this.flashElementIn(this.view.zoomInButton,0.5);
      this.flashElementIn(this.view.zoomOutButton,0.6);
   }
   function initFilterButtons()
   {
      this.allButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL,this.view.allButton,"SECUROSERV_ALL");
      this.ownedButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED,this.view.ownedButton,"SECUROSERV_OWNED");
      this.smallButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL,this.view.smallButton,"SECUROSERV_SMALL");
      this.mediumButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM,this.view.mediumButton,"SECUROSERV_MEDIUM");
      this.largeButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE,this.view.largeButton,"SECUROSERV_LARGE");
      this.updateFilterButtons(true);
   }
   function updateFilterButtons(initButtonDisplay)
   {
      var _loc5_ = false;
      var _loc6_ = false;
      var _loc7_ = false;
      var _loc13_ = false;
      var _loc15_ = false;
      var _loc9_ = false;
      var _loc14_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.app.warehouses.length)
      {
         var _loc4_ = this.app.warehouses[_loc2_].size;
         var _loc3_ = this.app.warehouses[_loc2_].isOwned;
         if(_loc4_ == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_SMALL)
         {
            _loc5_ = true;
            if(_loc3_)
            {
               _loc13_ = true;
            }
         }
         else if(_loc4_ == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_MEDIUM)
         {
            _loc6_ = true;
            if(_loc3_)
            {
               _loc15_ = true;
            }
         }
         else if(_loc4_ == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_LARGE)
         {
            _loc7_ = true;
         }
         if(_loc3_)
         {
            _loc9_ = true;
            _loc14_ = _loc14_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc14_ == 5)
      {
         if(!_loc13_)
         {
            _loc5_ = false;
         }
         if(!_loc15_ && !_loc13_)
         {
            _loc6_ = false;
         }
      }
      var _loc17_ = _loc5_ + _loc6_ + _loc7_ > 1;
      _loc5_ = _loc5_ && _loc17_;
      _loc6_ = _loc6_ && _loc17_;
      _loc7_ = _loc7_ && _loc17_;
      var _loc12_ = [];
      this.addControl(this.allButton);
      _loc12_.push(this.view.allButton);
      if(_loc9_)
      {
         this.addControl(this.ownedButton);
         _loc12_.push(this.view.ownedButton);
         this.view.ownedButton._visible = true;
      }
      else
      {
         this.removeControl(this.ownedButton);
         this.view.ownedButton._visible = false;
      }
      if(_loc5_)
      {
         this.addControl(this.smallButton);
         _loc12_.push(this.view.smallButton);
         this.view.smallButton._visible = true;
      }
      else
      {
         this.removeControl(this.smallButton);
         this.view.smallButton._visible = false;
      }
      if(_loc6_)
      {
         this.addControl(this.mediumButton);
         _loc12_.push(this.view.mediumButton);
         this.view.mediumButton._visible = true;
      }
      else
      {
         this.removeControl(this.mediumButton);
         this.view.mediumButton._visible = false;
      }
      if(_loc7_)
      {
         this.addControl(this.largeButton);
         _loc12_.push(this.view.largeButton);
         this.view.largeButton._visible = true;
      }
      else
      {
         this.removeControl(this.largeButton);
         this.view.largeButton._visible = false;
      }
      var _loc8_ = 0;
      if(_loc12_.length > 0)
      {
         _loc12_.sortOn("_width",Array.NUMERIC | Array.DESCENDING);
         _loc8_ = _loc12_[0]._width;
      }
      var _loc11_ = this.view.zoomInButton._x - 8 - _loc8_;
      var _loc16_ = Math.max(this.view.largeButton._y,this.safeZoneTop);
      if(_loc7_)
      {
         this.view.largeButton._x = _loc11_;
         this.view.largeButton._y = _loc16_;
         _loc11_ -= 1 + _loc8_;
      }
      if(_loc6_)
      {
         this.view.mediumButton._x = _loc11_;
         this.view.mediumButton._y = _loc16_;
         _loc11_ -= 1 + _loc8_;
      }
      if(_loc5_)
      {
         this.view.smallButton._x = _loc11_;
         this.view.smallButton._y = _loc16_;
         _loc11_ -= 1 + _loc8_;
      }
      if(_loc9_)
      {
         this.view.ownedButton._x = _loc11_;
         this.view.ownedButton._y = _loc16_;
         _loc11_ -= 1 + _loc8_;
      }
      this.view.allButton._x = _loc11_;
      this.view.allButton._y = _loc16_;
      this.allButton.width = _loc8_;
      this.ownedButton.width = _loc8_;
      this.smallButton.width = _loc8_;
      this.mediumButton.width = _loc8_;
      this.largeButton.width = _loc8_;
      if(this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE && !this.view.largeButton._visible)
      {
         this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
      }
      else if(this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM && !this.view.mediumButton._visible)
      {
         this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
      }
      else if(this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL && !this.view.smallButton._visible)
      {
         this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
      }
      if(initButtonDisplay)
      {
         if(_loc9_)
         {
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED);
         }
         else
         {
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
         }
         var _loc10_ = 0.1;
         if(_loc17_)
         {
            this.flashElementIn(this.view.allButton,_loc10_);
            _loc10_ += 0.1;
         }
         if(_loc9_)
         {
            this.flashElementIn(this.view.ownedButton,_loc10_);
            _loc10_ += 0.1;
         }
         if(_loc5_)
         {
            this.flashElementIn(this.view.smallButton,_loc10_);
            _loc10_ += 0.1;
         }
         if(_loc6_)
         {
            this.flashElementIn(this.view.mediumButton,_loc10_);
            _loc10_ += 0.1;
         }
         if(_loc7_)
         {
            this.flashElementIn(this.view.largeButton,_loc10_);
         }
      }
   }
   function initNavButtons()
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(-1,this.view.mapLabel,"SECUROSERV_WAREHOUSE_MAP");
      _loc2_.setState("on");
      var _loc3_ = Math.min(this.view.statsButton._y,this.safeZoneBottom - this.view.statsButton._height);
      this.statsButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.STATS,this.view.statsButton,"SECUROSERV_SUMMARY_PAGE");
      this.statsButton.setState("off");
      this.view.mapLabel._x = this.safeZoneRight - this.view.mapLabel._width;
      this.view.mapLabel._y = _loc3_;
      this.view.statsButton._x = this.view.mapLabel._x - 1 - this.view.statsButton._width;
      this.view.statsButton._y = _loc3_;
      _loc2_.updateBounds();
      this.statsButton.updateBounds();
      if(this.app.returningPlayer)
      {
         this.controls.push(this.statsButton);
      }
      else
      {
         this.view.statsButton._visible = false;
      }
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.securoserv.PurchaseOutcomeOverlay(this.view.overlay,com.rockstargames.gtav.levelDesign.securoserv.MapScreen.OVERLAY_ACCEPT,com.rockstargames.gtav.levelDesign.securoserv.MapScreen.OVERLAY_CANCEL);
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
               var _loc2_ = this.app.getWarehouseByID(_loc3_.id);
               this.showWarehousePanel(_loc2_);
               this.updateMarkers();
               if(_loc2_.isOwned)
               {
                  this.warehousePanelMarker.setState("ownedSelected");
                  this.warehousePanelMarker.initMeter(_loc2_.amountStored / _loc2_.capacity,true);
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
            if(!this.overlay.isShowing && this.view.warehousePanel._visible)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Deselect");
               this.hideWarehousePanel();
               this.updateMarkers();
            }
            else if(!this.overlay.isShowing && this.app.returningPlayer)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Close");
               this.app.showScreen(this.app.STATS_SCREEN);
            }
            else if(!this.overlay.isShowing)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Close");
               this.app.showScreen(this.app.BRANCH_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.SCROLL_DOWN_MOUSE:
            if(!this.overlay.isShowing)
            {
               this.scaleMap(-0.5 * com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_STEP);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.SCROLL_UP_MOUSE:
            if(!this.overlay.isShowing)
            {
               this.scaleMap(0.5 * com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_STEP);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LB:
            if(!this.overlay.isShowing)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.prevFilter();
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RB:
            if(!this.overlay.isShowing)
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
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.filterWarehouses(_loc2_);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.ZOOM_IN:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.scaleMap(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_STEP);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.ZOOM_OUT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.scaleMap(- com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_STEP);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.OVERLAY_ACCEPT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
            this.checkReturningPlayerStatus();
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.OVERLAY_CANCEL:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Cancel");
            this.checkReturningPlayerStatus();
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.STATS:
            if(this.app.returningPlayer)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.showScreen(this.app.STATS_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.BUY_WAREHOUSE:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.SMALL_SHIPMENT:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MEDIUM_SHIPMENT:
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.LARGE_SHIPMENT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Buy");
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.SELL_CONTRABAND:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Sell");
            break;
         default:
            var _loc3_ = this.app.getWarehouseByID(_loc2_);
            if(_loc3_ != null)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Warehouse_Select");
               this.showWarehousePanel(_loc3_);
               this.updateMarkers();
               break;
            }
            if(!this.overlay.isShowing)
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
      if(!this.overlay.isShowing)
      {
         if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LT || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.RT)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Map_Zoom_End");
         }
      }
   }
   function handleJoystickInput(isLeftStick, x, y)
   {
      if(this.overlay.isShowing)
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
         this.moveMap((- com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_MOVE_SPEED) * x,(- com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_MOVE_SPEED) * y);
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
      if(this.app.returningPlayer)
      {
         this.controls.push(this.statsButton);
         this.view.statsButton._visible = true;
      }
   }
   function filterWarehouses(id)
   {
      switch(id)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL:
            this.smallButton.setState("on");
            this.mediumButton.setState("off");
            this.largeButton.setState("off");
            this.allButton.setState("off");
            this.ownedButton.setState("off");
            this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL;
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM:
            this.smallButton.setState("off");
            this.mediumButton.setState("on");
            this.largeButton.setState("off");
            this.allButton.setState("off");
            this.ownedButton.setState("off");
            this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM;
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE:
            this.smallButton.setState("off");
            this.mediumButton.setState("off");
            this.largeButton.setState("on");
            this.allButton.setState("off");
            this.ownedButton.setState("off");
            this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE;
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED:
            this.smallButton.setState("off");
            this.mediumButton.setState("off");
            this.largeButton.setState("off");
            this.allButton.setState("off");
            this.ownedButton.setState("on");
            this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED;
            break;
         default:
            this.smallButton.setState("off");
            this.mediumButton.setState("off");
            this.largeButton.setState("off");
            this.allButton.setState("on");
            this.ownedButton.setState("off");
            this.currentFilter = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL;
      }
      this.updateMarkers();
   }
   function prevFilter()
   {
      switch(this.currentFilter)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL:
            if(this.view.largeButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE:
            if(this.view.mediumButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM:
            if(this.view.smallButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL:
            if(this.view.ownedButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED:
            if(this.view.allButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
               break;
            }
         default:
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
      }
   }
   function nextFilter()
   {
      switch(this.currentFilter)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL:
            if(this.view.ownedButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED:
            if(this.view.smallButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL:
            if(this.view.mediumButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM:
            if(this.view.largeButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE);
               break;
            }
         case com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE:
            if(this.view.allButton._visible)
            {
               this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
               break;
            }
         default:
            this.filterWarehouses(com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL);
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
      if(_loc4_ > com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_MAX)
      {
         _loc3_ = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_MAX / _loc2_.a;
      }
      else if(_loc4_ < com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_MIN)
      {
         _loc3_ = com.rockstargames.gtav.levelDesign.securoserv.MapScreen.MAP_SCALE_MIN / _loc2_.a;
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
         if(!this.overlay.isShowing)
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
      var _loc18_ = this.view.map._x;
      var _loc17_ = this.view.map._y;
      var _loc13_ = this.view.map.transform.matrix.a;
      var _loc16_ = [];
      var _loc14_ = 0;
      var _loc7_ = false;
      var _loc15_ = false;
      var _loc6_ = 0;
      var _loc8_ = this.app.warehouses.length;
      while(_loc6_ < _loc8_)
      {
         var _loc2_ = this.app.warehouses[_loc6_];
         if(_loc2_.isOwned)
         {
            _loc14_ = _loc14_ + 1;
            if(_loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_SMALL)
            {
               _loc7_ = true;
            }
            else if(_loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_MEDIUM)
            {
               _loc15_ = true;
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      _loc8_ = this.app.warehouses.length;
      while(_loc6_ < _loc8_)
      {
         _loc2_ = this.app.warehouses[_loc6_];
         var _loc3_ = this.markers[_loc2_.markerIndex];
         var _loc4_ = false;
         var _loc12_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_SMALL && _loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_SMALL;
         var _loc9_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_MEDIUM && _loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_MEDIUM;
         var _loc11_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_LARGE && _loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_LARGE;
         var _loc5_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL;
         var _loc10_ = this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_OWNED && _loc2_.isOwned;
         if(this.currentFilter == com.rockstargames.gtav.levelDesign.securoserv.MapScreen.FILTER_ALL)
         {
            if(_loc14_ == 5)
            {
               if(_loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_SMALL && !_loc7_)
               {
                  _loc5_ = false;
               }
               else if(_loc2_.size == com.rockstargames.gtav.levelDesign.securoserv.Warehouse.SIZE_MEDIUM && (!_loc7_ && !_loc15_))
               {
                  _loc5_ = false;
               }
            }
         }
         if(_loc12_ || _loc9_ || _loc11_ || _loc5_ || _loc10_)
         {
            var _loc20_ = _loc13_ * _loc2_.x + _loc18_;
            var _loc19_ = _loc13_ * _loc2_.y + _loc17_;
            _loc3_.updatePosition(_loc20_,_loc19_);
            if(_loc3_.isOnStage(this.safeZoneLeft,this.safeZoneRight,this.safeZoneTop,this.safeZoneBottom))
            {
               if(!this.markerIsHiddenByWarehousePanel(_loc3_))
               {
                  _loc16_.push(_loc3_);
               }
               else
               {
                  _loc4_ = true;
               }
            }
            else
            {
               _loc4_ = true;
            }
         }
         else
         {
            _loc4_ = true;
         }
         if(_loc4_)
         {
            _loc3_.updatePosition(-100,-100);
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc20_ = _loc13_ * this.app.playerX + _loc18_;
      _loc19_ = _loc13_ * this.app.playerY + _loc17_;
      this.officeMarker.updatePosition(_loc20_,_loc19_);
      this.updateActiveButtons(_loc16_);
   }
   function showWarehousePanel(warehouse)
   {
      this.app.selectedWarehouseID = warehouse.id;
      if(!this.view.warehousePanel._visible)
      {
         this.view.warehousePanel._visible = true;
         this.flashElementIn(this.view.warehousePanel,0.1);
      }
      this.warehousePanel.show(warehouse,this.app.imageManager);
      if(this.warehousePanelMarker)
      {
         if(this.warehousePanelMarker.id != warehouse.id)
         {
            var _loc5_ = this.app.getWarehouseByID(this.warehousePanelMarker.id);
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
               this.warehousePanelMarker.initMeter(warehouse.amountStored / warehouse.capacity,false);
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
         var _loc6_ = this.app.getWarehouseByID(this.activeMarker.id);
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
            _loc6_ = this.app.getWarehouseByID(this.activeMarker.id);
            if(this.activeMarker != this.warehousePanelMarker)
            {
               if(_loc6_.isOwned)
               {
                  this.activeMarker.setState("ownedActive");
                  this.activeMarker.initMeter(_loc6_.amountStored / _loc6_.capacity,true);
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
         var _loc2_ = this.app.getWarehouseByID(this.warehousePanelMarker.id);
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
