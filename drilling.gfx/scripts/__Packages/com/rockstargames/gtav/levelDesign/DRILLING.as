class com.rockstargames.gtav.levelDesign.DRILLING extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var drillBit;
   var drillPosition;
   var hole;
   var holeDepth;
   var speedStep;
   static var DRILL_BIT_MIN_Y = 187;
   static var DRILL_BIT_MAX_Y = 20;
   static var DRILL_BIT_RANGE = com.rockstargames.gtav.levelDesign.DRILLING.DRILL_BIT_MAX_Y - com.rockstargames.gtav.levelDesign.DRILLING.DRILL_BIT_MIN_Y;
   function DRILLING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.speedStep = 0;
      this.holeDepth = 0;
      this.drillPosition = 0;
      this.drillBit = this.CONTENT.animation.drillBit;
      this.hole = this.CONTENT.animation.hole;
   }
   function SET_SPEED(speed)
   {
      speed = Math.min(1,Math.max(0,speed));
      var _loc6_ = Math.ceil(speed * 10);
      var _loc3_;
      var _loc4_;
      var _loc5_;
      var _loc2_;
      if(_loc6_ != this.speedStep)
      {
         this.speedStep = _loc6_;
         _loc3_ = this.drillBit.bit._y;
         this.drillBit.gotoAndStop("speed_" + _loc6_);
         if(_loc6_ == 0)
         {
            this.drillBit.bit._y = _loc3_;
         }
         else
         {
            _loc4_ = this.drillBit._currentFrame;
            _loc5_ = 22 - 2 * _loc6_;
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.drillBit.bit._y >= _loc3_)
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
   function SET_HOLE_DEPTH(depth)
   {
      depth = Math.min(1,Math.max(0,depth));
      this.holeDepth = depth;
      var _loc3_ = Math.round(depth * 100) + 1;
      this.hole.gotoAndStop(_loc3_);
      if(depth < this.drillPosition)
      {
         this.SET_DRILL_POSITION(depth);
      }
   }
   function SET_DRILL_POSITION(position)
   {
      position = Math.min(1,Math.max(0,position));
      this.drillPosition = position;
      this.drillBit._y = position * com.rockstargames.gtav.levelDesign.DRILLING.DRILL_BIT_RANGE + com.rockstargames.gtav.levelDesign.DRILLING.DRILL_BIT_MIN_Y;
      if(position > this.holeDepth)
      {
         this.SET_HOLE_DEPTH(position);
      }
   }
   function SET_TEMPERATURE(temperature)
   {
      temperature = Math.min(1,Math.max(0,temperature)) * 102;
      this.drillBit.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,temperature,0,0,0);
   }
}
