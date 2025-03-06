class com.rockstargames.gtav.levelDesign.nightclub.TotalStockMeter
{
   var view;
   var delay;
   var columns;
   var updateArgs;
   var COLUMN_SIZES = [8,7,7,6,6,6];
   var NUM_CUBES = 0;
   var NUM_COLUMNS = com.rockstargames.gtav.levelDesign.nightclub.TotalStockMeter.prototype.COLUMN_SIZES.length;
   var COLUMN_ORDER = [0,0,1,2,0];
   var FRAME_DURATION = 0.03333333333333333;
   function TotalStockMeter(view, delay)
   {
      this.view = view;
      this.delay = delay;
      this.init();
   }
   function setValue(value, total, dollarValue)
   {
      var _loc6_ = total > 0 ? Math.min(1,value / total) : 0;
      var _loc4_ = Math.round(_loc6_ * this.NUM_CUBES);
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.NUM_COLUMNS)
      {
         _loc3_[_loc2_] = 0;
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_[this.COLUMN_ORDER[_loc2_]]++;
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.NUM_COLUMNS)
      {
         this.columns[_loc2_].setValue(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.view.stockLevelLabel.text = value + "/" + total;
      this.view.dollarsLabel.text = dollarValue;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,this.delay,{onCompleteScope:this,onComplete:this.update});
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view = null;
   }
   function init()
   {
      this.columns = [];
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      var _loc2_ = 0;
      while(_loc2_ < this.NUM_COLUMNS)
      {
         var _loc3_ = new com.rockstargames.gtav.levelDesign.nightclub.TotalColumn(this.view["column" + _loc2_].baseCube,this.COLUMN_SIZES[_loc2_],_loc2_);
         this.columns.push(_loc3_);
         this.NUM_CUBES += this.COLUMN_SIZES[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = 1;
      _loc2_ = this.COLUMN_ORDER.length;
      while(_loc2_ < this.NUM_CUBES)
      {
         this.COLUMN_ORDER.push(_loc4_ % this.NUM_COLUMNS);
         _loc4_ = _loc4_ + 1;
         _loc2_ = _loc2_ + 1;
      }
      this.view.totalStockLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.totalStockLabel,"CLUB_TOTALSTOCK");
      this.setValue(0,0,"$0");
   }
   function update()
   {
      var _loc3_ = true;
      var _loc2_ = 0;
      while(_loc2_ < this.NUM_COLUMNS)
      {
         _loc3_ = this.columns[_loc2_].update() && _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc3_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,this.FRAME_DURATION,this.updateArgs);
      }
   }
}
