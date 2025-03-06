class com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen extends com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var state;
   var view;
   var parallaxLayers;
   var horseContainer;
   var finishingLine;
   var app;
   var raceProgress;
   var raceDuration;
   var raceDistance;
   var postRaceOffset;
   var offset;
   var asyncOffset;
   var startTimestamp;
   var updateArgs;
   var raceFinishTimestamp;
   var HORSE_Y_MIN = 520;
   var HORSE_Y_MAX = 875;
   var HORSE_SCALE_MIN = 90;
   var HORSE_SCALE_MAX = 100;
   var PARALLAX_SPEED = 1;
   var UPDATE_INTERVAL = 0.03333333333333333;
   var OFFSET_INTERVAL = 30;
   var HORSE_X_GAP_MIN = 10;
   var HORSE_X_GAP_MAX = 250;
   var HORSE_X_GAP_RANGE = com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen.prototype.HORSE_X_GAP_MAX - com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen.prototype.HORSE_X_GAP_MIN;
   var TRACKING_X_MIN = 299.90000000000003;
   var TRACKING_X_MAX = 2699.1;
   var TRACKING_X_RANGE = com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen.prototype.TRACKING_X_MAX - com.rockstargames.gtav.minigames.horseracingwall.screens.RaceScreen.prototype.TRACKING_X_MIN;
   var STATE_PRE_RACE = 0;
   var STATE_RACING = 1;
   var STATE_FINISHING = 2;
   var STATE_COMPLETE = 3;
   function RaceScreen(app, viewContainer)
   {
      super(app,viewContainer,"raceScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initParallax();
      this.initHorses();
      this.initVignette();
      this.initRaceProgress();
      this.state = this.STATE_PRE_RACE;
   }
   function initParallax()
   {
      var _loc2_ = new com.rockstargames.gtav.minigames.horseracingwall.ParallaxLayer(this.view.parallax.frontLayer,1,900);
      var _loc3_ = new com.rockstargames.gtav.minigames.horseracingwall.ParallaxLayer(this.view.parallax.midLayer,0.75,1980);
      var _loc4_ = new com.rockstargames.gtav.minigames.horseracingwall.ParallaxLayer(this.view.parallax.backLayer,0.5,3005);
      this.parallaxLayers = [_loc2_,_loc3_,_loc4_];
   }
   function initHorses()
   {
      this.horseContainer = this.view.createEmptyMovieClip("horseContainer",this.view.getNextHighestDepth());
      this.finishingLine = this.horseContainer.attachMovie("finishingLine","finishingLine",this.horseContainer.getNextHighestDepth());
      this.finishingLine._x = com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH + this.finishingLine._width;
      var _loc6_ = this.app.horses.length;
      var _loc5_ = this.HORSE_Y_MIN;
      var _loc8_ = (this.HORSE_Y_MAX - this.HORSE_Y_MIN) / (_loc6_ - 1);
      var _loc4_ = this.HORSE_SCALE_MIN;
      var _loc7_ = (this.HORSE_SCALE_MAX - this.HORSE_SCALE_MIN) / (_loc6_ - 1);
      var _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         var _loc2_ = this.horseContainer.attachMovie("horse","horse" + _loc3_,this.horseContainer.getNextHighestDepth());
         _loc2_._x = 0;
         _loc2_._y = _loc5_;
         _loc2_._xscale = _loc4_;
         _loc2_._yscale = _loc4_;
         this.app.horses[_loc3_].init(_loc2_,false);
         _loc5_ += _loc8_;
         _loc4_ += _loc7_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function initVignette()
   {
      this.view.attachMovie("vignette","vignette",this.view.getNextHighestDepth());
   }
   function initRaceProgress()
   {
      var _loc2_ = this.view.attachMovie("raceProgress","raceProgress",this.view.getNextHighestDepth());
      this.raceProgress = new com.rockstargames.gtav.minigames.horseracingwall.RaceProgress(_loc2_,this.app.horses,this.app);
      _loc2_._x = 0.5 * (com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH - _loc2_._width);
      _loc2_._y = 20;
   }
   function startRace(duration, seed, firstHorse, secondHorse, thirdHorse, fourthHorse, fifthHorse, sixthHorse, offset, sync)
   {
      this.raceDuration = duration;
      this.raceDistance = duration * this.PARALLAX_SPEED;
      this.finishingLine._x = this.raceDistance;
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setRandomSeed(seed);
      this.app.winOrder.length = 0;
      var _loc8_ = this.raceDistance;
      var _loc3_ = 2;
      while(_loc3_ < 8)
      {
         var _loc6_ = arguments[_loc3_] - 1;
         var _loc7_ = this.app.horses[_loc6_];
         if(_loc7_)
         {
            this.app.winOrder.push(_loc6_);
            _loc7_.start(_loc8_,this.raceDuration);
            _loc8_ -= Math.floor(com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.rnd() * this.HORSE_X_GAP_RANGE + this.HORSE_X_GAP_MIN);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.parallaxLayers.length)
      {
         this.parallaxLayers[_loc3_].animate(this.PARALLAX_SPEED);
         _loc3_ = _loc3_ + 1;
      }
      this.state = this.STATE_RACING;
      this.postRaceOffset = 0;
      if(offset > 0)
      {
         if(offset > this.raceDuration)
         {
            offset = this.raceDuration;
         }
         if(sync !== true)
         {
            _loc3_ = 0;
            while(_loc3_ < this.parallaxLayers.length)
            {
               this.parallaxLayers[_loc3_].killAcceleration();
               this.parallaxLayers[_loc3_].update(offset);
               _loc3_ = _loc3_ + 1;
            }
            this.offset = offset;
            this.asyncOffset = this.OFFSET_INTERVAL;
            this.updateAsyncOffset();
            return undefined;
         }
         var _loc4_ = this.OFFSET_INTERVAL;
         do
         {
            if(_loc4_ > offset)
            {
               _loc4_ = offset;
            }
            this.updateOffset(_loc4_);
            _loc4_ += this.OFFSET_INTERVAL;
         }
         while(_loc4_ < offset);
         
         this.startTimestamp = getTimer() - offset;
      }
      else
      {
         this.startTimestamp = getTimer();
      }
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.update();
   }
   function updateAsyncOffset()
   {
      var _loc2_ = 0;
      while(_loc2_ < 75)
      {
         if(this.asyncOffset > this.offset)
         {
            this.asyncOffset = this.offset;
         }
         this.updateHorses(this.asyncOffset / this.raceDuration);
         if(this.asyncOffset == this.offset)
         {
            this.startTimestamp = getTimer() - this.offset;
            this.updateArgs = {onCompleteScope:this,onComplete:this.update};
            this.update();
            return undefined;
         }
         this.asyncOffset += this.OFFSET_INTERVAL;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,this.UPDATE_INTERVAL,{onCompleteScope:this,onComplete:this.updateAsyncOffset});
   }
   function updateOffset(dt)
   {
      var _loc2_ = dt / this.raceDuration;
      this.updateHorses(_loc2_);
      if(this.state != this.STATE_FINISHING)
      {
         this.updateParallax(dt);
      }
   }
   function update()
   {
      var _loc3_ = getTimer() - this.startTimestamp;
      var _loc2_ = _loc3_ / this.raceDuration;
      this.updateHorses(_loc2_);
      this.raceProgress.update(_loc2_,this.app.horses);
      if(this.state != this.STATE_FINISHING)
      {
         this.updateParallax(_loc3_);
      }
      if(this.state != this.STATE_COMPLETE)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,this.UPDATE_INTERVAL,this.updateArgs);
      }
   }
   function updateHorses(normElapsed)
   {
      var _loc5_ = 0;
      var _loc6_ = 1.7976931348623157e+308;
      var _loc8_ = 0;
      var _loc4_ = false;
      var _loc7_ = this.app.horses.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         var _loc2_ = this.app.horses[_loc3_];
         _loc4_ = _loc2_.update(normElapsed,this.postRaceOffset) || _loc4_;
         if(_loc2_.view._x > _loc5_)
         {
            _loc5_ = _loc2_.view._x;
         }
         if(_loc2_.view._x < _loc6_)
         {
            _loc6_ = _loc2_.view._x;
         }
         _loc8_ += _loc2_.view._x;
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_)
      {
         this.state = this.STATE_COMPLETE;
         this.initPhotoFinish();
      }
      if(this.state == this.STATE_RACING)
      {
         var _loc12_ = normElapsed * this.TRACKING_X_RANGE + this.TRACKING_X_MIN;
         var _loc10_ = _loc8_ / _loc7_;
         var _loc11_ = normElapsed * (_loc5_ - _loc10_) + _loc10_;
         this.horseContainer._x = _loc12_ - _loc11_;
      }
   }
   function updateParallax(elapsed)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.parallaxLayers.length)
      {
         this.parallaxLayers[_loc2_].update(elapsed);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initPhotoFinish()
   {
      this.view.attachMovie("whiteFlash","whiteFlash",this.view.getNextHighestDepth());
      com.rockstargames.gtav.minigames.horseracingwall.HORSE_RACING_WALL.setSpacedText(this.view.whiteFlash.label,"HORSEGAME_PHOTO",1.5,true,false);
      this.raceProgress.hide();
      this.stopHorses();
      this.raceFinishTimestamp = getTimer();
   }
   function isComplete()
   {
      return this.state == this.STATE_COMPLETE && getTimer() - this.raceFinishTimestamp > com.rockstargames.gtav.minigames.horseracingwall.screens.FinishScreen.DURATION;
   }
   function stopHorses()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.app.horses.length)
      {
         var _loc2_ = this.app.horses[_loc3_].view;
         for(var _loc4_ in _loc2_)
         {
            _loc2_[_loc4_].stop();
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getHorsePositions()
   {
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.app.horses.length)
      {
         _loc3_.push({x:this.app.horses[_loc2_].x,num:this.app.horses[_loc2_].number});
         _loc2_ = _loc2_ + 1;
      }
      _loc3_.sortOn("x",Array.NUMERIC | Array.DESCENDING);
      var _loc4_ = 1;
      var _loc7_ = 0;
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc7_ += _loc3_[_loc2_].num * _loc4_;
         _loc4_ *= 10;
         _loc2_ = _loc2_ + 1;
      }
      return _loc7_;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      var _loc3_ = 0;
      while(_loc3_ < this.parallaxLayers.length)
      {
         this.parallaxLayers[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      this.parallaxLayers = null;
      _loc3_ = 0;
      while(_loc3_ < this.app.horses.length)
      {
         this.app.horses[_loc3_].reset();
         _loc3_ = _loc3_ + 1;
      }
      this.raceProgress.dispose();
      this.raceProgress = null;
      this.updateArgs = null;
      this.horseContainer = null;
      this.finishingLine = null;
      super.dispose();
   }
}
