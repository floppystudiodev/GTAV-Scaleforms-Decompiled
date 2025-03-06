class com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var view;
   var _buttons;
   var app;
   static var METER_BAR_ANIMATION_DURATION = 0.5;
   static var isFirstRun = true;
   function StatsScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"statsScreen");
      this.init();
   }
   function init()
   {
      super.init();
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.earningsLabel,"UA_EARNINGS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.salesLabel,"UA_SALES");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.resupplyLabel,"UA_RESUPPLY_SUCC");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.sellBCLabel,"UA_SELL_SUCC_BC");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.sellLSLabel,"UA_SELL_SUCC_LS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.unitsLabel,"UA_UNITS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.researchUnlockedLabel,"UA_RESEARCH_UNLOCKED");
      this._buttons = [];
      this.updateStats();
      var _loc5_ = Math.max(0,Math.min(this.app.stockLevel,100));
      var _loc3_ = Math.max(0,Math.min(this.app.researchProgress,100));
      var _loc4_ = Math.max(0,Math.min(this.app.suppliesLevel,100));
      if(com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen.isFirstRun)
      {
         this.view.stockMeter.bar._xscale = 0;
         this.view.researchMeter.bar._xscale = 0;
         this.view.suppliesMeter.bar._xscale = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stockMeter.bar,com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen.METER_BAR_ANIMATION_DURATION,{_xscale:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.researchMeter.bar,com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen.METER_BAR_ANIMATION_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.suppliesMeter.bar,com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen.METER_BAR_ANIMATION_DURATION,{_xscale:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
         com.rockstargames.gtav.levelDesign.disruptionLogistics.StatsScreen.isFirstRun = false;
      }
      else
      {
         this.view.stockMeter.bar._xscale = _loc5_;
         this.view.researchMeter.bar._xscale = _loc3_;
         this.view.suppliesMeter.bar._xscale = _loc4_;
      }
   }
   function updateStats()
   {
      super.updateStats();
      this.view.earnings.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.totalEarnings);
      this.view.sales.text = this.app.totalSales;
      this.view.resupply.text = this.app.resupplySuccessRate + "%";
      this.view.sellBC.text = this.app.sellSuccessRateBC + "%";
      this.view.sellLS.text = this.app.sellSuccessRateLS + "%";
      this.view.units.text = this.app.numUnitsManufactured.toString();
      this.view.researchUnlocked.text = this.app.numResearchUnlocked + "/" + this.app.numResearchTotal;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.researchMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.suppliesMeter.bar);
      super.dispose();
   }
}
