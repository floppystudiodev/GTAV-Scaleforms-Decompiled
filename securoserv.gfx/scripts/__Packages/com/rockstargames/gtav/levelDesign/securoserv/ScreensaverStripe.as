class com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe
{
   var view;
   var amplitude;
   var numSteps;
   var step;
   static var MAX_HEIGHT = 256;
   static var MAX_ALPHA = 7;
   function ScreensaverStripe(view)
   {
      this.view = view;
   }
   function init()
   {
      this.view.stripe1._alpha = 0;
      this.view.stripe2._alpha = 0;
      this.view.stripe1._y = 0;
      this.view.stripe2._y = 0;
      this.view._y = Math.random() * 60 + 300;
      this.amplitude = Math.random() * 320 + 160;
      this.numSteps = int(Math.random() * 160 + 80);
      this.step = 0;
      this.view._visible = true;
   }
   function update()
   {
      var _loc5_ = Math.sin(3.141592653589793 * this.step / this.numSteps);
      var _loc4_ = this.amplitude * _loc5_;
      var _loc2_ = com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe.MAX_HEIGHT - com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe.MAX_HEIGHT * _loc5_ + 1;
      var _loc3_ = com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe.MAX_ALPHA * (1 - _loc2_ / com.rockstargames.gtav.levelDesign.securoserv.ScreensaverStripe.MAX_HEIGHT);
      this.view.stripe1._y = _loc4_;
      this.view.stripe1._height = _loc2_;
      this.view.stripe1._alpha = _loc3_;
      this.view.stripe2._y = - _loc4_;
      this.view.stripe2._height = _loc2_;
      this.view.stripe2._alpha = _loc3_;
      if(++this.step == this.numSteps)
      {
         this.view._visible = false;
         return true;
      }
      return false;
   }
   function getState()
   {
      return {amplitude:this.amplitude,numSteps:this.numSteps,step:this.step,y:this.view._y};
   }
   function setState(state)
   {
      this.amplitude = state.amplitude;
      this.numSteps = state.numSteps;
      this.step = state.step;
      this.view._y = state.y;
      this.view._visible = true;
   }
}
