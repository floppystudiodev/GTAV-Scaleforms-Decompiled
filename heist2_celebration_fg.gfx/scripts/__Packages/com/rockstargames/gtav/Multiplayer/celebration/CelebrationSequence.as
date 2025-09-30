class com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence
{
   var background;
   var backgroundColour;
   var backgroundContainer;
   var backgroundTween;
   var currentStep;
   var displayConfig;
   var finalTweenOutStarted;
   var firstTweenOutComplete;
   var movieId;
   var sequenceTypeBit;
   var steps;
   var stepsContainer;
   var stepsTween;
   var syncClearCallback;
   var syncedMovies;
   var view;
   static var SPEED_MULTIPLIER = 1;
   static var SCREEN_WIDTH = 1280;
   static var SCREEN_HEIGHT = 720;
   var DEFAULT_TEXT_ALPHA = 100;
   var DEFAULT_GRAPHICS_VISIBILITY = true;
   var IS_CUTOUT = false;
   var USE_COLOUR = true;
   static var IS_ASIAN = false;
   static var IS_WIDESCREEN = true;
   static var SOUNDSET = "";
   static var DEFAULT_PUSHDOWN_DURATION = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.333;
   static var POINTS_COUNT_DURATION = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.5;
   static var POST_POINTS_COUNT_PAUSE = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 2;
   static var POST_STEP_PAUSE = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 1.5;
   static var FRAME_RATE = 30;
   static var ONE_FRAME = 1 / com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.FRAME_RATE;
   static var BACKGROUND_READY = 0;
   static var BACKGROUND_START_TWEEN_IN = 1;
   static var BACKGROUND_FINISH_TWEEN_IN = 2;
   static var BACKGROUND_START_TWEEN_OUT = 3;
   static var BACKGROUND_HALFWAY_TWEEN_OUT = 4;
   static var BACKGROUND_FINISH_TWEEN_OUT = 5;
   static var COMPLETE_MESSAGE_SHOWN = 6;
   static var NUM_MOVIES_TO_SYNC = 1;
   static var MOVIE_BIT_MATCH = (1 << com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.NUM_MOVIES_TO_SYNC) - 1;
   function CelebrationSequence(container, backgroundColour, displayConfig, sfxId, movieId, sequenceTypeBit)
   {
      this.backgroundColour = backgroundColour;
      this.displayConfig = displayConfig;
      this.movieId = movieId;
      this.sequenceTypeBit = sequenceTypeBit;
      this.init(container,sfxId);
   }
   function init(container, sfxId)
   {
      this.view = container.createEmptyMovieClip("sequenceMC",container.getNextHighestDepth());
      this.backgroundContainer = this.view.createEmptyMovieClip("backgroundMC",0);
      this.stepsContainer = this.view.createEmptyMovieClip("stepsMC",1);
      this.steps = [];
      com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_ASIAN = this.displayConfig.isAsian;
      com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN = this.displayConfig.isWideScreen;
      com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET = new Array("","DLC_HEISTS_PREP_SCREEN_SOUNDS","DLC_HEISTS_FAILED_SCREEN_SOUNDS","DLC_HEISTS_FINALE_SCREEN_SOUNDS")[sfxId];
      this.finalTweenOutStarted = false;
      this.firstTweenOutComplete = false;
      this.syncedMovies = 0;
      this.setGlobalFlag(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.BACKGROUND_READY);
   }
   function addBackground(alpha, sideTextureId)
   {
      this.background = new com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground(this.backgroundContainer,this.backgroundColour,alpha,sideTextureId);
   }
   function addStep(step)
   {
      this.steps.push(step);
   }
   function removeStep(step)
   {
      var _loc2_ = this.steps.length - 1;
      while(_loc2_ >= 0)
      {
         if(this.steps[_loc2_] == step)
         {
            this.steps.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ - 1;
      }
   }
   function getStepById(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.steps.length)
      {
         if(this.steps[_loc2_].id == id)
         {
            return this.steps[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function start()
   {
      this.currentStep = 0;
      var _loc2_ = - this.steps[0].height - this.stepsContainer._y - Math.abs(com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA);
      this.steps[0].init(this.stepsContainer,_loc2_);
      this.steps[0].start();
      this.playSound("Initial_Blade_Slide_On",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
   }
   function pushDownSteps(deltaY, duration)
   {
      var _loc2_ = this.stepsContainer._y + deltaY;
      this.stepsTween = com.rockstargames.ui.tweenStar.TweenStarLite.to(this.stepsContainer,duration,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.pushDownComplete,onCompleteScope:this});
   }
   function pushDownComplete()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.steps.length)
      {
         if(!this.steps[_loc2_].finished)
         {
            if(this.steps[_loc2_].view._y + this.stepsContainer._y > com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT)
            {
               this.steps[_loc2_].finish();
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!this.firstTweenOutComplete)
      {
         this.firstTweenOutComplete = true;
      }
      if(this.finalTweenOutStarted)
      {
         this.finalTweenOutStarted = false;
         this.setGlobalFlag(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.BACKGROUND_FINISH_TWEEN_OUT);
      }
   }
   function pushDownBackground(deltaY, duration)
   {
      var _loc2_ = this.backgroundContainer._y + deltaY;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.backgroundTween.target);
      this.backgroundTween = com.rockstargames.ui.tweenStar.TweenStarLite.to(this.backgroundContainer,duration,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
   }
   function setBackgroundY(y)
   {
      this.backgroundContainer._y = y;
   }
   function currentStepComplete()
   {
      this.syncPointReached(this.createDelegate(this,this.nextStep));
   }
   function nextStep()
   {
      var _loc2_;
      if(this.currentStep < this.steps.length - 1)
      {
         _loc2_ = this.steps[this.currentStep].view._y;
         this.currentStep = this.currentStep + 1;
         _loc2_ -= this.steps[this.currentStep].height;
         this.steps[this.currentStep].init(this.stepsContainer,_loc2_);
         this.steps[this.currentStep].start();
      }
      else
      {
         this.finalTweenOutStarted = true;
         this.pushDownSteps(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT - com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
         this.pushDownBackground(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT - com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
         this.playSound("Final_Blade_Slide_Off",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
      }
   }
   function get previousStep()
   {
      return this.steps[this.currentStep - 1];
   }
   function playSound(soundName, libName)
   {
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,libName);
   }
   function setGlobalFlag(id)
   {
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,id);
   }
   function syncPointReached(syncClearCallback)
   {
      this.syncClearCallback = syncClearCallback;
      if(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.NUM_MOVIES_TO_SYNC > 1)
      {
         com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST2_CELEBRATION_BG","registerSyncedMovie",[this.movieId,this.sequenceTypeBit]);
      }
      else
      {
         this.syncPointClear();
      }
   }
   function registerSyncedMovie(sequenceTypeBit)
   {
      this.syncedMovies |= sequenceTypeBit;
      var _loc2_ = (com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.MOVIE_BIT_MATCH & this.syncedMovies) == com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.MOVIE_BIT_MATCH;
      if(_loc2_)
      {
         this.syncedMovies = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.notifyAllSynced});
      }
   }
   function notifyAllSynced()
   {
      com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST2_CELEBRATION_BG","syncPointClear",[this.movieId]);
      com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST2_CELEBRATION_FG","syncPointClear",[this.movieId]);
      com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST2_CELEBRATION","syncPointClear",[this.movieId]);
   }
   function syncPointClear()
   {
      if(this.syncClearCallback)
      {
         this.syncClearCallback();
         this.syncClearCallback = null;
      }
   }
   function createDelegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
   function dispose()
   {
      var _loc2_ = 0;
      var _loc3_ = this.steps.length;
      while(_loc2_ < _loc3_)
      {
         this.steps[_loc2_].finish();
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.stepsTween.target);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.backgroundTween.target);
   }
}
