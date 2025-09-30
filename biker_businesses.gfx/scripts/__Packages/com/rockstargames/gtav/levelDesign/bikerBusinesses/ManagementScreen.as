class com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var app;
   var business;
   var ceaseButton;
   var cursor;
   var overlay;
   var resupplyButton;
   var resupplyPanelControls;
   var sellButton;
   var sellPanelControls;
   var upgradeButton;
   var upgradePanelControls;
   var view;
   static var METER_FILL_DURATION = 1;
   static var OVERLAY_ACCEPT_BUTTON = 101;
   static var OVERLAY_CANCEL_BUTTON = 102;
   static var RESUPPLY_BUTTON = 3001;
   static var UPGRADE_BUTTON = 3002;
   static var SETUP_BUTTON = 3003;
   static var CEASE_BUTTON = 3005;
   static var START_BUTTON = 3006;
   static var SELL_BUTTON = 3007;
   static var UPGRADE_1_BUTTON = 3008;
   static var UPGRADE_2_BUTTON = 3009;
   static var UPGRADE_3_BUTTON = 3010;
   static var SELL_1_BUTTON = 3011;
   static var SELL_2_BUTTON = 3012;
   static var SELL_3_BUTTON = 3013;
   static var RESUPPLY_1_BUTTON = 3014;
   static var RESUPPLY_2_BUTTON = 3015;
   function ManagementScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"managementScreen");
      this.init();
   }
   function init()
   {
      this.resupplyPanelControls = [];
      this.upgradePanelControls = [];
      this.sellPanelControls = [];
      this.business = this.app.getBusinessByID(this.app.GET_SELECTED_BUSINESS_ID());
      this.initOverlay();
      this.initText();
      this.initMeters();
      this.initImages();
      this.initControlButtons();
      this.initResupplyPanel();
      this.initUpgradePanel();
      this.initSellPanel();
      this.view._visible = true;
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.updateControls();
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Overlay(this.view.overlay,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.OVERLAY_ACCEPT_BUTTON,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.OVERLAY_CANCEL_BUTTON);
   }
   function initText()
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.adminTools,"BIKEBIZ_ADMIN");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loggedIn,"BIKEBIZ_LOGGED");
      this.view.userName.text = this.app.userName;
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.statusLabel,"BIKEBIZ_STATUS");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.status,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUSES[this.business.status]);
      this.view.status._x = this.view.statusLabel._x + this.view.statusLabel.textWidth + 10;
      this.view.stockLevelLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.stockLevelLabel,"BIKEBIZ_STOCK");
      this.view.suppliesLevelLabel.suppliesLevelLabel = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.suppliesLevelLabel,"BIKEBIZ_SUPPLIES");
      this.view.totalEarningsLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.totalEarningsLabel,"BIKEBIZ_TOTAL_EARN");
      this.view.totalSalesLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.totalSalesLabel,"BIKEBIZ_TOTAL_SALES");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.resupplySuccessLabel,"BIKEBIZ_SUCCESS_RESUPPLY");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellSuccessLSLabel,"BIKEBIZ_SUCCESS_LS");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellSuccessBCLabel,"BIKEBIZ__SUCCESS_BC");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedSuppliesLabel,"BIKEBIZ_CEASE_SUPPLY");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedRaidedLabel,"BIKEBIZ_CEASE_RAID");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedCapacityLabel,"BIKEBIZ_CEASE_CAP");
      this.view.type.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.type,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.DESCS[this.business.type]);
      this.view.location.text = this.business.location;
      this.view.totalEarnings.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(this.business.totalSales);
      this.view.totalSales.text = this.business.successfulSales;
      this.view.successfulSales.text = this.business.successfulSales;
      this.view.resupplySuccess.text = this.business.resupplySuccess + "%";
      this.view.sellSuccessLS.text = this.business.sellSuccessLS + "%";
      this.view.sellSuccessBC.text = this.business.sellSuccessBC + "%";
      this.view.ceasedSupplies.text = this.business.ceasedSupplies;
      this.view.ceasedRaided.text = this.business.timesRaided;
      this.view.ceasedCapacity.text = this.business.ceasedCapacity;
   }
   function initMeters()
   {
      var _loc2_ = false;
      this.view.stockMeter.bar._xscale = 0;
      var _loc3_ = Math.min(100,Math.max(0,this.business.stockLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stockMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.METER_FILL_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_ = _loc2_ || _loc3_ > 0;
      this.view.suppliesMeter.bar._xscale = 0;
      _loc3_ = Math.min(100,Math.max(0,this.business.suppliesLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.suppliesMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.METER_FILL_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_ = _loc2_ || _loc3_ > 0;
      if(_loc2_)
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Show_Stock_Level");
      }
   }
   function initImages()
   {
      this.app.imageManager.addImage(this.business.txd,this.business.txd + "_EXT_S",this.view.image);
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.business.getUpgrade(_loc2_);
         if(_loc3_)
         {
            this.app.imageManager.addImage("MP_BWH_GENERIC",_loc3_.txd,this.view.upgradePanel["upgrade" + (_loc2_ + 1) + "Button"].image);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function initControlButtons()
   {
      this.view.resupplyButton.gotoAndStop(!this.business.resupplyButtonEnabled ? "disabled" : "enabled");
      if(this.business.canResupply)
      {
         this.resupplyButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_BUTTON,this.view.resupplyButton,"BIKEBIZ_RESUPPLY");
      }
      else
      {
         this.resupplyButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SETUP_BUTTON,this.view.resupplyButton,"BIKEBIZ_SETUP");
      }
      var _loc2_ = this.business.status == com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_ACTIVE || this.business.status == com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_SUSPENDED;
      if(_loc2_)
      {
         this.ceaseButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.CEASE_BUTTON,this.view.ceaseButton,"BIKEBIZ_CEASE");
         this.view.ceaseButton.gotoAndStop("enabled");
      }
      else
      {
         this.ceaseButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.START_BUTTON,this.view.ceaseButton,"BIKEBIZ_START");
         this.setStartProductionStatus();
      }
      this.upgradeButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_BUTTON,this.view.upgradeButton,"BIKEBIZ_UPGRADE");
      this.sellButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SELL_BUTTON,this.view.sellButton,"BIKEBIZ_SELL");
   }
   function initResupplyPanel()
   {
      this.view.resupplyPanel._visible = false;
      var _loc2_;
      _loc2_ = this.view.resupplyPanel.resupply1Button;
      this.resupplyPanelControls.push(new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_1_BUTTON,_loc2_,"BIKEBIZ_BUY_SUPPLIES"));
      if(this.business.resupplySaleCost != -1)
      {
         _loc2_.originalPrice.autoSize = "left";
         _loc2_.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(this.business.resupplySaleCost);
         _loc2_.originalPrice.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(this.business.resupplyCost);
         _loc2_.originalPrice._x = _loc2_.price._x + _loc2_.price._width - _loc2_.price.textWidth - _loc2_.originalPrice._width - 10;
         _loc2_.reductionLine._width = _loc2_.originalPrice._width;
         _loc2_.reductionLine._x = _loc2_.originalPrice._x + _loc2_.originalPrice._width - _loc2_.reductionLine._width;
      }
      else
      {
         _loc2_.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(this.business.resupplyCost);
         _loc2_.reductionLine._visible = false;
      }
      _loc2_ = this.view.resupplyPanel.resupply2Button;
      _loc2_.reductionLine._visible = false;
      this.resupplyPanelControls.push(new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_2_BUTTON,_loc2_,"BIKEBIZ_STEAL_SUPPLIES"));
   }
   function initUpgradePanel()
   {
      this.view.upgradePanel._visible = false;
      var _loc2_ = 1;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ <= 3)
      {
         _loc5_ = com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen["UPGRADE_" + _loc2_ + "_BUTTON"];
         _loc3_ = this.view.upgradePanel["upgrade" + _loc2_ + "Button"];
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(_loc3_.tooltip.label,"BIKEBIZ_UPG_" + _loc2_ + "_DESC");
         _loc3_.tooltip._alpha = 0;
         _loc4_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(_loc5_,_loc3_);
         this.upgradePanelControls.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initSellPanel()
   {
      this.view.sellPanel._visible = false;
      var _loc2_ = 1;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ <= 3)
      {
         _loc5_ = com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen["SELL_" + _loc2_ + "_BUTTON"];
         _loc3_ = this.view.sellPanel["sell" + _loc2_ + "Button"];
         _loc4_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(_loc5_,_loc3_);
         this.sellPanelControls.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function get isReady()
   {
      return true;
   }
   function onTargetChange(id)
   {
      var _loc3_ = 0.2;
      var _loc2_ = 0.5;
      if(this.view.upgradePanel._visible)
      {
         if(id == com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_1_BUTTON)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade1Button.tooltip,_loc3_,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade1Button.tooltip,_loc2_,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         if(id == com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_2_BUTTON)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade2Button.tooltip,_loc3_,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade2Button.tooltip,_loc2_,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         if(id == com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_3_BUTTON)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade3Button.tooltip,_loc3_,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradePanel.upgrade3Button.tooltip,_loc2_,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         }
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.ACCEPT:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
         default:
            return;
      }
   }
   function handleAcceptInput(inputID)
   {
      switch(this.app.GET_CURRENT_SELECTION())
      {
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SELL_BUTTON:
            this.showSellPanel();
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_BUTTON:
            this.showResupplyPanel();
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_BUTTON:
            if(this.business.status != com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_NOT_SET_UP && this.business.status != com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_PENDING_RESTART)
            {
               this.showUpgradePanel();
            }
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.OVERLAY_ACCEPT_BUTTON:
            this.hideAllPanels();
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SETUP_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.CEASE_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.START_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.OVERLAY_CANCEL_BUTTON:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_1_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.RESUPPLY_2_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SELL_1_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SELL_2_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.SELL_3_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_1_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_2_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.UPGRADE_3_BUTTON:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         default:
            if(!this.overlay.isShowing)
            {
               this.hideAllPanels();
            }
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
            return;
      }
   }
   function showOverlay(message, acceptButton, cancelButton)
   {
      this.overlay.show(message,acceptButton,cancelButton);
      this.updateControls();
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.updateControls();
   }
   function onBusinessListChange()
   {
      this.business = this.app.getBusinessByID(this.app.GET_SELECTED_BUSINESS_ID());
      this.initText();
      var _loc2_ = Math.min(100,Math.max(0,this.business.stockLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stockMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.METER_FILL_DURATION,{_xscale:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_ = Math.min(100,Math.max(0,this.business.suppliesLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.suppliesMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.ManagementScreen.METER_FILL_DURATION,{_xscale:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      this.initControlButtons();
      this.updateControls();
   }
   function setStartProductionStatus()
   {
      var _loc2_ = this.business.status == com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_ACTIVE || this.business.status == com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_SUSPENDED;
      if(!_loc2_)
      {
         this.view.ceaseButton.gotoAndStop(!this.app.startProductionEnabled ? "disabled" : "enabled");
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceaseButton.label,"BIKEBIZ_START");
      }
   }
   function addUpgrade(index, description, price, txd)
   {
      this.app.imageManager.addImage("MP_BWH_GENERIC",txd,this.view.upgradePanel["upgrade" + index + "Button"].image);
      this.updateControls();
   }
   function removeUpgrade(index)
   {
      this.updateControls();
   }
   function setUpgradeStatus(index, isEnabled)
   {
      this.updateControls();
   }
   function addBuyer(index, buyerName, amount, price)
   {
      this.updateControls();
   }
   function removeBuyer(index)
   {
      this.updateControls();
   }
   function setBuyerStatus(index, isEnabled)
   {
      this.updateControls();
   }
   function showResupplyPanel()
   {
      if(this.business.resupplyButtonEnabled)
      {
         this.view.resupplyPanel._visible = true;
         this.view.sellPanel._visible = false;
         this.view.upgradePanel._visible = false;
         this.updateControls();
      }
   }
   function showSellPanel()
   {
      this.view.sellPanel._visible = true;
      this.view.resupplyPanel._visible = false;
      this.view.upgradePanel._visible = false;
      this.updateControls();
   }
   function showUpgradePanel()
   {
      this.view.upgradePanel._visible = true;
      this.view.resupplyPanel._visible = false;
      this.view.sellPanel._visible = false;
      this.updateControls();
   }
   function hideAllPanels()
   {
      this.view.resupplyPanel._visible = false;
      this.view.sellPanel._visible = false;
      this.view.upgradePanel._visible = false;
      this.updateControls();
   }
   function updateControls()
   {
      if(this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.overlay.controls);
         return undefined;
      }
      var _loc5_ = [this.resupplyButton,this.ceaseButton];
      var _loc9_ = (this.business.getBuyer(0) || this.business.getBuyer(1) || this.business.getBuyer(2)) != undefined;
      if(this.view.sellPanel._visible)
      {
         this.sellButton.view._visible = false;
      }
      else if(_loc9_)
      {
         this.sellButton.view.gotoAndStop("enabled");
         this.sellButton.view._visible = true;
         _loc5_.push(this.sellButton);
      }
      else
      {
         this.sellButton.view.gotoAndStop("disabled");
         this.sellButton.view._visible = true;
      }
      var _loc12_ = (this.business.getUpgrade(0) || this.business.getUpgrade(1) || this.business.getUpgrade(2)) != undefined;
      var _loc11_;
      var _loc10_;
      if(_loc12_)
      {
         _loc11_ = this.business.getUpgrade(0).isEnabled || this.business.getUpgrade(1).isEnabled || this.business.getUpgrade(2).isEnabled;
         _loc10_ = this.business.status == com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUS_PENDING_RESTART;
         this.upgradeButton.view.gotoAndStop(!(_loc11_ && !_loc10_) ? "disabled" : "enabled");
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.upgradeButton.view.label,"BIKEBIZ_UPGRADE");
         this.upgradeButton.view._visible = true;
         _loc5_.push(this.upgradeButton);
      }
      else
      {
         this.upgradeButton.view._visible = false;
      }
      if(this.view.resupplyPanel._visible)
      {
         _loc5_.push(this.resupplyPanelControls[0]);
         _loc5_.push(this.resupplyPanelControls[1]);
      }
      var _loc8_;
      var _loc6_;
      var _loc2_;
      var _loc3_;
      if(this.view.upgradePanel._visible)
      {
         _loc8_ = 10;
         _loc6_ = 0;
         while(_loc6_ < 3)
         {
            _loc2_ = this.business.getUpgrade(_loc6_);
            _loc3_ = this.upgradePanelControls[_loc6_].view;
            if(_loc2_)
            {
               if(_loc2_.isEnabled)
               {
                  _loc3_.gotoAndStop("enabled");
               }
               else
               {
                  _loc3_.gotoAndStop("disabled");
               }
               _loc5_.push(this.upgradePanelControls[_loc6_]);
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(_loc3_.label,_loc2_.description);
               _loc3_._visible = true;
               _loc3_._x = _loc8_;
               if(_loc2_.salePrice != -1)
               {
                  _loc3_.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(_loc2_.salePrice);
                  _loc3_.originalPrice.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(_loc2_.price);
                  _loc3_.originalPrice.autoSize = "left";
                  _loc3_.originalPrice._x = _loc3_.price.textWidth + 25;
                  _loc3_.reductionLine._x = _loc3_.originalPrice._x;
                  _loc3_.reductionLine._width = _loc3_.originalPrice._width;
                  _loc3_.reductionLine._visible = true;
               }
               else
               {
                  _loc3_.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(_loc2_.price);
                  _loc3_.reductionLine._visible = false;
               }
               this.upgradePanelControls[_loc6_].updateBounds();
               _loc8_ += 215;
            }
            else
            {
               _loc3_._visible = false;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      var _loc7_;
      var _loc4_;
      if(this.view.sellPanel._visible)
      {
         _loc7_ = 0;
         _loc6_ = 0;
         while(_loc6_ < 3)
         {
            _loc4_ = this.business.getBuyer(_loc6_);
            _loc3_ = this.sellPanelControls[_loc6_].view;
            if(_loc4_)
            {
               if(_loc4_.isEnabled)
               {
                  _loc3_.gotoAndStop("enabled");
               }
               else
               {
                  _loc3_.gotoAndStop("disabled");
               }
               _loc5_.push(this.sellPanelControls[_loc6_]);
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellPanel["offer" + _loc6_],_loc4_.buyerName);
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellPanel["amount" + _loc6_],_loc4_.amount);
               _loc3_.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(_loc4_.price);
               _loc3_._visible = true;
               _loc3_._y = _loc7_;
               this.sellPanelControls[_loc6_].updateBounds();
               _loc7_ += 93;
            }
            else
            {
               _loc3_._visible = false;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      _loc6_ = 0;
      while(_loc6_ < _loc5_.length)
      {
         _loc5_[_loc6_].updateBounds();
         _loc6_ = _loc6_ + 1;
      }
      this.cursor.setTargetRects(_loc5_);
   }
   function dispose()
   {
      this.business = null;
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.suppliesMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.upgradePanel.upgrade1Button.tooltip);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.upgradePanel.upgrade2Button.tooltip);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.upgradePanel.upgrade3Button.tooltip);
      super.dispose();
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
}
