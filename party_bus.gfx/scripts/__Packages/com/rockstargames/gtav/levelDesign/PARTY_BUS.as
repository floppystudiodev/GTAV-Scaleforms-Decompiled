class com.rockstargames.gtav.levelDesign.PARTY_BUS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var activeAnimation;
   var animationBeatCounter;
   var animations;
   var background;
   var beatTimestamp;
   var currAnimationStep;
   var height;
   var isManual;
   var lightBar;
   var strobeBeatCounter;
   var strobeBeatDuration;
   var strobeRate;
   var strobeTimestamp;
   var width;
   static var MIN_STROBE_RATE = 10;
   static var MAX_STROBE_RATE = 100;
   static var TEMPO_BPM = 120;
   static var BEAT_DURATION = 60000 / com.rockstargames.gtav.levelDesign.PARTY_BUS.TEMPO_BPM;
   static var BEATS_PER_ANIMATION = 64;
   static var MIN_STROBE_DURATION = 8;
   static var MAX_STROBE_DURATION = 32;
   static var MIN_STROBE_WAIT = 128;
   static var MAX_STROBE_WAIT = 256;
   function PARTY_BUS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.initLightBar();
      this.initAnimations();
      this.initStrobe();
      this.initBeat();
      this.lightBar.onEnterFrame = this.delegate(this,this.update);
      this.isManual = false;
      this.SHOW_ANIMATION(this.currAnimationStep,true);
   }
   function initLightBar()
   {
      var _loc2_ = this.CONTENT.attachMovie("lightBar","lightBar",this.CONTENT.getNextHighestDepth());
      this.background = new com.rockstargames.gtav.levelDesign.partyBus.GradientBackground(_loc2_);
      this.lightBar = _loc2_.createEmptyMovieClip("content",_loc2_.getNextHighestDepth());
      this.lightBar.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
      _loc2_.ledGrid.swapDepths(_loc2_.getNextHighestDepth());
      this.width = _loc2_._width;
      this.height = _loc2_._height;
   }
   function initAnimations()
   {
      this.animations = [];
      this.animations.push(new com.rockstargames.gtav.levelDesign.partyBus.Smileys(this.lightBar,this.width,this.height));
      this.animations.push(new com.rockstargames.gtav.levelDesign.partyBus.Grid(this.lightBar,this.width,this.height));
      this.animations.push(new com.rockstargames.gtav.levelDesign.partyBus.Dots(this.lightBar,this.width,this.height));
      this.animations.push(new com.rockstargames.gtav.levelDesign.partyBus.Swirls(this.lightBar,this.width,this.height));
      this.currAnimationStep = 0;
      this.animationBeatCounter = 0;
   }
   function initStrobe()
   {
      this.strobeRate = 0;
      this.strobeTimestamp = getTimer();
      this.strobeBeatCounter = 0;
      this.strobeBeatDuration = int(Math.random() * (com.rockstargames.gtav.levelDesign.PARTY_BUS.MAX_STROBE_WAIT - com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_WAIT) + com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_WAIT);
   }
   function initBeat()
   {
      this.beatTimestamp = getTimer();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function update()
   {
      this.background.update();
      this.activeAnimation.update();
      if(!this.isManual)
      {
         if(getTimer() - this.beatTimestamp > com.rockstargames.gtav.levelDesign.PARTY_BUS.BEAT_DURATION)
         {
            this.BEAT();
            this.beatTimestamp += com.rockstargames.gtav.levelDesign.PARTY_BUS.BEAT_DURATION;
         }
      }
      if(this.strobeRate > 0)
      {
         if(getTimer() - this.strobeTimestamp > this.strobeRate)
         {
            this.lightBar._visible = !this.lightBar._visible;
            this.strobeTimestamp += this.strobeRate;
         }
      }
   }
   function onHideComplete(index)
   {
      this.activeAnimation = this.animations[index];
      this.activeAnimation.show(false);
   }
   function SET_MANUAL_OVERRIDE(isManual)
   {
      this.isManual = isManual;
   }
   function SET_TEST_CARD(isShowing)
   {
      if(isShowing && this.CONTENT.testcard == undefined)
      {
         this.CONTENT.attachMovie("testcard","testcard",this.CONTENT.getNextHighestDepth());
      }
      else if(!isShowing && this.CONTENT.testcard != undefined)
      {
         this.CONTENT.testcard.removeMovieClip();
      }
   }
   function BEAT()
   {
      this.activeAnimation.beat();
      if(!this.isManual)
      {
         if(++this.animationBeatCounter == com.rockstargames.gtav.levelDesign.PARTY_BUS.BEATS_PER_ANIMATION)
         {
            this.animationBeatCounter = 0;
            this.currAnimationStep = (this.currAnimationStep + 1) % this.animations.length;
            this.SHOW_ANIMATION(this.currAnimationStep,true);
         }
         if(++this.strobeBeatCounter == this.strobeBeatDuration)
         {
            this.strobeBeatCounter = 0;
            if(this.strobeRate == 0)
            {
               this.STROBE(Math.random());
               this.strobeBeatDuration = int(Math.random() * (com.rockstargames.gtav.levelDesign.PARTY_BUS.MAX_STROBE_DURATION - com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_DURATION) + com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_DURATION);
            }
            else
            {
               this.STROBE(0);
               this.strobeBeatDuration = int(Math.random() * (com.rockstargames.gtav.levelDesign.PARTY_BUS.MAX_STROBE_WAIT - com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_WAIT) + com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_WAIT);
            }
         }
      }
   }
   function SHOW_ANIMATION(index, showImmediately)
   {
      if(showImmediately)
      {
         this.activeAnimation.hide(true);
         this.activeAnimation = this.animations[index];
         this.activeAnimation.show(true);
      }
      else
      {
         this.activeAnimation.hide(false,this,this.onHideComplete,arguments);
      }
   }
   function STROBE(normRate)
   {
      if(normRate <= 0)
      {
         this.strobeRate = 0;
         this.lightBar._visible = true;
      }
      else
      {
         this.strobeRate = (1 - Math.min(1,normRate)) * (com.rockstargames.gtav.levelDesign.PARTY_BUS.MAX_STROBE_RATE - com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_RATE) + com.rockstargames.gtav.levelDesign.PARTY_BUS.MIN_STROBE_RATE;
         this.strobeTimestamp = getTimer();
      }
   }
}
