class com.rockstargames.gtav.minigames.dancing.Meter
{
   var controlPoints;
   var drawDirections;
   var mask;
   var r;
   var view;
   static var MIN_ALPHA = 20;
   static var ALPHA_FALLOFF = 100 - com.rockstargames.gtav.minigames.dancing.Meter.MIN_ALPHA;
   function Meter(view, radius)
   {
      this.view = view;
      this.r = radius;
      this.init();
   }
   function init()
   {
      this.mask = this.view.createEmptyMovieClip("mask",this.view.getNextHighestDepth());
      this.view.fill.setMask(this.mask);
      this.controlPoints = [this.r,0,this.r,this.r,0,this.r,- this.r,this.r,- this.r,0,- this.r,- this.r,0,- this.r,this.r,- this.r,this.r,0];
      this.drawDirections = [this.r,0,0,1,0,1,this.r,0,0,-1,this.r,0,- this.r,0,0,1,- this.r,0,0,-1,0,-1,- this.r,0,0,1,- this.r,0,this.r,0,0,-1];
   }
   function set value(normValue)
   {
      var _loc4_ = Math.floor(normValue * 8);
      this.mask.clear();
      this.mask.beginFill(0);
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc3_ <= _loc4_)
      {
         this.mask.lineTo(this.controlPoints[_loc2_],this.controlPoints[_loc2_ + 1]);
         _loc3_++;
         _loc2_ += 2;
      }
      var _loc7_;
      var _loc6_;
      if(normValue < 1)
      {
         _loc7_ = !(_loc4_ & 1) ? normValue % 0.125 : 0.125 - normValue % 0.125;
         _loc6_ = this.r * Math.tan(6.283185307179586 * _loc7_);
         _loc4_ <<= 2;
         this.mask.lineTo(this.drawDirections[_loc4_] + _loc6_ * this.drawDirections[_loc4_ + 1],this.drawDirections[_loc4_ + 2] + _loc6_ * this.drawDirections[_loc4_ + 3]);
         this.mask.lineTo(0,0);
      }
      this.mask.endFill();
      this.view.fill._visible = normValue > 0;
      this.view._alpha = com.rockstargames.gtav.minigames.dancing.Meter.ALPHA_FALLOFF * normValue + com.rockstargames.gtav.minigames.dancing.Meter.MIN_ALPHA;
   }
}
