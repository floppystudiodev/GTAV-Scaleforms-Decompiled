class com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon
{
   var animateScaleDown;
   var animateScaleUp;
   var background;
   var icon;
   var meterContainer;
   var meters;
   var timer;
   var timerContainer;
   var view;
   static var ICON_LINKAGES = ["blank","accelerator","armoured","beast_mode","bomb","boost","day","deadline","detonator","dope","ghost","inverse","jump","machine_gun","night","off_radar","rage","ramp_buggy","repair","rockets","ruiner","score","zoned","score_ring","tag_team","letter_a","letter_b","letter_c","letter_d","letter_e","boost_shunt","emp","explosive_mine","kinetic_mine","monster_truck","slick","targeted"];
   static var BLANK_COLOUR_TRANSFORM = new flash.geom.ColorTransform();
   static var TIMER_R = 21;
   static var TIMER_CP = [com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0];
   static var TIMER_DD = [com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,1,0,1,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,-1,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,1,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,-1,0,-1,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,1,- com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R,0,0,-1];
   function GenericIcon(type, container)
   {
      this.init(type,container);
   }
   function init(type, container)
   {
      this.meters = [];
      this.initView(type,container);
      this.initAnimationConstants();
      this.deactivate();
   }
   function initView(type, container)
   {
      var _loc2_ = container.getNextHighestDepth();
      var _loc3_ = "icon" + _loc2_;
      this.view = container.createEmptyMovieClip(_loc3_,_loc2_);
      this.background = this.view.attachMovie("icon_background","bg",0);
      this.meterContainer = this.view.createEmptyMovieClip("meterContainer",1);
      this.timerContainer = this.view.attachMovie("icon_background","meterContainer",2);
      this.timer = this.timerContainer.createEmptyMovieClip("timer",this.timerContainer.getNextHighestDepth());
      this.timer._rotation = -90;
      this.timer.setMask(this.timerContainer.circle);
      this.timer._visible = false;
      this.timerContainer._visible = false;
      this.icon = this.view.attachMovie(com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.ICON_LINKAGES[type],"icon",3);
   }
   function initAnimationConstants()
   {
      this.animateScaleDown = {_xscale:100,_yscale:100};
      this.animateScaleUp = {_xscale:125,_yscale:125,onCompleteScope:this,onComplete:this.animate,onCompleteArgs:[true]};
   }
   function activate()
   {
      this.icon._alpha = 100;
      this.background._alpha = 50;
   }
   function deactivate()
   {
      this.background.transform.colorTransform = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM;
      this.icon._alpha = 50;
      this.background._alpha = 50;
      this.timerContainer._visible = false;
   }
   function setVisible(isVisible)
   {
      if(this.view._visible != isVisible)
      {
         this.view._visible = isVisible;
         return true;
      }
      return false;
   }
   function get isVisible()
   {
      return this.view._visible;
   }
   function setBackgroundColour(colourTransform)
   {
      if(colourTransform != undefined)
      {
         this.background.transform.colorTransform = colourTransform;
         this.background._alpha = 100;
      }
      else
      {
         this.background.transform.colorTransform = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM;
         this.background._alpha = 50;
      }
   }
   function animate()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.2,!arguments[0] ? this.animateScaleUp : this.animateScaleDown);
   }
   function setScore(score, colourTransform)
   {
      if(this.icon.label)
      {
         this.icon.label.textAutoSize = "shrink";
         this.icon.label.verticalAlign = "center";
         this.icon.label.text = score;
         if(colourTransform != undefined)
         {
            this.icon.transform.colorTransform = colourTransform;
         }
         else
         {
            this.icon.transform.colorTransform = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM;
         }
      }
   }
   function setMeter(meterValues, teamColours)
   {
      this.icon._alpha = 100;
      this.background.transform.colorTransform = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM;
      this.background._alpha = 50;
      this.meterContainer._visible = true;
      this.timerContainer._visible = false;
      var _loc4_ = teamColours.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(!this.meters[_loc2_])
         {
            this.meters[_loc2_] = this.meterContainer.attachMovie("meter","meter" + _loc2_,this.meterContainer.getNextHighestDepth());
            this.meters[_loc2_].transform.colorTransform = teamColours[_loc2_];
         }
         if(!meterValues[_loc2_] || meterValues[_loc2_] < 0)
         {
            meterValues[_loc2_] = 0;
         }
         this.meters[_loc2_].mask._yscale = 100 * meterValues[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = meterValues.sort(Array.NUMERIC | Array.DESCENDING | Array.RETURNINDEXEDARRAY);
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         this.meters[_loc5_[_loc2_]].swapDepths(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTimer(timerValues, teamColours)
   {
      this.icon._alpha = 100;
      this.background.transform.colorTransform = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM;
      this.background._alpha = 50;
      this.meterContainer._visible = false;
      this.timerContainer._visible = true;
      this.timer.clear();
      this.timer._visible = false;
      var _loc5_ = timerValues.sort(Array.NUMERIC | Array.DESCENDING | Array.RETURNINDEXEDARRAY);
      var _loc6_ = teamColours.length;
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = timerValues[_loc5_[_loc3_]];
         _loc4_ = teamColours[_loc5_[_loc3_]].rgb;
         if(_loc2_ > 0)
         {
            if(_loc2_ > 1)
            {
               _loc2_ = 1;
            }
            this.drawTimer(_loc2_,_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function drawTimer(value, colour)
   {
      this.timer.beginFill(colour);
      var _loc4_ = Math.floor(value * 8);
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc3_ <= _loc4_)
      {
         this.timer.lineTo(com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_CP[_loc2_],com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_CP[_loc2_ + 1]);
         _loc3_++;
         _loc2_ += 2;
      }
      var _loc7_;
      var _loc6_;
      if(value < 1)
      {
         _loc7_ = !(_loc4_ & 1) ? value % 0.125 : 0.125 - value % 0.125;
         _loc6_ = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_R * Math.tan(6.283185307179586 * _loc7_);
         _loc4_ <<= 2;
         this.timer.lineTo(com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_DD[_loc4_] + _loc6_ * com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_DD[_loc4_ + 1],com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_DD[_loc4_ + 2] + _loc6_ * com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.TIMER_DD[_loc4_ + 3]);
         this.timer.lineTo(0,0);
      }
      this.timer.endFill();
      this.timer._visible = true;
   }
}
