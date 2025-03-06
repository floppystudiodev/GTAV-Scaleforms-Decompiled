class com.rockstargames.gtav.levelDesign.celebration.steps.MissionResultStep extends com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var missionTitle;
   var passFail;
   var message;
   var initialised;
   var view;
   var sequence;
   var height;
   var baseY;
   var started;
   function MissionResultStep(sequence, missionTitle, passFail, message)
   {
      super(sequence,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT,"MissionResultStep");
      this.missionTitle = missionTitle.toUpperCase();
      this.passFail = passFail;
      this.message = message;
   }
   function init(container, y)
   {
      if(this.initialised)
      {
         return undefined;
      }
      super.init(container,y);
      var _loc3_ = this.view.attachMovie("MissionResultStep","content",0);
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN)
      {
         _loc3_.passFailText._x += 160;
         _loc3_.missionTitleText._x += 160;
         _loc3_.messageText._x += 160;
      }
      _loc3_.passFailText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.passFailText.autoSize = "left";
      _loc3_.passFailText.text = this.passFail;
      var _loc18_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * _loc3_.passFailText._x;
      var _loc15_ = _loc18_ / _loc3_.passFailText.textWidth;
      if(!com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN || _loc15_ < 1)
      {
         _loc3_.passFailText._xscale = _loc3_.passFailText._yscale = 100 * _loc15_;
      }
      _loc3_.passFailText._y = 0.5 * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT - 0.46 * _loc3_.passFailText._height;
      _loc3_.missionTitleText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
      _loc3_.missionTitleText.autoSize = "left";
      _loc3_.missionTitleText.text = this.missionTitle;
      var _loc13_ = com.rockstargames.gtav.levelDesign.celebration.steps.Step.PRICEDOWN_ASCENDER * _loc3_.passFailText._height;
      var _loc7_ = [100,68,104,72,107,75,98,66,192,193,194,195,196,197,200,201,202,203,204,206,207,209,210,211,212,213,214,217,218,219,220,223,224,225,226,227,228,229,232,233,234,235,236,237,238,239,241,242,243,244,245,246,249,250,251,252,272,273,321,323,324,346,347,1061,360,361,366,367,377,378,379,380,1049,1081];
      var _loc10_ = false;
      var _loc6_ = 0;
      while(_loc6_ < this.passFail.length)
      {
         var _loc8_ = this.passFail.charCodeAt(_loc6_);
         var _loc4_ = 0;
         while(_loc4_ < _loc7_.length)
         {
            if(_loc8_ == _loc7_[_loc4_])
            {
               _loc13_ = 0;
               _loc10_ = true;
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
         if(_loc10_)
         {
            break;
         }
         _loc3_.passFailText.text = this.passFail.substring(0,_loc6_ + 1);
         if(_loc3_.passFailText.textWidth > _loc3_.missionTitleText.textWidth)
         {
            break;
         }
         _loc6_ = _loc6_ + 1;
      }
      var _loc5_ = [103,121,113,71,89,81,1062,1065,1094,1097];
      if(this.message != "")
      {
         _loc3_.messageText._alpha = this.sequence.DEFAULT_TEXT_ALPHA;
         _loc3_.messageText.autoSize = "left";
         _loc3_.messageText.text = this.message;
         var _loc17_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 2 * _loc3_.messageText._x;
         if(_loc3_.messageText._width > _loc17_)
         {
            _loc15_ = 100 * _loc17_ / _loc3_.messageText._width;
            _loc3_.messageText._xscale = _loc15_;
            _loc3_.messageText._yscale = _loc15_;
         }
         _loc3_.passFailText.text = "";
         var _loc9_ = false;
         var _loc11_ = 0;
         _loc6_ = 0;
         while(_loc6_ < this.passFail.length)
         {
            _loc8_ = this.passFail.charCodeAt(_loc6_);
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               if(_loc8_ == _loc5_[_loc4_])
               {
                  _loc11_ = com.rockstargames.gtav.levelDesign.celebration.steps.Step.PRICEDOWN_DESCENDER * _loc3_.passFailText._height;
                  _loc9_ = true;
                  break;
               }
               _loc4_ = _loc4_ + 1;
            }
            if(_loc9_)
            {
               break;
            }
            _loc3_.passFailText.text = this.passFail.substring(0,_loc6_ + 1);
            if(_loc3_.passFailText.textWidth > _loc3_.messageText.textWidth)
            {
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
         if(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_ASIAN)
         {
            _loc11_ += 30;
         }
         _loc3_.messageText._y = _loc3_.passFailText._y + (com.rockstargames.gtav.levelDesign.celebration.steps.Step.PRICEDOWN_ASCENDER + com.rockstargames.gtav.levelDesign.celebration.steps.Step.PRICEDOWN_BODY) * _loc3_.passFailText._height + _loc11_;
      }
      _loc3_.passFailText.text = this.passFail;
      _loc3_.missionTitleText._y = _loc3_.passFailText._y - 110 + _loc13_;
      var _loc14_ = _loc3_.passFailText._height;
      var _loc12_ = true;
      _loc6_ = 0;
      while(_loc6_ < this.passFail.length)
      {
         _loc8_ = this.passFail.charCodeAt(_loc6_);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(_loc8_ == _loc5_[_loc4_])
            {
               _loc12_ = false;
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      if(_loc12_)
      {
         _loc14_ *= 0.82;
      }
      var _loc16_ = this.height - _loc14_ - _loc3_.passFailText._y;
      this.baseY = _loc3_._y;
      if(this.message != "")
      {
         _loc16_ -= 80;
      }
      _loc3_._y += _loc16_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.content,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION,{_y:this.baseY,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_IN,onComplete:this.startPause,onCompleteScope:this});
   }
   function start()
   {
      if(this.started)
      {
         return undefined;
      }
      var _loc2_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT + Math.abs(com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA);
      this.sequence.pushDownSteps(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      this.sequence.pushDownBackground(_loc2_,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.DEFAULT_PUSHDOWN_DURATION);
      this.sequence.setGlobalFlag(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.BACKGROUND_START_TWEEN_IN);
   }
   function finish()
   {
      super.finish();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.content);
   }
   function startPause()
   {
      this.sequence.setGlobalFlag(com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.BACKGROUND_FINISH_TWEEN_IN);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.POST_STEP_PAUSE,{onComplete:this.sequence.currentStepComplete,onCompleteScope:this.sequence});
   }
   function pauseComplete()
   {
      this.sequence.currentStepComplete();
   }
}
