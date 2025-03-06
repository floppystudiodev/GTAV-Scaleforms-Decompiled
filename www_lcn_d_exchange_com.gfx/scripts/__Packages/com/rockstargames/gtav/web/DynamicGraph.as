class com.rockstargames.gtav.web.DynamicGraph extends MovieClip
{
   static var highVal;
   static var lowVal;
   static var graphPlot;
   function DynamicGraph()
   {
      super();
   }
   static function draw(labelsDataArray, graphDataArray, graphMovieClip, plotColour)
   {
      if(graphDataArray.length > 0)
      {
         var _loc6_ = new Array(0,-0.37,0.27,-0.18,0.3,-0.09,0.26,0.09,0.46,-0.3,0.1,0.27,0.07,-0.27,0.13,0.48,0.17,-0.15,0.06,0.18,0.49);
         com.rockstargames.gtav.web.DynamicGraph.highVal = graphDataArray[0];
         com.rockstargames.gtav.web.DynamicGraph.lowVal = graphDataArray[0];
         var _loc16_ = 0;
         while(_loc16_ < graphDataArray.length)
         {
            if(graphDataArray[_loc16_] > com.rockstargames.gtav.web.DynamicGraph.highVal)
            {
               com.rockstargames.gtav.web.DynamicGraph.highVal = graphDataArray[_loc16_];
            }
            if(graphDataArray[_loc16_] < com.rockstargames.gtav.web.DynamicGraph.lowVal)
            {
               com.rockstargames.gtav.web.DynamicGraph.lowVal = graphDataArray[_loc16_];
            }
            _loc16_ = _loc16_ + 1;
         }
         com.rockstargames.gtav.web.DynamicGraph.lowVal = Math.floor(com.rockstargames.gtav.web.DynamicGraph.lowVal * 10) / 10;
         com.rockstargames.gtav.web.DynamicGraph.highVal = Math.ceil(com.rockstargames.gtav.web.DynamicGraph.highVal * 10) / 10;
         var _loc28_ = com.rockstargames.gtav.web.DynamicGraph.highVal - com.rockstargames.gtav.web.DynamicGraph.lowVal;
         var _loc26_ = Math.ceil(10 * _loc28_ / 4) / 10;
         _loc28_ = 4 * _loc26_;
         com.rockstargames.gtav.web.DynamicGraph.highVal = com.rockstargames.gtav.web.DynamicGraph.lowVal + _loc28_;
         var _loc21_ = com.rockstargames.gtav.web.DynamicGraph.normalizeArray(graphDataArray,_loc28_);
         var _loc18_ = _loc21_.length;
         var _loc8_ = labelsDataArray[6];
         var _loc24_ = undefined;
         if(_loc8_ == undefined)
         {
            _loc8_ = 0;
            _loc24_ = 0;
         }
         else
         {
            _loc24_ = Math.ceil(10 / _loc18_ * 10);
         }
         var _loc27_ = 0;
         var _loc23_ = graphMovieClip.drawArea._width;
         var _loc7_ = 0;
         var _loc4_ = graphMovieClip.drawArea._height;
         if(graphMovieClip.graphPlot)
         {
            graphMovieClip.graphPlot.removeMovieClip();
         }
         if(graphMovieClip.graphLine)
         {
            graphMovieClip.graphLine.removeMovieClip();
         }
         com.rockstargames.gtav.web.DynamicGraph.graphPlot = graphMovieClip.createEmptyMovieClip("graphPlot",graphMovieClip.getNextHighestDepth());
         com.rockstargames.gtav.web.DynamicGraph.graphPlot._visible = false;
         graphMovieClip.drawArea._alpha = 0;
         com.rockstargames.gtav.web.DynamicGraph.graphPlot._x = graphMovieClip.drawArea._x;
         com.rockstargames.gtav.web.DynamicGraph.graphPlot._y = graphMovieClip.drawArea._y;
         var _loc29_ = graphMovieClip.getNextHighestDepth();
         graphMovieClip.gridLines.swapDepths(_loc29_);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.beginFill(16777215);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineStyle(1,16777215);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.moveTo(_loc27_,_loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[0],_loc7_,_loc4_));
         var _loc10_ = _loc27_;
         var _loc9_ = _loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[0],_loc7_,_loc4_);
         var _loc1_ = 0;
         _loc16_ = 1;
         while(_loc16_ < _loc18_)
         {
            var _loc14_ = _loc23_ / _loc18_ * (_loc16_ + 1);
            var _loc12_ = _loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[_loc16_],_loc7_,_loc4_);
            if(_loc8_ > 0)
            {
               var _loc19_ = 1 / _loc24_;
               var _loc3_ = 0;
               while(_loc3_ < 1)
               {
                  var _loc15_ = com.rockstargames.gtav.web.DynamicGraph.lerp(_loc3_,_loc10_,_loc14_);
                  var _loc13_ = com.rockstargames.gtav.web.DynamicGraph.lerp(_loc3_,_loc9_,_loc12_);
                  var _loc2_ = _loc13_ + _loc6_[_loc1_] * (graphMovieClip.drawArea._height / 20 * _loc8_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc1_ > _loc6_.length - 1)
                  {
                     _loc1_ = 0;
                  }
                  _loc2_ = Math.max(_loc2_,_loc7_);
                  _loc2_ = Math.min(_loc2_,_loc4_);
                  com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineTo(_loc15_,_loc2_);
                  _loc3_ += _loc19_;
               }
               _loc10_ = _loc14_;
               _loc9_ = _loc12_;
            }
            else
            {
               com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineTo(_loc14_,_loc12_);
            }
            _loc16_ = _loc16_ + 1;
         }
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineTo(_loc23_,_loc12_);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineTo(_loc23_,_loc4_);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.lineTo(_loc27_,_loc4_);
         com.rockstargames.gtav.web.DynamicGraph.graphPlot.endFill();
         com.rockstargames.gtav.web.DynamicGraph.graphPlot._visible = true;
         graphMovieClip.drawArea._alpha = 100;
         MovieClip(graphMovieClip.drawArea).setMask(com.rockstargames.gtav.web.DynamicGraph.graphPlot);
         var _loc20_ = graphMovieClip.createEmptyMovieClip("graphLine",graphMovieClip.getNextHighestDepth());
         _loc20_.lineStyle(4,plotColour,100,true,"none","square","miter",2);
         _loc20_.moveTo(_loc27_,_loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[0],_loc7_,_loc4_));
         _loc20_._x = com.rockstargames.gtav.web.DynamicGraph.graphPlot._x;
         _loc20_._y = com.rockstargames.gtav.web.DynamicGraph.graphPlot._y;
         _loc10_ = _loc27_;
         _loc9_ = _loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[0],_loc7_,_loc4_);
         _loc1_ = 0;
         _loc16_ = 1;
         while(_loc16_ < _loc18_)
         {
            _loc14_ = _loc23_ / _loc18_ * (_loc16_ + 1);
            _loc12_ = _loc4_ - com.rockstargames.gtav.web.DynamicGraph.lerp(_loc21_[_loc16_],_loc7_,_loc4_);
            if(_loc8_ > 0)
            {
               _loc19_ = 1 / _loc24_;
               _loc3_ = 0;
               while(_loc3_ < 1)
               {
                  _loc15_ = com.rockstargames.gtav.web.DynamicGraph.lerp(_loc3_,_loc10_,_loc14_);
                  _loc13_ = com.rockstargames.gtav.web.DynamicGraph.lerp(_loc3_,_loc9_,_loc12_);
                  _loc2_ = _loc13_ + _loc6_[_loc1_] * (graphMovieClip.drawArea._height / 20 * _loc8_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc1_ > _loc6_.length - 1)
                  {
                     _loc1_ = 0;
                  }
                  _loc2_ = Math.max(_loc2_,_loc7_);
                  _loc2_ = Math.min(_loc2_,_loc4_);
                  _loc20_.lineTo(_loc15_,_loc2_);
                  _loc3_ += _loc19_;
               }
               _loc10_ = _loc14_;
               _loc9_ = _loc12_;
            }
            else
            {
               _loc20_.lineTo(_loc14_,_loc12_);
            }
            _loc16_ = _loc16_ + 1;
         }
         _loc16_ = 0;
         while(_loc16_ < 6)
         {
            var _loc22_ = "labelH_" + _loc16_;
            if(labelsDataArray[_loc16_] != undefined)
            {
               graphMovieClip[_loc22_].text = labelsDataArray[_loc16_];
            }
            _loc16_ = _loc16_ + 1;
         }
         _loc16_ = 0;
         while(_loc16_ < 5)
         {
            _loc22_ = "labelV_" + (_loc16_ + 1);
            var _loc11_ = com.rockstargames.gtav.web.DynamicGraph.lowVal + _loc26_ * _loc16_;
            graphMovieClip[_loc22_].text = _loc11_ != int(_loc11_) ? _loc11_ : _loc11_ + ".0";
            _loc16_ = _loc16_ + 1;
         }
      }
   }
   static function lerp(amount, start, end)
   {
      if(start == end)
      {
         return start;
      }
      return (1 - amount) * start + amount * end;
   }
   static function normalizeArray(data)
   {
      var _loc3_ = new Array();
      var _loc1_ = 0;
      while(_loc1_ < data.length)
      {
         _loc3_[_loc1_] = (data[_loc1_] - com.rockstargames.gtav.web.DynamicGraph.lowVal) / (com.rockstargames.gtav.web.DynamicGraph.highVal - com.rockstargames.gtav.web.DynamicGraph.lowVal);
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
}
