class com.rockstargames.gtav.levelDesign.SECUROSERV extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var gamerTag;
   var gamerHasAccess;
   var totalEarnings;
   var collectionsCompleted;
   var collectionSuccessRate;
   var salesCompleted;
   var salesSuccessRate;
   var activeUsers;
   var selectedWarehouseID;
   var currScreenID;
   var returningPlayer;
   var returningVehiclePlayer;
   var warehouses;
   var vehicleWarehouses;
   var specialVehicles;
   var statsShown;
   var vehicleStatsShown;
   var inputReceived;
   var deactivated;
   var numVehiclesStolen;
   var stealVehiclesSuccess;
   var vehiclesExported;
   var exportVehiclesSuccess;
   var totalVehicleEarnings;
   var mapStartX;
   var mapStartY;
   var mapStartScale;
   var displayConfig;
   var imageManager;
   var screenContainer;
   var cursor;
   var organisation;
   var hasSpecialVehicleMissions;
   var playerX;
   var playerY;
   var hasSpecialCargoMissions;
   var importExportMissions;
   var currScreen;
   static var DPAD_DOWN = 187;
   static var DPAD_UP = 188;
   static var DPAD_LEFT = 189;
   static var DPAD_RIGHT = 190;
   static var ACCEPT = 201;
   static var CANCEL = 202;
   static var X = 203;
   static var Y = 204;
   static var LB = 205;
   static var RB = 206;
   static var LT = 207;
   static var RT = 208;
   static var LEFT_MOUSE = 237;
   static var RIGHT_MOUSE = 238;
   static var SCROLL_UP_MOUSE = 241;
   static var SCROLL_DOWN_MOUSE = 242;
   static var KEY_DOWN = 300;
   static var KEY_UP = 301;
   static var MAP_START_X = -734.7;
   static var MAP_START_Y = -2850;
   static var MAP_START_SCALE = 0.5;
   var LOGIN_SCREEN = 0;
   var STATS_SCREEN = 1;
   var MAP_SCREEN = 2;
   var BRANCH_SCREEN = 3;
   var IMPORT_EXPORT_STATS_SCREEN = 4;
   var IMPORT_EXPORT_MAP_SCREEN = 5;
   var SPECIAL_VEHICLES_SCREEN = 6;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.securoserv.LoginScreen,com.rockstargames.gtav.levelDesign.securoserv.StatsScreen,com.rockstargames.gtav.levelDesign.securoserv.MapScreen,com.rockstargames.gtav.levelDesign.securoserv.BranchScreen,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen,com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen,com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen];
   function SECUROSERV()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "SECUROSERV";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.gamerTag = "";
      this.gamerHasAccess = false;
      this.totalEarnings = 0;
      this.collectionsCompleted = 0;
      this.collectionSuccessRate = 0;
      this.salesCompleted = 0;
      this.salesSuccessRate = 0;
      this.activeUsers = [];
      this.selectedWarehouseID = -1;
      this.currScreenID = -1;
      this.returningPlayer = false;
      this.returningVehiclePlayer = false;
      this.warehouses = [];
      this.vehicleWarehouses = [];
      this.specialVehicles = [];
      this.statsShown = false;
      this.vehicleStatsShown = false;
      this.inputReceived = false;
      this.deactivated = false;
      this.numVehiclesStolen = 0;
      this.stealVehiclesSuccess = 0;
      this.vehiclesExported = 0;
      this.exportVehiclesSuccess = 0;
      this.totalVehicleEarnings = 0;
      this.mapStartX = com.rockstargames.gtav.levelDesign.SECUROSERV.MAP_START_X;
      this.mapStartY = com.rockstargames.gtav.levelDesign.SECUROSERV.MAP_START_Y;
      this.mapStartScale = com.rockstargames.gtav.levelDesign.SECUROSERV.MAP_START_SCALE;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.securoserv.ImageManager();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.securoserv.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.showScreen(this.LOGIN_SCREEN);
   }
   function ACTIVATE()
   {
      this.deactivated = false;
   }
   function DEACTIVATE()
   {
      this.deactivated = true;
   }
   function SET_PLAYER_DATA(gamerTag, gamerHasAccess, totalEarnings, collectionsCompleted, collectionSuccessRate, salesCompleted, salesSuccessRate, organisation, numVehiclesStolen, stealVehiclesSuccess, vehiclesExported, exportVehiclesSuccess, totalVehicleEarnings, hasSpecialVehicleMissions, playerX, playerY, hasSpecialCargoMissions, importExportMissions)
   {
      this.gamerTag = gamerTag;
      this.gamerHasAccess = gamerHasAccess;
      this.totalEarnings = totalEarnings;
      this.collectionsCompleted = collectionsCompleted;
      this.collectionSuccessRate = collectionSuccessRate;
      this.salesCompleted = salesCompleted;
      this.salesSuccessRate = salesSuccessRate;
      this.organisation = organisation != undefined ? organisation : "";
      this.numVehiclesStolen = numVehiclesStolen != undefined ? numVehiclesStolen : 0;
      this.stealVehiclesSuccess = stealVehiclesSuccess != undefined ? stealVehiclesSuccess : 0;
      this.vehiclesExported = vehiclesExported != undefined ? vehiclesExported : 0;
      this.exportVehiclesSuccess = exportVehiclesSuccess != undefined ? exportVehiclesSuccess : 0;
      this.totalVehicleEarnings = totalVehicleEarnings != undefined ? totalVehicleEarnings : 0;
      this.hasSpecialVehicleMissions = hasSpecialVehicleMissions != undefined ? hasSpecialVehicleMissions : true;
      this.playerX = playerX * com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_X;
      this.playerY = playerY * (- com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_Y;
      this.hasSpecialCargoMissions = hasSpecialCargoMissions != undefined ? hasSpecialCargoMissions : true;
      this.importExportMissions = importExportMissions != undefined ? importExportMissions : true;
      if(this.currScreen instanceof com.rockstargames.gtav.levelDesign.securoserv.LoginScreen)
      {
         com.rockstargames.gtav.levelDesign.securoserv.LoginScreen(this.currScreen).userName = gamerTag;
      }
   }
   function ADD_ACTIVE_USER(gamerTag, organisation, goon1, goon2, goon3, goon4, goon5, goon6, goon7)
   {
      this.activeUsers.push({name:gamerTag,organisation:organisation,goons:[goon1,goon2,goon3,goon4,goon5,goon6,goon7]});
   }
   function REMOVE_ACTIVE_USER(gamerTag)
   {
      var _loc2_ = 0;
      var _loc3_ = this.activeUsers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.activeUsers[_loc2_].name == gamerTag)
         {
            this.activeUsers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function ADD_WAREHOUSE(id, x, y, purchaseCost, nameLabel, locationLabel, descriptionLabel, txd, isOwned, size, capacity, amountStored, currentValue, sellCooldown, buyCooldown, displayOrder, purchaseSaleCost)
   {
      var _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.Warehouse(id,x,y,purchaseCost,nameLabel,locationLabel,descriptionLabel,txd,isOwned,size,capacity,amountStored,currentValue,0,sellCooldown,buyCooldown,displayOrder,purchaseSaleCost);
      var _loc5_ = false;
      var _loc2_ = 0;
      var _loc3_ = this.warehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.warehouses[_loc2_].id == id)
         {
            _loc4_.markerIndex = this.warehouses[_loc2_].markerIndex;
            this.warehouses.splice(_loc2_,1,_loc4_);
            _loc5_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc5_)
      {
         this.warehouses.push(_loc4_);
      }
      if(isOwned)
      {
         this.returningPlayer = true;
      }
      if(this.currScreen)
      {
         this.currScreen.onWarehouseListChange();
      }
   }
   function ADD_WAREHOUSE_SHIPMENTS(id, smallShipmentSize, smallShipmentCost, shipmentDescription, mediumShipmentSize, mediumShipmentCost, mediumShipmentDescription, largeShipmentSize, largeShipmentCost, smallShipmentIsSpecial, smallShipmentSaleCost, mediumShipmentSaleCost, largeShipmentSaleCost)
   {
      var _loc2_ = 0;
      var _loc3_ = this.warehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.warehouses[_loc2_].id == id)
         {
            this.warehouses[_loc2_].setShipmentData(shipmentDescription,smallShipmentSize,smallShipmentCost,mediumShipmentSize,mediumShipmentCost,largeShipmentSize,largeShipmentCost,smallShipmentIsSpecial,smallShipmentSaleCost,mediumShipmentSaleCost,largeShipmentSaleCost);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function ADD_VEHICLE_WAREHOUSE(id, x, y, interior0Cost, interior0SaleCost, interior1Cost, interior1SaleCost, interior2Cost, interior2SaleCost, warehouseName, location, description, txd, isOwned, vehicleCapacity, numVehiclesStored, currentValue, stealCooldown, purchasedInterior)
   {
      var _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse(id,x,y,interior0Cost,interior0SaleCost,interior1Cost,interior1SaleCost,interior2Cost,interior2SaleCost,warehouseName,location,description,txd,isOwned,vehicleCapacity,numVehiclesStored,currentValue,stealCooldown,purchasedInterior);
      var _loc5_ = false;
      var _loc2_ = 0;
      var _loc3_ = this.vehicleWarehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.vehicleWarehouses[_loc2_].id == id)
         {
            _loc4_.markerIndex = this.vehicleWarehouses[_loc2_].markerIndex;
            this.vehicleWarehouses.splice(_loc2_,1,_loc4_);
            _loc5_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc5_)
      {
         this.vehicleWarehouses.push(_loc4_);
      }
      if(isOwned)
      {
         this.returningVehiclePlayer = true;
      }
      if(this.currScreen)
      {
         this.currScreen.onWarehouseListChange();
      }
   }
   function ADD_SPECIAL_VEHICLE(id, name, description, txd, lockNum, enabled, cashBonus, rpBonus)
   {
      var _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.SpecialVehicle(id,name,description,txd,lockNum,enabled,cashBonus,rpBonus);
      var _loc5_ = false;
      var _loc2_ = 0;
      var _loc3_ = this.specialVehicles.length;
      while(_loc2_ < _loc3_)
      {
         if(this.specialVehicles[_loc2_].id == id)
         {
            this.specialVehicles.splice(_loc2_,1,_loc4_);
            _loc5_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc5_)
      {
         this.specialVehicles.push(_loc4_);
      }
   }
   function UPDATE_COOLDOWN(remainingSeconds)
   {
      if(this.currScreen)
      {
         this.currScreen.updateCooldown(remainingSeconds);
         var _loc2_ = this.getVehicleWarehouseByID(this.selectedWarehouseID);
         if(_loc2_)
         {
            _loc2_.stealCooldown = remainingSeconds;
         }
      }
   }
   function SHOW_OVERLAY(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success, showInteriorsOverlay)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(typeof this.currScreen.showOverlay == "function")
      {
         this.currScreen.showOverlay(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success,showInteriorsOverlay);
      }
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      if(typeof this.currScreen.hideOverlay == "function")
      {
         this.currScreen.hideOverlay();
      }
   }
   function GET_SELECTED_WAREHOUSE_ID()
   {
      return this.selectedWarehouseID;
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.inputReceived)
      {
         return this.cursor.getTargetIDUnderCursor();
      }
      return -1;
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function IS_WAREHOUSE_PANEL_SHOWING()
   {
      var _loc2_ = this.currScreenID == this.MAP_SCREEN && com.rockstargames.gtav.levelDesign.securoserv.MapScreen(this.currScreen).warehousePanelShowing;
      var _loc3_ = this.currScreenID == this.IMPORT_EXPORT_MAP_SCREEN && com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen(this.currScreen).warehousePanelShowing;
      return _loc2_ || _loc3_;
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.inputReceived = true;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.LEFT:
            var _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Mouse_Move_Cursor");
            }
      }
      this.currScreen.handleButtonInput(inputID);
   }
   function SET_INPUT_RELEASE_EVENT(inputID)
   {
      this.currScreen.handleButtonInputRelease(inputID);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this.cursor.moveBy(x,y);
      }
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_CURSOR_SPEED(speed)
   {
      this.cursor.setSpeed(speed);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this.cursor.moveTo(x,y,true);
      this.currScreen.handleMouseInput(x,y);
   }
   function showScreen(screenID)
   {
      if(this.currScreen)
      {
         this.imageManager.clearImageQueue();
         this.currScreen.dispose();
      }
      this.cursor.setState(com.rockstargames.gtav.levelDesign.securoserv.Cursor.STATE_ARROW);
      this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor);
      this.currScreenID = screenID;
      this.inputReceived = false;
   }
   function getWarehouseByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.warehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.warehouses[_loc2_].id == id)
         {
            return this.warehouses[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getVehicleWarehouseByID(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.vehicleWarehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.vehicleWarehouses[_loc2_].id == id)
         {
            return this.vehicleWarehouses[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function quit()
   {
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
         com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(tf,label);
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = 2;
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
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      if(!isNaN(letterSpacing))
      {
         var _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      if(tf.textWidth > tf._width)
      {
         var _loc6_ = tf._width;
         tf.autoSize = autoSize;
         var _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "GTAO_Exec_SecuroServ_Computer_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
}
