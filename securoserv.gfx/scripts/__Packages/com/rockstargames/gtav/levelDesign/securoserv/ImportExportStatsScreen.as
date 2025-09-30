class com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var app;
   var capacityMeter;
   var controls;
   var cursor;
   var interiorsOverlay;
   var mapButton;
   var organisationMembersShowing;
   var overlay;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneTop;
   var stealButton;
   var userListPanelOffset;
   var view;
   static var STEAL_VEHICLE = 4001;
   static var MAP = 4002;
   static var OVERLAY_ACCEPT = 4003;
   static var OVERLAY_CANCEL = 4004;
   static var ACTIVE_ORGANISATION_1 = 4005;
   static var ACTIVE_ORGANISATION_2 = 4006;
   static var ACTIVE_ORGANISATION_3 = 4007;
   static var ACTIVE_ORGANISATION_4 = 4008;
   static var ACTIVE_ORGANISATION_5 = 4009;
   static var ACTIVE_ORGANISATION_6 = 4010;
   static var ACTIVE_ORGANISATION_7 = 4011;
   static var ACTIVE_ORGANISATION_8 = 4012;
   static var ACTIVE_ORGANISATION_9 = 4013;
   static var ACTIVE_ORGANISATION_10 = 4014;
   static var INTERIOR_0 = 4015;
   static var INTERIOR_1 = 4016;
   static var INTERIOR_2 = 4017;
   static var PURCHASE_INTERIOR = 4018;
   static var CANCEL_INTERIOR = 4019;
   static var SHOW_INTERIORS_OVERLAY = 4023;
   static var MAP_2 = 4024;
   static var USER_LIST_UPDATE_INTERVAL = 1.4;
   function ImportExportStatsScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"importExportStatsScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      this.userListPanelOffset = 0;
      var _loc2_ = 0;
      var _loc4_ = this.app.vehicleWarehouses.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.app.vehicleWarehouses[_loc2_];
         if(_loc3_.isOwned)
         {
            this.app.selectedWarehouseID = _loc3_.id;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.initInteriorsOverlay();
      this.initOverlay();
      this.initSummaryPanel();
      this.initEarningsPanel();
      this.initStealPanel();
      this.initUserListPanel();
      this.initNavButtons();
      this.initMap();
      this.view._visible = true;
      this.flashElementIn(this.view.summaryPanel,0.7,"Summary_Box_Appear");
      this.flashElementIn(this.view.earningsPanel,0.8,"Summary_Box_Appear");
      this.flashElementIn(this.view.stealPanel,0.9,"Summary_Box_Appear");
      this.flashElementIn(this.view.userListPanel,1,"Summary_Box_Appear");
      if(this.app.vehicleStatsShown)
      {
         this.view.map.gotoAndStop(this.view.map._totalframes);
         this.view.grid.gotoAndStop(this.view.grid._totalframes);
      }
      this.app.vehicleStatsShown = true;
      this.cursor.setTargetRects(this.controls);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initInteriorsOverlay()
   {
      this.interiorsOverlay = new com.rockstargames.gtav.levelDesign.securoserv.InteriorsOverlay(this.view.interiorsOverlay,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_0,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_1,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_2,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.PURCHASE_INTERIOR,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.CANCEL_INTERIOR,this.app.imageManager);
      this.interiorsOverlay.hide();
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.securoserv.PurchaseOutcomeOverlay(this.view.overlay,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.OVERLAY_ACCEPT,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.OVERLAY_CANCEL);
      this.overlay.hide();
   }
   function initSummaryPanel()
   {
      var _loc2_ = this.view.summaryPanel;
      var _loc4_ = this.app.organisation;
      if(_loc4_.length > 0)
      {
         _loc4_ += " ";
      }
      _loc2_.heading.text = _loc4_;
      _loc2_.collectionsCompletedLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.collectionsCompletedLabel,"SECUROSERV_VEHICLES_STOLEN");
      _loc2_.collectionsSuccessLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.collectionsSuccessLabel,"SECUROSERV_STEAL_SUCCESS_RATE");
      _loc2_.salesCompletedLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.salesCompletedLabel,"SECUROSERV_VEHICLES_EXPORTED");
      _loc2_.salesSuccessLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.salesSuccessLabel,"SECUROSERV_EXPORT_SUCCESS_RATE");
      _loc2_.collectionsCompletedStat.text = this.app.numVehiclesStolen.toString();
      _loc2_.collectionsSuccessStat.text = this.app.stealVehiclesSuccess + "%";
      _loc2_.salesCompletedStat.text = this.app.vehiclesExported.toString();
      _loc2_.salesSuccessStat.text = this.app.exportVehiclesSuccess + "%";
      var _loc3_;
      var _loc5_;
      var _loc6_;
      if(this.app.selectedWarehouseID != -1)
      {
         _loc3_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
         _loc2_.warehouseName.text = _loc3_.name;
         _loc2_.warehouseLocation.text = _loc3_.location;
         this.capacityMeter = new com.rockstargames.gtav.levelDesign.securoserv.CapacityMeter(_loc2_.meter,_loc2_.meter._width);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc2_.meter,1,{onCompleteScope:this,onComplete:this.startCapacityMeter});
         this.app.imageManager.addImage(_loc3_.txd,_loc3_.txd + "_2",_loc2_.image);
         _loc5_ = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.SHOW_INTERIORS_OVERLAY,_loc2_.renovateButton);
         com.rockstargames.gtav.levelDesign.SECUROSERV.setSpacedTextField(_loc2_.renovateButton.label,"SECUROSERV_RENOVATE");
         this.controls.push(_loc5_);
         _loc6_ = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.MAP_2,_loc2_.mapButton);
         com.rockstargames.gtav.levelDesign.SECUROSERV.setSpacedTextField(_loc2_.mapButton.label,"SECUROSERV_WAREHOUSE_MAP");
         this.controls.push(_loc6_);
      }
      else
      {
         _loc2_.renovateButton._visible = false;
      }
   }
   function startCapacityMeter()
   {
      var _loc2_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      this.capacityMeter.percentage = 100 * _loc2_.numVehiclesStored / _loc2_.vehicleCapacity;
   }
   function initEarningsPanel()
   {
      var _loc2_ = this.view.earningsPanel;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.totalEarningsLabel,"SECUROSERV_TOTAL_EXPORT_EARNINGS");
      _loc2_.totalEarningsStat.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(this.app.totalVehicleEarnings);
   }
   function initStealPanel()
   {
      var _loc2_ = this.view.stealPanel;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.title,"SECUROSERV_STATS_TITLE");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.description,"SECUROSERV_STATS_DESCRIPTION");
      this.stealButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.STEAL_VEHICLE,_loc2_.stealButton);
      com.rockstargames.gtav.levelDesign.SECUROSERV.setSpacedTextField(_loc2_.stealButton.label,"SECUROSERV_STEAL_VEHICLE");
      this.controls.push(this.stealButton);
      var _loc3_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      if(_loc3_)
      {
         this.updateCooldown(_loc3_.stealCooldown);
      }
   }
   function initUserListPanel()
   {
      var _loc2_ = this.view.userListPanel;
      _loc2_.organisationMembers._visible = false;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.heading,"SECUROSERV_ACTIVE_USERS");
      _loc2_.organisationMembers.heading.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.organisationMembers.heading,"SECUROSERV_MEMBER_LIST");
      this.organisationMembersShowing = false;
      this.updateUserListPanel(0);
   }
   function updateUserListPanel(offset)
   {
      var _loc5_ = this.view.userListPanel;
      var _loc8_ = this.app.activeUsers.length;
      if(_loc8_ <= 10)
      {
         offset = 0;
      }
      var _loc2_ = 0;
      var _loc7_;
      var _loc6_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < 10)
      {
         _loc7_ = (_loc2_ + offset) % _loc8_;
         if(_loc2_ < _loc8_)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc5_["activeOrganisation" + _loc2_].gamerTag,this.app.activeUsers[_loc7_].name,"left");
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc5_["activeOrganisation" + _loc2_].organisation,this.app.activeUsers[_loc7_].organisation,"left");
            _loc6_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.controls.length)
            {
               _loc4_ = this.controls[_loc3_];
               if(_loc4_.id == com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)])
               {
                  _loc6_ = true;
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
            if(!_loc6_)
            {
               this.controls.push(new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)],_loc5_["activeOrganisation" + _loc2_]));
            }
         }
         else
         {
            _loc5_["activeOrganisation" + _loc2_].gamerTag.text = "";
            _loc5_["activeOrganisation" + _loc2_].organisation.text = "";
            _loc3_ = this.controls.length - 1;
            while(_loc3_ > 0)
            {
               _loc4_ = this.controls[_loc3_];
               if(_loc4_.id == com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)])
               {
                  this.controls.splice(_loc3_,1);
                  break;
               }
               _loc3_ = _loc3_ - 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.userListPanelOffset = offset;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc5_.tweenController,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.USER_LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updateUserListPanel,onCompleteArgs:[offset = offset + 1]});
      if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
      {
         this.cursor.setTargetRects(this.controls);
      }
   }
   function initNavButtons()
   {
      this.mapButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.MAP,this.view.mapButton,"SECUROSERV_VEHICLE_MAP");
      this.mapButton.setState("off");
      this.controls.push(this.mapButton);
      var _loc3_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(-1,this.view.statsLabel,"SECUROSERV_SUMMARY_PAGE");
      _loc3_.setState("on");
      var _loc2_ = Math.max(this.view.statsLabel._y,this.safeZoneTop);
      this.view.statsLabel._x = this.safeZoneLeft;
      this.view.statsLabel._y = _loc2_;
      this.view.mapButton._x = this.view.statsLabel._x + 1 + this.view.statsLabel._width;
      this.view.mapButton._y = _loc2_;
      this.mapButton.updateBounds();
   }
   function initMap()
   {
      this.view.map._x = this.app.mapStartX;
      this.view.map._y = this.app.mapStartY;
      var _loc2_;
      var _loc3_;
      if(this.app.mapStartMatrix)
      {
         this.view.map.transform.matrix = this.app.mapStartMatrix;
      }
      else
      {
         _loc2_ = this.view.map.transform.matrix;
         _loc3_ = this.app.mapStartScale / _loc2_.a;
         _loc2_.translate(- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         _loc2_.scale(_loc3_,_loc3_);
         _loc2_.translate(com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         this.view.map.transform.matrix = _loc2_;
      }
   }
   function onTargetChange(targetID)
   {
      var _loc2_;
      if(!this.overlay.isShowing && !this.interiorsOverlay.isShowing)
      {
         _loc2_ = 1;
         while(_loc2_ <= 10)
         {
            if(targetID == com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen["ACTIVE_ORGANISATION_" + _loc2_])
            {
               this.showOrganisationMembers(_loc2_ - 1);
               return undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.hideOrganisationMembers();
   }
   function showOrganisationMembers(organisationIndex)
   {
      var _loc2_ = this.view.userListPanel.organisationMembers;
      var _loc7_ = this.app.activeUsers[(organisationIndex + this.userListPanelOffset) % this.app.activeUsers.length];
      com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc2_.member0,_loc7_.name,"left");
      _loc2_.bg._height = _loc2_.member0._y + _loc2_.member0._height + 18;
      var _loc6_ = 0;
      var _loc4_ = 0;
      var _loc5_;
      var _loc3_;
      while(_loc4_ < 8)
      {
         _loc5_ = _loc7_.goons[_loc4_];
         if(_loc5_ != undefined && _loc5_ != "")
         {
            _loc3_ = _loc2_["member" + (_loc6_ = _loc6_ + 1)];
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc3_,_loc5_,"left");
            _loc2_.bg._height = _loc3_._y + _loc3_._height + 18;
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = _loc6_ + 1;
      while(_loc4_ < 8)
      {
         _loc2_["member" + _loc4_].text = "";
         _loc4_ = _loc4_ + 1;
      }
      _loc2_._y = 0;
      _loc2_.arrow._y = 0;
      var _loc9_ = _loc2_.bg._height - _loc2_.arrow._height;
      var _loc8_ = this.view.userListPanel["activeOrganisation" + organisationIndex]._y + 10;
      if(_loc8_ > _loc9_)
      {
         _loc2_._y = _loc8_ - _loc2_.bg._height + _loc2_.arrow._height;
         if(_loc2_._y + _loc2_._height > this.safeZoneBottom)
         {
            _loc2_._y = this.safeZoneBottom - _loc2_._height;
         }
         _loc8_ = _loc2_.bg._height - _loc2_.arrow._height;
      }
      _loc2_.arrow._y = _loc8_;
      _loc2_._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.userListPanel.tweenController);
      this.organisationMembersShowing = true;
   }
   function hideOrganisationMembers()
   {
      if(this.organisationMembersShowing)
      {
         this.view.userListPanel.organisationMembers._visible = false;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.userListPanel.tweenController,com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.USER_LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updateUserListPanel,onCompleteArgs:[this.userListPanelOffset]});
         this.organisationMembersShowing = false;
      }
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.ACCEPT || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE)
      {
         switch(this.app.GET_CURRENT_SELECTION())
         {
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.MAP:
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.MAP_2:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.showScreen(this.app.IMPORT_EXPORT_MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.SHOW_INTERIORS_OVERLAY:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_0:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
               this.interiorsOverlay.selectButton(0);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_1:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
               this.interiorsOverlay.selectButton(1);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.INTERIOR_2:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Confirm");
               this.interiorsOverlay.selectButton(2);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.CANCEL_INTERIOR:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Popup_Cancel");
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.PURCHASE_INTERIOR:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Buy");
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.ImportExportStatsScreen.STEAL_VEHICLE:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            default:
               return;
         }
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.CANCEL || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.RIGHT_MOUSE)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
         this.app.showScreen(this.app.BRANCH_SCREEN);
      }
   }
   function updateCooldown(remainingSeconds)
   {
      if(remainingSeconds == undefined)
      {
         remainingSeconds = 0;
      }
      var _loc2_ = this.view.stealPanel.stealButton;
      var _loc3_;
      var _loc4_;
      var _loc6_;
      var _loc10_;
      var _loc8_;
      var _loc7_;
      var _loc9_;
      if(remainingSeconds > 0)
      {
         _loc2_._alpha = 50;
         _loc3_ = Math.ceil(remainingSeconds);
         _loc4_ = _loc3_ % 60;
         _loc6_ = Math.floor((_loc3_ - _loc4_) / 60) % 60;
         _loc10_ = Math.floor((_loc3_ - _loc4_ - _loc6_ * 60) / 3600);
         _loc8_ = ("0" + _loc10_).substr(-2);
         _loc7_ = ("0" + _loc6_).substr(-2);
         _loc9_ = ("0" + _loc4_).substr(-2);
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
   function dispose()
   {
      this.cursor.setChangeListener(null);
      this.capacityMeter.dispose();
      this.capacityMeter = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.summaryPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.earningsPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.userListPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.userListPanel.tweenController);
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
         this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
         this.cursor.setTargetRects(this.overlay.controls);
      }
   }
   function showInteriorsOverlay()
   {
      var _loc2_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      this.interiorsOverlay.show(_loc2_.interior0Cost,_loc2_.interior0SaleCost,_loc2_.interior1Cost,_loc2_.interior1SaleCost,_loc2_.interior2Cost,_loc2_.interior2SaleCost,_loc2_.purchasedInterior);
      this.cursor.setTargetRects(this.interiorsOverlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.interiorsOverlay.hide();
      this.cursor.setTargetRects(this.controls);
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
