class com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel
{
   var showing;
   var view;
   static var PANEL_FADE_DELAY = 0.15;
   static var PANEL_FADE_DURATION = 0.25;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   function StatsPanel(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.hide(true);
      this.initStat(this.view.stealsCompleted,"HC_STEAL_COMPLT");
      this.initStat(this.view.stealSuccessRate,"HC_STEAL_SUCC");
      this.initStat(this.view.salesCompleted,"HC_SALES_COMPLT");
      this.initStat(this.view.salesSuccessRate,"HC_SALES_SUCC");
      this.initStat(this.view.rivalCratesStolen,"HC_RIVAL_CRATE");
      this.initStat(this.view.salesEarnings,"HC_SALES_EARN");
      this.initStat(this.view.cargoTypeBonus,"HC_BONUS_EARN");
      this.initStat(this.view.totalEarnings,"HC_TOTAL_EARN");
   }
   function initStat(statView, label, value)
   {
      statView.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(statView.label,label);
      statView._alpha = 0;
   }
   function update(name, stealsCompleted, stealSuccessRate, salesCompleted, salesSuccessRate, rivalCratesStolen, saleEarnings, bonusEarnings)
   {
      this.view.organisationName.text = name;
      this.view.stealsCompleted.stat.text = stealsCompleted.toString();
      this.view.stealSuccessRate.stat.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatPercentage(stealSuccessRate);
      this.view.salesCompleted.stat.text = salesCompleted.toString();
      this.view.salesSuccessRate.stat.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatPercentage(salesSuccessRate);
      this.view.rivalCratesStolen.stat.text = rivalCratesStolen.toString();
      this.view.salesEarnings.stat.text = "$" + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatNumber(saleEarnings);
      this.view.cargoTypeBonus.stat.text = "$" + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatNumber(bonusEarnings);
      this.view.totalEarnings.amount.text = "$" + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatNumber(saleEarnings + bonusEarnings);
      if(!this.showing)
      {
         this.show(false);
      }
   }
   function show(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel.PANEL_FADE_DURATION,{_alpha:100,delay:com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel.PANEL_FADE_DELAY,onCompleteScope:this,onComplete:this.onMainFadeInComplete});
      }
      this.showing = true;
   }
   function onMainFadeInComplete()
   {
      var _loc5_ = [this.view.stealsCompleted,this.view.stealSuccessRate,this.view.salesCompleted,this.view.salesSuccessRate,this.view.rivalCratesStolen,this.view.salesEarnings,this.view.cargoTypeBonus,this.view.totalEarnings];
      var _loc4_ = {_alpha:100,delay:0};
      var _loc2_ = 0;
      var _loc3_ = _loc5_.length;
      while(_loc2_ < _loc3_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_[_loc2_],com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel.ELEMENT_FADE_IN_DURATION,_loc4_);
         _loc4_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel.ELEMENT_FADE_IN_STEP;
         _loc2_ = _loc2_ + 1;
      }
   }
   function hide(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 0;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel.PANEL_FADE_DURATION,{_alpha:0});
      }
      this.showing = false;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealsCompleted);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealSuccessRate);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.salesCompleted);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.salesSuccessRate);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.rivalCratesStolen);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.salesEarnings);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.cargoTypeBonus);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.totalEarnings);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view = null;
   }
}
