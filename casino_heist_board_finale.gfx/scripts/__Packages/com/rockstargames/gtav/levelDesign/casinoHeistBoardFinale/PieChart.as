class com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart
{
   var view;
   var numSegments;
   var labelRadius;
   var fillBitmapData;
   var values;
   var segments;
   var labels;
   var dividers;
   static var COLOURS = [871845,2135096,14096427,0];
   static var TWO_PI = 6.283185307179586;
   static var RAD_2_DEG = 57.29577951308232;
   function PieChart(view, numSegments, radius, labelRadius, fillLinkage)
   {
      this.view = view;
      this.numSegments = numSegments;
      this.labelRadius = labelRadius;
      this.fillBitmapData = flash.display.BitmapData.loadBitmap(fillLinkage);
      this.values = new Array(numSegments);
      this.segments = new Array(numSegments);
      this.labels = new Array(numSegments);
      this.dividers = new Array(numSegments);
      var _loc2_ = 0;
      while(_loc2_ < numSegments)
      {
         this.values[_loc2_] = 0;
         this.segments[_loc2_] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment(view.createEmptyMovieClip("segment" + _loc2_,view.getNextHighestDepth()),radius,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart.COLOURS[_loc2_]);
         this.labels[_loc2_] = view.attachMovie("pieChartLabel","label" + _loc2_,view.getNextHighestDepth());
         this.labels[_loc2_]._rotation = 90;
         this.labels[_loc2_].label.text = _loc2_ + 1;
         this.labels[_loc2_]._visible = false;
         this.dividers[_loc2_] = view.attachMovie("pieChartDivider","divider" + _loc2_,view.getNextHighestDepth());
         _loc2_ = _loc2_ + 1;
      }
   }
   function setLabel(index, label)
   {
      this.labels[index].label.text = label;
   }
   function setValue(index, value)
   {
      this.values[index] = value;
      this.draw();
   }
   function highlightSegment(segmentIndex)
   {
   }
   function setSegmentVisible(segmentIndex, isVisible)
   {
      this.segments[segmentIndex].setVisible(isVisible);
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.numSegments)
      {
         this.segments[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.segments = null;
      this.values = null;
      this.view = null;
   }
   function draw()
   {
      var _loc5_ = 0;
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.numSegments)
      {
         _loc5_ += this.values[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.numSegments)
      {
         var _loc3_ = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart.TWO_PI * this.values[_loc2_] / _loc5_;
         this.segments[_loc2_].draw(_loc4_,_loc4_ + _loc3_,this.fillBitmapData);
         this.labels[_loc2_]._visible = _loc3_ > 0.4;
         this.labels[_loc2_]._x = this.labelRadius * Math.cos(_loc4_ + 0.5 * _loc3_);
         this.labels[_loc2_]._y = this.labelRadius * Math.sin(_loc4_ + 0.5 * _loc3_);
         this.dividers[_loc2_]._visible = _loc3_ > 0;
         this.dividers[_loc2_]._rotation = _loc4_ * com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart.RAD_2_DEG;
         _loc4_ += _loc3_;
         _loc2_ = _loc2_ + 1;
      }
   }
}
