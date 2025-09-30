class com.rockstargames.gtav.levelDesign.VAULT_LASER extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var activeDisc;
   var currTemperature;
   var device;
   var discHighlightPosition;
   var discs;
   var discsComplete;
   var displayConfig;
   var displayYOffset;
   var drillYMax;
   var drillYMin;
   var frontDiscs;
   var isWithdrawing;
   var laserIsVisible;
   var laserTipY;
   var noise;
   var noiseStep;
   var numDiscs;
   var overheats;
   var updateArgs;
   static var TEMPERATURE_MIN = 68;
   static var TEMPERATURE_MAX = 960;
   static var MAX_NUM_DISCS = 6;
   static var SPEED_STEP_MIN = 0;
   static var SPEED_STEP_MAX = 15;
   static var FRAME_DURATION = 0.03333333333333333;
   static var SPARKS_MIN_SCALE = 5;
   static var SPARKS_MAX_SCALE = 100;
   static var SPARKS_BURST_SCALE = 180;
   static var SPARKS_FADE_IN_DURATION = 0.1;
   static var SPARKS_FADE_OUT_DURATION = 0.3;
   static var SPARKS_BURST_DURATION = 0.45;
   static var DRILL_TEMPERATURE_INCREASE_EASING = 0.1;
   static var DRILL_TEMPERATURE_DECREASE_EASING = 0.01;
   static var DISC_COMPLETE_FADE_DOWN_DURATION = 1.5;
   static var DISC_COMPLETE_FADE_DOWN_ALPHA = 50;
   static var DISC_HIGHLIGHT_PRE_REVEAL_DELAY = 0.5;
   static var DISC_HIGHLIGHT_FLASH_ON_DURATION = 0.3;
   static var DISC_HIGHLIGHT_FLASH_OFF_DURATION = 0.17;
   static var DISPLAY_Y_OFFSET_START = 0.2;
   static var DISPLAY_Y_OFFSET_END = 0.8;
   static var DISPLAY_Y_OFFSETS = [0,0,0,0,30,100,150];
   static var LASER_WIDE_SCALE = 125;
   static var LASER_NARROW_SCALE = 50;
   static var LASER_WIDE_TWEEN_DURATION = 1;
   static var LASER_WITHDRAW_TWEEN_DURATION = 0.25;
   static var LASER_BREAKTHROUGH_TWEEN_DURATION = 0.25;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var DEVICE_HALF_WIDTH = 162;
   static var DEVICE_HALF_HEIGHT = 214;
   static var DISPLAY_BASE_POSITION = new flash.geom.Point(0,0);
   static var DISC_ENTER_POSITIONS = [276,216,156,96,36,-24];
   static var DISC_EXIT_POSITIONS = [249,189,129,69,9,-51];
   static var DRILL_Y_MIN_POSITION = 320;
   static var DRILL_Y_MAX_POSITIONS = [114,114,114,54,-6,-66];
   static var DISC_HIGHLIGHT_X = 63;
   static var LASER_TIP_FINAL_Y = 40;
   function VAULT_LASER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.device = this.CONTENT.attachMovie("device","device",this.CONTENT.getNextHighestDepth());
      this.SET_POSITION(1,1);
      this.showNumber(com.rockstargames.gtav.levelDesign.VAULT_LASER.TEMPERATURE_MAX,this.device.meter.maxTemp);
      this.showNumber(com.rockstargames.gtav.levelDesign.VAULT_LASER.TEMPERATURE_MIN,this.device.meter.minTemp);
      this.noise = new com.rockstargames.ui.utils.Perlin1D();
      this.noiseStep = 0;
      this.drillYMin = com.rockstargames.gtav.levelDesign.VAULT_LASER.DRILL_Y_MIN_POSITION;
      this.discHighlightPosition = new flash.geom.Point(com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_HIGHLIGHT_X,0);
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.discs = new Array(com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS);
      this.frontDiscs = new Array(com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS);
      this.overheats = new Array(com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS);
      this.discsComplete = new Array(com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS);
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS)
      {
         this.discs[_loc3_] = this.device.display.discs["disc" + (_loc3_ + 1)];
         this.frontDiscs[_loc3_] = this.device.display.frontDiscs["disc" + (_loc3_ + 1)];
         this.overheats[_loc3_] = this.device.display.overheats["overheat" + (_loc3_ + 1)];
         _loc3_ = _loc3_ + 1;
      }
      this.RESET();
      this.update();
   }
   function SET_POSITION(normX, normY)
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.STAGE_WIDTH * this.displayConfig.safeLeft + com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_WIDTH;
      var _loc5_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.STAGE_WIDTH * this.displayConfig.safeRight - com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_WIDTH;
      var _loc2_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.STAGE_HEIGHT * this.displayConfig.safeTop + com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_HEIGHT;
      var _loc4_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.STAGE_HEIGHT * this.displayConfig.safeBottom - com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_HEIGHT;
      var _loc7_ = normX * (_loc5_ - _loc3_) + _loc3_;
      var _loc6_ = normY * (_loc4_ - _loc2_) + _loc2_;
      this.device._x = _loc7_ - com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_WIDTH;
      this.device._y = _loc6_ - com.rockstargames.gtav.levelDesign.VAULT_LASER.DEVICE_HALF_HEIGHT;
   }
   function SET_NUM_DISCS(numDiscs)
   {
      this.numDiscs = numDiscs;
      var _loc2_ = 0;
      while(_loc2_ < this.discs.length)
      {
         this.discs[_loc2_]._visible = _loc2_ < numDiscs;
         this.frontDiscs[_loc2_]._visible = _loc2_ < numDiscs;
         _loc2_ = _loc2_ + 1;
      }
      this.device.display.discHighlight.label.numDiscs.gotoAndStop(numDiscs + 1);
      this.drillYMax = com.rockstargames.gtav.levelDesign.VAULT_LASER.DRILL_Y_MAX_POSITIONS[numDiscs - 1];
   }
   function REVEAL()
   {
      this.device.display.foreground.gotoAndPlay("reveal");
      this.setDiscHighlight(0);
   }
   function SET_HOLE_DEPTH(depth)
   {
      depth = Math.min(1,Math.max(0,depth));
      var _loc3_ = depth * (this.drillYMax - this.drillYMin) + this.drillYMin;
      this.updateDiscs(_loc3_,true);
   }
   function SET_DRILL_POSITION(position)
   {
      position = Math.min(1,Math.max(0,position));
      var _loc3_ = position * (this.drillYMax - this.drillYMin) + this.drillYMin;
      this.isWithdrawing = _loc3_ >= this.device.display.drill._y;
      if(_loc3_ < this.laserTipY)
      {
         this.laserTipY = _loc3_;
      }
      var _loc2_ = (position - com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_Y_OFFSET_START) / (com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_Y_OFFSET_END - com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_Y_OFFSET_START);
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      this.displayYOffset = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_Y_OFFSETS[this.numDiscs] * _loc2_ * _loc2_;
      var _loc4_ = this.activeDisc;
      this.updateDiscs(_loc3_,false);
      if(this.activeDisc != _loc4_)
      {
         if(this.activeDisc != -1)
         {
            this.fadeInSparks();
         }
         else if(this.isWithdrawing)
         {
            this.fadeOutSparks();
         }
         else
         {
            this.burstOutSparks();
            if(_loc4_ + 1 == this.numDiscs)
            {
               this.laserTipY = com.rockstargames.gtav.levelDesign.VAULT_LASER.LASER_TIP_FINAL_Y - this.displayYOffset;
            }
            else
            {
               this.laserTipY = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_ENTER_POSITIONS[_loc4_ + 1];
            }
         }
      }
      this.device.display.drill._y = this.laserTipY;
      this.device.display.sparks._y = this.laserTipY;
   }
   function SET_TEMPERATURE(temperature)
   {
      temperature = Math.min(1,Math.max(0,temperature));
      this.currTemperature = temperature;
      this.device.meter.tempMarker._y = (1 - temperature) * this.device.meter.meterBar._height + this.device.meter.meterBar._y;
      var _loc3_ = Math.round(temperature * (com.rockstargames.gtav.levelDesign.VAULT_LASER.TEMPERATURE_MAX - com.rockstargames.gtav.levelDesign.VAULT_LASER.TEMPERATURE_MIN)) + com.rockstargames.gtav.levelDesign.VAULT_LASER.TEMPERATURE_MIN;
      this.showNumber(_loc3_,this.device.meter.tempMarker.label);
   }
   function SET_LASER_WIDTH(width)
   {
      width = Math.min(1,Math.max(0,width));
      this.device.display.drill._xscale = width * (com.rockstargames.gtav.levelDesign.VAULT_LASER.LASER_WIDE_SCALE - com.rockstargames.gtav.levelDesign.VAULT_LASER.LASER_NARROW_SCALE) + com.rockstargames.gtav.levelDesign.VAULT_LASER.LASER_NARROW_SCALE;
      this.device.display.drill.whiteCentre._alpha = (1 - width) * 100;
   }
   function SET_LASER_VISIBLE(isVisible)
   {
      this.laserIsVisible = isVisible;
      this.device.display.drill._visible = isVisible;
      this.device.display.sparks._visible = isVisible;
   }
   function RESET()
   {
      this.numDiscs = 6;
      this.activeDisc = -1;
      this.SET_TEMPERATURE(0);
      this.displayYOffset = 0;
      this.drillYMax = com.rockstargames.gtav.levelDesign.VAULT_LASER.DRILL_Y_MAX_POSITIONS[com.rockstargames.gtav.levelDesign.VAULT_LASER.MAX_NUM_DISCS - 1];
      this.laserTipY = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_ENTER_POSITIONS[0];
      this.SET_LASER_VISIBLE(true);
      this.isWithdrawing = true;
      var _loc2_ = 0;
      while(_loc2_ < this.discs.length)
      {
         this.discs[_loc2_].gotoAndStop(1);
         this.discs[_loc2_]._alpha = 100;
         this.discs[_loc2_]._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.discs[_loc2_]);
         this.frontDiscs[_loc2_].overheat.gotoAndStop(1);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.frontDiscs[_loc2_]);
         this.overheats[_loc2_].gotoAndStop(1);
         this.discsComplete[_loc2_] = false;
         _loc2_ = _loc2_ + 1;
      }
      this.device.display._x = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_BASE_POSITION.x;
      this.device.display._y = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_BASE_POSITION.y;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.device.display.drill);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.device.display.drill.whiteCentre);
      this.device.display.drill._xscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.LASER_NARROW_SCALE;
      this.device.display.drill._y = this.drillYMin;
      this.device.display.drill.whiteCentre._alpha = 0;
      this.device.display.sparks._y = this.drillYMin;
      this.device.display.sparks._xscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE;
      this.device.display.sparks._yscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE;
      this.device.display.sparks._alpha = 100;
      this.device.display.sparks._visible = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.device.display.sparks);
      this.device.display.discHighlight._visible = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.device.display.discHighlight);
      this.device.display.foreground.gotoAndStop(1);
   }
   function update()
   {
      this.updateOverheat();
      this.shake();
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.device,com.rockstargames.gtav.levelDesign.VAULT_LASER.FRAME_DURATION,this.updateArgs);
   }
   function updateOverheat()
   {
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < this.overheats.length)
      {
         if(_loc2_ == this.activeDisc)
         {
            _loc4_ = this.overheats[_loc2_]._currentFrame;
            _loc3_ = Math.round(this.currTemperature * (this.overheats[_loc2_]._totalframes - 1) + 1);
            if(_loc3_ < _loc4_)
            {
               this.overheats[_loc2_].prevFrame();
            }
            else if(_loc3_ = _loc4_ + 1)
            {
               this.overheats[_loc2_].nextFrame();
            }
            else if(_loc3_ > _loc4_)
            {
               _loc3_ = Math.ceil(0.35 * (_loc3_ - _loc4_) + _loc4_);
               this.overheats[_loc2_].gotoAndStop(_loc3_);
            }
         }
         else
         {
            this.overheats[_loc2_].prevFrame();
         }
         _loc2_ = _loc2_ + 1;
      }
      this.device.display.drill.temperature._y = this.currTemperature * (this.device.display.drill.temperature._height - this.device.display.drill.mask._height) + this.device.display.drill.mask._height;
   }
   function updateDiscs(y, allowHoleFilling)
   {
      this.activeDisc = -1;
      var _loc4_ = this.device.display.drill._y;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.discs.length)
      {
         _loc3_ = Math.round((this.discs[_loc2_]._totalframes - 1) * (com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_ENTER_POSITIONS[_loc2_] - y) / (com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_ENTER_POSITIONS[_loc2_] - com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_EXIT_POSITIONS[_loc2_])) + 1;
         if(allowHoleFilling || _loc3_ > this.discs[_loc2_]._currentframe)
         {
            this.discs[_loc2_].gotoAndStop(_loc3_);
         }
         if(y < com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_EXIT_POSITIONS[_loc2_])
         {
            if(!this.discsComplete[_loc2_])
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.discs[_loc2_],com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_COMPLETE_FADE_DOWN_DURATION,{_alpha:com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_COMPLETE_FADE_DOWN_ALPHA});
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.frontDiscs[_loc2_],com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_COMPLETE_FADE_DOWN_DURATION,{_alpha:com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_COMPLETE_FADE_DOWN_ALPHA});
               this.discsComplete[_loc2_] = true;
               this.setDiscHighlight(_loc2_ + 1);
            }
         }
         else if(allowHoleFilling)
         {
            this.discsComplete[_loc2_] = false;
         }
         if(!this.discsComplete[_loc2_] && _loc4_ < com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_ENTER_POSITIONS[_loc2_] && _loc4_ >= com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_EXIT_POSITIONS[_loc2_])
         {
            this.activeDisc = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function shake()
   {
      var _loc3_ = 10 * this.noise.getValue(this.noiseStep);
      var _loc2_ = 10 * this.noise.getValue(this.noiseStep + 5);
      if(!this.isWithdrawing && this.activeDisc != -1)
      {
         _loc3_ += 2 * Math.random() - 1;
         _loc2_ += 6 * Math.random() - 3;
      }
      this.device.display._x = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_BASE_POSITION.x + _loc3_;
      this.device.display._y = com.rockstargames.gtav.levelDesign.VAULT_LASER.DISPLAY_BASE_POSITION.y + this.displayYOffset + _loc2_;
      this.device.display.discHighlight._x = this.discHighlightPosition.x - _loc3_;
      this.device.display.discHighlight._y = this.discHighlightPosition.y - _loc2_;
      this.noiseStep += 0.01;
   }
   function fadeInSparks()
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_FADE_IN_DURATION * (com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MAX_SCALE - this.device.display.sparks._xscale) / (com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MAX_SCALE - com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE);
      this.device.display.sparks._alpha = 100;
      this.device.display.sparks._visible = this.laserIsVisible;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.device.display.sparks,_loc2_,{_xscale:com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MAX_SCALE,_yscale:com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MAX_SCALE});
   }
   function fadeOutSparks()
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_FADE_OUT_DURATION * (com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE - this.device.display.sparks._xscale) / (com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE - com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MAX_SCALE);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.device.display.sparks,com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_FADE_OUT_DURATION,{_xscale:com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE,_yscale:com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE,onCompleteScope:this,onComplete:this.fadeOutSparksComplete});
   }
   function burstOutSparks()
   {
      this.device.display.sparks._visible = this.laserIsVisible;
      this.device.display.sparks._xscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_BURST_SCALE;
      this.device.display.sparks._yscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_BURST_SCALE;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.device.display.sparks,com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_BURST_DURATION,{_alpha:0,onCompleteScope:this,onComplete:this.fadeOutSparksComplete,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
   }
   function fadeOutSparksComplete()
   {
      this.device.display.sparks._xscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE;
      this.device.display.sparks._yscale = com.rockstargames.gtav.levelDesign.VAULT_LASER.SPARKS_MIN_SCALE;
      this.device.display.sparks._visible = false;
      this.device.display.sparks._alpha = 100;
   }
   function setDiscHighlight(discIndex)
   {
      if(discIndex < this.numDiscs)
      {
         this.discHighlightPosition.y = this.discs[discIndex]._y;
         this.device.display.discHighlight.label.currDisc.gotoAndStop(discIndex + 2);
         this.device.display.discHighlight._visible = true;
         this.flashDiscHighlight(com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_HIGHLIGHT_FLASH_OFF_DURATION,com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_HIGHLIGHT_FLASH_ON_DURATION,com.rockstargames.gtav.levelDesign.VAULT_LASER.DISC_HIGHLIGHT_PRE_REVEAL_DELAY);
      }
      else
      {
         this.device.display.discHighlight._visible = false;
      }
   }
   function flashDiscHighlight()
   {
      this.device.display.discHighlight._visible = !this.device.display.discHighlight._visible;
      if(arguments.length >= 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.device.display.discHighlight,Number(arguments.pop()),{onCompleteScope:this,onComplete:this.flashDiscHighlight,onCompleteArgs:arguments});
      }
   }
   function showNumber(value, view)
   {
      view.hundreds._visible = value > 99;
      view.tens._visible = value > 9;
      view.hundreds.gotoAndStop(Math.floor(value / 100) % 10 + 1);
      view.tens.gotoAndStop(Math.floor(value / 10) % 10 + 1);
      view.units.gotoAndStop(value % 10 + 1);
   }
}
