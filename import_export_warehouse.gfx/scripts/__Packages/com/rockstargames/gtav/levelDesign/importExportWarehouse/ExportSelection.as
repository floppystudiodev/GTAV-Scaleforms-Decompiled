class com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection
{
   var _allOfferLabels;
   var _allRequirementDescriptions;
   var _allRequirements;
   var _allRequirementsLabels;
   var _allValues;
   var _bonusMoneyForCollection;
   var _buyerBackground;
   var _buyerButtons;
   var _carSlots;
   var _commissionLabel;
   var _commissionOfferString;
   var _commissionString;
   var _currentTab;
   var _currentlySelectedVehicles;
   var _exportButton;
   var _exportString;
   var _imageManager;
   var _moneyLabel;
   var _moneyString;
   var _upperBg;
   var _view;
   static var EXPORT_SELECTION_MAX = 4;
   static var UPPER_BG_HEIGHT_NORMAL = 208;
   static var UPPER_BG_HEIGHT_BUYER_SCREEN = 155;
   function ExportSelection(view, imageManager)
   {
      this._view = view;
      this._imageManager = imageManager;
      this.init();
   }
   function init()
   {
      this._carSlots = [];
      this._currentlySelectedVehicles = [[],[]];
      this._currentTab = com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB;
      this._bonusMoneyForCollection = 0;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.EXPORT_SELECTION_MAX)
      {
         _loc3_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile(this._view["carSlot" + _loc2_]);
         _loc3_.selected = false;
         this._carSlots.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this._exportButton = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.EXPORT_BUTTON,this._view.exportSelectionButton,"IEW_EXPORT_BUTTON",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._exportString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.exportSelectionButton.label,"IEW_EXPORT_BUTTON",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._moneyLabel = this._view.labelMoney;
      this._moneyString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._moneyLabel,"IEW_EXPORT_LABEL_MONEY",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._moneyLabel.text = this._moneyString + " $0";
      this._commissionLabel = this._view.labelCommission;
      this._commissionLabel._visible = false;
      this._commissionString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._commissionLabel,"IEW_EXPORT_LABEL_COMMISSION",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      this._commissionLabel.text = this._commissionString + " $0";
      this._upperBg = this._view.upperBg;
      var _loc11_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.BUYER_0,this._view.buyer0,"IEW_BUYER_0");
      _loc11_.view._visible = false;
      var _loc12_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.BUYER_1,this._view.buyer1,"IEW_BUYER_1");
      _loc12_.view._visible = false;
      var _loc10_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.BUYER_2,this._view.buyer2,"IEW_BUYER_2");
      _loc10_.view._visible = false;
      this._buyerButtons = [_loc11_,_loc12_,_loc10_];
      var _loc13_ = this._view.buyersTitleLabel;
      com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc13_,"IEW_BUYERS_TITLE",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc13_._visible = false;
      var _loc5_ = this._view.offer0;
      com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc5_,"IEW_BUYER_COMMISSION_OFFER",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc5_._visible = false;
      var _loc8_ = this._view.offer1;
      com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc8_,"IEW_BUYER_COMMISSION_OFFER",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc8_._visible = false;
      var _loc4_ = this._view.offer2;
      this._commissionOfferString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc4_,"IEW_BUYER_COMMISSION_OFFER",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc4_._visible = false;
      this._allOfferLabels = [_loc5_,_loc8_,_loc4_];
      this._buyerBackground = this._view.buyerBg;
      this._allRequirementDescriptions = [];
      var _loc6_ = this._view.requirement0;
      this._allRequirementDescriptions[0] = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc6_,"IEW_BUYER_NO_MOD",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc6_._visible = false;
      var _loc9_ = this._view.requirement1;
      this._allRequirementDescriptions[1] = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc9_,"IEW_BUYER_STANDARD_MOD",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc9_._visible = false;
      var _loc7_ = this._view.requirement2;
      this._allRequirementDescriptions[2] = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(_loc7_,"IEW_BUYER_HIGH_END_MOD",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      _loc7_._visible = false;
      this._allRequirementsLabels = [_loc6_,_loc9_,_loc7_];
   }
   function setBonusMoney(value)
   {
      this._bonusMoneyForCollection = value;
   }
   function addOrRemoveVehicle(selectedVehicle)
   {
      var _loc4_ = false;
      var _loc2_ = 0;
      var _loc3_ = this._currentlySelectedVehicles[this._currentTab].length;
      while(_loc2_ < _loc3_)
      {
         if(this._currentlySelectedVehicles[this._currentTab][_loc2_])
         {
            if(this._currentlySelectedVehicles[this._currentTab][_loc2_].id == selectedVehicle.id)
            {
               this._currentlySelectedVehicles[this._currentTab].splice(_loc2_,1);
               _loc4_ = true;
               break;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc4_ && this._currentlySelectedVehicles[this._currentTab].length < com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.EXPORT_SELECTION_MAX)
      {
         this._currentlySelectedVehicles[this._currentTab].push(selectedVehicle);
      }
      this.updateSelectedVehicles();
   }
   function reset()
   {
      this._currentlySelectedVehicles = [[],[]];
      this.updateSelectedVehicles();
   }
   function setTab(currentTab)
   {
      this._currentTab = currentTab;
      this._exportButton.view._visible = this._currentTab != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      this._commissionLabel._visible = this._currentTab != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      this._moneyLabel._visible = this._currentTab != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      if(this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
      {
         this._moneyString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._moneyLabel,"IEW_EXPORT_LABEL_MONEY",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      }
      else if(this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
      {
         this._moneyString = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._moneyLabel,"IEW_EXPORT_LABEL_BONUS",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
      }
      this._moneyLabel.text = this._moneyString + " $0";
      this._upperBg._height = this._currentTab != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB ? com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.UPPER_BG_HEIGHT_NORMAL : com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.UPPER_BG_HEIGHT_BUYER_SCREEN;
      this._buyerBackground._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      var _loc3_ = 0;
      while(_loc3_ < this._buyerButtons.length)
      {
         this._buyerButtons[_loc3_].view._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
         _loc3_ = _loc3_ + 1;
      }
      this._view.buyersTitleLabel._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      this._view.offer0._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      this._view.offer1._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      this._view.offer2._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      var _loc2_ = 0;
      while(_loc2_ < this._allRequirementsLabels.length)
      {
         this._allRequirementsLabels[_loc2_]._visible = this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
         _loc2_ = _loc2_ + 1;
      }
      this.updateSelectedVehicles();
   }
   function setBuyers(allRequirements, allValues, allAvailability)
   {
      this._allRequirements = allRequirements;
      var _loc10_ = "<font color=\'#CC0000\'>$";
      var _loc9_ = "</font>";
      var _loc3_ = 0;
      var _loc6_;
      while(_loc3_ < this._allRequirementsLabels.length)
      {
         _loc6_ = this._allRequirementDescriptions[_loc3_];
         this._allRequirementsLabels[_loc3_].htmlText = _loc6_ + " " + _loc10_ + com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(this._allRequirements[_loc3_]) + _loc9_;
         _loc3_ = _loc3_ + 1;
      }
      this._allValues = allValues;
      var _loc4_ = 0;
      while(_loc4_ < this._buyerButtons.length)
      {
         com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this._buyerButtons[_loc4_]).setAvailable(allAvailability[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      var _loc7_ = "<font color=\'#5CC45C\'>$";
      var _loc8_ = "</font>";
      var _loc2_ = 0;
      var _loc5_;
      while(_loc2_ < this._allOfferLabels.length)
      {
         if(this._allValues[_loc2_])
         {
            _loc5_ = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(this._allValues[_loc2_]);
            this._allOfferLabels[_loc2_].htmlText = this._commissionOfferString + " " + _loc7_ + _loc5_ + _loc8_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setCooldown(cooldownSeconds)
   {
      if(cooldownSeconds > getTimer())
      {
         this.updateCooldown(this._exportButton.view,cooldownSeconds,this._exportString);
      }
      else
      {
         this._exportButton.setLabel(this._exportString,true);
      }
   }
   function updateCooldown(button, cooldown, finalLabel)
   {
      var _loc2_ = Math.ceil(0.001 * (cooldown - getTimer()));
      var _loc3_;
      var _loc4_;
      var _loc8_;
      var _loc6_;
      var _loc5_;
      var _loc7_;
      if(_loc2_ <= 0)
      {
         this._exportButton.setLabel(this._exportString,true);
      }
      else
      {
         _loc3_ = _loc2_ % 60;
         _loc4_ = Math.floor((_loc2_ - _loc3_) / 60) % 60;
         _loc8_ = Math.floor((_loc2_ - _loc3_ - _loc4_ * 60) / 3600);
         _loc6_ = ("0" + _loc8_).substr(-2);
         _loc5_ = ("0" + _loc4_).substr(-2);
         _loc7_ = ("0" + _loc3_).substr(-2);
         this._exportButton.setLabel(_loc6_ + ":" + _loc5_ + ":" + _loc7_,true);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(button,0.25,{onCompleteScope:this,onComplete:this.updateCooldown,onCompleteArgs:[button,cooldown,finalLabel]});
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._exportButton);
   }
   function updateSelectedVehicles()
   {
      var _loc6_;
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(this._currentTab != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB)
      {
         _loc6_ = 0;
         _loc5_ = 0;
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.levelDesign.importExportWarehouse.ExportSelection.EXPORT_SELECTION_MAX)
         {
            _loc4_ = this._currentlySelectedVehicles[this._currentTab][_loc2_];
            if(_loc4_)
            {
               _loc3_ = this._carSlots[_loc2_];
               if(_loc3_.id != _loc4_.id)
               {
                  _loc3_.reset();
               }
               _loc3_.initImageOnly(this._currentlySelectedVehicles[this._currentTab][_loc2_],this._imageManager,Boolean(this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB));
               _loc3_.selected = true;
               if(this._currentlySelectedVehicles[this._currentTab][_loc2_].value != undefined && this._currentlySelectedVehicles[this._currentTab][_loc2_].value > 0)
               {
                  if(this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB)
                  {
                     _loc5_ += this._currentlySelectedVehicles[this._currentTab][_loc2_].actualValue;
                     _loc6_ += this._currentlySelectedVehicles[this._currentTab][_loc2_].value;
                  }
                  else if(this._currentTab == com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB)
                  {
                     _loc5_ = this._bonusMoneyForCollection;
                     _loc6_ += this._currentlySelectedVehicles[this._currentTab][_loc2_].collectionValue;
                  }
               }
            }
            else
            {
               this._carSlots[_loc2_].selected = false;
               this._carSlots[_loc2_].reset();
            }
            _loc2_ = _loc2_ + 1;
         }
         this._moneyLabel.text = this._moneyString + " $" + com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(_loc5_);
         this._commissionLabel.text = this._commissionString + " $" + com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(_loc6_);
      }
   }
   function get exportButton()
   {
      return this._exportButton;
   }
   function get currentlySelectedVehicles()
   {
      return this._currentlySelectedVehicles;
   }
   function get carSlots()
   {
      return this._carSlots;
   }
   function get buyerButtons()
   {
      return this._buyerButtons;
   }
}
