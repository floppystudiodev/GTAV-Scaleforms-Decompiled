class com.rockstargames.gtav.levelDesign.DRILLING extends com.rockstargames.ui.core.BaseScreenLayout
{
   var speedStep;
   var drillBit;
   var CONTENT;
   function DRILLING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.speedStep = 0;
      this.drillBit = this.CONTENT.animation.drillBit;
   }
   function SET_SPEED(speed)
   {
      speed = Math.min(1,Math.max(0,speed));
      var _loc6_ = Math.ceil(speed * 10);
      if(_loc6_ != this.speedStep)
      {
         this.speedStep = _loc6_;
         var _loc3_ = this.drillBit.bit._y;
         this.drillBit.gotoAndStop("speed_" + _loc6_);
         if(_loc6_ == 0)
         {
            this.drillBit.bit._y = _loc3_;
         }
         else
         {
            var _loc4_ = this.drillBit._currentFrame;
            var _loc5_ = 22 - 2 * _loc6_;
            var _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.CONTENT.animation.drillBit.bit._y >= _loc3_)
               {
                  break;
               }
               this.drillBit.gotoAndStop(_loc4_ + _loc2_);
               _loc2_ = _loc2_ + 1;
            }
            this.drillBit.gotoAndPlay(_loc4_ + _loc2_ - 1);
         }
      }
   }
   function SET_DEPTH(depth)
   {
      depth = Math.min(1,Math.max(0,depth));
      var _loc2_ = Math.round(depth * 100) + 1;
      this.CONTENT.animation.gotoAndStop(_loc2_);
   }
   function SET_TEMPERATURE(temperature)
   {
      temperature = Math.min(1,Math.max(0,temperature)) * 102;
      this.CONTENT.animation.drillBit.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,temperature,0,0,0);
   }
}
