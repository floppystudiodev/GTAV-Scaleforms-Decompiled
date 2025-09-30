class com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var faderStep;
   var faderStepTimestamp;
   var faders;
   var meters;
   var noise;
   var playTimestamp;
   var state;
   var updateArgs;
   var waveform;
   static var STATE_NULL = -1;
   static var STATE_OFF = 0;
   static var STATE_EDIT = 1;
   static var STATE_PLAY = 2;
   static var SEGS = [119,36,93,109,46,107,123,37,127,111];
   static var NUM_SEGMENTS = 7;
   static var NUM_FADERS = 9;
   static var NUM_LEDS = 30;
   static var NUM_METERS = 13;
   static var NUM_ACTIVE_METERS_WHEN_PLAYING = 6;
   static var NUM_ACTIVE_FADERS_WHEN_PLAYING = [3,1,4];
   static var NUM_ACTIVE_FADERS_WHEN_EDITING = [1,0];
   static var FADER_STEP_DURATION = 5000;
   static var FRAME_DURATION = 0.03333333333333333;
   function MUSIC_STUDIO_MONITOR()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "MUSIC_STUDIO_MONITOR";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.state = com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_NULL;
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.noise = new com.rockstargames.ui.utils.Perlin1D();
      this.meters = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_METERS)
      {
         this.meters.push(new com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter(this.CONTENT["meter" + _loc2_]));
         _loc2_ = _loc2_ + 1;
      }
      this.faders = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_FADERS)
      {
         this.faders.push(new com.rockstargames.gtav.levelDesign.musicStudioMonitor.Fader(this.CONTENT["fader" + _loc2_]));
         _loc2_ = _loc2_ + 1;
      }
      this.waveform = new com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform(this.CONTENT.waveform,this.CONTENT.leftWaveformOverlay,this.CONTENT.rightWaveformOverlay);
      this.setTime(0);
      this.SET_STATE(0);
      this.update();
   }
   function SET_STATE(state)
   {
      if(this.state != state)
      {
         this.state = state;
         switch(state)
         {
            case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_OFF:
               this.waveform.stopEdit();
               break;
            case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_EDIT:
               this.faderStepTimestamp = getTimer();
               this.faderStep = 0;
               this.waveform.startEdit();
               this.shuffleArray(this.faders);
               break;
            case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_PLAY:
               this.faderStepTimestamp = getTimer();
               this.faderStep = 0;
               this.playTimestamp = getTimer();
               this.waveform.stopEdit();
               this.shuffleArray(this.meters);
               this.shuffleArray(this.faders);
            default:
               return;
         }
      }
   }
   function update()
   {
      switch(this.state)
      {
         case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_OFF:
            this.dampMeters();
            break;
         case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_EDIT:
            this.dampMeters();
            this.waveform.updateEdit();
            this.updateFaders(com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_ACTIVE_FADERS_WHEN_EDITING[this.faderStep % com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_ACTIVE_FADERS_WHEN_EDITING.length]);
            this.updateLEDs(0.05);
            break;
         case com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.STATE_PLAY:
            this.setTime(getTimer() - this.playTimestamp);
            this.waveform.updatePlayback();
            this.updateMeters(com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_ACTIVE_METERS_WHEN_PLAYING);
            this.updateFaders(com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_ACTIVE_FADERS_WHEN_PLAYING[this.faderStep % com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_ACTIVE_FADERS_WHEN_PLAYING.length]);
            this.updateLEDs(0.01);
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.FRAME_DURATION,this.updateArgs);
   }
   function setTime(milliseconds)
   {
      milliseconds = this.clamp(milliseconds,0,milliseconds);
      var _loc2_ = this.CONTENT.timeDisplay;
      var _loc3_ = Math.floor(milliseconds / 1000);
      var _loc5_ = Math.floor(_loc3_ / 60);
      _loc3_ %= 60;
      this.setSegment(_loc2_.segment0,Math.floor(milliseconds / 10) % 10);
      this.setSegment(_loc2_.segment1,Math.floor(milliseconds / 100) % 10);
      this.setSegment(_loc2_.segment2,_loc3_ % 10);
      this.setSegment(_loc2_.segment3,Math.floor(_loc3_ / 10) % 10);
      this.setSegment(_loc2_.segment4,_loc5_ % 10);
      this.setSegment(_loc2_.segment5,Math.floor(_loc5_ / 10) % 10);
   }
   function setSegment(segment, digit)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.SEGS[digit];
      var _loc1_ = 0;
      while(_loc1_ < com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_SEGMENTS)
      {
         segment["seg" + _loc1_]._visible = _loc2_ & 1 << _loc1_;
         _loc1_ = _loc1_ + 1;
      }
   }
   function updateLEDs(rate)
   {
      var _loc2_;
      var _loc3_;
      if(Math.random() < rate)
      {
         _loc2_ = Math.floor(Math.random() * com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_LEDS);
         _loc3_ = Math.floor(Math.random() * 3);
         this.CONTENT["led" + _loc2_].gotoAndStop(_loc3_ + 1);
      }
   }
   function updateFaders(updateThreshold)
   {
      var _loc2_ = 0;
      while(_loc2_ < updateThreshold)
      {
         this.faders[_loc2_].update(this.noise);
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = getTimer();
      if(_loc4_ - this.faderStepTimestamp > com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.FADER_STEP_DURATION)
      {
         this.faderStepTimestamp = _loc4_;
         this.faderStep = this.faderStep + 1;
         this.shuffleArray(this.faders);
      }
   }
   function updateMeters(updateThreshold)
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.MUSIC_STUDIO_MONITOR.NUM_METERS)
      {
         if(_loc2_ < updateThreshold)
         {
            this.meters[_loc2_].update(this.noise);
         }
         else
         {
            this.meters[_loc2_].damp();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function dampMeters()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.meters.length)
      {
         this.meters[_loc2_].damp();
         _loc2_ = _loc2_ + 1;
      }
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
   function shuffleArray(a)
   {
      var _loc4_ = a.length - 1;
      var _loc1_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc1_ < _loc4_)
      {
         _loc3_ = Math.random() * (_loc4_ - _loc1_) + _loc1_ + 1;
         _loc2_ = a.splice(_loc3_,1)[0];
         a.splice(_loc1_,0,_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
}
