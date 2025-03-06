class com.rockstargames.gtav.levelDesign.partyBus.GradientBackground
{
   var view;
   var t;
   var rDelta;
   var gDelta;
   var bDelta;
   var r0;
   var g0;
   var b0;
   var ct;
   static var TWEEN_DURATION = 60;
   function GradientBackground(container)
   {
      this.view = container.attachMovie("gradientBackground","bg",container.getNextHighestDepth());
      this.t = com.rockstargames.gtav.levelDesign.partyBus.GradientBackground.TWEEN_DURATION;
      this.rDelta = 0;
      this.gDelta = 0;
      this.bDelta = 0;
      this.r0 = int(Math.random() * 256 - 128);
      this.g0 = int(Math.random() * 256 - 128);
      this.b0 = int(Math.random() * 256 - 128);
      this.ct = new flash.geom.ColorTransform(1,1,1,1,this.r0,this.g0,this.b0,0);
   }
   function update()
   {
      if(this.t++ == com.rockstargames.gtav.levelDesign.partyBus.GradientBackground.TWEEN_DURATION)
      {
         this.setNewGoalColour();
      }
      var _loc2_ = this.t / com.rockstargames.gtav.levelDesign.partyBus.GradientBackground.TWEEN_DURATION;
      this.ct.redOffset = this.r0 + Math.round(_loc2_ * this.rDelta);
      this.ct.greenOffset = this.g0 + Math.round(_loc2_ * this.gDelta);
      this.ct.blueOffset = this.b0 + Math.round(_loc2_ * this.bDelta);
      this.view.transform.colorTransform = this.ct;
   }
   function setNewGoalColour()
   {
      this.r0 += this.rDelta;
      this.g0 += this.gDelta;
      this.b0 += this.bDelta;
      var _loc3_ = 0;
      var _loc4_ = 0;
      var _loc2_ = 0;
      var _loc7_ = Math.random() * 60;
      var _loc8_ = _loc7_ % 1;
      var _loc5_ = Math.round(255 * (1 - _loc8_));
      var _loc6_ = Math.round(255 * _loc8_);
      switch(Math.floor(_loc7_) % 6)
      {
         case 0:
            _loc3_ = 255;
            _loc4_ = _loc6_;
            break;
         case 1:
            _loc3_ = _loc5_;
            _loc4_ = 255;
            break;
         case 2:
            _loc4_ = 255;
            _loc2_ = _loc6_;
            break;
         case 3:
            _loc4_ = _loc5_;
            _loc2_ = 255;
            break;
         case 4:
            _loc3_ = _loc6_;
            _loc2_ = 255;
            break;
         case 5:
            _loc3_ = 255;
            _loc2_ = _loc5_;
      }
      this.rDelta = _loc3_ - this.r0;
      this.gDelta = _loc4_ - this.g0;
      this.bDelta = _loc2_ - this.b0;
      this.t = 0;
   }
}
