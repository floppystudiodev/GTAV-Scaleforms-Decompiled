class com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var app;
   var controls;
   var cursor;
   var view;
   static var BACK_BUTTON = 4001;
   static var METER_FILL_DURATION = 1;
   function SummaryScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"summaryScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      var _loc2_ = this.app.getBusinessByID(this.app.GET_SELECTED_BUSINESS_ID());
      this.initText(_loc2_);
      this.initMeters(_loc2_);
      this.initImages(_loc2_);
      this.initBackButton();
      this.view._visible = true;
      this.cursor.setTargetRects(this.controls);
   }
   function initText(business)
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.header.version,"BIKEBIZ_VERSION");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.statusLabel,"BIKEBIZ_STATUS");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.status,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.STATUSES[business.status]);
      this.view.status._x = this.view.statusLabel._x + this.view.statusLabel.textWidth + 10;
      this.view.stockValueLabel.stockLevelLabel = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.stockLevelLabel,"BIKEBIZ_STOCK");
      this.view.stockValueLabel.suppliesLevelLabel = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.suppliesLevelLabel,"BIKEBIZ_SUPPLIES");
      this.view.stockValueLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.stockValueLabel,"BIKEBIZ_STOCK_VALUE");
      this.view.totalSalesLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.totalSalesLabel,"BIKEBIZ_TOTAL_SALES");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.resupplySuccessLabel,"BIKEBIZ_SUCCESS_RESUPPLY");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellSuccessLSLabel,"BIKEBIZ_SUCCESS_LS");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sellSuccessBCLabel,"BIKEBIZ__SUCCESS_BC");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedSuppliesLabel,"BIKEBIZ_CEASE_SUPPLY");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedRaidedLabel,"BIKEBIZ_CEASE_RAID");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ceasedCapacityLabel,"BIKEBIZ_CEASE_CAP");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.locationLabel,"BIKEBIZ_LOCATION");
      this.view.type.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.type,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.DESCS[business.type]);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.location,business.location);
      this.view.stockValue.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.stockValue);
      this.view.totalSales.text = business.successfulSales;
      this.view.successfulSales.text = business.successfulSales;
      this.view.resupplySuccess.text = business.resupplySuccess + "%";
      this.view.sellSuccessLS.text = business.sellSuccessLS + "%";
      this.view.sellSuccessBC.text = business.sellSuccessBC + "%";
      this.view.ceasedSupplies.text = business.ceasedSupplies;
      this.view.ceasedRaided.text = business.timesRaided;
      this.view.ceasedCapacity.text = business.ceasedCapacity;
      this.view.totalEarnings.text = com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.totalEarnings,"BIKEBIZ_TOTAL_EARN") + " $" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.totalSales);
   }
   function initMeters(business)
   {
      var _loc2_ = false;
      this.view.stockMeter.bar._xscale = 0;
      var _loc3_ = Math.min(100,Math.max(0,business.stockLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stockMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen.METER_FILL_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_ = _loc2_ || _loc3_ > 0;
      this.view.suppliesMeter.bar._xscale = 0;
      _loc3_ = Math.min(100,Math.max(0,business.suppliesLevel));
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.suppliesMeter.bar,com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen.METER_FILL_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      _loc2_ = _loc2_ || _loc3_ > 0;
      if(_loc2_)
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Show_Stock_Level");
      }
   }
   function initImages(business)
   {
      this.app.imageManager.addImage(business.txd,business.txd + "_EXT_S",this.view.image);
      this.app.imageManager.addImage(business.txd,business.txd + "_MAP",this.view.map);
   }
   function initBackButton()
   {
      this.controls.push(new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen.BACK_BUTTON,this.view.backButton));
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.backButton.sortLabel,"BIKEBIZ_BACK");
   }
   function onTargetChange(targetID)
   {
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.ACCEPT:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.CANCEL:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.RIGHT_MOUSE:
            this.app.showScreen(this.app.BUSINESSES_SCREEN);
         default:
            return;
      }
   }
   function handleAcceptInput(inputID)
   {
      if(this.app.GET_CURRENT_SELECTION() == com.rockstargames.gtav.levelDesign.bikerBusinesses.SummaryScreen.BACK_BUTTON)
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
         this.app.showScreen(this.app.BUSINESSES_SCREEN);
      }
      else
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
      }
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.suppliesMeter.bar);
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
