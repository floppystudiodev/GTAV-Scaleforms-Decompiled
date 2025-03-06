class com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehousePanel
{
   var view;
   var isAsian;
   var _controls;
   var currWarehouseID;
   var capacityMeter;
   var buyButton;
   var stealButton;
   var renovateButton;
   var showingOwnedView;
   var _left;
   var _right;
   var _top;
   var _bottom;
   function VehicleWarehousePanel(view, displayConfig)
   {
      this.view = view;
      this.isAsian = displayConfig.isAsian;
      this._controls = [];
      this.currWarehouseID = -1;
      view.name.textAutoSize = "shrink";
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealButton);
      this._controls = null;
      this.capacityMeter.dispose();
      this.capacityMeter = null;
      this.buyButton = null;
      this.stealButton = null;
      this.renovateButton = null;
      this.view.gotoAndStop("resetView");
      this.view = null;
   }
   function show(warehouse, imageManager, returningVehiclePlayer)
   {
      if(this.currWarehouseID == warehouse.id && this.showingOwnedView == warehouse.isOwned)
      {
         return undefined;
      }
      this.currWarehouseID = warehouse.id;
      this.showingOwnedView = warehouse.isOwned;
      if(this.capacityMeter)
      {
         this.capacityMeter.dispose();
         this.capacityMeter = null;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealButton);
      this._controls.length = 0;
      this.view.gotoAndStop("resetView");
      if(warehouse.isOwned)
      {
         this.initOwnedView(warehouse,returningVehiclePlayer);
      }
      else
      {
         this.initUnownedView(warehouse);
      }
      imageManager.addImage(warehouse.txd,warehouse.txd,this.view.image);
      this.view._visible = true;
   }
   function hide()
   {
      this.currWarehouseID = -1;
      this.view._visible = false;
      this._controls.length = 0;
      if(this.capacityMeter)
      {
         this.capacityMeter.dispose();
         this.capacityMeter = null;
      }
   }
   function get controls()
   {
      return this._controls;
   }
   function get left()
   {
      return this._left;
   }
   function get right()
   {
      return this._right;
   }
   function get top()
   {
      return this._top;
   }
   function get bottom()
   {
      return this._bottom;
   }
   function initOwnedView(warehouse, returningVehiclePlayer)
   {
      this.view.gotoAndStop("owned");
      this._controls = [];
      this.view.name.text = warehouse.name;
      this.view.location.text = warehouse.location;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.locationLabel,"SECUROSERV_LOCATION");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storageLabel,"SECUROSERV_VEHICLES_STORED");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.currentValueLabel,"SECUROSERV_CURRENT_VALUE");
      this.view.currentValue.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.currentValue);
      var _loc3_ = warehouse.vehicleCapacity != 1 ? "SECUROSERV_VEHICLE_UNITS" : "SECUROSERV_VEHICLE_UNIT";
      this.view.storage.text = warehouse.numVehiclesStored + " / " + warehouse.vehicleCapacity + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storage,_loc3_);
      this.setupTextFieldPair(this.view.locationLabel,this.view.location);
      this.setupTextFieldPair(this.view.storageLabel,this.view.storage);
      this.setupTextFieldPair(this.view.currentValueLabel,this.view.currentValue);
      this.capacityMeter = new com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter(this.view.capacityMeter);
      this.capacityMeter.percentage = 100 * warehouse.numVehiclesStored / warehouse.vehicleCapacity;
      this.stealButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.STEAL_VEHICLE,this.view.stealButton,"SECUROSERV_STEAL_VEHICLE");
      if(returningVehiclePlayer)
      {
         this.renovateButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.RENOVATE_WAREHOUSE,this.view.renovateButton,"SECUROSERV_RENOVATE");
         this._controls = [this.renovateButton,this.stealButton];
      }
      else
      {
         this.view.renovateButton._visible = false;
         this._controls = [this.stealButton];
      }
      this.updateCooldown(warehouse.stealCooldown);
      this.setBounds();
   }
   function initUnownedView(warehouse)
   {
      this.view.gotoAndStop("unowned");
      this.view.descriptionLabel.textAutoSize = "shrink";
      this.view.name.text = warehouse.name;
      this.view.location.text = warehouse.location;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.locationLabel,"SECUROSERV_LOCATION");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storageLabel,"SECUROSERV_STORAGE");
      this.setupTextFieldPair(this.view.locationLabel,this.view.location);
      this.setupTextFieldPair(this.view.storageLabel,this.view.storage);
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.descriptionLabel,"SECUROSERV_DESCRIPTION");
      this.view.description.text = warehouse.desciption;
      var _loc6_ = warehouse.vehicleCapacity != 1 ? "SECUROSERV_VEHICLE_UNITS" : "SECUROSERV_VEHICLE_UNIT";
      this.view.storage.text = com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(warehouse.vehicleCapacity) + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.storage,_loc6_);
      var _loc3_ = this.getMinPrice(warehouse.interior0Cost,warehouse.interior1Cost,warehouse.interior2Cost);
      var _loc4_ = this.getMinPrice(warehouse.interior0SaleCost,warehouse.interior1SaleCost,warehouse.interior2SaleCost);
      this.view.price.label.textAutoSize = "shrink";
      if(_loc4_ >= 0)
      {
         this.view.price.label.text = com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.price.label,"SECUROSERV_FROM") + " $" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(_loc4_);
         this.view.salePrice.label.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(_loc3_);
         this.view.salePrice.redLine._x = 0.5 * (this.view.salePrice.label._width - this.view.salePrice.redLine._width) + this.view.salePrice.label._x - 5;
         this.view.salePrice.redLine._width = this.view.salePrice.label.textWidth + 5;
         this.view.salePrice._visible = true;
      }
      else
      {
         this.view.price.label.text = com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.price.label,"SECUROSERV_FROM") + " $" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(_loc3_);
         this.view.salePrice._visible = false;
      }
      var _loc5_ = this.view.buyButton._width;
      this.view.buyButton.label.multiline = false;
      this.view.buyButton.label.textAutoSize = "shrink";
      this.buyButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportMapScreen.BUY_WAREHOUSE,this.view.buyButton,"SECUROSERV_BUY_VEH_WAREHOUSE");
      this.view.buyButton.label.autoSize = "none";
      this.view.buyButton.label._width = _loc5_;
      this._controls = [this.buyButton];
      this.setBounds();
   }
   function getMinPrice(price1, price2, price3)
   {
      if(price1 == -1 && price2 == -1 && price3 == -1)
      {
         return -1;
      }
      return Math.min(price1,Math.min(price2,price3));
   }
   function setBounds()
   {
      this._left = this.view._x;
      this._right = this.view._x + this.view.bg._width;
      this._top = this.view._y;
      this._bottom = this.view._y + this.view._height;
   }
   function setupTextFieldPair(leftTF, rightTF)
   {
      leftTF.autoSize = "left";
      rightTF.autoSize = "right";
      var _loc6_ = leftTF._x;
      var _loc4_ = rightTF._x + rightTF._width;
      var _loc7_ = leftTF._width;
      var _loc8_ = rightTF._width;
      if(_loc7_ + _loc8_ > _loc4_ - _loc6_)
      {
         var _loc5_ = _loc4_ - _loc6_ - _loc7_;
         var _loc3_ = rightTF.text;
         var _loc1_ = _loc3_.length;
         while(_loc1_ > 0)
         {
            rightTF.text = _loc3_.substring(0,_loc1_) + "...";
            if(rightTF._width <= _loc5_)
            {
               rightTF._x = _loc4_ - rightTF._width;
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCooldown(remainingSeconds)
   {
      var _loc2_ = this.view.stealButton;
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      if(remainingSeconds == undefined)
      {
         remainingSeconds = 0;
      }
      if(remainingSeconds > 0)
      {
         _loc2_._alpha = 50;
         var _loc3_ = Math.ceil(remainingSeconds);
         var _loc4_ = _loc3_ % 60;
         var _loc6_ = Math.floor((_loc3_ - _loc4_) / 60) % 60;
         var _loc10_ = Math.floor((_loc3_ - _loc4_ - _loc6_ * 60) / 3600);
         var _loc8_ = ("0" + _loc10_).substr(-2);
         var _loc7_ = ("0" + _loc6_).substr(-2);
         var _loc9_ = ("0" + _loc4_).substr(-2);
         _loc2_.label.text = _loc8_ + ":" + _loc7_ + ":" + _loc9_;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.label,"SECUROSERV_STEAL_VEHICLE");
         _loc2_._alpha = remainingSeconds >= 0 ? 100 : 50;
      }
      if(_loc2_.bg)
      {
         _loc2_.label._x = 0.5 * (_loc2_.bg._width - _loc2_.label._width);
      }
   }
}
