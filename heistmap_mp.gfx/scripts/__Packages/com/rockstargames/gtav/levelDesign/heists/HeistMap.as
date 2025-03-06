class com.rockstargames.gtav.levelDesign.heists.HeistMap
{
   var containerMC;
   var mapBitmapData;
   var xRatio;
   var yRatio;
   var mapCentreX;
   var mapCentreY;
   var isLowerMap;
   var mapBoundsRectangle;
   var mapMC;
   var assetsMC;
   var pins;
   var postIts;
   var areas;
   var highlights;
   var arrows;
   var texts;
   var isDrawing;
   var scrollYGoal;
   static var ZOOM_BUFFER = 62;
   static var MAX_ZOOM_SCALE = 3.5;
   static var ARROW_THICKNESS = 2;
   static var MAP_WIDTH = 580;
   static var MAP_HEIGHT = 710;
   static var SCROLL_IN_GOAL = 0;
   static var SCROLL_OUT_GOAL = - com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_HEIGHT + 36;
   static var SCROLL_EASING = 0.17;
   function HeistMap(containerMC, mapBitmapData, x, y, xRatio, yRatio, mapCentreX, mapCentreY, isLowerMap)
   {
      this.containerMC = containerMC;
      this.mapBitmapData = mapBitmapData;
      this.xRatio = xRatio;
      this.yRatio = yRatio;
      this.mapCentreX = mapCentreX;
      this.mapCentreY = mapCentreY;
      this.isLowerMap = isLowerMap;
      if(isLowerMap)
      {
         var _loc3_ = containerMC.getBounds(containerMC._parent._parent);
         this.mapBoundsRectangle = new flash.geom.Rectangle(_loc3_.xMin,_loc3_.yMin,_loc3_.xMax - _loc3_.xMin,_loc3_.yMax - _loc3_.yMin);
      }
      this.mapMC = containerMC.createEmptyMovieClip("mapMC",containerMC.getNextHighestDepth());
      this.assetsMC = containerMC.createEmptyMovieClip("assetsMC",containerMC.getNextHighestDepth());
      this.assetsMC._x = x;
      this.assetsMC._y = y;
      containerMC.rollerBottom.swapDepths(containerMC.getNextHighestDepth());
      this.pins = [];
      this.postIts = [];
      this.areas = [];
      this.highlights = [];
      this.arrows = [];
      this.texts = [];
      this.isDrawing = false;
   }
   function get mc()
   {
      return this.containerMC;
   }
   function get checkIfIsDrawing()
   {
      return this.isDrawing;
   }
   function hideAssets()
   {
      this.assetsMC._visible = false;
   }
   function showAssets()
   {
      this.assetsMC._visible = true;
   }
   function draw()
   {
      if(this.pins.length > 0 || this.areas.length > 0 || this.texts.length > 0 || this.highlights.length > 0)
      {
         if(!this.isDrawing)
         {
            this.isDrawing = true;
            var _loc2_ = undefined;
            var _loc3_ = undefined;
            var _loc10_ = this.assetsMC.getBounds(this.assetsMC);
            var _loc14_ = _loc10_.xMin - com.rockstargames.gtav.levelDesign.heists.HeistMap.ZOOM_BUFFER;
            var _loc19_ = _loc10_.xMax + com.rockstargames.gtav.levelDesign.heists.HeistMap.ZOOM_BUFFER;
            var _loc13_ = _loc10_.yMin - com.rockstargames.gtav.levelDesign.heists.HeistMap.ZOOM_BUFFER;
            var _loc18_ = _loc10_.yMax + com.rockstargames.gtav.levelDesign.heists.HeistMap.ZOOM_BUFFER;
            var _loc12_ = _loc19_ - _loc14_;
            var _loc11_ = _loc18_ - _loc13_;
            var _loc21_ = _loc14_ + _loc12_ / 2;
            var _loc20_ = _loc13_ + _loc11_ / 2;
            var _loc9_ = _loc11_ >= _loc12_ ? com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_HEIGHT / _loc11_ : com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_WIDTH / _loc12_;
            if(_loc9_ > com.rockstargames.gtav.levelDesign.heists.HeistMap.MAX_ZOOM_SCALE)
            {
               _loc9_ = com.rockstargames.gtav.levelDesign.heists.HeistMap.MAX_ZOOM_SCALE;
            }
            var _loc17_ = 100 * _loc9_;
            var _loc7_ = 100 / _loc9_;
            var _loc16_ = this.mapCentreX - _loc21_ * _loc9_;
            var _loc15_ = this.mapCentreY - _loc20_ * _loc9_;
            this.assetsMC._xscale = _loc17_;
            this.assetsMC._yscale = _loc17_;
            this.assetsMC._x = _loc16_;
            this.assetsMC._y = _loc15_;
            _loc2_ = 0;
            _loc3_ = this.pins.length;
            while(_loc2_ < _loc3_)
            {
               var _loc4_ = this.pins[_loc2_];
               var _loc8_ = _loc4_.baseScale / _loc9_;
               _loc4_._xscale = _loc8_;
               _loc4_._yscale = _loc8_;
               _loc4_._visible = true;
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = 0;
            _loc3_ = this.texts.length;
            while(_loc2_ < _loc3_)
            {
               var _loc5_ = this.texts[_loc2_];
               _loc5_._xscale = _loc7_;
               _loc5_._yscale = _loc7_;
               _loc5_._visible = true;
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = 0;
            _loc3_ = this.postIts.length;
            while(_loc2_ < _loc3_)
            {
               var _loc6_ = this.postIts[_loc2_];
               _loc6_._xscale = _loc7_;
               _loc6_._yscale = _loc7_;
               _loc6_._visible = true;
               _loc2_ = _loc2_ + 1;
            }
            var _loc23_ = _loc16_ - 296.7 * _loc9_;
            var _loc22_ = _loc15_ - 475.9 * _loc9_;
            this.drawZoomedMap(_loc9_,_loc9_,_loc23_,_loc22_);
         }
      }
   }
   function scrollOut()
   {
      this.scrollYGoal = com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_OUT_GOAL;
      this.containerMC.onEnterFrame = mx.utils.Delegate.create(this,this.updateScrollOut);
   }
   function updateScrollOut()
   {
      var _loc4_ = this.containerMC._y + com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_EASING * (this.scrollYGoal - this.containerMC._y);
      if(com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_HEIGHT + _loc4_ < 5)
      {
         _loc4_ = this.scrollYGoal;
         delete this.containerMC.onEnterFrame;
      }
      for(var _loc3_ in this.assetsMC)
      {
         var _loc2_ = this.assetsMC[_loc3_];
         if(_loc2_._visible && _loc2_.getBounds(this.containerMC._parent).yMin < 70)
         {
            _loc2_._visible = false;
         }
      }
      this.containerMC._y = _loc4_;
      this.drawScrolledMap();
   }
   function scrollIn()
   {
      this.scrollYGoal = com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_IN_GOAL;
      this.containerMC.onEnterFrame = mx.utils.Delegate.create(this,this.updateScrollIn);
   }
   function updateScrollIn()
   {
      var _loc4_ = this.containerMC._y + com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_EASING * (this.scrollYGoal - this.containerMC._y);
      if(_loc4_ > -5)
      {
         _loc4_ = this.scrollYGoal;
         delete this.containerMC.onEnterFrame;
      }
      for(var _loc3_ in this.assetsMC)
      {
         var _loc2_ = this.assetsMC[_loc3_];
         if(!_loc2_._visible && _loc2_.getBounds(this.containerMC._parent).yMin >= 0)
         {
            _loc2_._visible = true;
         }
      }
      this.containerMC._y = _loc4_;
      this.drawScrolledMap();
   }
   function drawZoomedMap(sx, sy, tx, ty)
   {
      var _loc2_ = new flash.geom.Matrix();
      if(sx == undefined)
      {
         sx = 0.5673828125;
         sy = 0.703125;
         tx = 0;
         ty = 0;
      }
      else
      {
         sx *= 0.5673828125;
         sy *= 0.703125;
      }
      var _loc4_ = this.mapBitmapData.width != 512 ? 1 : 2;
      _loc2_.scale(_loc4_ * sx,_loc4_ * sy);
      _loc2_.translate(tx,ty);
      this.mapMC.clear();
      this.mapMC.beginBitmapFill(this.mapBitmapData,_loc2_,false,true);
      this.mapMC.moveTo(25,27);
      this.mapMC.lineTo(556,27);
      this.mapMC.lineTo(556,693);
      this.mapMC.lineTo(25,693);
      this.mapMC.lineTo(25,27);
      this.mapMC.endFill();
      this.isDrawing = false;
   }
   function drawScrolledMap()
   {
      var _loc4_ = new flash.geom.Matrix();
      var _loc3_ = - this.containerMC._y + 10;
      var _loc2_ = this.mapBitmapData.width != 580 ? 2 : 1;
      this.mapMC.clear();
      this.mapMC.beginBitmapFill(this.mapBitmapData,_loc4_,false,true);
      this.mapMC.moveTo(0,_loc2_ * _loc3_);
      this.mapMC.lineTo(_loc2_ * com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_WIDTH,_loc2_ * _loc3_);
      this.mapMC.lineTo(_loc2_ * com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_WIDTH,_loc2_ * com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_HEIGHT);
      this.mapMC.lineTo(0,_loc2_ * com.rockstargames.gtav.levelDesign.heists.HeistMap.MAP_HEIGHT);
      this.mapMC.lineTo(0,_loc2_ * _loc3_);
      this.mapMC.endFill();
      this.mapMC._xscale = this.mapMC._yscale = 100 / _loc2_;
      var _loc5_ = 1 + (com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_OUT_GOAL - this.containerMC._y) / (com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_IN_GOAL - com.rockstargames.gtav.levelDesign.heists.HeistMap.SCROLL_OUT_GOAL);
      var _loc6_ = Math.round(99 * _loc5_) + 1;
      this.containerMC.rollerBottom.gotoAndStop(_loc6_);
   }
   function resetAllDepths()
   {
      var _loc2_ = 0;
      var _loc3_ = this.pins.length;
      while(_loc2_ < _loc3_)
      {
         if(this.pins[_loc2_].depth != this.pins[_loc2_].getDepth())
         {
            this.pins[_loc2_].swapDepths(this.pins[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.areas.length;
      while(_loc2_ < _loc3_)
      {
         if(this.areas[_loc2_].depth != this.areas[_loc2_].getDepth())
         {
            this.areas[_loc2_].swapDepths(this.areas[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.texts.length;
      while(_loc2_ < _loc3_)
      {
         if(this.texts[_loc2_].depth != this.texts[_loc2_].getDepth())
         {
            this.texts[_loc2_].swapDepths(this.texts[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.postIts.length;
      while(_loc2_ < _loc3_)
      {
         if(this.postIts[_loc2_].depth != this.postIts[_loc2_].getDepth())
         {
            this.postIts[_loc2_].swapDepths(this.postIts[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.arrows.length;
      while(_loc2_ < _loc3_)
      {
         if(this.arrows[_loc2_].depth != this.arrows[_loc2_].getDepth())
         {
            this.arrows[_loc2_].swapDepths(this.arrows[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.highlights.length;
      while(_loc2_ < _loc3_)
      {
         if(this.highlights[_loc2_].depth != this.highlights[_loc2_].getDepth())
         {
            this.highlights[_loc2_].swapDepths(this.highlights[_loc2_].depth);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function cleanup()
   {
      delete this.containerMC.onEnterFrame;
      this.removeAllAreas();
      this.removeAllArrows();
      this.removeAllHighlights();
      this.removeAllPins();
      this.removeAllPostIts();
      this.removeAllText();
      this.mapBitmapData.dispose();
      this.mapBitmapData = null;
   }
   function checkIfOutsideOfMap(mapItem)
   {
      var _loc2_ = mapItem.getBounds(this.containerMC._parent._parent);
      var _loc3_ = new flash.geom.Rectangle(_loc2_.xMin,_loc2_.yMin,_loc2_.xMax - _loc2_.xMin,_loc2_.yMax - _loc2_.yMin);
      mapItem._visible = this.mapBoundsRectangle.containsRectangle(_loc3_);
   }
   function addPin(enum, iconEnum, xPos, yPos, scale, colR, colG, colB, colA)
   {
      var _loc5_ = iconEnum != 0 ? "pin_dot" : "pin_outline";
      var _loc2_ = "pin_" + enum;
      var _loc8_ = xPos / this.xRatio;
      var _loc7_ = (- yPos) / this.yRatio;
      var _loc11_ = undefined;
      if(this.assetsMC[_loc2_])
      {
         _loc11_ = this.assetsMC[_loc2_].getDepth();
         this.removePin(enum);
      }
      else
      {
         _loc11_ = this.assetsMC.getNextHighestDepth();
      }
      var _loc3_ = this.assetsMC.attachMovie(_loc5_,_loc2_,_loc11_,{_x:_loc8_,_y:_loc7_,_xscale:scale,_yscale:scale,_alpha:colA,depth:_loc11_,baseScale:scale});
      this.colourPin(enum,colR,colG,colB,colA);
      this.pins.push(_loc3_);
      if(this.isLowerMap)
      {
         this.checkIfOutsideOfMap(_loc3_);
      }
   }
   function removePin(enum)
   {
      var _loc2_ = this.assetsMC["pin_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.pins.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.pins.splice(_loc3_,1);
         }
      }
   }
   function colourPin(enum, colR, colG, colB, colA, iconEnum)
   {
      var _loc2_ = this.assetsMC["pin_" + enum];
      if(_loc2_)
      {
         if(iconEnum != undefined)
         {
            var _loc5_ = iconEnum != 0 ? "pin_dot" : "pin_outline";
            var _loc4_ = "pin_" + enum;
            var _loc7_ = _loc2_._x;
            var _loc6_ = _loc2_._x;
            var _loc3_ = _loc2_._xscale;
            var _loc10_ = _loc2_.getDepth();
            _loc2_.removeMovieClip();
            _loc2_ = this.assetsMC.attachMovie(_loc5_,_loc4_,_loc10_,{_x:_loc7_,_y:_loc6_,_xscale:_loc3_,_yscale:_loc3_,depth:_loc10_,baseScale:_loc3_});
         }
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,colR,colG,colB,colA);
      }
   }
   function bringPinToFront(enum)
   {
      var _loc2_ = this.assetsMC["pin_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllPins()
   {
      var _loc2_ = 0;
      var _loc3_ = this.pins.length;
      while(_loc2_ < _loc3_)
      {
         this.pins[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.pins.length = 0;
   }
   function hideAllPins()
   {
      var _loc2_ = 0;
      var _loc3_ = this.pins.length;
      while(_loc2_ < _loc3_)
      {
         this.pins[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllPins()
   {
      var _loc2_ = 0;
      var _loc3_ = this.pins.length;
      while(_loc2_ < _loc3_)
      {
         this.pins[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addPostIt(enum, textNumber, xPos, yPos)
   {
      var _loc4_ = "postit_mc";
      var _loc3_ = "postit_" + enum;
      var _loc7_ = xPos / this.xRatio;
      var _loc6_ = (- yPos) / this.yRatio;
      var _loc8_ = this.assetsMC.getNextHighestDepth();
      if(this.assetsMC[_loc3_])
      {
         this.removePostIt(enum);
      }
      var _loc2_ = this.assetsMC.attachMovie(_loc4_,_loc3_,_loc8_,{_x:_loc7_,_y:_loc6_,depth:_loc8_});
      _loc2_.content._rotation = Math.random() * 10 - 5;
      _loc2_.content.gotoAndStop(textNumber % 4 + 1);
      _loc2_.content.textTF.text = textNumber;
      this.colourPostIt(enum,241,229,92,100);
      this.postIts.push(_loc2_);
      if(this.isLowerMap)
      {
         this.checkIfOutsideOfMap(_loc2_);
      }
   }
   function removePostIt(enum)
   {
      var _loc2_ = this.assetsMC["postit_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.postIts.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.postIts.splice(_loc3_,1);
         }
      }
   }
   function colourPostIt(enum, colR, colG, colB, colA)
   {
      var _loc2_ = 75;
      if(colA == undefined)
      {
         colA = 100;
      }
      colR += _loc2_;
      if(colR > 255)
      {
         colR = 255;
      }
      colG += _loc2_;
      if(colG > 255)
      {
         colG = 255;
      }
      colB += _loc2_;
      if(colB > 255)
      {
         colB = 255;
      }
      var _loc3_ = this.assetsMC["postit_" + enum];
      if(_loc3_)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc3_,colR,colG,colB,colA);
      }
   }
   function scalePostIt(enum, scale)
   {
      var _loc2_ = this.assetsMC["postit_" + enum];
      _loc2_.content._xscale = _loc2_.content._yscale = scale;
   }
   function bringPostItToFront(enum)
   {
      var _loc2_ = this.assetsMC["postit_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllPostIts()
   {
      var _loc2_ = 0;
      var _loc3_ = this.postIts.length;
      while(_loc2_ < _loc3_)
      {
         this.postIts[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.postIts.length = 0;
   }
   function hideAllPostIts()
   {
      var _loc2_ = 0;
      var _loc3_ = this.postIts.length;
      while(_loc2_ < _loc3_)
      {
         this.postIts[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllPostIts()
   {
      var _loc2_ = 0;
      var _loc3_ = this.postIts.length;
      while(_loc2_ < _loc3_)
      {
         this.postIts[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addArea(enum, xPos, yPos, diameter, colR, colG, colB, colA)
   {
      var _loc3_ = "area";
      var _loc2_ = "area_" + enum;
      var _loc8_ = xPos / this.xRatio;
      var _loc6_ = (- yPos) / this.yRatio;
      var _loc10_ = undefined;
      diameter /= this.xRatio;
      if(this.assetsMC[_loc2_])
      {
         _loc10_ = this.assetsMC[_loc2_].getDepth();
         this.removeArea(enum);
      }
      else
      {
         _loc10_ = this.assetsMC.getNextHighestDepth();
      }
      var _loc7_ = this.assetsMC.attachMovie(_loc3_,_loc2_,_loc10_,{_x:_loc8_,_y:_loc6_,_width:diameter,_height:diameter,_alpha:colA,depth:_loc10_});
      this.colourArea(enum,colR,colG,colB,colA);
      this.areas.push(_loc7_);
   }
   function removeArea(enum)
   {
      var _loc2_ = this.assetsMC["area_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.areas.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.areas.splice(_loc3_,1);
         }
      }
   }
   function colourArea(enum, colR, colG, colB, colA)
   {
      var _loc2_ = this.assetsMC["area_" + enum];
      if(_loc2_)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,colR,colG,colB,colA);
      }
   }
   function bringAreaToFront(enum)
   {
      var _loc2_ = this.assetsMC["area_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllAreas()
   {
      var _loc2_ = 0;
      var _loc3_ = this.areas.length;
      while(_loc2_ < _loc3_)
      {
         this.areas[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.areas.length = 0;
   }
   function hideAllAreas()
   {
      var _loc2_ = 0;
      var _loc3_ = this.areas.length;
      while(_loc2_ < _loc3_)
      {
         this.areas[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllAreas()
   {
      var _loc2_ = 0;
      var _loc3_ = this.areas.length;
      while(_loc2_ < _loc3_)
      {
         this.areas[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addHighlight(enum, xPos, yPos, size, colR, colG, colB, colA)
   {
      if(colR == undefined)
      {
         colR = 194;
         colG = 81;
         colB = 81;
         colA = 100;
      }
      var _loc4_ = "highlight_mc";
      var _loc2_ = "highlight_" + enum;
      var _loc10_ = xPos / this.xRatio;
      var _loc9_ = (- yPos) / this.yRatio;
      var _loc6_ = size / this.xRatio;
      var _loc7_ = size / this.yRatio;
      var _loc14_ = undefined;
      if(this.assetsMC[_loc2_])
      {
         _loc14_ = this.assetsMC[_loc2_].getDepth();
         this.removeHighlight(enum);
      }
      else
      {
         _loc14_ = this.assetsMC.getNextHighestDepth();
      }
      var _loc3_ = this.assetsMC.attachMovie(_loc4_,_loc2_,_loc14_,{_x:_loc10_,_y:_loc9_,_width:_loc6_,_height:_loc7_,depth:_loc14_});
      _loc3_.graphic._rotation = Math.random() * 360;
      _loc3_.graphic._alpha = 70;
      this.colourHighlight(enum,colR,colG,colB,colA);
      this.highlights.push(_loc3_);
   }
   function removeHighlight(enum)
   {
      var _loc2_ = this.assetsMC["highlight_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.highlights.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.highlights.splice(_loc3_,1);
         }
      }
   }
   function colourHighlight(enum, colR, colG, colB, colA)
   {
      var _loc2_ = this.assetsMC["highlight_" + enum];
      if(_loc2_)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,colR,colG,colB,colA);
      }
   }
   function bringHighlightToFront(enum)
   {
      var _loc2_ = this.assetsMC["highlight_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllHighlights()
   {
      var _loc2_ = 0;
      var _loc3_ = this.highlights.length;
      while(_loc2_ < _loc3_)
      {
         this.highlights[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.highlights.length = 0;
   }
   function hideAllHighlights()
   {
      var _loc2_ = 0;
      var _loc3_ = this.highlights.length;
      while(_loc2_ < _loc3_)
      {
         this.highlights[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllHighlights()
   {
      var _loc2_ = 0;
      var _loc3_ = this.highlights.length;
      while(_loc2_ < _loc3_)
      {
         this.highlights[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addArrow(enum, fromX, fromY, toX, toY, curve)
   {
      if(curve == undefined || curve == 0)
      {
         curve = 4;
      }
      var _loc2_ = "arrow_" + enum;
      var _loc4_ = undefined;
      if(this.assetsMC[_loc2_])
      {
         _loc4_ = this.assetsMC[_loc2_].getDepth();
         this.removeArrow(enum);
      }
      else
      {
         _loc4_ = this.assetsMC.getNextHighestDepth();
      }
      var _loc3_ = this.assetsMC.createEmptyMovieClip(_loc2_,_loc4_);
      _loc3_.depth = _loc4_;
      this.initialiseArrow(_loc3_,enum,fromX,fromY,toX,toY,curve);
      this.arrows.push(_loc3_);
   }
   function initialiseArrow(mc, arrowEnum, fromX, fromY, toX, toY, curve)
   {
      var _loc16_ = fromX / this.xRatio;
      var _loc15_ = - fromY / this.yRatio;
      var _loc18_ = toX / this.xRatio;
      var _loc17_ = - toY / this.yRatio;
      var _loc5_ = new flash.geom.Point(_loc16_,_loc15_);
      var _loc6_ = new flash.geom.Point(_loc18_,_loc17_);
      var _loc11_ = flash.geom.Point.distance(_loc5_,_loc6_);
      var _loc10_ = flash.geom.Point.interpolate(_loc5_,_loc6_,0.5);
      var _loc8_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x);
      var _loc12_ = _loc8_ - 1.5707963267948966;
      var _loc14_ = _loc11_ / curve * Math.cos(_loc12_) + _loc10_.x;
      var _loc13_ = _loc11_ / curve * Math.sin(_loc12_) + _loc10_.y;
      var _loc4_ = new flash.geom.Point(_loc14_,_loc13_);
      var _loc9_ = flash.geom.Point.interpolate(_loc5_,_loc4_,0.9);
      var _loc3_ = flash.geom.Point.interpolate(_loc6_,_loc4_,0.9);
      mc.lineStyle(com.rockstargames.gtav.levelDesign.heists.HeistMap.ARROW_THICKNESS,15790320,100,true,"normal","round","miter",0.25);
      mc.moveTo(_loc9_.x,_loc9_.y);
      mc.curveTo(_loc4_.x,_loc4_.y,_loc3_.x,_loc3_.y);
      _loc8_ = Math.atan2(_loc3_.y - _loc4_.y,_loc3_.x - _loc4_.x);
      var _loc2_ = mc.createEmptyMovieClip("arrowHead",mc.getNextHighestDepth());
      _loc2_._x = _loc3_.x;
      _loc2_._y = _loc3_.y;
      _loc2_.lineStyle(com.rockstargames.gtav.levelDesign.heists.HeistMap.ARROW_THICKNESS,15790320,100,true,"normal","none","miter",0.25);
      _loc2_.lineTo(-15,20);
      _loc2_.moveTo(15,20);
      _loc2_.lineTo(0,0);
      var _loc19_ = _loc8_ * 180 / 3.141592653589793;
      _loc2_._rotation += 90 + _loc19_;
   }
   function removeArrow(enum)
   {
      var _loc2_ = this.assetsMC["arrow_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.arrows.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.arrows.splice(_loc3_,1);
         }
      }
   }
   function colourArrow(enum, colR, colG, colB, colA)
   {
      var _loc2_ = this.assetsMC["arrow_" + enum];
      if(_loc2_)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,colR,colG,colB,colA);
      }
   }
   function bringArrowToFront(enum)
   {
      var _loc2_ = this.assetsMC["arrow_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllArrows()
   {
      var _loc2_ = 0;
      var _loc3_ = this.arrows.length;
      while(_loc2_ < _loc3_)
      {
         this.arrows[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.arrows.length = 0;
   }
   function hideAllArrows()
   {
      var _loc2_ = 0;
      var _loc3_ = this.arrows.length;
      while(_loc2_ < _loc3_)
      {
         this.arrows[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllArrows()
   {
      var _loc2_ = 0;
      var _loc3_ = this.arrows.length;
      while(_loc2_ < _loc3_)
      {
         this.arrows[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addText(enum, textString, xPos, yPos, textAngle, fontSize, textWidth, textAlpha, dropshadow)
   {
      if(dropshadow == undefined)
      {
         dropshadow = true;
      }
      if(textAlpha == undefined)
      {
         textAlpha = 100;
      }
      if(textWidth == undefined)
      {
         textWidth = 100;
      }
      if(fontSize == undefined)
      {
         fontSize = 18;
      }
      var _loc9_ = !dropshadow ? "textMC" : "textMCshadow";
      var _loc3_ = "text_" + enum;
      var _loc7_ = xPos / this.xRatio;
      var _loc6_ = (- yPos) / this.yRatio;
      var _loc14_ = undefined;
      if(this.assetsMC[_loc3_])
      {
         _loc14_ = this.assetsMC[_loc3_].getDepth();
         this.removeText(enum);
      }
      else
      {
         _loc14_ = this.assetsMC.getNextHighestDepth();
      }
      var _loc4_ = this.assetsMC.attachMovie(_loc9_,_loc3_,_loc14_,{_x:_loc7_,_y:_loc6_,_rotation:textAngle,_alpha:textAlpha,depth:_loc14_,baseX:_loc7_,baseY:_loc6_});
      var _loc2_ = _loc4_.textTF;
      _loc2_._width = textWidth;
      _loc2_.htmlText = textString;
      _loc2_.autoSize = "left";
      var _loc5_ = _loc2_.getNewTextFormat();
      _loc5_.size = fontSize;
      _loc2_.setTextFormat(_loc5_);
      _loc2_._x = -0.5 * _loc2_.textWidth;
      _loc2_._y = -0.5 * _loc2_._height;
      this.texts.push(_loc4_);
      if(this.isLowerMap)
      {
         this.checkIfOutsideOfMap(_loc4_);
      }
   }
   function removeText(enum)
   {
      var _loc2_ = this.assetsMC["text_" + enum];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.texts.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            this.texts.splice(_loc3_,1);
         }
      }
   }
   function colourText(enum, colR, colG, colB, colA)
   {
      if(colA == undefined)
      {
         colA = 100;
      }
      var _loc2_ = this.assetsMC["text_" + enum];
      if(_loc2_)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,colR,colG,colB,colA);
      }
   }
   function bringTextToFront(enum)
   {
      var _loc2_ = this.assetsMC["text_" + enum];
      _loc2_.swapDepths(this.assetsMC.getNextHighestDepth());
   }
   function removeAllText()
   {
      var _loc2_ = 0;
      var _loc3_ = this.texts.length;
      while(_loc2_ < _loc3_)
      {
         this.texts[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.texts.length = 0;
   }
   function hideAllText()
   {
      var _loc2_ = 0;
      var _loc3_ = this.texts.length;
      while(_loc2_ < _loc3_)
      {
         this.texts[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showAllText()
   {
      var _loc2_ = 0;
      var _loc3_ = this.texts.length;
      while(_loc2_ < _loc3_)
      {
         this.texts[_loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
}
