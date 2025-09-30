class com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment
{
   var arcPoints;
   var centreAngle;
   var colour;
   var isHighlighted;
   var radius;
   var view;
   static var DEG_2_RAD = 0.017453292519943295;
   static var RAD_2_DEG = 57.29577951308232;
   static var OCTANT = 0.7853981633974483;
   static var INV_OCTANT = 1.2732395447351628;
   static var TWO_PI = 6.283185307179586;
   static var HIGHLIGHT_OFFSET = 12;
   static var OCTANT_POINTS = [0.9942056744293,0.411813474136906,0.707106781186548,0.707106781186547,0.411813474136906,0.9942056744293,6.12303176911189e-17,1,-0.411813474136906,0.9942056744293,-0.707106781186547,0.707106781186548,-0.9942056744293,0.411813474136906,-1,1.22460635382238e-16,-0.9942056744293,-0.411813474136906,-0.707106781186548,-0.707106781186547,-0.411813474136906,-0.994205674429299,-1.83690953073357e-16,-1,0.411813474136906,-0.994205674429299,0.707106781186547,-0.707106781186548,0.994205674429299,-0.411813474136906,1,-2.44921270764475e-16];
   function PieChartSegment(view, radius, colour)
   {
      this.view = view;
      this.radius = radius;
      this.colour = colour;
      this.arcPoints = [];
      this.isHighlighted = false;
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.rgb = colour;
      view.transform.colorTransform = _loc2_;
   }
   function highlight(isHighlighted)
   {
      this.isHighlighted = isHighlighted;
      var _loc3_;
      var _loc2_;
      if(isHighlighted)
      {
         _loc3_ = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.HIGHLIGHT_OFFSET * Math.cos(this.centreAngle);
         _loc2_ = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.HIGHLIGHT_OFFSET * Math.sin(this.centreAngle);
      }
      else
      {
         _loc3_ = 0;
         _loc2_ = 0;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.06,{_x:_loc3_,_y:_loc2_});
   }
   function setVisible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function draw(startAngle, endAngle, fillBitmapData)
   {
      this.view.clear();
      if(startAngle == endAngle)
      {
         return undefined;
      }
      this.calculateArcPoints(startAngle,endAngle);
      var _loc4_ = new flash.geom.Matrix();
      _loc4_.translate(0.5 * fillBitmapData.width,0.5 * fillBitmapData.height);
      _loc4_.translate(- this.view._x,- this.view._y);
      _loc4_.rotate(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.DEG_2_RAD * (- this.view._rotation));
      _loc4_.scale(0.5,0.5);
      this.view.beginBitmapFill(fillBitmapData,_loc4_);
      this.view.lineTo(this.arcPoints[0],this.arcPoints[1]);
      var _loc2_ = 2;
      var _loc3_ = this.arcPoints.length;
      while(_loc2_ < _loc3_)
      {
         this.view.curveTo(this.arcPoints[_loc2_],this.arcPoints[_loc2_ + 1],this.arcPoints[_loc2_ + 2],this.arcPoints[_loc2_ + 3]);
         _loc2_ += 4;
      }
      this.view.lineTo(0,0);
      this.view.endFill();
      this.highlight(this.isHighlighted);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function calculateArcPoints(startAngle, endAngle)
   {
      while(endAngle < startAngle)
      {
         endAngle += com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.TWO_PI;
      }
      while(endAngle > startAngle + com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.TWO_PI)
      {
         endAngle -= com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.TWO_PI;
      }
      this.view._rotation = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.RAD_2_DEG * startAngle;
      this.centreAngle = 0.5 * (startAngle + endAngle);
      endAngle -= startAngle;
      this.arcPoints.length = 0;
      var _loc5_ = 1;
      var _loc11_ = 0;
      var _loc3_ = 0;
      this.arcPoints[0] = this.radius;
      this.arcPoints[1] = 0;
      var _loc9_;
      var _loc7_;
      var _loc4_;
      var _loc8_;
      var _loc6_;
      while(_loc3_ < endAngle)
      {
         _loc3_ = _loc5_ * com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.OCTANT;
         if(_loc3_ > endAngle)
         {
            _loc9_ = Math.cos(endAngle);
            _loc7_ = Math.sin(endAngle);
            _loc4_ = 0.5 * (_loc11_ + endAngle);
            _loc8_ = Math.cos(_loc4_);
            _loc6_ = Math.sin(_loc4_);
            this.calculateArcEndSegment(this.arcPoints,this.radius,_loc9_,_loc7_,_loc8_,_loc6_);
         }
         else
         {
            this.getOctantPoints(_loc5_,this.arcPoints,this.radius);
         }
         _loc11_ = _loc3_;
         _loc5_ = _loc5_ + 1;
      }
   }
   function calculateArcEndSegment(points, r, cosAngle, sinAngle, cosTheta, sinTheta)
   {
      var _loc9_;
      var _loc8_;
      var _loc2_;
      var _loc6_;
      var _loc7_;
      var _loc5_;
      var _loc12_;
      var _loc11_;
      var _loc4_;
      var _loc3_ = points.length;
      _loc9_ = points[_loc3_ - 2];
      _loc8_ = points[_loc3_ - 1];
      _loc2_ = r * cosAngle;
      _loc6_ = r * sinAngle;
      _loc7_ = 0.5 * (_loc9_ + _loc2_);
      _loc5_ = 0.5 * (_loc8_ + _loc6_);
      _loc4_ = 2 * r - Math.sqrt(_loc7_ * _loc7_ + _loc5_ * _loc5_);
      _loc12_ = _loc4_ * cosTheta;
      _loc11_ = _loc4_ * sinTheta;
      points.push(_loc12_);
      points.push(_loc11_);
      points.push(_loc2_);
      points.push(_loc6_);
   }
   function getOctantPoints(octant, points, radius)
   {
      var _loc1_ = (octant - 1) * 4;
      points.push(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.OCTANT_POINTS[_loc1_] * radius);
      points.push(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.OCTANT_POINTS[_loc1_ + 1] * radius);
      points.push(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.OCTANT_POINTS[_loc1_ + 2] * radius);
      points.push(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChartSegment.OCTANT_POINTS[_loc1_ + 3] * radius);
   }
}
