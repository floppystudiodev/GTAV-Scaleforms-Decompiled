class com.rockstargames.gtav.levelDesign.musicStudioMonitor.Fader
{
   var view;
   var value;
   var noiseSamplePoint;
   static var NOISE_SAMPLE_STEP = 0.001;
   static var NOISE_SCALAR = 3;
   static var DAMPING = 0.3;
   function Fader(view)
   {
      this.view = view;
      this.value = 0;
      this.noiseSamplePoint = Math.random();
   }
   function update(noise)
   {
      var _loc2_ = Math.abs(noise.getValue(this.noiseSamplePoint));
      this.noiseSamplePoint += com.rockstargames.gtav.levelDesign.musicStudioMonitor.Fader.NOISE_SAMPLE_STEP;
      _loc2_ *= com.rockstargames.gtav.levelDesign.musicStudioMonitor.Fader.NOISE_SCALAR;
      _loc2_ = this.clamp(_loc2_,0,1);
      this.view.handle._y += com.rockstargames.gtav.levelDesign.musicStudioMonitor.Fader.DAMPING * (_loc2_ * this.view.track._height - this.view.handle._y);
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
}
