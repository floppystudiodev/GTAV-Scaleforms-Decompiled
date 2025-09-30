class com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var app;
   var cursor;
   var finishingLine;
   var horseContainer;
   var parallaxLayers;
   var postRaceOffset;
   var raceDistance;
   var raceDuration;
   var raceProgress;
   var startTimestamp;
   var state;
   var trackingXMax;
   var trackingXMin;
   var trackingXRange;
   var updateArgs;
   var view;
   var HORSE_Y_MIN = 476;
   var HORSE_Y_MAX = 710;
   var HORSE_SCALE_MIN = 90;
   var HORSE_SCALE_MAX = 100;
   var PARALLAX_SPEED = 1;
   var UPDATE_INTERVAL = 0.03333333333333333;
   var OFFSET_INTERVAL = 30;
   var HORSE_X_GAP_MIN = 10;
   var HORSE_X_GAP_MAX = 250;
   var HORSE_X_GAP_RANGE = com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen.prototype.HORSE_X_GAP_MAX - com.rockstargames.gtav.minigames.horseracingconsole.screens.RaceScreen.prototype.HORSE_X_GAP_MIN;
   var STATE_PRE_RACE = 0;
   var STATE_RACING = 1;
   var STATE_FINISHING = 2;
   var STATE_COMPLETE = 3;
   function RaceScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"raceScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.initParallax();
      this.initHorses();
      this.initVignette();
      this.initRaceProgress();
      var _loc4_ = Math.max(0.1,this.app.displayConfig.safeLeft);
      var _loc3_ = Math.min(0.8,this.app.displayConfig.safeRight);
      this.trackingXMin = _loc4_ * this.app.displayConfig.screenWidth;
      this.trackingXMax = _loc3_ * this.app.displayConfig.screenWidth;
      this.trackingXRange = this.trackingXMax - this.trackingXMin;
      this.cursor.hide();
      this.state = this.STATE_PRE_RACE;
   }
   function initParallax()
   {
      var _loc2_ = new com.rockstargames.gtav.minigames.horseracingconsole.ParallaxLayer(this.view.parallax.frontLayer,1,900);
      var _loc3_ = new com.rockstargames.gtav.minigames.horseracingconsole.ParallaxLayer(this.view.parallax.midLayer,0.75,1980);
      var _loc4_ = new com.rockstargames.gtav.minigames.horseracingconsole.ParallaxLayer(this.view.parallax.backLayer,0.5,3005);
      this.parallaxLayers = [_loc2_,_loc3_,_loc4_];
   }
   function initHorses()
   {
      this.horseContainer = this.view.createEmptyMovieClip("horseContainer",this.view.getNextHighestDepth());
      this.finishingLine = this.horseContainer.attachMovie("finishingLine","finishingLine",this.horseContainer.getNextHighestDepth());
      this.finishingLine._x = com.rockstargames.gtav.minigames.horseracingconsole.Screen.CONSOLE_WIDTH + this.finishingLine._width;
      var _loc6_ = this.app.horses.length;
      var _loc5_ = this.HORSE_Y_MIN;
      var _loc8_ = (this.HORSE_Y_MAX - this.HORSE_Y_MIN) / (_loc6_ - 1);
      var _loc4_ = this.HORSE_SCALE_MIN;
      var _loc7_ = (this.HORSE_SCALE_MAX - this.HORSE_SCALE_MIN) / (_loc6_ - 1);
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.horseContainer.attachMovie("horse","horse" + _loc3_,this.horseContainer.getNextHighestDepth());
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
      this.raceProgress = new com.rockstargames.gtav.minigames.horseracingconsole.RaceProgress(_loc2_,this.app.horses,!this.app.isSingleRace ? this.app.mainSelectedHorseIndex : this.app.singleSelectedHorseIndex);
      _loc2_._x = 0.5 * (com.rockstargames.gtav.minigames.horseracingconsole.Screen.CONSOLE_WIDTH - _loc2_._width);
      _loc2_._y = 20;
   }
   function startRace(duration, seed, firstHorse, secondHorse, thirdHorse, fourthHorse, fifthHorse, sixthHorse, offset)
   {
      this.raceDuration = duration;
      this.raceDistance = duration * this.PARALLAX_SPEED;
      this.finishingLine._x = this.raceDistance;
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setRandomSeed(seed);
      this.app.winOrder.length = 0;
      var _loc8_ = this.raceDistance;
      var _loc4_ = 2;
      var _loc5_;
      var _loc6_;
      while(_loc4_ < 8)
      {
         _loc5_ = arguments[_loc4_] - 1;
         _loc6_ = this.app.horses[_loc5_];
         if(_loc6_)
         {
            this.app.winOrder.push(_loc5_);
            _loc6_.start(_loc8_,this.raceDuration);
            _loc8_ -= Math.floor(com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.rnd() * this.HORSE_X_GAP_RANGE + this.HORSE_X_GAP_MIN);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < this.parallaxLayers.length)
      {
         this.parallaxLayers[_loc4_].animate(this.PARALLAX_SPEED);
         _loc4_ = _loc4_ + 1;
      }
      this.state = this.STATE_RACING;
      this.postRaceOffset = 0;
      var _loc3_;
      if(offset > 0)
      {
         if(offset > this.raceDuration)
         {
            offset = this.raceDuration;
         }
         _loc3_ = this.OFFSET_INTERVAL;
         do
         {
            if(_loc3_ > offset)
            {
               _loc3_ = offset;
            }
            this.updateOffset(_loc3_);
            _loc3_ += this.OFFSET_INTERVAL;
         }
         while(_loc3_ < offset);
         
         this.startTimestamp = getTimer() - offset;
      }
      else
      {
         this.startTimestamp = getTimer();
      }
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.update();
      this.app.playSound("race_start");
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
      var _loc2_;
      while(_loc3_ < _loc7_)
      {
         _loc2_ = this.app.horses[_loc3_];
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
         this.grabPhotoFinish();
         this.stopRace();
      }
      var _loc12_;
      var _loc10_;
      var _loc11_;
      if(this.state == this.STATE_RACING)
      {
         _loc12_ = normElapsed * this.trackingXRange + this.trackingXMin;
         _loc10_ = _loc8_ / _loc7_;
         _loc11_ = normElapsed * (_loc5_ - _loc10_) + _loc10_;
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
   function grabPhotoFinish()
   {
      this.app.photoFinish = {parallax:{},horses:{}};
      this.grabPhotoFinishElement(this.app.photoFinish.parallax,this.view.parallax);
      this.grabPhotoFinishElement(this.app.photoFinish.horses,this.horseContainer);
   }
   function grabPhotoFinishElement(photoFinish, element)
   {
      photoFinish.name = element._name;
      photoFinish.x = element._x;
      photoFinish.y = element._y;
      photoFinish.frame = element._currentframe;
      photoFinish.xScale = element._xscale;
      photoFinish.yScale = element._yscale;
      photoFinish.children = [];
      var _loc3_;
      for(var _loc5_ in element)
      {
         if(element[_loc5_] instanceof MovieClip)
         {
            _loc3_ = {};
            this.grabPhotoFinishElement(_loc3_,element[_loc5_]);
            photoFinish.children.push(_loc3_);
         }
      }
   }
   function stopRace()
   {
      this.app.showScreen(this.app.FINISH_SCREEN);
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
