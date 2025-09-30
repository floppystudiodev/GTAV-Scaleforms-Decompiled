class com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel
{
   var goalAngle;
   var pieChart;
   var showing;
   var view;
   static var PANEL_FADE_DELAY = 0.15;
   static var PANEL_FADE_DURATION = 0.25;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   function TotalStockPanel(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.hide(true);
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.totalStockLabel.label,"HC_TOTAL_STOCK");
      this.view.totalStockLabel._alpha = 0;
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.freeSpace.label,"HC_TOTAL_FREE");
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.stockHeld.label,"HC_TOTAL_HELD");
      this.view.freeSpace._alpha = 0;
      this.view.stockHeld._alpha = 0;
      this.view.pieChart._alpha = 0;
      this.view.pieChart.pie.bg._alpha = 0;
      this.view.pieChart.label.textAutoSize = "shrink";
      this.pieChart = new com.rockstargames.gtav.levelDesign.hangarCargo.PieChart(this.view.pieChart.pie);
   }
   function update(filledSpace, totalSpace)
   {
      var _loc3_ = 100;
      if(totalSpace > 0)
      {
         _loc3_ = Math.round(100 * (totalSpace - filledSpace) / totalSpace);
      }
      var _loc4_ = 100 - _loc3_;
      this.view.freeSpace.percentage.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatPercentage(_loc3_);
      this.view.stockHeld.percentage.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatPercentage(_loc4_);
      this.view.pieChart.label.htmlText = "<font color=\'#66cc66\'>" + filledSpace + "</font><font color=\'#ffffff\'>/" + totalSpace + "</font>";
      this.goalAngle = 360 * filledSpace / totalSpace;
      if(this.showing)
      {
         this.pieChart.setAngle(this.goalAngle,false);
      }
      else
      {
         this.show(false);
      }
   }
   function show(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 100;
         this.showing = true;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel.PANEL_FADE_DURATION,{_alpha:100,delay:com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel.PANEL_FADE_DELAY,onCompleteScope:this,onComplete:this.onMainFadeInComplete});
      }
   }
   function onMainFadeInComplete()
   {
      var _loc5_ = [this.view.totalStockLabel,this.view.pieChart,this.view.freeSpace,this.view.stockHeld];
      var _loc4_ = {_alpha:100,delay:0};
      var _loc2_ = 0;
      var _loc3_ = _loc5_.length;
      while(_loc2_ < _loc3_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_[_loc2_],com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel.ELEMENT_FADE_IN_DURATION,_loc4_);
         _loc4_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel.ELEMENT_FADE_IN_STEP;
         _loc2_ = _loc2_ + 1;
      }
      this.showing = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.pieChart.pie.bg,_loc4_.delay,{onCompleteScope:this,onComplete:this.animatePieChart});
   }
   function animatePieChart()
   {
      this.pieChart.setAngle(this.goalAngle,false);
   }
   function hide(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 0;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel.PANEL_FADE_DURATION,{_alpha:0});
      }
      this.showing = false;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.totalStockLabel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.pieChart);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.pieChart.pie.bg);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.freeSpace);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockHeld);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.pieChart.dispose();
      this.pieChart = null;
      this.view = null;
   }
}
