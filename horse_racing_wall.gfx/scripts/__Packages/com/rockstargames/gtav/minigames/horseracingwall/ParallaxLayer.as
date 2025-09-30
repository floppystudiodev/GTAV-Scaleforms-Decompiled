class com.rockstargames.gtav.minigames.horseracingwall.ParallaxLayer
{
   var acceleration;
   var numSegments;
   var parallaxRatio;
   var segmentWidth;
   var segments;
   var speed;
   var viewWidth;
   static var START_ACCELERATION = 0.3;
   function ParallaxLayer(view, parallaxRatio, segmentWidth)
   {
      this.parallaxRatio = parallaxRatio;
      this.segmentWidth = segmentWidth;
      this.segments = [];
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc6_ in view)
      {
         _loc2_ = view[_loc6_];
         _loc2_._x = _loc3_;
         _loc3_ += segmentWidth;
         this.segments.push(_loc2_);
      }
      this.numSegments = this.segments.length;
      this.viewWidth = this.numSegments * segmentWidth;
      this.acceleration = com.rockstargames.gtav.minigames.horseracingwall.ParallaxLayer.START_ACCELERATION;
   }
   function animate(speed)
   {
      this.speed = (- speed) * this.parallaxRatio;
   }
   function update(elapsed)
   {
      this.acceleration += 0.02 * (1 - this.acceleration);
      var _loc4_ = this.acceleration * this.speed * elapsed % this.viewWidth;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.numSegments)
      {
         _loc3_ = this.segments[_loc2_];
         _loc3_._x = _loc4_ + _loc2_ * this.segmentWidth;
         if(_loc3_._x < - this.segmentWidth)
         {
            _loc3_._x += this.viewWidth;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function killAcceleration()
   {
      this.acceleration = 1;
   }
   function dispose()
   {
      this.segments = null;
   }
}
