class com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel
{
   var view;
   var graphButtons;
   var showing;
   static var PANEL_FADE_DELAY = 0;
   static var PANEL_FADE_DURATION = 0.25;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   static var BAR_ANIMATE_DURATION = 1.5;
   function GraphPanel(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.graphButtons = [];
      this.hide(true);
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.stockLevelsLabel.label,"HC_STOCK_LEVELS");
      this.view.totalStockLabel._alpha = 0;
      var _loc3_ = 1;
      while(_loc3_ <= com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         var _loc2_ = this.view.bars["bar" + _loc3_];
         _loc2_._alpha = 0;
         _loc2_.graphic._yscale = 0;
         _loc2_.buttonHitArea._yscale = 0;
         _loc2_.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(_loc2_.label,"HC_CARGO_" + _loc3_);
         var _loc4_ = new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO["GRAPH_BAR_" + _loc3_],_loc2_.buttonHitArea);
         this.graphButtons.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function update(type, stockPercentage)
   {
      if(type < 1 || type > com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         return undefined;
      }
      if(stockPercentage < 0)
      {
         stockPercentage = 0;
      }
      else if(stockPercentage > 100)
      {
         stockPercentage = 100;
      }
      var _loc3_ = this.view.bars["bar" + type];
      _loc3_.buttonHitArea._yscale = stockPercentage;
      this.graphButtons[type - 1].updateBounds();
      var _loc8_ = !this.showing ? type * com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.ELEMENT_FADE_IN_STEP + com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.PANEL_FADE_DURATION : 0;
      var _loc5_ = com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.BAR_ANIMATE_DURATION * Math.abs(stockPercentage - _loc3_.graphic._yscale) / 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_.graphic,_loc5_,{_yscale:stockPercentage,delay:_loc8_,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
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
         this.showing = true;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.PANEL_FADE_DURATION,{_alpha:100,delay:com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.PANEL_FADE_DELAY,onCompleteScope:this,onComplete:this.onMainFadeInComplete});
      }
   }
   function onMainFadeInComplete()
   {
      var _loc4_ = {_alpha:100,delay:0};
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stockLevelsLabel,com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.ELEMENT_FADE_IN_DURATION,_loc4_);
      _loc4_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.ELEMENT_FADE_IN_STEP;
      var _loc2_ = 1;
      while(_loc2_ <= com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         var _loc3_ = this.view.bars["bar" + _loc2_];
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.ELEMENT_FADE_IN_DURATION,_loc4_);
         _loc4_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.ELEMENT_FADE_IN_STEP;
         _loc2_ = _loc2_ + 1;
      }
      this.showing = true;
   }
   function hide(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 0;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel.PANEL_FADE_DURATION,{_alpha:0});
      }
      this.showing = false;
   }
   function updateSelectedButton(activeButtonID)
   {
      var _loc2_ = 0;
      var _loc5_ = this.graphButtons.length;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = this.graphButtons[_loc2_];
         var _loc4_ = _loc3_.view._parent.graphic;
         if(_loc3_.id == activeButtonID)
         {
            _loc4_.gotoAndPlay("on");
         }
         else
         {
            _loc4_.gotoAndStop("off");
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function get buttons()
   {
      var _loc4_ = [];
      var _loc2_ = 0;
      var _loc3_ = this.graphButtons.length;
      while(_loc2_ < _loc3_)
      {
         if(this.graphButtons[_loc2_].view._yscale > 0)
         {
            _loc4_.push(this.graphButtons[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stockLevelsLabel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      var _loc2_ = 1;
      while(_loc2_ <= com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         var _loc3_ = this.view.bars["bar" + _loc2_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.graphic);
         _loc2_ = _loc2_ + 1;
      }
      this.graphButtons = null;
      this.view = null;
   }
}
