class com.rockstargames.gtav.levelDesign.partyBus.Dots extends com.rockstargames.gtav.levelDesign.partyBus.Animation
{
   var rotationStep;
   var dots;
   var view;
   var beatStep;
   static var NUM_DOTS = 4;
   static var ROTATION_SPEED = 0.01;
   static var BEAT_Y_SCALE = 1000;
   static var SCALE_EASING = 0.2;
   function Dots(container, width, height)
   {
      super(container,width,height,"dots");
      this.init();
   }
   function init()
   {
      this.rotationStep = 0;
      this.dots = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.partyBus.Dots.NUM_DOTS)
      {
         this.dots[_loc2_] = this.view["dots" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      this.rotationStep += com.rockstargames.gtav.levelDesign.partyBus.Dots.ROTATION_SPEED;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.partyBus.Dots.NUM_DOTS)
      {
         var _loc3_ = this.dots[_loc2_];
         var _loc4_ = this.rotationStep * ((_loc2_ % 2 << 1) - 1);
         if(_loc2_ % 2)
         {
            _loc4_ += 1.5707963267948966;
         }
         _loc3_.wrapper._rotation = 360 * Math.sin(_loc4_);
         _loc3_._yscale += com.rockstargames.gtav.levelDesign.partyBus.Dots.SCALE_EASING * (100 - _loc3_._yscale);
         _loc2_ = _loc2_ + 1;
      }
   }
   function beat()
   {
      if(this.beatStep % 2 == 0)
      {
         this.dots[1]._yscale = this.dots[3]._yscale = com.rockstargames.gtav.levelDesign.partyBus.Dots.BEAT_Y_SCALE;
      }
      else
      {
         this.dots[0]._yscale = this.dots[2]._yscale = com.rockstargames.gtav.levelDesign.partyBus.Dots.BEAT_Y_SCALE;
      }
      this.beatStep = this.beatStep + 1;
   }
}
