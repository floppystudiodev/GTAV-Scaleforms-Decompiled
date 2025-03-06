class com.rockstargames.gtav.levelDesign.dragRace.CircleSegment
{
   static var controlPoints = [0,-1,1,-1,1,0,1,1,0,1,-1,1,-1,0,-1,-1];
   static var drawDirections = [0,1,-1,0,1,0,0,-1,1,0,0,1,0,1,1,0,0,-1,1,0,-1,0,0,1,-1,0,0,-1,0,-1,-1,0];
   function CircleSegment()
   {
   }
   static function drawSegment(normStart, normFinish, radius, segmentMask, xOffset, yOffset)
   {
      segmentMask.clear();
      if(normStart == normFinish)
      {
         return undefined;
      }
      segmentMask.beginFill(0);
      if(Math.abs(normFinish - normStart) == 1)
      {
         segmentMask.moveTo(xOffset - radius,yOffset - radius);
         segmentMask.lineTo(xOffset + radius,yOffset - radius);
         segmentMask.lineTo(xOffset + radius,yOffset + radius);
         segmentMask.lineTo(xOffset - radius,yOffset + radius);
         segmentMask.lineTo(xOffset - radius,yOffset - radius);
         segmentMask.endFill();
         return undefined;
      }
      segmentMask.moveTo(xOffset,yOffset);
      var _loc11_ = (normStart % 1 + 1) % 1;
      var _loc12_ = (normFinish % 1 + 1) % 1;
      var _loc9_ = Math.floor(_loc11_ * 8);
      var _loc14_ = Math.floor(_loc12_ * 8);
      var _loc10_ = Math.ceil(((_loc12_ - _loc11_) % 1 + 1) % 1 * 8);
      if(_loc11_ % 0.125 != 0)
      {
         com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawSubSegment(_loc11_,_loc9_,radius,segmentMask,xOffset,yOffset);
      }
      var _loc1_ = 0;
      while(_loc1_ <= _loc10_)
      {
         var _loc3_ = (_loc1_ + _loc9_) % 8;
         var _loc6_ = com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.controlPoints[_loc3_ * 2] * radius + xOffset;
         var _loc5_ = com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.controlPoints[_loc3_ * 2 + 1] * radius + yOffset;
         segmentMask.lineTo(_loc6_,_loc5_);
         _loc1_ = _loc1_ + 1;
      }
      com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawSubSegment(_loc12_,_loc14_,radius,segmentMask,xOffset,yOffset);
      segmentMask.lineTo(xOffset,yOffset);
      segmentMask.endFill();
   }
   static function drawSubSegment(n, octant, radius, mc, xOffset, yOffset)
   {
      var _loc4_ = !(octant & 1) ? n % 0.125 : 0.125 - n % 0.125;
      var _loc3_ = Math.tan(6.283185307179586 * _loc4_);
      var _loc1_ = Math.floor(octant * 4);
      var _loc6_ = com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawDirections[_loc1_] * radius + _loc3_ * com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawDirections[_loc1_ + 1] * radius + xOffset;
      var _loc5_ = com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawDirections[_loc1_ + 2] * radius + _loc3_ * com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawDirections[_loc1_ + 3] * radius + yOffset;
      mc.lineTo(_loc6_,_loc5_);
   }
}
