class com.rockstargames.gtav.levelDesign.nightclub.TotalColumn
{
   var animationDamping;
   var animationDelay;
   var cubes;
   var currAnimationDelay;
   var currValue;
   var currentFrames;
   var goalFrames;
   var numCubes;
   static var ACTIVE_FRAME;
   static var Y_STEP = 16;
   static var MAX_Y_OFFSET = 35;
   static var RESTING_FRAME = 20;
   static var ANIMATION_STEPS = [];
   function TotalColumn(view, numCubes, animationDelay)
   {
      this.numCubes = numCubes;
      this.animationDelay = animationDelay;
      this.init(view);
   }
   function init(view)
   {
      this.cubes = [];
      this.currentFrames = [];
      this.goalFrames = [];
      this.animationDamping = [];
      var _loc2_ = 0;
      while(_loc2_ < this.numCubes)
      {
         view = view.attachMovie("totalCube","cube",0);
         this.cubes.push(view);
         this.currentFrames.push(0);
         this.goalFrames.push(0);
         this.animationDamping.push(1 - 0.1 * _loc2_ / this.numCubes);
         _loc2_ = _loc2_ + 1;
      }
      this.currValue = 0;
      if(com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ANIMATION_STEPS.length == 0)
      {
         com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.initAnimationSteps();
      }
   }
   static function initAnimationSteps()
   {
      var _loc4_ = 1.7976931348623157e+308;
      var _loc5_ = com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.RESTING_FRAME;
      var _loc6_ = 3.141592653589793 / com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.RESTING_FRAME;
      var _loc1_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc1_ < com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.RESTING_FRAME)
      {
         _loc3_ = (- com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.MAX_Y_OFFSET) * Math.sin(_loc1_ * _loc6_);
         _loc2_ = Math.abs(_loc3_ + com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.Y_STEP);
         if(_loc2_ < _loc4_)
         {
            _loc4_ = _loc2_;
            _loc5_ = _loc1_;
         }
         com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ANIMATION_STEPS[_loc1_] = _loc3_;
         _loc1_ = _loc1_ + 1;
      }
      com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ACTIVE_FRAME = _loc5_;
      com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ANIMATION_STEPS[_loc5_] = - com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.Y_STEP;
   }
   function setValue(value)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.numCubes)
      {
         this.goalFrames[_loc2_] = _loc2_ >= value ? 0 : com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ACTIVE_FRAME;
         _loc2_ = _loc2_ + 1;
      }
      this.currAnimationDelay = this.animationDelay;
   }
   function update()
   {
      var _loc5_ = true;
      if(this.currAnimationDelay > 0 && this.currAnimationDelay-- > 0)
      {
         return false;
      }
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < this.numCubes)
      {
         _loc4_ = this.currentFrames[_loc2_];
         if(_loc4_ != this.goalFrames[_loc2_])
         {
            _loc3_ = (_loc4_ + 1) % com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.RESTING_FRAME;
            this.cubes[_loc2_]._y = this.animationDamping[_loc2_] * com.rockstargames.gtav.levelDesign.nightclub.TotalColumn.ANIMATION_STEPS[_loc3_];
            this.currentFrames[_loc2_] = _loc3_;
            _loc5_ = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_;
   }
}
