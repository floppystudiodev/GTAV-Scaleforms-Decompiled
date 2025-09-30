class com.rockstargames.gtav.levelDesign.droneCam.SoundWave
{
   var numAvailableAmplitudes;
   var perlin;
   var perlinSeed;
   var updateArgs;
   var view;
   var waves;
   static var NUM_WAVES = 19;
   static var NUM_WAVES_LESS_ONE = com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVES - 1;
   static var NUM_WAVE_AMPLITUDES = 14;
   static var FRAME_DURATION = 0.03333333333333333;
   static var PERLIN_STEP = 0.1;
   function SoundWave(view, visible)
   {
      this.view = view;
      this.init();
      this.visible = visible;
   }
   function init()
   {
      this.perlin = new com.rockstargames.ui.utils.Perlin1D();
      this.perlinSeed = 0;
      this.numAvailableAmplitudes = 0;
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.waves = new Array(com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVES);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVES)
      {
         this.waves[_loc2_] = this.view.waves["sine" + _loc2_];
         this.applyPerlin(this.waves[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function set visible(isVisible)
   {
      this.view._visible = isVisible;
      if(isVisible)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.droneCam.SoundWave.FRAME_DURATION,this.updateArgs);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
   }
   function attenuate(scalar)
   {
      if(scalar < 0)
      {
         scalar = 0;
      }
      else if(scalar > 1)
      {
         scalar = 1;
      }
      this.numAvailableAmplitudes = Math.round(com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVE_AMPLITUDES * scalar);
   }
   function update()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVES_LESS_ONE)
      {
         _loc3_ = this.waves[_loc2_ + 1]._currentframe;
         if(_loc3_ > this.numAvailableAmplitudes + 1)
         {
            _loc3_ = _loc3_ - 1;
         }
         this.waves[_loc2_].gotoAndStop(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.applyPerlin(this.waves[com.rockstargames.gtav.levelDesign.droneCam.SoundWave.NUM_WAVES_LESS_ONE]);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.droneCam.SoundWave.FRAME_DURATION,this.updateArgs);
   }
   function applyPerlin(wave)
   {
      var _loc2_ = Math.round(1.25 * (this.perlin.getValue(this.perlinSeed) + 0.4) * this.numAvailableAmplitudes) + 1;
      wave.gotoAndStop(_loc2_);
      this.perlinSeed += com.rockstargames.gtav.levelDesign.droneCam.SoundWave.PERLIN_STEP;
   }
}
