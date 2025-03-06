class com.rockstargames.gtav.Multiplayer.celebration.steps.RPAndRankBarStep extends com.rockstargames.gtav.Multiplayer.celebration.steps.Step
{
   var repPointsGained;
   var startRepPoints;
   var minRepPointsForRank;
   var maxRepPointsForRank;
   var currentRank;
   var nextRank;
   var rank1Txt;
   var rank2Txt;
   var initialised;
   var view;
   var sequence;
   var activeDecile;
   var started;
   var height;
   var counterStep;
   static var RANKUP_SPIN_DURATION = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.4;
   function RPAndRankBarStep(sequence, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank, rank1Txt, rank2Txt)
   {
      super(sequence,370,"RPAndRankBarStep");
      this.repPointsGained = repPointsGained;
      this.startRepPoints = startRepPoints;
      this.minRepPointsForRank = minRepPointsForRank;
      this.maxRepPointsForRank = maxRepPointsForRank;
      this.currentRank = currentRank;
      this.nextRank = nextRank;
      this.rank1Txt = rank1Txt;
      this.rank2Txt = rank2Txt;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("RPAndRankBarStep","content",0);
      _loc3_.value._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      this.displayMonospacedValue(this.repPointsGained >= 0 ? "+0" : "-0");
      _loc3_.rankup.rankText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.rankup.upText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      if(!this.sequence.DEFAULT_GRAPHICS_VISIBILITY)
      {
         _loc3_.rankup.globeBackground._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      }
      _loc3_.icon._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rank.rankBar._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rank.rankBarBg._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rank.currentRankIcon._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rank.nextRankIcon._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rankup.globe._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rankup.glow._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      _loc3_.rankup.globeBackground._visible = this.sequence.DEFAULT_GRAPHICS_VISIBILITY;
      this.activeDecile = -1;
      var _loc6_ = Math.floor(10 * (this.startRepPoints - this.minRepPointsForRank) / (this.maxRepPointsForRank - this.minRepPointsForRank));
      this.updateActiveDecile(_loc6_);
      var _loc4_ = _loc3_.rank.currentRankText;
      var _loc5_ = _loc3_.rank.currentRankIcon;
      _loc4_.autoSize = "left";
      _loc4_.text = this.currentRank.toString();
      _loc4_._xscale = _loc4_._yscale = Math.min(100,80 * _loc5_._width / _loc4_._width);
      _loc4_._x = _loc5_._x + 0.5 * (_loc5_._width - _loc4_._width);
      _loc4_._y = _loc5_._y + 0.5 * (_loc5_._height - _loc4_._height);
      _loc4_ = _loc3_.rank.nextRankText;
      _loc5_ = _loc3_.rank.nextRankIcon;
      _loc4_.autoSize = "left";
      _loc4_.text = this.nextRank.toString();
      _loc4_._xscale = _loc4_._yscale = Math.min(100,80 * _loc5_._width / _loc4_._width);
      _loc4_._x = _loc5_._x + 0.5 * (_loc5_._width - _loc4_._width);
      _loc4_._y = _loc5_._y + 0.5 * (_loc5_._height - _loc4_._height);
      if(!com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc3_.icon._x += 100;
         _loc3_.value._x += 100;
         _loc3_.icon._y += 20;
         _loc3_.value._y += 20;
         _loc3_.rank._xscale = _loc3_.rank._yscale = 90;
         _loc3_.rank._x += 50;
         _loc3_.rankup.rankNumberMc._x -= 60;
         _loc3_.rankup.globeBackground._x -= 60;
         _loc3_.rankup.globe._x -= 60;
         _loc3_.rankup.glow._x -= 60;
         _loc3_.rankup.rankText._x += 90;
         _loc3_.rankup.upText._x += 90;
         _loc3_.rankup._xscale = _loc3_.rankup._yscale = 90;
         _loc3_.rankup._x += 20;
      }
      _loc3_.rankup._visible = false;
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc2_ = - this.view._parent._y - this.view._y + 20;
      this.sequence.pushDownSteps(_loc2_,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      var _loc3_ = this.view.content._y;
      this.view.content._y = - this.view._parent._y - this.view._y - this.height;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.startCounter,onCompleteScope:this});
      this.sequence.playSound("RP_Appear",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
   }
   function finish()
   {
      super.finish();
      delete this.view.onEnterFrame;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.rank);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.rankup);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.rankup.rankNumberMc);
   }
   function startCounter()
   {
      var _loc2_ = Math.ceil(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.FRAME_RATE * com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POINTS_COUNT_DURATION);
      this.counterStep = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[0,this.repPointsGained,_loc2_]});
   }
   function updateCounter(startValue, delta, duration)
   {
      var _loc2_ = ++this.counterStep / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      var _loc3_ = Math.round(_loc2_ * delta + startValue);
      this.displayMonospacedValue((_loc3_ >= 0 ? "+" : "-") + _loc3_);
      var _loc5_ = Math.floor(10 * (this.startRepPoints + _loc2_ * this.repPointsGained - this.minRepPointsForRank) / (this.maxRepPointsForRank - this.minRepPointsForRank));
      this.updateActiveDecile(_loc5_);
      if(delta != 0)
      {
         this.sequence.playSound("RP_Counter",com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
      }
      if(_loc2_ == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         if(this.startRepPoints + this.repPointsGained >= this.maxRepPointsForRank)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POST_POINTS_COUNT_PAUSE,{onComplete:this.showRankUp,onCompleteScope:this});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POST_STEP_PAUSE,{onComplete:this.stepComplete,onCompleteScope:this});
         }
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCounter,onCompleteArgs:[startValue,delta,duration]});
      }
   }
   function stepComplete()
   {
      this.sequence.setGlobalFlag(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.BACKGROUND_START_TWEEN_OUT);
      this.sequence.currentStepComplete();
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
   function updateActiveDecile(nextDecile)
   {
      if(!this.sequence.DEFAULT_GRAPHICS_VISIBILITY)
      {
         return undefined;
      }
      if(this.activeDecile < nextDecile)
      {
         this.view.content.rank.rankBar["sect" + this.activeDecile].gotoAndStop("normal");
         var _loc2_ = this.activeDecile + 1;
         while(_loc2_ <= nextDecile)
         {
            this.view.content.rank.rankBar["sect" + _loc2_]._alpha = 100;
            _loc2_ = _loc2_ + 1;
         }
         this.activeDecile = nextDecile;
         if(this.repPointsGained > 0)
         {
            this.view.content.rank.rankBar["sect" + this.activeDecile].gotoAndStop("glow");
         }
      }
   }
   function showRankUp()
   {
      var _loc2_ = undefined;
      _loc2_ = this.view.content.rankup.rankText;
      if(this.rank1Txt != undefined)
      {
         _loc2_.text = this.rank1Txt;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_,"CELEB_RANK_UP_1",0,false);
      }
      if(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_ASIAN)
      {
         _loc2_._x += 20;
      }
      _loc2_ = this.view.content.rankup.upText;
      _loc2_.autoSize = "left";
      if(this.rank2Txt != undefined)
      {
         _loc2_.text = this.rank2Txt;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_,"CELEB_RANK_UP_2",0,false);
      }
      if(_loc2_.textWidth > 650)
      {
         var _loc7_ = !com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_ASIAN ? 650 : 400;
         var _loc3_ = 100 * _loc7_ / _loc2_.textWidth;
         _loc2_._xscale = _loc2_._yscale = _loc3_;
         _loc2_._x += 0.1 * (100 - _loc3_);
         _loc2_._y += 0.6 * (100 - _loc3_);
      }
      _loc2_ = this.view.content.rankup.rankNumberMc.nextRankText;
      _loc2_.autoSize = "center";
      _loc2_.text = this.currentRank.toString();
      var _loc4_ = this.view.content.rankup.globe;
      _loc3_ = 70 * _loc4_._width / _loc2_.textWidth;
      if(_loc3_ < 100)
      {
         _loc2_._xscale = _loc2_._yscale = _loc3_;
         _loc2_._x = -0.5 * _loc2_._width;
         this.view.content.rankup.rankNumberMc._y = _loc4_._y + 0.5 * (_loc4_._height - _loc2_._height);
      }
      var _loc6_ = this.view.content.rankup._y;
      this.view.content.rankup._y = - this.view._parent._y - this.view._y - this.view.content.rankup._height;
      this.view.content.rankup._visible = true;
      this.sequence.setGlobalFlag(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.BACKGROUND_START_TWEEN_OUT);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content.rankup,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.startRankUpSpinAnimation,onCompleteScope:this});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content.rank,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      var _loc5_ = - this.view._parent._y - this.view._y + 670;
      this.sequence.pushDownSteps(_loc5_,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      this.view.onEnterFrame = this.createDelegate(this,this.lockBackgroundToRankUp);
      this.sequence.playSound("RANK_UP","HUD_AWARDS");
   }
   function lockBackgroundToRankUp()
   {
      var _loc2_ = {x:0,y:0};
      this.view.content.rankup.localToGlobal(_loc2_);
      if(_loc2_.y > -70)
      {
         this.sequence.setBackgroundY(_loc2_.y + 950);
      }
   }
   function startRankUpSpinAnimation()
   {
      this.sequence.setGlobalFlag(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.BACKGROUND_HALFWAY_TWEEN_OUT);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content.rankup.rankNumberMc,0.8 * com.rockstargames.gtav.Multiplayer.celebration.steps.RPAndRankBarStep.RANKUP_SPIN_DURATION,{_xscale:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onCompleteScope:this,onComplete:this.finishRankUpSpinAnimation});
      this.sequence.playSound("NUMBER_TURN","CELEBRATION_SOUNDSET");
   }
   function finishRankUpSpinAnimation()
   {
      this.view.content.rankup.rankNumberMc.nextRankText.text = this.nextRank.toString();
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content.rankup.rankNumberMc,0.2 * com.rockstargames.gtav.Multiplayer.celebration.steps.RPAndRankBarStep.RANKUP_SPIN_DURATION,{_xscale:100,onCompleteScope:this,onComplete:this.showRankUpGlow});
   }
   function showRankUpGlow()
   {
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.rgb = 1081269;
      this.view.content.rankup.globe.transform.colorTransform = _loc2_;
      this.view.content.rankup.glow.play();
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POST_STEP_PAUSE,{onComplete:this.sequence.currentStepComplete,onCompleteScope:this.sequence});
      this.sequence.playSound("NUMBER_TURN_STOP","CELEBRATION_SOUNDSET");
   }
   function displayMonospacedValue(digits)
   {
      var _loc3_ = digits.length;
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         this.view.content.value["digit" + _loc2_].text = _loc2_ >= _loc3_ ? "" : digits.charAt(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
}
