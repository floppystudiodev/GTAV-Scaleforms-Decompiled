class com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep extends com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var activeLine;
   var bottomLines;
   var counterStep;
   var currentStat;
   var id;
   var initialised;
   var sequence;
   var started;
   var stats;
   var topLines;
   var view;
   static var LINE_FADE_OUT_DURATION = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.25;
   static var PRE_ICON_ANIMATION_PAUSE = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.5;
   function BigDollarsStep(sequence, id)
   {
      super(sequence,320,"BigDollarsStep");
      this.id = id;
      this.stats = [];
   }
   function addStat(startDollars, deltaDollars, topText, bottomText, rightHandStat, rightHandIcon, soundType)
   {
      this.stats.push({startDollars:startDollars,deltaDollars:deltaDollars,topText:topText,bottomText:bottomText,rightHandStat:rightHandStat,rightHandIcon:rightHandIcon,soundType:soundType});
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("BigDollarsStep","content",0);
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc3_.topLineA._x += 100;
         _loc3_.topLineB._x += 100;
         _loc3_.bottomLineA._x += 100;
         _loc3_.bottomLineA.bottomText._width = 620;
         _loc3_.bottomLineA.statText._x = 645;
         _loc3_.bottomLineA.statIcon._x = 810;
         _loc3_.bottomLineB._x += 100;
         _loc3_.bottomLineB.bottomText._width = 620;
         _loc3_.bottomLineB.statText._x = 645;
         _loc3_.bottomLineB.statIcon._x = 810;
         _loc3_.cash._x += 100;
         _loc3_.cash._y += 10;
         _loc3_.bottomLineA.statIcon._xscale = _loc3_.bottomLineA.statIcon._yscale = 45;
         _loc3_.bottomLineB.statIcon._xscale = _loc3_.bottomLineB.statIcon._yscale = 45;
         _loc3_.cash._xscale = _loc3_.cash._yscale = 80;
      }
      this.topLines = [_loc3_.topLineA,_loc3_.topLineB];
      this.bottomLines = [_loc3_.bottomLineA,_loc3_.bottomLineB];
      this.activeLine = 0;
      this.currentStat = 0;
      _loc3_.topLineB._alpha = 0;
      _loc3_.bottomLineB._alpha = 0;
      _loc3_.topLineA._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.bottomLineA._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.cash._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.bottomLineA.statIcon.gotoAndStop(3);
      _loc3_.bottomLineB.statIcon.gotoAndStop(3);
      _loc3_.topLineA.topText.autoSize = "left";
      _loc3_.topLineB.topText.autoSize = "left";
      _loc3_.bottomLineA.bottomText.autoSize = "left";
      _loc3_.bottomLineB.bottomText.autoSize = "left";
      _loc3_.bottomLineA.statText.autoSize = "right";
      _loc3_.bottomLineB.statText.autoSize = "right";
      var _loc5_;
      var _loc6_;
      var _loc4_;
      if(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN)
      {
         _loc3_.bottomLineA.bottomText._y += 30;
         _loc3_.bottomLineA.statText._y += 30;
         _loc3_.bottomLineA.statIcon._y += 30;
         _loc3_.bottomLineB.bottomText._y += 30;
         _loc3_.bottomLineB.statText._y += 30;
         _loc3_.bottomLineB.statIcon._y += 30;
         _loc5_ = _loc3_.cash.dollar.getNewTextFormat();
         _loc5_.font = "$CelebrationCash";
         _loc3_.cash.dollar.setTextFormat(_loc5_);
         _loc4_ = 0;
         while(_loc4_ < 10)
         {
            _loc6_ = _loc3_.cash.value["digit" + _loc4_];
            _loc5_ = _loc6_.getNewTextFormat();
            _loc5_.font = "$CelebrationCash";
            _loc6_.setNewTextFormat(_loc5_);
            _loc4_ = _loc4_ + 1;
         }
         _loc3_.topLineA._xscale = _loc3_.topLineA._yscale = 80;
         _loc3_.topLineB._xscale = _loc3_.topLineB._yscale = 80;
      }
      var _loc7_ = this.topLines[this.activeLine].topText;
      _loc7_.text = this.stats[this.currentStat].topText.toUpperCase();
      _loc7_._xscale = _loc7_._yscale = 100;
      var _loc9_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * this.topLines[this.activeLine]._x;
      var _loc8_ = _loc9_ / _loc7_.textWidth;
      if(_loc8_ < 1)
      {
         _loc7_._xscale = _loc7_._yscale = 100 * _loc8_;
         _loc7_._y = -18 + (!(_loc8_ * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN) ? 70 : 10);
      }
      else
      {
         _loc7_._y = -18;
      }
      this.displayMonospacedValue("0");
      this.displayBottomLine();
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc3_ = this.view.content._y;
      this.view.content._y = - this.view._parent._y - this.view._y - this.view.content._height;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      var _loc2_ = - this.view._parent._y - this.view._y + 55;
      this.sequence.pushDownSteps(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.startCashCounter,onCompleteScope:this});
      switch(this.stats[this.currentStat].soundType)
      {
         case 3:
            this.sequence.playSound("Take_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
            break;
         case 4:
            this.sequence.playSound("Actual_Take_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
            break;
         case 5:
            this.sequence.playSound("Cut_Of_Take_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
            break;
         case 6:
            this.sequence.playSound("Elite_Challenge_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
         default:
            return;
      }
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.topLineA);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.topLineB);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.bottomLineA);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content.bottomLineB);
   }
   function showNextStat()
   {
      if(this.currentStat == this.stats.length - 1)
      {
         this.sequence.currentStepComplete();
         return undefined;
      }
      this.currentStat = this.currentStat + 1;
      var _loc7_ = this.stats[this.currentStat];
      var _loc8_ = this.stats[this.currentStat - 1].topText;
      var _loc5_ = _loc7_.topText;
      var _loc2_;
      if(_loc8_ != _loc5_)
      {
         _loc2_ = this.topLines[this.activeLine];
      }
      if(this.sequence.IS_CUTOUT)
      {
         _loc2_._alpha = 0;
         bottomLine._alpha = 0;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep.LINE_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      var bottomLine = this.bottomLines[this.activeLine];
      var _loc9_ = 0.5 * bottomLine._height;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(bottomLine,com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep.LINE_FADE_OUT_DURATION,{_y:_loc9_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,_alpha:0,onComplete:this.pauseBeforeDisplayingBottomLine,onCompleteScope:this});
      if(bottomLine.bottomText.text != "")
      {
         this.sequence.playSound("Elite_Challenge_Goal_Fade","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
      }
      this.displayMonospacedValue(_loc7_.startDollars.toString());
      this.activeLine = (this.activeLine + 1) % 2;
      _loc2_ = this.topLines[this.activeLine];
      _loc2_.topText.text = _loc5_.toUpperCase();
      _loc2_.topText._xscale = _loc2_.topText._yscale = 100;
      var _loc10_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * _loc2_._x;
      var _loc3_ = _loc10_ / _loc2_.topText.textWidth;
      if(_loc3_ < 1)
      {
         _loc2_.topText._xscale = _loc2_.topText._yscale = 100 * _loc3_;
         _loc2_._y = -18 + (!(_loc3_ * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN) ? 70 : 10);
      }
      else
      {
         _loc2_.topText._y = -18;
      }
      var _loc6_;
      var _loc4_;
      if(_loc8_ == _loc5_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc2_,2 * com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep.LINE_FADE_OUT_DURATION,{onComplete:this.pauseBeforeStartingCashCounter,onCompleteScope:this,onCompleteArgs:[true]});
      }
      else
      {
         _loc6_ = {x:0,y:0};
         this.view.content.localToGlobal(_loc6_);
         _loc4_ = _loc6_.y < 175;
         _loc2_._y = - this.view._parent._y - this.view._y - _loc2_._height;
         _loc2_._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.pauseBeforeStartingCashCounter,onCompleteScope:this,onCompleteArgs:[!_loc4_]});
         if(_loc4_)
         {
            this.sequence.pushDownSteps(170,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
            _loc9_ = this.view._y - 120;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc9_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         }
         switch(this.stats[this.currentStat].soundType)
         {
            case 3:
               this.sequence.playSound("First_Time_Bonus_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               break;
            case 4:
               this.sequence.playSound("Actual_Take_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               break;
            case 5:
               this.sequence.playSound("Cut_Of_Take_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               break;
            case 6:
               if(_loc4_)
               {
                  this.sequence.playSound("Elite_Challenge_Appear","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               }
               break;
            case 7:
               this.sequence.playSound("Total_Cash_Earned","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
            default:
               return;
         }
      }
   }
   function pauseBeforeStartingCashCounter(playSFX)
   {
      this.startCashCounter();
   }
   function startCashCounter()
   {
      var _loc2_ = this.stats[this.currentStat];
      var _loc3_ = Math.ceil(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.FRAME_RATE * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POINTS_COUNT_DURATION);
      this.counterStep = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCashCounter,onCompleteArgs:[_loc2_.startDollars,_loc2_.deltaDollars,_loc3_]});
   }
   function pauseBeforeDisplayingBottomLine()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.bottomLines[this.activeLine],com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION - com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep.LINE_FADE_OUT_DURATION,{onComplete:this.displayBottomLine,onCompleteScope:this});
   }
   function displayBottomLine()
   {
      var _loc4_ = this.stats[this.currentStat];
      var _loc2_ = this.bottomLines[this.activeLine];
      _loc2_.bottomText.text = _loc4_.bottomText;
      _loc2_.statText.text = _loc4_.rightHandStat;
      _loc2_.statIcon.gotoAndStop(3);
      _loc2_._y = !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? -60 : -20;
      _loc2_._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      var _loc3_ = 100;
      _loc2_.bottomText._xscale = _loc2_.bottomText._yscale = _loc3_;
      _loc2_.statText._xscale = _loc2_.statText._yscale = _loc3_;
      var _loc6_ = _loc2_.bottomText._width + _loc2_.statText._width;
      var _loc5_ = !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? 770 : 960;
      if(_loc6_ > _loc5_)
      {
         _loc3_ *= _loc5_ / _loc6_;
         _loc2_.bottomText._xscale = _loc2_.bottomText._yscale = _loc3_;
         _loc2_.statText._xscale = _loc2_.statText._yscale = _loc3_;
      }
      if(_loc3_ < 100)
      {
         _loc2_._y += Math.ceil((100 - _loc3_) * 0.19);
      }
      _loc2_.statText._x = _loc5_ + 25 - _loc2_.statText._width;
      _loc2_.statIcon.gotoAndStop(_loc4_.rightHandIcon);
      _loc2_.statIcon._y = 0.5 * (_loc2_.bottomText._height - _loc2_.statIcon._height) + _loc2_.bottomText._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc2_.statIcon,com.rockstargames.gtav.levelDesign.celebration.steps.BigDollarsStep.PRE_ICON_ANIMATION_PAUSE,{onComplete:this.displayIcon,onCompleteScope:this});
      if(_loc4_.soundType == 1)
      {
         this.sequence.playSound("Elite_Challenge_Goal_Pass","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
      }
      else if(_loc4_.soundType == 2)
      {
         this.sequence.playSound("Elite_Challenge_Goal_Fail","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
      }
   }
   function displayIcon()
   {
      var _loc3_ = this.stats[this.currentStat];
      var _loc2_ = this.bottomLines[this.activeLine];
      if(_loc2_.statIcon.icon)
      {
         _loc2_.statIcon.icon.play();
      }
      if(_loc3_.rightHandIcon == 1)
      {
         this.sequence.playSound("Elite_Challenge_Passed","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
      }
      else if(_loc3_.rightHandIcon == 2)
      {
         this.sequence.playSound("Elite_Challenge_Failed","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
      }
   }
   function updateCashCounter(startValue, delta, duration)
   {
      var _loc2_ = ++this.counterStep / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      this.displayMonospacedValue(Math.round(_loc2_ * delta + startValue).toString());
      if(delta != 0)
      {
         switch(this.stats[this.currentStat].soundType)
         {
            case 3:
            case 6:
               this.sequence.playSound("First_Time_Bonus_Counter","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               break;
            case 4:
               this.sequence.playSound("Actual_Take_Counter","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               break;
            case 5:
               this.sequence.playSound("Cut_Of_Take_Counter","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
         }
      }
      if(_loc2_ == 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POST_POINTS_COUNT_PAUSE,{onComplete:this.showNextStat,onCompleteScope:this});
         if(delta != 0)
         {
            switch(this.stats[this.currentStat].soundType)
            {
               case 3:
               case 6:
                  this.sequence.playSound("First_Time_Bonus_Counter_Finish","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
                  break;
               case 4:
                  this.sequence.playSound("Actual_Take_Counter_Finish","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
                  break;
               case 5:
                  this.sequence.playSound("Cut_Of_Take_Counter_Finish","DLC_HEISTS_FINALE_SCREEN_SOUNDS");
               default:
                  return;
            }
         }
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.ONE_FRAME,{onCompleteScope:this,onComplete:this.updateCashCounter,onCompleteArgs:[startValue,delta,duration]});
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
   function displayMonospacedValue(digits)
   {
      var _loc3_ = digits.length;
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         this.view.content.cash.value["digit" + _loc2_].text = _loc2_ >= _loc3_ ? "" : digits.charAt(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
}
