class com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep extends com.rockstargames.gtav.Multiplayer.celebration.steps.Step
{
   var id;
   var stats;
   var initialised;
   var view;
   var sequence;
   var currentRowStep;
   var started;
   var height;
   var finished;
   static var ROW_STEP_PAUSE_DURATION = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SPEED_MULTIPLIER * 0.5;
   function StatTableStep(sequence, id)
   {
      super(sequence,360,"StatTableStep");
      this.id = id;
      this.stats = [];
   }
   function addStat(name, value, colour)
   {
      this.stats.push({name:name,value:value,colour:colour,view:null});
   }
   function get numStats()
   {
      return this.stats.length;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc8_ = 3;
      var _loc6_ = 0;
      var _loc4_ = this.stats.length - 1;
      while(_loc4_ >= 0)
      {
         var _loc3_ = this.view.attachMovie("StatTableStepRow","row" + _loc4_,_loc4_);
         _loc3_._y = _loc8_-- * 0.9 * _loc3_._height;
         _loc3_._visible = _loc4_ == this.stats.length - 1;
         _loc3_.nameText.autoSize = "right";
         _loc3_.nameText.text = this.stats[_loc4_].name;
         this.stats[_loc4_].view = _loc3_;
         var _loc5_ = _loc3_.valueText.getTextFormat();
         _loc5_.color = !this.sequence.USE_COLOUR ? 16777215 : this.stats[_loc4_].colour;
         if(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_ASIAN)
         {
            _loc5_.size *= 0.8;
         }
         _loc3_.valueText.setNewTextFormat(_loc5_);
         _loc3_.valueText.text = this.stats[_loc4_].value;
         _loc3_.nameText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
         _loc3_.valueText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
         if(_loc3_.valueText.textWidth > _loc6_)
         {
            _loc6_ = _loc3_.valueText.textWidth;
         }
         _loc4_ = _loc4_ - 1;
      }
      if(!com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc6_ += 110;
      }
      if(com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_ASIAN)
      {
         _loc6_ += 20;
      }
      if(_loc6_ > _loc3_.valueText._width)
      {
         var _loc7_ = _loc6_ - _loc3_.valueText._width;
         _loc4_ = 0;
         while(_loc4_ < this.stats.length)
         {
            _loc3_ = this.view["row" + _loc4_];
            _loc3_.nameText._x -= _loc7_;
            _loc3_.valueText._x -= _loc7_;
            _loc3_.valueText._width = _loc6_ + 10;
            _loc4_ = _loc4_ + 1;
         }
      }
      this.currentRowStep = this.stats.length - 1;
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      this.sequence.pushDownSteps(0.5 * this.height,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{onComplete:this.pauseBeforeShowNextRow,onCompleteScope:this});
      this.playDropSound();
   }
   function finish()
   {
      if(this.finished)
      {
         return undefined;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.stats.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.stats[_loc3_].view);
         this.stats[_loc3_] = null;
         _loc3_ = _loc3_ + 1;
      }
      this.stats = null;
      super.finish();
   }
   function pauseBeforeShowNextRow()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep.ROW_STEP_PAUSE_DURATION,{onComplete:this.showNextRow,onCompleteScope:this});
   }
   function showNextRow()
   {
      if(this.currentRowStep == 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.POST_STEP_PAUSE - com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep.ROW_STEP_PAUSE_DURATION,{onComplete:this.sequence.currentStepComplete,onCompleteScope:this.sequence});
      }
      else
      {
         this.currentRowStep = this.currentRowStep - 1;
         var _loc2_ = this.stats[this.currentRowStep].view;
         var _loc8_ = _loc2_._y;
         this.stats[this.currentRowStep].view._visible = true;
         var _loc3_ = _loc2_._y;
         _loc2_._y = - this.view._parent._y - this.view._y - _loc2_._height;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         this.sequence.pushDownSteps(0.5 * _loc2_._height,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
         _loc3_ = this.view._y + 0.5 * _loc2_._height;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.pauseBeforeShowNextRow,onCompleteScope:this});
         this.playDropSound();
      }
   }
   function playDropSound()
   {
      var _loc2_ = this.currentRowStep != 0 ? "Name_Appear" : "Name_Appear_Gold";
      this.sequence.playSound(_loc2_,com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SOUNDSET);
   }
}
