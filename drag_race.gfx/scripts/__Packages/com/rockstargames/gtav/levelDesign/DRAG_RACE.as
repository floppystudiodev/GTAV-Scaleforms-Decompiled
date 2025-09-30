class com.rockstargames.gtav.levelDesign.DRAG_RACE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var centreX;
   var centreY;
   var contentHeight;
   var contentWidth;
   var displayConfig;
   var innerGradientMask;
   var innerRangeMax;
   var innerRangeMin;
   var innerShiftRingMask;
   var isDriftRace;
   var maskRadius;
   var outerRangeMax;
   var outerRangeMin;
   var outerShiftRingMask;
   var shiftRingGlowMask;
   var shiftRingInnerMask;
   var shiftRingOuterMask;
   var sweepRingPostMask;
   var sweepRingPreMask;
   static var WIDTH = 1280;
   static var HEIGHT = 720;
   static var MIN_ROTATION = -130;
   static var MAX_ROTATION = 130;
   static var FLASH_FADE_IN_DURATION = 0.06666666666666667;
   static var FLASH_FADE_OUT_DURATION = 0.4;
   static var INNER_TINT = new flash.geom.ColorTransform(0,0,0,1,19,180,247,0);
   static var OUTER_TINT = new flash.geom.ColorTransform(0,0,0,1,209,26,72,0);
   static var NEEDLE_TINT = new flash.geom.ColorTransform(1,1,1,1,209,26,72,0);
   static var NO_TINT = new flash.geom.ColorTransform();
   function DRAG_RACE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DRAG_RACE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.centreX = this.CONTENT.meter.needle._x;
      this.centreY = this.CONTENT.meter.needle._y;
      this.contentWidth = this.CONTENT.background._width;
      this.contentHeight = this.CONTENT.background._height;
      this.maskRadius = Math.max(this.contentWidth,this.contentHeight);
      this.sweepRingPreMask = this.initMask("sweepRingPreMask",this.CONTENT.meter.sweepRingPre,false);
      this.shiftRingInnerMask = this.initMask("shiftRingInnerMask",this.CONTENT.meter.shiftRingInner,false);
      this.shiftRingOuterMask = this.initMask("shiftRingOuterMask",this.CONTENT.meter.shiftRingOuter,false);
      this.shiftRingGlowMask = this.initMask("shiftRingGlowMask",this.CONTENT.meter.shiftRingGlow,false);
      this.sweepRingPostMask = this.initMask("sweepRingPostMask",this.CONTENT.meter.sweepRingPost,true);
      this.innerShiftRingMask = this.initMask("innerShiftRingMask",this.CONTENT.meter.innerShiftRing,false);
      this.outerShiftRingMask = this.initMask("outerShiftRingMask",this.CONTENT.meter.outerShiftRing,false);
      this.innerGradientMask = this.initMask("innerGradientMask",this.CONTENT.meter.innerGradient,false);
      this.CONTENT.meter.innerShiftRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.INNER_TINT;
      this.CONTENT.meter.outerShiftRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.OUTER_TINT;
      this.CONTENT.meter.shiftRingOuter.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.OUTER_TINT;
      this.CONTENT.meter.shiftRingInner.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.INNER_TINT;
      this.CONTENT.meter.needle.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.NEEDLE_TINT;
      this.CONTENT.meter.innerGradient._visible = false;
      this.CONTENT.meter.shiftRingGlow._alpha = 0;
      this.CONTENT.background._visible = false;
      this.innerRangeMin = -1;
      this.innerRangeMax = -1;
      this.outerRangeMin = -1;
      this.outerRangeMax = -1;
      this.isDriftRace = false;
      this.SET_SCREEN_POSITION(1,0.8);
      if(this.displayConfig.isAsian)
      {
         this.resizeAsianText(this.CONTENT.gear);
         this.resizeAsianText(this.CONTENT.speed);
         this.resizeAsianText(this.CONTENT.speedLabel);
      }
   }
   function initMask(maskName, maskee, show)
   {
      var _loc2_ = this.CONTENT.meter.createEmptyMovieClip(maskName,this.CONTENT.meter.getNextHighestDepth());
      _loc2_._x = this.centreX;
      _loc2_._y = this.centreY;
      if(show)
      {
         this.drawMask(_loc2_,maskee,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      }
      else
      {
         this.drawMask(_loc2_,maskee,0,0);
      }
      maskee.setMask(_loc2_);
      return _loc2_;
   }
   function SET_SCREEN_POSITION(xNorm, yNorm)
   {
      xNorm = Math.min(1,Math.max(0,xNorm));
      yNorm = Math.min(1,Math.max(0,yNorm));
      var _loc3_ = com.rockstargames.gtav.levelDesign.DRAG_RACE.WIDTH * this.displayConfig.safeLeft;
      var _loc7_ = com.rockstargames.gtav.levelDesign.DRAG_RACE.WIDTH * this.displayConfig.safeRight - this.contentWidth;
      var _loc2_ = com.rockstargames.gtav.levelDesign.DRAG_RACE.HEIGHT * this.displayConfig.safeTop;
      var _loc6_ = com.rockstargames.gtav.levelDesign.DRAG_RACE.HEIGHT * this.displayConfig.safeBottom - this.contentHeight;
      this.CONTENT._x = xNorm * (_loc7_ - _loc3_) + _loc3_;
      this.CONTENT._y = yNorm * (_loc6_ - _loc2_) + _loc2_;
   }
   function SET_GEAR(gear)
   {
      gear = Math.floor(gear);
      this.CONTENT.gear.text = gear > 0 ? gear : "R";
   }
   function SET_SPEED(speed)
   {
      speed = Math.floor(speed);
      this.CONTENT.speed.text = speed > 0 ? speed : "-";
   }
   function SET_SPEED_UNITS(units)
   {
      this.CONTENT.speedLabel.text = units.toUpperCase();
   }
   function SET_METER_VALUE(normValue)
   {
      normValue = this.clampNormalised(normValue);
      var _loc3_ = this.mapNormalised(normValue,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      this.CONTENT.meter.needle._rotation = _loc3_;
      this.drawMask(this.sweepRingPreMask,this.CONTENT.meter.sweepRingPre,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,_loc3_);
      this.drawMask(this.shiftRingGlowMask,this.CONTENT.meter.shiftRingGlow,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,_loc3_);
      this.drawMask(this.sweepRingPostMask,this.CONTENT.meter.sweepRingPost,_loc3_,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      if(!this.isDriftRace)
      {
         if(normValue > this.innerRangeMin && normValue <= this.innerRangeMax)
         {
            this.CONTENT.meter.outerRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.INNER_TINT;
            this.CONTENT.meter.sweepRingPre.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.INNER_TINT;
         }
         else if(normValue > this.outerRangeMin && normValue <= this.outerRangeMax)
         {
            this.CONTENT.meter.outerRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.OUTER_TINT;
            this.CONTENT.meter.sweepRingPre.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.OUTER_TINT;
         }
         else
         {
            this.CONTENT.meter.outerRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.NO_TINT;
            this.CONTENT.meter.sweepRingPre.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.NO_TINT;
         }
      }
   }
   function SET_INNER_GOAL(normMin, normMax)
   {
      normMin = this.clampNormalised(normMin);
      normMax = this.clampNormalised(normMax);
      var _loc3_ = this.mapNormalised(normMin,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      var _loc2_ = this.mapNormalised(normMax,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      this.drawMask(this.innerShiftRingMask,this.CONTENT.meter.innerShiftRing,_loc3_,_loc2_);
      this.drawMask(this.shiftRingInnerMask,this.CONTENT.meter.shiftRingInner,_loc3_,_loc2_);
      this.drawMask(this.innerGradientMask,this.CONTENT.meter.innerGradient,_loc3_,_loc2_);
      this.CONTENT.meter.innerGradient._visible = _loc3_ < _loc2_;
      this.CONTENT.meter.innerGradient._rotation = _loc2_;
      this.innerRangeMin = normMin;
      this.innerRangeMax = normMax;
   }
   function SET_OUTER_GOAL(normMin, normMax)
   {
      normMin = this.clampNormalised(normMin);
      normMax = this.clampNormalised(normMax);
      var _loc4_ = this.mapNormalised(normMin,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      var _loc3_ = this.mapNormalised(normMax,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      this.drawMask(this.shiftRingOuterMask,this.CONTENT.meter.shiftRingOuter,_loc4_,_loc3_);
      this.drawMask(this.outerShiftRingMask,this.CONTENT.meter.outerShiftRing,_loc4_,_loc3_);
      this.outerRangeMin = normMin;
      this.outerRangeMax = normMax;
   }
   function SET_BURNOUT_GOAL(normMin, normMax)
   {
      this.SET_OUTER_GOAL(0,0);
      normMin = this.clampNormalised(normMin);
      normMax = this.clampNormalised(normMax);
      var _loc3_ = this.mapNormalised(normMin,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      var _loc2_ = this.mapNormalised(normMax,com.rockstargames.gtav.levelDesign.DRAG_RACE.MIN_ROTATION,com.rockstargames.gtav.levelDesign.DRAG_RACE.MAX_ROTATION);
      this.drawMask(this.shiftRingInnerMask,this.CONTENT.meter.shiftRingInner,_loc3_,_loc2_);
      this.drawMask(this.innerShiftRingMask,this.CONTENT.meter.innerShiftRing,_loc3_,_loc2_);
   }
   function FLASH_INNER_GOAL()
   {
      this.CONTENT.meter.shiftRingGlow.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.INNER_TINT;
      this.fadeInGlow();
   }
   function FLASH_OUTER_GOAL()
   {
      this.CONTENT.meter.shiftRingGlow.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.OUTER_TINT;
      this.fadeInGlow();
   }
   function SET_IS_DRIFT_RACE(isDriftRace)
   {
      this.isDriftRace = isDriftRace;
      if(isDriftRace)
      {
         this.CONTENT.meter.outerRing.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.NO_TINT;
         this.CONTENT.meter.sweepRingPre.transform.colorTransform = com.rockstargames.gtav.levelDesign.DRAG_RACE.NO_TINT;
      }
      this.CONTENT.meter.innerGradient._visible = !isDriftRace;
   }
   function SET_METER_GOAL(normMin, normMax)
   {
      if(normMin == undefined && normMax == undefined)
      {
         this.SET_INNER_GOAL(0,0);
         this.SET_OUTER_GOAL(0,0);
      }
      else if(normMax == undefined)
      {
         this.SET_INNER_GOAL(normMin - 0.01,normMin + 0.01);
         this.SET_OUTER_GOAL(0,0);
      }
      else
      {
         this.SET_INNER_GOAL(0,0);
         this.SET_OUTER_GOAL(normMin,normMax);
      }
   }
   function SET_FLASHING(normFlashingRate)
   {
      this.FLASH_INNER_GOAL();
   }
   function drawMask(mask, maskee, minRotation, maxRotation)
   {
      com.rockstargames.gtav.levelDesign.dragRace.CircleSegment.drawSegment(minRotation / 360,maxRotation / 360,this.maskRadius,mask,0,0);
      maskee._visible = minRotation != maxRotation;
   }
   function clampNormalised(value)
   {
      return value >= 0 ? (value <= 1 ? value : 1) : 0;
   }
   function mapNormalised(value, destMin, destMax)
   {
      return value * (destMax - destMin) + destMin;
   }
   function fadeInGlow()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.meter.shiftRingGlow,com.rockstargames.gtav.levelDesign.DRAG_RACE.FLASH_FADE_IN_DURATION,{_alpha:100,onCompleteScope:this,onComplete:this.fadeOutGlow});
   }
   function fadeOutGlow()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.meter.shiftRingGlow,com.rockstargames.gtav.levelDesign.DRAG_RACE.FLASH_FADE_OUT_DURATION,{_alpha:0});
   }
   function resizeAsianText(tf)
   {
      tf.verticalAlign = "center";
      var _loc1_ = tf.getNewTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 0;
      tf.setNewTextFormat(_loc1_);
   }
}
