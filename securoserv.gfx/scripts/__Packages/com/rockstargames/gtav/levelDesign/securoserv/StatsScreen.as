class com.rockstargames.gtav.levelDesign.securoserv.StatsScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var controls;
   var ownedWarehouseIDs;
   var userListPanelOffset;
   var view;
   var app;
   var cursor;
   var barGraphAnimateCount;
   var pieChart;
   var pieChartPercentage;
   var organisationMembersShowing;
   var mapButton;
   var safeZoneBottom;
   var safeZoneRight;
   static var WAREHOUSE_MAP = 2001;
   static var BUY_0 = 2002;
   static var BUY_1 = 2003;
   static var BUY_2 = 2004;
   static var BUY_3 = 2005;
   static var BUY_4 = 2006;
   static var BAR_0 = 2007;
   static var BAR_1 = 2008;
   static var BAR_2 = 2009;
   static var BAR_3 = 2010;
   static var BAR_4 = 2011;
   static var MAP = 2012;
   static var ACTIVE_ORGANISATION_1 = 2013;
   static var ACTIVE_ORGANISATION_2 = 2014;
   static var ACTIVE_ORGANISATION_3 = 2015;
   static var ACTIVE_ORGANISATION_4 = 2016;
   static var ACTIVE_ORGANISATION_5 = 2017;
   static var USER_LIST_UPDATE_INTERVAL = 1.4;
   static var BAR_GRAPH_MAX_VALUE = 120;
   static var BAR_GRAPH_MAX_HEIGHT = 240;
   static var BAR_GRAPH_SCALAR = com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_MAX_HEIGHT / com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_MAX_VALUE;
   static var BAR_GRAPH_ANIMATE_SPEED = 160;
   static var BAR_GRAPH_BAR_INTERVAL = 0.5;
   static var BAR_GRAPH_RED_INTERVAL = 0.15;
   function StatsScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"statsScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      this.ownedWarehouseIDs = [];
      this.userListPanelOffset = 0;
      this.initSummaryPanel();
      this.initEarningsPanel();
      this.initWarehousesPanel();
      this.initStockPanel();
      this.initUserListPanel();
      this.initNavButtons();
      this.initMap();
      this.view._visible = true;
      this.flashElementIn(this.view.summaryPanel,0.7,"Summary_Box_Appear");
      this.flashElementIn(this.view.earningsPanel,0.8,"Summary_Box_Appear");
      this.flashElementIn(this.view.warehousesPanel,0.9,"Summary_Box_Appear");
      this.flashElementIn(this.view.stockPanel,1,"Summary_Box_Appear");
      this.flashElementIn(this.view.userListPanel,1.1,"Summary_Box_Appear");
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.stockPanel.pieChart,1.5,{onCompleteScope:this,onComplete:this.animatePieChart});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.warehousesPanel.bar0,2,{onCompleteScope:this,onComplete:this.animateBarGraph});
      if(this.app.statsShown)
      {
         this.view.map.gotoAndStop(this.view.map._totalframes);
         this.view.grid.gotoAndStop(this.view.grid._totalframes);
      }
      this.app.statsShown = true;
      this.cursor.setTargetRects(this.controls);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initSummaryPanel()
   {
      var _loc2_ = this.view.summaryPanel;
      var _loc3_ = this.app.organisation;
      if(_loc3_.length > 0)
      {
         _loc3_ += " ";
      }
      _loc2_.heading.text = _loc3_;
      _loc2_.collectionsCompletedLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.collectionsCompletedLabel,"SECUROSERV_COLLECTIONS_COMPLETED");
      _loc2_.collectionsSuccessLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.collectionsSuccessLabel,"SECUROSERV_COLLECTION_SUCCESS_RATE");
      _loc2_.salesCompletedLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.salesCompletedLabel,"SECUROSERV_SALES_COMPLETED");
      _loc2_.salesSuccessLabel.text = "    " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc2_.salesSuccessLabel,"SECUROSERV_SALE_SUCCESS_RATE");
      _loc2_.collectionsCompletedStat.text = this.app.collectionsCompleted.toString();
      _loc2_.collectionsSuccessStat.text = this.app.collectionSuccessRate + "%";
      _loc2_.salesCompletedStat.text = this.app.salesCompleted.toString();
      _loc2_.salesSuccessStat.text = this.app.salesSuccessRate + "%";
   }
   function initEarningsPanel()
   {
      var _loc4_ = this.view.earningsPanel;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc4_.numWarehousesLabel,"SECUROSERV_WAREHOUSES_OWNED");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc4_.totalEarningsLabel,"SECUROSERV_TOTAL_EARNINGS");
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_ = this.app.warehouses.length;
      while(_loc2_ < _loc3_)
      {
         if(this.app.warehouses[_loc2_].isOwned)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc4_.numWarehousesStat._x = _loc4_.numWarehousesLabel._x + _loc4_.numWarehousesLabel.textWidth + 8;
      _loc4_.numWarehousesStat.text = _loc5_.toString();
      _loc4_.totalEarningsStat._x = _loc4_.totalEarningsLabel._x + _loc4_.totalEarningsLabel.textWidth + 8;
      _loc4_.totalEarningsStat.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(this.app.totalEarnings);
      var _loc6_ = _loc4_.button._x + _loc4_.button._width;
      var _loc7_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.WAREHOUSE_MAP,_loc4_.button,"SECUROSERV_WAREHOUSE_MAP");
      _loc4_.button._x = _loc6_ - _loc4_.button._width;
      this.controls.push(_loc7_);
   }
   function initWarehousesPanel()
   {
      var _loc4_ = this.view.warehousesPanel;
      _loc4_.heading.text = com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc4_.heading,"SECUROSERV_WAREHOUSE_STOCK");
      var _loc11_ = _loc4_.contrabandHeldLabel._x + _loc4_.contrabandHeldLabel._width;
      _loc4_.contrabandHeldLabel.autoSize = "left";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc4_.contrabandHeldLabel,"SECUROSERV_CONTRABAND_HELD");
      _loc4_.maxStorageLabel.autoSize = "left";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc4_.maxStorageLabel,"SECUROSERV_MAX_STORAGE");
      var _loc10_ = _loc11_ - Math.max(_loc4_.contrabandHeldLabel.textWidth,_loc4_.maxStorageLabel.textWidth);
      _loc4_.contrabandHeldLabel._x = _loc10_;
      _loc4_.maxStorageLabel._x = _loc10_;
      _loc4_.maxStorageDot._x = _loc4_.contrabandDot._x = _loc10_ - 20;
      var _loc7_ = [];
      var _loc6_ = 0;
      var _loc8_ = this.app.warehouses.length;
      while(_loc6_ < _loc8_)
      {
         var _loc3_ = this.app.warehouses[_loc6_];
         if(_loc3_.isOwned)
         {
            _loc7_.push(_loc3_);
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc7_.sortOn("displayOrder",Array.NUMERIC);
      var _loc5_ = 0;
      _loc6_ = 0;
      _loc8_ = _loc7_.length;
      while(_loc6_ < _loc8_)
      {
         _loc3_ = _loc7_[_loc6_];
         if(_loc3_.isOwned)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc4_["colLabel" + _loc5_],_loc3_.name,"center");
            var _loc2_ = _loc4_["bar" + _loc5_];
            _loc2_.barLinesMask._height = _loc2_.whiteBar._height = _loc2_.whiteBar.originalHeight = com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_SCALAR * Math.min(_loc3_.capacity,com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_MAX_VALUE);
            _loc2_.redBar._height = _loc2_.redBar.originalHeight = com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_SCALAR * Math.min(_loc3_.amountStored,com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_MAX_VALUE);
            _loc2_.whiteBar._height = _loc2_.barLinesMask._height = _loc2_.redBar._height = 0;
            var _loc9_ = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.StatsScreen["BAR_" + _loc5_],_loc2_);
            this.controls.push(_loc9_);
            this.ownedWarehouseIDs.push(_loc3_.id);
            _loc5_ = _loc5_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = _loc5_;
      while(_loc6_ < 5)
      {
         _loc4_["bar" + _loc6_]._visible = false;
         _loc6_ = _loc6_ + 1;
      }
   }
   function animateBarGraph()
   {
      var _loc8_ = this.view.warehousesPanel;
      _loc8_.dottedLines.play();
      this.barGraphAnimateCount = 0;
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         var _loc3_ = _loc8_["bar" + _loc2_];
         if(_loc3_._visible)
         {
            var _loc4_ = _loc2_ * com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_BAR_INTERVAL;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc3_.whiteBar,_loc4_,{onCompleteScope:this,onComplete:this.startBarAnimation,onCompleteArgs:[_loc3_,_loc2_]});
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function startBarAnimation(bar, index)
   {
      if(++this.barGraphAnimateCount == 1)
      {
         this.playBarAnimationSound();
      }
      var _loc4_ = bar.whiteBar.originalHeight;
      var _loc2_ = _loc4_ / com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_ANIMATE_SPEED;
      var _loc5_ = index * com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_RED_INTERVAL;
      var _loc6_ = bar.redBar.originalHeight;
      var _loc7_ = _loc6_ / com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_GRAPH_ANIMATE_SPEED;
      var _loc8_ = Math.max(_loc2_,_loc5_ + _loc7_);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.whiteBar,_loc2_,{_height:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      if(_loc8_ == _loc2_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.barLinesMask,_loc2_,{_height:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onCompleteScope:this,onComplete:this.finishBarAnimation});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.redBar,_loc7_,{_height:_loc6_,delay:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.barLinesMask,_loc2_,{_height:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.redBar,_loc7_,{_height:_loc6_,delay:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onCompleteScope:this,onComplete:this.finishBarAnimation});
      }
   }
   function finishBarAnimation()
   {
      this.barGraphAnimateCount = this.barGraphAnimateCount - 1;
   }
   function playBarAnimationSound()
   {
      if(this.barGraphAnimateCount > 0)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Summary_Warehouse_Stock_Graph_Counter");
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.warehousesPanel,0.033,{onCompleteScope:this,onComplete:this.playBarAnimationSound});
      }
   }
   function initStockPanel()
   {
      var _loc5_ = this.view.stockPanel;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc5_.heading,"SECUROSERV_TOTAL_STOCK");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc5_.freeSpaceLabel,"SECUROSERV_FREE_SPACE");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc5_.heldLabel,"SECUROSERV_HELD");
      var _loc7_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.app.warehouses.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.app.warehouses[_loc2_];
         if(_loc3_.isOwned)
         {
            _loc6_ += _loc3_.capacity;
            _loc7_ += _loc3_.amountStored;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = Math.round(100 * (_loc6_ - _loc7_) / _loc6_);
      var _loc8_ = 100 - _loc9_;
      _loc5_.freeSpaceStat.text = _loc9_ + "%";
      _loc5_.usedSpaceStat.text = _loc8_ + "%";
      _loc5_.heldDot._x = _loc5_.usedSpaceStat._x + _loc5_.usedSpaceStat._width - _loc5_.usedSpaceStat.textWidth - 19;
      _loc5_.totalStats.textAutoSize = "shrink";
      _loc5_.totalStats.text = com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(_loc7_) + " / " + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(_loc6_) + " " + com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(_loc5_.totalStats,"SECUROSERV_UNITS");
      this.pieChart = new com.rockstargames.gtav.levelDesign.securoserv.PieChart(_loc5_.pieChart,_loc8_);
      this.pieChartPercentage = _loc8_;
   }
   function animatePieChart()
   {
      this.pieChart.animateTo(this.pieChartPercentage);
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
      if(_loc8_ <= 5)
      {
         offset = 0;
      }
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         var _loc7_ = (_loc2_ + offset) % _loc8_;
         if(_loc2_ < _loc8_)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc5_["activeOrganisation" + _loc2_].gamerTag,this.app.activeUsers[_loc7_].name,"left");
            com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc5_["activeOrganisation" + _loc2_].organisation,this.app.activeUsers[_loc7_].organisation,"left");
            var _loc6_ = false;
            var _loc3_ = 0;
            while(_loc3_ < this.controls.length)
            {
               var _loc4_ = this.controls[_loc3_];
               if(_loc4_.id == com.rockstargames.gtav.levelDesign.securoserv.StatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)])
               {
                  _loc6_ = true;
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
            if(!_loc6_)
            {
               this.controls.push(new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.StatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)],_loc5_["activeOrganisation" + _loc2_]));
            }
         }
         else
         {
            _loc5_["activeOrganisation" + _loc2_].gamerTag.text = "";
            _loc5_["activeOrganisation" + _loc2_].organisation.text = "";
            _loc3_ = 0;
            while(_loc3_ < this.controls.length)
            {
               _loc4_ = this.controls[_loc3_];
               if(_loc4_.id == com.rockstargames.gtav.levelDesign.securoserv.StatsScreen["ACTIVE_ORGANISATION_" + (_loc2_ + 1)])
               {
                  this.controls.splice(_loc3_,1);
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.userListPanelOffset = offset;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc5_.tweenController,com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.USER_LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updateUserListPanel,onCompleteArgs:[offset = offset + 1]});
      this.cursor.setTargetRects(this.controls);
   }
   function initNavButtons()
   {
      this.mapButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.MAP,this.view.mapButton,"SECUROSERV_WAREHOUSE_MAP");
      this.mapButton.setState("off");
      this.controls.push(this.mapButton);
      var _loc2_ = Math.min(this.view.mapButton._y,this.safeZoneBottom - this.view.mapButton._height);
      var _loc3_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(-1,this.view.statsLabel,"SECUROSERV_SUMMARY_PAGE");
      _loc3_.setState("on");
      this.view.mapButton._x = this.safeZoneRight - this.view.mapButton._width;
      this.view.mapButton._y = _loc2_;
      this.view.statsLabel._x = this.view.mapButton._x - 1 - this.view.statsLabel._width;
      this.view.statsLabel._y = _loc2_;
      this.mapButton.updateBounds();
      _loc3_.updateBounds();
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
   }
   function onTargetChange(targetID)
   {
      switch(targetID)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.ACTIVE_ORGANISATION_1:
            this.showOrganisationMembers(0);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.ACTIVE_ORGANISATION_2:
            this.showOrganisationMembers(1);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.ACTIVE_ORGANISATION_3:
            this.showOrganisationMembers(2);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.ACTIVE_ORGANISATION_4:
            this.showOrganisationMembers(3);
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.ACTIVE_ORGANISATION_5:
            this.showOrganisationMembers(4);
            break;
         default:
            this.hideOrganisationMembers();
      }
   }
   function showOrganisationMembers(organisationIndex)
   {
      var _loc2_ = this.view.userListPanel.organisationMembers;
      var _loc7_ = this.app.activeUsers[(organisationIndex + this.userListPanelOffset) % this.app.activeUsers.length];
      com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(_loc2_.member0,_loc7_.name,"left");
      _loc2_.bg._height = _loc2_.member0._y + _loc2_.member0._height + 18;
      var _loc6_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < 8)
      {
         var _loc5_ = _loc7_.goons[_loc4_];
         if(_loc5_ != undefined && _loc5_ != "")
         {
            var _loc3_ = _loc2_["member" + (_loc6_ = _loc6_ + 1)];
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
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.userListPanel.tweenController,com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.USER_LIST_UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updateUserListPanel,onCompleteArgs:[this.userListPanelOffset]});
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
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_0:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = this.ownedWarehouseIDs[0];
               this.app.showScreen(this.app.MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_1:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = this.ownedWarehouseIDs[1];
               this.app.showScreen(this.app.MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_2:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = this.ownedWarehouseIDs[2];
               this.app.showScreen(this.app.MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_3:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = this.ownedWarehouseIDs[3];
               this.app.showScreen(this.app.MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BAR_4:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = this.ownedWarehouseIDs[4];
               this.app.showScreen(this.app.MAP_SCREEN);
               break;
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BUY_0:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BUY_1:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BUY_2:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BUY_3:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.BUY_4:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.WAREHOUSE_MAP:
            case com.rockstargames.gtav.levelDesign.securoserv.StatsScreen.MAP:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.selectedWarehouseID = -1;
               this.app.showScreen(this.app.MAP_SCREEN);
         }
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.CANCEL || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.RIGHT_MOUSE)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
         this.app.showScreen(this.app.BRANCH_SCREEN);
      }
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.summaryPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.earningsPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.warehousesPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockPanel.pieChart);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.userListPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.userListPanel.tweenController);
      var _loc4_ = 0;
      while(_loc4_ < 5)
      {
         var _loc3_ = this.view.warehousesPanel["bar" + _loc4_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.whiteBar);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.barLinesMask);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.redBar);
         _loc4_ = _loc4_ + 1;
      }
      this.pieChart.dispose();
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
