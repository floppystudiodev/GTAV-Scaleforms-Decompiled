class com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen extends com.rockstargames.gtav.levelDesign.importExportWarehouse.Screen
{
   var _controls;
   var _tabButtons;
   var _exportTabContent;
   var _collectionTabContent;
   var _allCarTiles;
   var _allCollectionTiles;
   var _activeTabIndex;
   var view;
   var _overlay;
   var _filterSystem;
   var _activeScrollKey;
   var app;
   var _exportSelection;
   var _exportScrollbar;
   var _collectionScrollbar;
   var _exportTabButton;
   var _collectionTabButton;
   var _singleCarInventoryContainer;
   var _carSetsInventoryContainer;
   var safeZoneBottom;
   var cursor;
   static var ID_EXPORT_TAB = 0;
   static var ID_COLLECTION_TAB = 1;
   static var ID_BUYERS_TAB = 2;
   static var NUM_COLS = 4;
   static var COL_WIDTH = 216;
   static var ROW_HEIGHT = 219;
   static var LIST_Y_OFFSET_TO_FILTER_BUTTONS = 20;
   static var LIST_X_OFFSET_FOR_IMAGE_TEXTFIELD = 2;
   static var COLLECTION_NUM_COLS = 1;
   static var COLLECTION_COL_WIDTH = 857;
   static var COLLECTION_ROW_HEIGHT = 225;
   function WarehouseScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"warehouseScreen");
      this.init();
   }
   function init()
   {
      this._controls = [];
      this._tabButtons = [];
      this._exportTabContent = [];
      this._collectionTabContent = [];
      this._allCarTiles = [];
      this._allCollectionTiles = [];
      this._activeTabIndex = -1;
      this.initOverlay();
      this.initStaticButtons();
      this.initExportTabContent();
      this.initCollectionTabContent();
      this.initExportSelection();
      this.initScrollbars();
      this.initFilterButtons();
      this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB);
      this.view._visible = true;
   }
   function showOverlay(title, message, acceptButton, cancelButton)
   {
      this._overlay.show(title,message,acceptButton,cancelButton);
      this.updateControls();
   }
   function hideOverlay()
   {
      this._overlay.hide();
      this.updateControls();
   }
   function handleButtonInput(inputID)
   {
      if(this._filterSystem.areFilterOptionsShowing)
      {
         this.handleInput(inputID);
         return undefined;
      }
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.LB:
            this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB);
            break;
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.RB:
            this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB);
            break;
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.KEY_UP:
            this._activeScrollKey = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.KEY_UP;
            this.scrollListFromKeyboard(-1);
            break;
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.KEY_DOWN:
            this._activeScrollKey = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.KEY_DOWN;
            this.scrollListFromKeyboard(1);
            break;
         default:
            this.handleInput(inputID);
      }
   }
   function handleInput(inputID)
   {
      var _loc3_ = -1;
      if(com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG)
      {
         _loc3_ = this.app.GET_CURRENT_SELECTION();
      }
      else
      {
         _loc3_ = inputID;
      }
      switch(_loc3_)
      {
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.EXPORT_TAB_BUTTON:
            this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB);
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.COLLECTION_TAB_BUTTON:
            this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB);
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_VALUE:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_NAME:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_POSITION:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_COMPLETION:
            this._filterSystem.setSortOrder(_loc3_);
            this.applySortOrder();
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_DRIVERS:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_CLASS:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_NONE:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_0:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_1:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_2:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_3:
            if(this._filterSystem.areFilterOptionsShowing)
            {
               this._filterSystem.setFilter(_loc3_);
               this.applyFilter();
               break;
            }
            this._filterSystem.openFilterOptions(_loc3_);
            this.updateControls();
            break;
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.CANCEL:
            if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB && !this._overlay.isShowing)
            {
               this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB);
            }
            break;
         default:
            if(_loc3_ != -1 && _loc3_ != undefined)
            {
               if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
               {
                  if(_loc3_ > com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.CAR_BUTTON_ID_OFFSET && _loc3_ < com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.COLLECTION_BUTTON_ID_OFFSET)
                  {
                     _loc3_ -= com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.CAR_BUTTON_ID_OFFSET;
                  }
                  var _loc6_ = this.getVehicleByID(_loc3_);
                  if(_loc6_)
                  {
                     this.setVehicleSelectedByID(_loc6_.id,!_loc6_.selected);
                     this._exportSelection.addOrRemoveVehicle(_loc6_);
                     this.onVehicleSelected(_loc6_.id);
                  }
               }
               if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
               {
                  if(_loc3_ > com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.COLLECTION_BUTTON_ID_OFFSET)
                  {
                     _loc3_ -= com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.COLLECTION_BUTTON_ID_OFFSET;
                  }
                  var _loc4_ = this.getCollectionByID(_loc3_);
                  if(_loc4_)
                  {
                     this.setCollectionSelectedByID(_loc4_.id,!_loc4_.selected);
                     this.onCollectionSelected(_loc3_);
                     var _loc7_ = !_loc4_.selected ? 0 : _loc4_.value;
                     this._exportSelection.setBonusMoney(_loc7_);
                     var _loc5_ = _loc4_.vehicles.length;
                     var _loc2_ = 0;
                     while(_loc2_ < _loc5_)
                     {
                        this._exportSelection.addOrRemoveVehicle(_loc4_.vehicles[_loc2_]);
                        _loc2_ = _loc2_ + 1;
                     }
                  }
               }
            }
      }
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel, isSlowingDown)
   {
      if(this.view._visible)
      {
         if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
         {
            this._exportScrollbar.handleJoystickInput(isLeftStick,x,y,isMouseWheel,isSlowingDown);
         }
         else
         {
            this._collectionScrollbar.handleJoystickInput(isLeftStick,x,y,isMouseWheel,isSlowingDown);
         }
      }
   }
   function dispose()
   {
      this._exportScrollbar.dispose();
      this._collectionScrollbar.dispose();
      this._exportSelection.dispose();
      super.dispose();
   }
   function onVehicleSelected(id)
   {
      var _loc4_ = this._allCarTiles.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._allCarTiles[_loc3_];
         if(_loc2_.button.id == id)
         {
            _loc2_.selected = !_loc2_.selected;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.updateControls();
   }
   function showBuyers(allRequirements, allValues, allAvailability)
   {
      this.showTab(com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB);
      this._exportSelection.setBuyers(allRequirements,allValues,allAvailability);
   }
   function setCooldown(cooldownSeconds)
   {
      this._exportSelection.setCooldown(cooldownSeconds);
   }
   function initOverlay()
   {
      this._overlay = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Overlay(this.view.overlay,com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.OVERLAY_ACCEPT_BUTTON,com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.OVERLAY_CANCEL_BUTTON);
   }
   function initStaticButtons()
   {
      this._exportTabButton = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.EXPORT_TAB_BUTTON,this.view.header.exportButton,"IEW_EXPORT_TAB",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._collectionTabButton = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.COLLECTION_TAB_BUTTON,this.view.header.collectionButton,"IEW_COLLECTION_TAB",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._tabButtons = [this._exportTabButton,this._collectionTabButton];
   }
   function initExportTabContent()
   {
      var _loc12_ = this.view.carList;
      _loc12_._visible = false;
      this._exportTabContent.push(_loc12_);
      this._singleCarInventoryContainer = _loc12_.createEmptyMovieClip("singleCarInventoryContainer",this.view.getNextHighestDepth());
      this._singleCarInventoryContainer._x = _loc12_.carListMask._x;
      this._singleCarInventoryContainer._y = _loc12_.carListMask._y;
      this._singleCarInventoryContainer.setMask(_loc12_.carListMask);
      var _loc11_ = this.app.vehicles;
      var _loc8_ = [];
      var _loc3_ = 0;
      var _loc9_ = _loc11_.length;
      while(_loc3_ < _loc9_)
      {
         var _loc7_ = _loc11_[_loc3_];
         if(_loc7_.owned)
         {
            _loc8_.push(_loc7_);
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc2_ = 0;
      var _loc10_ = _loc8_.length;
      while(_loc2_ < _loc10_)
      {
         var _loc6_ = this._singleCarInventoryContainer.getNextHighestDepth();
         var _loc4_ = this._singleCarInventoryContainer.attachMovie("singleCarTile","singleCarTile" + _loc6_,_loc6_);
         _loc4_._x = _loc2_ % com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.COL_WIDTH - com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_X_OFFSET_FOR_IMAGE_TEXTFIELD;
         _loc4_._y = Math.floor(_loc2_ / com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ROW_HEIGHT + com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_Y_OFFSET_TO_FILTER_BUTTONS;
         var _loc5_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile(_loc4_);
         _loc5_.initFull(_loc8_[_loc2_],this.app.imageManager);
         this._allCarTiles.push(_loc5_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc13_ = this._allCarTiles[this._allCarTiles.length - 1];
      this.addLogoToBottomOfList(this._singleCarInventoryContainer,_loc13_.view._y + _loc13_.view._height);
   }
   function initCollectionTabContent()
   {
      var _loc8_ = this.view.setsList;
      _loc8_._visible = false;
      this._collectionTabContent.push(_loc8_);
      this._carSetsInventoryContainer = _loc8_.createEmptyMovieClip("carSetsInventoryContainer",this.view.getNextHighestDepth());
      this._carSetsInventoryContainer._x = _loc8_.carListMask._x;
      this._carSetsInventoryContainer._y = _loc8_.carListMask._y;
      this._carSetsInventoryContainer.setMask(_loc8_.carListMask);
      var _loc6_ = this.app.collections;
      var _loc2_ = 0;
      var _loc7_ = _loc6_.length;
      while(_loc2_ < _loc7_)
      {
         if(!_loc6_[_loc2_].disabled)
         {
            var _loc4_ = this._carSetsInventoryContainer.getNextHighestDepth();
            var _loc3_ = this._carSetsInventoryContainer.attachMovie("carSetTile","carSetTile" + _loc4_,_loc4_);
            _loc3_._x = 0;
            _loc3_._y = Math.floor(_loc2_ * (com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.COLLECTION_ROW_HEIGHT + 10)) + com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_Y_OFFSET_TO_FILTER_BUTTONS;
            var _loc5_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.CarCollectionTile(_loc3_);
            _loc5_.init(_loc6_[_loc2_],this.app.imageManager);
            this._allCollectionTiles.push(_loc5_);
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = this._allCollectionTiles[this._allCollectionTiles.length - 1];
      this.addLogoToBottomOfList(this._carSetsInventoryContainer,_loc9_.view._y + _loc9_.view._height);
   }
   function initFilterButtons()
   {
      this._filterSystem = new com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem(this.view.filterButtons);
      this._filterSystem.init();
      this._filterSystem.setSortOrder(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_POSITION);
   }
   function initScrollbars()
   {
      this._exportScrollbar = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Scrollbar(this.view.carList.scrollbar,this._singleCarInventoryContainer,this.view.carList.carListMask,this.delegate(this,this.updateControls),this.safeZoneBottom);
      this._collectionScrollbar = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Scrollbar(this.view.setsList.scrollbar,this._carSetsInventoryContainer,this.view.setsList.carListMask,this.delegate(this,this.updateControls),this.safeZoneBottom);
   }
   function initExportSelection()
   {
      this._exportSelection = new com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection(this.view.exportSelection,this.app.imageManager);
      var _loc3_ = this.app.vehicles;
      var _loc5_ = _loc3_.length;
      var _loc4_ = [];
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         if(_loc3_[_loc2_].selected && _loc4_.length < com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.EXPORT_SELECTION_MAX)
         {
            _loc4_.push(_loc3_[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.setCooldown(this.app.exportCooldown);
   }
   function updateControls()
   {
      if(this._overlay.isShowing)
      {
         this.cursor.setTargetRects(this._overlay.controls);
         return undefined;
      }
      if(this._filterSystem.areFilterOptionsShowing)
      {
         this.cursor.setTargetRects(this._filterSystem.filterOptionButtons);
         return undefined;
      }
      var _loc3_ = [];
      if(this._activeTabIndex != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB)
      {
         _loc3_ = _loc3_.concat(this._filterSystem.buttons);
      }
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         _loc3_.push(this._collectionTabButton);
         var _loc2_ = 0;
         while(_loc2_ < this._allCarTiles.length)
         {
            if(this._allCarTiles[_loc2_])
            {
               var _loc8_ = this._allCarTiles[_loc2_].view._y + this._allCarTiles[_loc2_].view._height + this._allCarTiles[_loc2_].view._parent._y - this._allCarTiles[_loc2_].button.view._height;
               if(_loc8_ > this.view.carList.carListMask._y && this._allCarTiles[_loc2_].isVisible)
               {
                  _loc3_.push(this._allCarTiles[_loc2_].button);
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
      {
         _loc3_.push(this._exportTabButton);
         _loc2_ = 0;
         var _loc6_ = this._allCollectionTiles.length;
         while(_loc2_ < _loc6_)
         {
            if(this._allCollectionTiles[_loc2_])
            {
               _loc8_ = this._allCollectionTiles[_loc2_].view._y + this._allCollectionTiles[_loc2_].view._height + this._allCollectionTiles[_loc2_].view._parent._y - this._allCollectionTiles[_loc2_].button.view._height;
               if(_loc8_ > this.view.setsList.carListMask._y && this._allCollectionTiles[_loc2_].isVisible)
               {
                  _loc3_.push(this._allCollectionTiles[_loc2_].button);
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this._exportSelection)
      {
         if(this._activeTabIndex != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB)
         {
            _loc3_.push(this._exportSelection.exportButton);
            var _loc10_ = this._exportSelection.currentlySelectedVehicles[this._activeTabIndex];
            var _loc11_ = this._exportSelection.carSlots;
            var _loc4_ = 0;
            var _loc9_ = _loc10_.length;
            while(_loc4_ < _loc9_)
            {
               if(_loc10_[_loc4_])
               {
                  _loc3_.push(_loc11_[_loc4_].button);
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         else
         {
            _loc3_ = _loc3_.concat(this._exportSelection.buyerButtons);
         }
      }
      var _loc5_ = 0;
      var _loc7_ = _loc3_.length;
      while(_loc5_ < _loc7_)
      {
         _loc3_[_loc5_].updateBounds();
         _loc5_ = _loc5_ + 1;
      }
      this.cursor.setTargetRects(_loc3_);
   }
   function scrollListFromKeyboard(direction)
   {
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         this._exportScrollbar.scrollListFromKeyboard(direction);
      }
      else
      {
         this._collectionScrollbar.scrollListFromKeyboard(direction);
      }
   }
   function resetScroll()
   {
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         this._exportScrollbar.resetScroll();
      }
      else
      {
         this._collectionScrollbar.resetScroll();
      }
   }
   function showTab(index)
   {
      if(this._activeTabIndex != index)
      {
         this._activeTabIndex = index;
         this._exportTabButton.view._visible = index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB ? true : false;
         this._exportTabButton.view.gotoAndStop(index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB ? "off" : "on");
         this._exportTabButton.setTextFromCache();
         var _loc2_ = 0;
         var _loc4_ = this._exportTabContent.length;
         while(_loc2_ < _loc4_)
         {
            this._exportTabContent[_loc2_]._visible = index == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB;
            _loc2_ = _loc2_ + 1;
         }
         this._exportScrollbar.pause(index == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB);
         this._collectionTabButton.view._visible = index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB ? true : false;
         this._collectionTabButton.view.gotoAndStop(index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB ? "off" : "on");
         this._collectionTabButton.setTextFromCache();
         _loc2_ = 0;
         _loc4_ = this._collectionTabContent.length;
         while(_loc2_ < _loc4_)
         {
            this._collectionTabContent[_loc2_]._visible = index == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB;
            _loc2_ = _loc2_ + 1;
         }
         this._collectionScrollbar.pause(index == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB);
         this._exportSelection.setTab(index);
         this._filterSystem.setTab(index);
         this.applyFilter();
         this.resetScroll();
         this.updateControls();
         com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.playSound("Change_Tab");
         this.app.selectedTab = index;
      }
   }
   function getVehicleByID(id)
   {
      var _loc3_ = this.app.vehicles;
      var _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc3_[_loc2_].id == id)
         {
            return _loc3_[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function setVehicleSelectedByID(id, selected)
   {
      var _loc3_ = this.app.vehicles;
      var _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc3_[_loc2_].id == id)
         {
            _loc3_[_loc2_].selected = selected;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.app.vehicles = _loc3_;
   }
   function getCollectionByID(id)
   {
      var _loc3_ = this.app.collections;
      var _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc3_[_loc2_].id == id)
         {
            return _loc3_[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function onCollectionSelected(id)
   {
      var _loc4_ = this._allCollectionTiles.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._allCollectionTiles[_loc2_];
         if(_loc3_.button.id == id)
         {
            _loc3_.selected = !_loc3_.selected;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.updateControls();
   }
   function setCollectionSelectedByID(id, selected)
   {
      var _loc3_ = this.app.collections;
      var _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc3_[_loc2_].id == id)
         {
            _loc3_[_loc2_].selected = selected;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.app.collections = _loc3_;
   }
   function addLogoToBottomOfList(listContainer, endOfList)
   {
      var _loc2_ = listContainer.getNextHighestDepth();
      var _loc1_ = listContainer.attachMovie("poweredBySecuroServ","poweredBySecuroServ",_loc2_);
      _loc1_._x = 0;
      _loc1_._y = endOfList + 20;
   }
   function removeLogoFromBottomOfList(listContainer)
   {
      MovieClip(listContainer.poweredBySecuroServ).removeMovieClip();
   }
   function updateLogo(listContainer, endOfList)
   {
      MovieClip(listContainer.poweredBySecuroServ)._y = endOfList + 20;
   }
   function applySortOrder()
   {
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         this._exportScrollbar.resetScroll();
         this.updateCarTiles();
         this._exportScrollbar.updateScrollbar();
      }
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
      {
         this._collectionScrollbar.resetScroll();
         this.updateCollectionTiles();
         this._collectionScrollbar.updateScrollbar();
      }
      this.updateControls();
   }
   function applyFilter()
   {
      var _loc4_ = this._activeTabIndex != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB ? this._allCollectionTiles : this._allCarTiles;
      var _loc2_ = 0;
      var _loc3_ = _loc4_.length;
      while(_loc2_ < _loc3_)
      {
         _loc4_[_loc2_].filter(this._filterSystem.currentFilterFlag != undefined ? this._filterSystem.currentFilterFlag : com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE);
         _loc2_ = _loc2_ + 1;
      }
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         this._exportScrollbar.resetScroll();
         this.updateCarTiles();
         this._exportScrollbar.updateScrollbar();
      }
      if(this._activeTabIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
      {
         this._collectionScrollbar.resetScroll();
         this.updateCollectionTiles();
         this._collectionScrollbar.updateScrollbar();
      }
      this.updateControls();
   }
   function updateCarTiles()
   {
      var _loc5_ = this._allCarTiles;
      var _loc6_ = [];
      var _loc2_ = 0;
      var _loc8_ = _loc5_.length;
      while(_loc2_ < _loc8_)
      {
         _loc6_[_loc2_] = {index:_loc2_,value:_loc5_[_loc2_].value,name:_loc5_[_loc2_].translatedName,warehousePosition:_loc5_[_loc2_].warehousePosition};
         _loc2_ = _loc2_ + 1;
      }
      _loc6_.sortOn(this._filterSystem.currentSortField,this._filterSystem.currentSortOrder);
      var _loc7_ = 0;
      var _loc13_ = undefined;
      var _loc4_ = 0;
      var _loc9_ = _loc6_.length;
      while(_loc4_ < _loc9_)
      {
         var _loc3_ = this._allCarTiles[_loc6_[_loc4_].index];
         if(_loc3_.isVisible)
         {
            _loc3_.view._x = _loc7_ % com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.COL_WIDTH - com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_X_OFFSET_FOR_IMAGE_TEXTFIELD;
            _loc3_.view._y = Math.floor(_loc7_ / com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ROW_HEIGHT + com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_Y_OFFSET_TO_FILTER_BUTTONS;
            _loc7_ = _loc7_ + 1;
            _loc13_ = _loc3_;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.updateLogo(this._singleCarInventoryContainer,_loc13_.view._y + _loc13_.view._height);
   }
   function updateCollectionTiles()
   {
      var _loc5_ = this._allCollectionTiles;
      var _loc6_ = [];
      var _loc2_ = 0;
      var _loc7_ = _loc5_.length;
      while(_loc2_ < _loc7_)
      {
         _loc6_[_loc2_] = {index:_loc2_,value:_loc5_[_loc2_].value,name:_loc5_[_loc2_].translatedName,completion:_loc5_[_loc2_].completion};
         _loc2_ = _loc2_ + 1;
      }
      _loc6_.sortOn(this._filterSystem.currentSortField,this._filterSystem.currentSortOrder);
      var _loc9_ = 0;
      var _loc13_ = undefined;
      var _loc4_ = 0;
      var _loc8_ = _loc6_.length;
      while(_loc4_ < _loc8_)
      {
         var _loc3_ = this._allCollectionTiles[_loc6_[_loc4_].index];
         if(_loc3_.isVisible)
         {
            _loc3_.view._x = 0;
            _loc3_.view._y = Math.floor(_loc9_ * (com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.COLLECTION_ROW_HEIGHT + 10)) + com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.LIST_Y_OFFSET_TO_FILTER_BUTTONS;
            _loc9_ = _loc9_ + 1;
            _loc13_ = _loc3_;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.updateLogo(this._carSetsInventoryContainer,_loc13_.view._y + _loc13_.view._height);
   }
   function get activeTabIndex()
   {
      return this._activeTabIndex;
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
}
