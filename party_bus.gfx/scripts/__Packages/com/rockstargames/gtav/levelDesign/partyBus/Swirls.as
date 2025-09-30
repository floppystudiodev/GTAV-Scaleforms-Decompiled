class com.rockstargames.gtav.levelDesign.partyBus.Swirls extends com.rockstargames.gtav.levelDesign.partyBus.Animation
{
   var beatStep;
   var height;
   var maxYOffset;
   var position;
   var skew;
   var swirls;
   var view;
   static var BEAT_SCALES = [1.5,0.5];
   static var FALL_SPEED = 0.01;
   static var SKEW_SPEED = 0.03;
   static var SKEW_AMOUNT = 0.3;
   static var SKEW_AMOUNT_X2 = com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_AMOUNT * 2;
   static var SKEW_AMOUNT_X4 = com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_AMOUNT * 4;
   static var NUM_SWIRLS = 12;
   static var SWIRL_SIZE = 256;
   static var HALF_SWIRL_SIZE = com.rockstargames.gtav.levelDesign.partyBus.Swirls.SWIRL_SIZE / 2;
   static var DOUBLE_SWIRL_SIZE = 2 * com.rockstargames.gtav.levelDesign.partyBus.Swirls.SWIRL_SIZE;
   function Swirls(container, width, height)
   {
      super(container,width,height,"swirls");
      this.init();
   }
   function init()
   {
      this.maxYOffset = 0.5 * this.height;
      this.skew = 0;
      this.position = 0;
      this.swirls = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.partyBus.Swirls.NUM_SWIRLS)
      {
         this.swirls[_loc2_] = this.view["swirl" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      this.view._y = this.maxYOffset + com.rockstargames.gtav.levelDesign.partyBus.Swirls.HALF_SWIRL_SIZE * Math.sin(this.position);
      this.position += com.rockstargames.gtav.levelDesign.partyBus.Swirls.FALL_SPEED;
      var _loc7_ = Math.abs(this.skew % com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_AMOUNT_X4 - com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_AMOUNT_X2) - com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_AMOUNT;
      this.skew += com.rockstargames.gtav.levelDesign.partyBus.Swirls.SKEW_SPEED;
      var _loc3_ = 0;
      var _loc6_;
      var _loc5_;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.partyBus.Swirls.NUM_SWIRLS)
      {
         _loc6_ = this.swirls[_loc3_];
         _loc5_ = this.swirls[_loc3_ + 1];
         _loc2_ = _loc6_.transform.matrix;
         _loc4_ = _loc5_.transform.matrix;
         _loc2_.a += 0.2 * (1 - _loc2_.a);
         _loc2_.b = _loc7_;
         _loc4_.a = _loc2_.a - 2;
         _loc4_.b = _loc7_;
         _loc4_.tx = _loc2_.tx + com.rockstargames.gtav.levelDesign.partyBus.Swirls.DOUBLE_SWIRL_SIZE;
         _loc6_.transform.matrix = _loc2_;
         _loc5_.transform.matrix = _loc4_;
         _loc3_ += 2;
      }
   }
   function beat()
   {
      var _loc7_ = com.rockstargames.gtav.levelDesign.partyBus.Swirls.BEAT_SCALES[this.beatStep % com.rockstargames.gtav.levelDesign.partyBus.Swirls.BEAT_SCALES.length];
      var _loc2_ = 0;
      var _loc6_;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.partyBus.Swirls.NUM_SWIRLS)
      {
         _loc6_ = this.swirls[_loc2_];
         _loc5_ = this.swirls[_loc2_ + 1];
         _loc3_ = _loc6_.transform.matrix;
         _loc4_ = _loc5_.transform.matrix;
         _loc3_.a = _loc7_;
         _loc4_.a = _loc7_ - 2;
         _loc4_.tx = _loc3_.tx + com.rockstargames.gtav.levelDesign.partyBus.Swirls.DOUBLE_SWIRL_SIZE;
         _loc6_.transform.matrix = _loc3_;
         _loc5_.transform.matrix = _loc4_;
         _loc2_ += 2;
      }
      this.beatStep = this.beatStep + 1;
   }
}
