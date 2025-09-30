class com.rockstargames.gtav.levelDesign.celebration.steps.CompleteStep extends com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var complete;
   var initialised;
   var missionTitle;
   var sequence;
   var started;
   var view;
   static var SLIDE_IN_MULTIPLIER = 1.2;
   function CompleteStep(sequence, missionTitle, complete)
   {
      super(sequence,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT,"CompleteStep");
      this.missionTitle = missionTitle.toUpperCase();
      this.complete = complete;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc4_ = this.view.attachMovie("CompleteStep","content",0);
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc4_.completeText._x += 160;
         _loc4_.missionTitleText._x += 160;
      }
      _loc4_.completeText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc4_.completeText.autoSize = "left";
      _loc4_.completeText.text = this.complete;
      var _loc14_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * _loc4_.completeText._x;
      var _loc10_ = _loc14_ / _loc4_.completeText.textWidth;
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN || _loc10_ < 1)
      {
         _loc4_.completeText._xscale = _loc4_.completeText._yscale = 100 * _loc10_;
      }
      _loc4_.completeText._y = 0.5 * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT - 0.46 * _loc4_.completeText._height;
      _loc4_.missionTitleText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc4_.missionTitleText.autoSize = "left";
      _loc4_.missionTitleText.text = this.missionTitle;
      var _loc9_ = com.rockstargames.gtav.levelDesign.celebration.steps.Step.PRICEDOWN_ASCENDER * _loc4_.completeText._height;
      var _loc6_ = [100,68,104,72,107,75,98,66,192,193,194,195,196,197,200,201,202,203,204,206,207,209,210,211,212,213,214,217,218,219,220,223,224,225,226,227,228,229,232,233,234,235,236,237,238,239,241,242,243,244,245,246,249,250,251,252,272,273,321,323,324,346,347,1061,360,361,366,367,377,378,379,380,1049,1081];
      var _loc8_ = false;
      var _loc5_ = 0;
      var _loc7_;
      var _loc3_;
      while(_loc5_ < this.complete.length)
      {
         _loc7_ = this.complete.charCodeAt(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            if(_loc7_ == _loc6_[_loc3_])
            {
               _loc9_ = 0;
               _loc8_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc8_)
         {
            break;
         }
         _loc4_.completeText.text = this.complete.substring(0,_loc5_ + 1);
         if(_loc4_.completeText.textWidth > _loc4_.missionTitleText.textWidth)
         {
            break;
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc4_.completeText.text = this.complete;
      _loc4_.missionTitleText._y = _loc4_.completeText._y - 70 + _loc9_;
      var _loc11_ = com.rockstargames.gtav.levelDesign.celebration.steps.CompleteStep.SLIDE_IN_MULTIPLIER * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION;
      var _loc12_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT - com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA;
      _loc4_._y = _loc12_ - _loc4_.completeText._y - _loc10_ * _loc4_.completeText.textHeight;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,_loc11_,{_y:_loc12_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.startPause,onCompleteScope:this});
      var _loc13_ = this.view.content.createEmptyMovieClip("pauseMC",this.view.content.getNextHighestDepth());
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc13_,_loc11_ - 0.12,{onComplete:this.notifyMessageInPlace,onCompleteScope:this});
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc2_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT + Math.abs(com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA);
      this.sequence.pushDownBackground(_loc2_,com.rockstargames.gtav.levelDesign.celebration.steps.CompleteStep.SLIDE_IN_MULTIPLIER * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content);
   }
   function notifyMessageInPlace()
   {
      this.sequence.setGlobalFlag(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.COMPLETE_MESSAGE_SHOWN);
   }
   function startPause()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POST_STEP_PAUSE,{onComplete:this.sequence.currentStepComplete,onCompleteScope:this.sequence});
   }
   function pauseComplete()
   {
      this.sequence.currentStepComplete();
   }
}
