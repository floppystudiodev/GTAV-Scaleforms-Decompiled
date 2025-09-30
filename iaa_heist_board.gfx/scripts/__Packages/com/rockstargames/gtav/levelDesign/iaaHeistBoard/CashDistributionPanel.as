class com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel
{
   var bars;
   var caps;
   var goalWidths;
   var tags;
   var updateDistributionArgs;
   var view;
   static var DEFAULT_COLOUR = new flash.geom.ColorTransform(1,1,1,1,77,77,77,0);
   static var ACTIVE_COLOUR = new flash.geom.ColorTransform(1,1,1,1,228,0,0,0);
   function CashDistributionPanel(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.tags = [];
      this.bars = [];
      this.caps = [];
      this.goalWidths = [0,0,0,0];
      this.updateDistributionArgs = {onCompleteScope:this,onComplete:this.updateDistribution};
      this.setLocalisedText(this.view.title,"IAA_TAKE");
      var _loc6_;
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.view.title._y = this.view.titleBG._y - 6;
         _loc6_ = this.view.title.getTextFormat();
         _loc6_.size = 18;
         this.view.title.setTextFormat(_loc6_);
         this.view.title.verticalAlign = "bottom";
      }
      this.view.titleBG._width = this.view.title.textWidth + 12;
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         _loc3_ = this.view.barChart["player" + _loc2_];
         _loc3_.label.autoSize = "center";
         _loc3_.label.text = this.setLocalisedText(_loc3_.label,"IAA_PLAYER") + "_0" + (_loc2_ + 1);
         _loc3_.transform.colorTransform = com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel.DEFAULT_COLOUR;
         _loc3_._visible = false;
         this.tags[_loc2_] = _loc3_;
         _loc4_ = this.view.barChart["bar" + _loc2_];
         _loc4_._width = 0;
         _loc4_.transform.colorTransform = com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel.DEFAULT_COLOUR;
         _loc4_._visible = false;
         this.bars[_loc2_] = _loc4_;
         _loc5_ = this.view.barChart["cap" + _loc2_];
         _loc5_._x = 0;
         _loc5_._visible = false;
         this.caps[_loc2_] = _loc5_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function update(finalePlayers, totalCash)
   {
      var _loc10_ = this.view.barChart.bg._width;
      var _loc9_ = 0;
      var _loc2_ = 0;
      var _loc7_ = finalePlayers.length;
      var _loc4_;
      var _loc3_;
      var _loc5_;
      var _loc6_;
      while(_loc2_ < _loc7_)
      {
         _loc4_ = finalePlayers[_loc2_];
         _loc3_ = this.bars[_loc2_];
         _loc5_ = this.tags[_loc2_];
         _loc6_ = this.caps[_loc2_];
         if(_loc4_.isEnabled)
         {
            this.goalWidths[_loc2_] = _loc10_ * _loc4_.cash / totalCash;
            _loc9_ += _loc4_.cash;
            _loc3_._visible = true;
            _loc5_._visible = true;
            _loc6_._visible = true;
         }
         else
         {
            this.goalWidths[_loc2_] = 0;
            _loc3_._width = 0;
            _loc3_._visible = false;
            _loc5_._visible = false;
            _loc6_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc12_ = _loc9_ == totalCash && _loc9_ > 0;
      this.view.hundredPercent.gotoAndStop(!_loc12_ ? "inactive" : "active");
      this.view.total.label.text = "";
      this.view.total.label.htmlText = "<font color=\'#FFFFFF\'>$" + this.formatNumber(totalCash) + "</font> <font color=\'#808080\'>" + this.setLocalisedText(this.view.total.label,"IAA_REWARD") + "</font>";
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.view.total.label.verticalAlign = "center";
      }
      this.updateDistribution();
   }
   function updateActiveState(activeIndex)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 4)
      {
         _loc3_ = activeIndex != _loc2_ ? com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel.DEFAULT_COLOUR : com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel.ACTIVE_COLOUR;
         this.view.barChart["bar" + _loc2_].transform.colorTransform = _loc3_;
         this.view.barChart["player" + _loc2_].transform.colorTransform = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateDistribution()
   {
      var _loc8_ = 0.1;
      var _loc9_ = this.view.barChart;
      var _loc4_ = 0;
      var _loc2_ = 0;
      var _loc5_ = this.goalWidths.length;
      var _loc3_;
      var _loc6_;
      var _loc7_;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this.bars[_loc2_];
         _loc6_ = this.tags[_loc2_];
         _loc7_ = this.caps[_loc2_];
         _loc3_._x = _loc4_;
         _loc3_._width += _loc8_ * (this.goalWidths[_loc2_] - _loc3_._width);
         _loc6_._x = 0.5 * _loc3_._width + _loc4_;
         _loc4_ += _loc3_._width;
         _loc7_._x = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,this.updateDistributionArgs);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
}
