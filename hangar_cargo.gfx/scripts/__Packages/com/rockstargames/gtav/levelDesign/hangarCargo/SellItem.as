class com.rockstargames.gtav.levelDesign.hangarCargo.SellItem
{
   var view;
   var type;
   var button;
   var pieChart;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   function SellItem(view, type)
   {
      this.view = view;
      this.type = type;
      this.init();
   }
   function init()
   {
      this.view._alpha = 0;
      this.view.button.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.label,"HC_CARGO_" + this.type);
      this.button = new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO["SELL_TYPE_" + this.type],this.view.button);
      this.pieChart = new com.rockstargames.gtav.levelDesign.hangarCargo.PieChart(this.view.pieChart);
      this.reset();
   }
   function reset()
   {
      this.view.bonus.text = "";
      this.view.stat.text = "";
      this.view.button._alpha = 0;
      this.pieChart.setAngle(0,true);
   }
   function update(cargo)
   {
      if(cargo.bonusPercent > 0)
      {
         this.view.bonus.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatPercentage(cargo.bonusPercent) + " " + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.bonus,"HC_BONUS");
      }
      if(cargo.sellPrice > 0)
      {
         this.view.button.label.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.button.label,"HC_SELL_FOR") + " $" + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatNumber(cargo.sellPrice);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.button,com.rockstargames.gtav.levelDesign.hangarCargo.SellItem.ELEMENT_FADE_IN_DURATION,{_alpha:100});
      }
      else
      {
         this.view.button._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.button);
      }
      if(cargo.currentStockLevel != undefined && cargo.totalStockLevel != undefined)
      {
         this.view.stat.htmlText = "<font color=\'#66cc66\'>" + cargo.currentStockLevel + "</font><font color=\'#ffffff\'>/" + cargo.totalStockLevel + "</font>";
      }
      this.pieChart.setAngle(360 * cargo.currentStockLevel / cargo.totalStockLevel);
      return cargo.sellPrice > 0;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.button);
      this.pieChart.dispose();
      this.pieChart = null;
      this.button = null;
      this.view = null;
   }
}
