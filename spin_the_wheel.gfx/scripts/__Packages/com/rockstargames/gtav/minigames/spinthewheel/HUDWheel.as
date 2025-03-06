class com.rockstargames.gtav.minigames.spinthewheel.HUDWheel extends com.rockstargames.gtav.minigames.spinthewheel.Wheel
{
   var view;
   var winPauseDuration;
   var winIcon;
   var winMessage;
   var numSpinSteps;
   var segments;
   var currSpinStep;
   var acceleration;
   var spinStepDuration;
   static var INITIAL_FADE_IN_DURATION = 0.5;
   static var INITIAL_FADE_IN_DELAY = 0.01;
   static var SPIN_STEP_FADE_OUT_DURATION = 1;
   static var SPIN_STEP_FADE_OUT_ALPHA = 0;
   static var WIN_ANIM_DURATION = 0.3;
   static var WIN_FLASH_DURATION = 0.6;
   var segmentFormatMethods = [com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatBlankSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatPowerUpSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatCashSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatRPSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatAPSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatFreeSpinSegment,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.prototype.formatRandomSegment];
   var segmentSuffixes = ["","",""," RP"," AP","",""];
   function HUDWheel(container, numSegments, x, y, isSpectatorWheel, displayConfig)
   {
      super(container,numSegments,x,y,"hudWheel");
      this.view.title.verticalAlign = "center";
      this.view.title.textAutoSize = "shrink";
      com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.setLocalisedText(this.view.title,"SPINWHEEL_CTA");
      this.view.centreIcon.label.textAutoSize = "shrink";
      this.view.centreIcon._visible = false;
      if(displayConfig.isAsian)
      {
         this.view.label._y = 120;
      }
   }
   function spin(targetSegment, numFullSpins, totalDuration, winPauseDuration, winIcon, winMessage)
   {
      this.winPauseDuration = winPauseDuration;
      this.winIcon = winIcon;
      this.winMessage = winMessage;
      this.numSpinSteps = targetSegment + numFullSpins * this.segments.length;
      this.currSpinStep = 0;
      var _loc3_ = 30;
      this.acceleration = 2 * this.numSpinSteps / (totalDuration * totalDuration);
      this.spinStepDuration = totalDuration;
      this.setLabelText("",false);
      this.updateSpin();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.centreIcon);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.centreIcon.overlay);
      var _loc3_ = 0;
      while(_loc3_ < this.segments.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.segments[_loc3_]);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.segments[_loc3_].glowIcon);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.segments[_loc3_].glowBG);
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
   function addSegment(index, type, value)
   {
      var _loc5_ = 290;
      var _loc4_ = 6.283185307179586 * index / this.segments.length - 1.5707963267948966;
      var _loc3_ = this.view.getNextHighestDepth();
      var _loc2_ = this.view.attachMovie("hudSegment","segment" + _loc3_,_loc3_);
      _loc2_.icon.gotoAndStop(type + 1);
      _loc2_.glowIcon.gotoAndStop(type + 1);
      _loc2_.label.textAutoSize = "shrink";
      _loc2_._x = _loc5_ * Math.cos(_loc4_);
      _loc2_._y = _loc5_ * Math.sin(_loc4_);
      this.segmentFormatMethods[type](_loc2_,value);
      _loc2_.glowIcon._alpha = 0;
      _loc2_.glowBG._alpha = 0;
      _loc2_._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.INITIAL_FADE_IN_DURATION,{delay:index * com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.INITIAL_FADE_IN_DELAY,_alpha:100});
      return _loc2_;
   }
   function formatBlankSegment(segment, value)
   {
   }
   function formatPowerUpSegment(segment, value)
   {
      com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.setLocalisedText(segment.label,"SPINWHEEL_POWERUP");
   }
   function formatCashSegment(segment, value)
   {
      segment.label.text = "$" + com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.formatNumber(value);
   }
   function formatRPSegment(segment, value)
   {
      segment.label.text = com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.formatNumber(value);
   }
   function formatAPSegment(segment, value)
   {
      segment.label.text = com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.formatNumber(value);
   }
   function formatFreeSpinSegment(segment, value)
   {
      com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.setLocalisedText(segment.label,"SPINWHEEL_FREESPIN");
   }
   function formatRandomSegment(segment, value)
   {
      com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.setLocalisedText(segment.label,"SPINWHEEL_RANDOM");
   }
   function updateSpin()
   {
      var _loc2_ = this.segments[this.currSpinStep % this.segments.length];
      _loc2_.glowIcon._alpha = 100;
      _loc2_.glowBG._alpha = 100;
      this.view.label.text = _loc2_.label.text + this.segmentSuffixes[_loc2_.icon._currentframe - 1];
      this.view.centreIcon.label.text = _loc2_.label.text;
      this.view.centreIcon.glowIcon.gotoAndStop(_loc2_.icon._currentframe);
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Wheel_Spin_Selection_Change","DLC_AW_Arena_Spin_Wheel_Game_Frontend_Sounds");
      if(this.currSpinStep < this.numSpinSteps)
      {
         this.currSpinStep = this.currSpinStep + 1;
         var _loc5_ = this.numSpinSteps - this.currSpinStep;
         var _loc4_ = Math.sqrt(2 * _loc5_ / this.acceleration);
         var _loc3_ = this.spinStepDuration - _loc4_;
         this.spinStepDuration = _loc4_;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.glowIcon,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.SPIN_STEP_FADE_OUT_DURATION,{_alpha:com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.SPIN_STEP_FADE_OUT_ALPHA,delay:_loc3_});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.glowBG,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.SPIN_STEP_FADE_OUT_DURATION,{_alpha:com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.SPIN_STEP_FADE_OUT_ALPHA,delay:_loc3_});
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,_loc3_,{onCompleteScope:this,onComplete:this.updateSpin});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_.glowIcon);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_.glowBG);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         this.initWinAnimation();
      }
   }
   function initWinAnimation()
   {
      this.view.label.text = "";
      this.view.title._visible = false;
      if(this.winMessage != undefined)
      {
         this.view.centreIcon.label.text = this.winMessage;
      }
      if(this.winIcon != undefined)
      {
         this.view.centreIcon.glowIcon.gotoAndStop(this.winIcon);
      }
      this.view.centreIcon.overlay._alpha = 100;
      this.view.centreIcon.overlay._xscale = 100;
      this.view.centreIcon.overlay._yscale = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.centreIcon.overlay,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.WIN_ANIM_DURATION,{_xscale:105,_yscale:105,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_IN,onCompleteScope:this,onComplete:this.flashWinAnimation});
      this.view.centreIcon._yrotation = -90;
      this.view.centreIcon._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.centreIcon,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.WIN_ANIM_DURATION,{_yrotation:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onCompleteScope:this,onComplete:this.initReset});
      this.view.centreIcon._visible = true;
   }
   function flashWinAnimation()
   {
      this.view.centreIcon.overlay._alpha = 100;
      this.view.centreIcon.overlay._xscale = 100;
      this.view.centreIcon.overlay._yscale = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.centreIcon.overlay,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.WIN_FLASH_DURATION,{_alpha:0});
   }
   function initReset()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.centreIcon,com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.WIN_FLASH_DURATION,{delay:this.winPauseDuration - com.rockstargames.gtav.minigames.spinthewheel.HUDWheel.WIN_FLASH_DURATION,_alpha:0,onCompleteScope:this,onComplete:this.reset});
   }
   function reset()
   {
      this.view.title._visible = true;
      this.view.centreIcon._visible = false;
   }
}
