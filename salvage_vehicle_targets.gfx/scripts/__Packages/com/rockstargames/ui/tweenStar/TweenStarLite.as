class com.rockstargames.ui.tweenStar.TweenStarLite
{
   var target;
   var vars;
   var duration;
   var startTime;
   var ease;
   var props;
   var updateMC;
   var tweenStarUpdateRef;
   static var version = 1.01;
   static var tweenMCDepth = 99999;
   static var frameRate = 30;
   static var tweenStarLiteRef = "TweenStarLiteRef";
   function TweenStarLite(_mytarget, _duration, _vars, _isTween)
   {
      _global.gfxExtensions = true;
      this.target = _mytarget;
      this.vars = _vars;
      this.duration = _duration * 1000;
      this.startTime = getTimer() + (this.vars.delay * 1000 || 0);
      this.ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[com.rockstargames.ui.tweenStar.Ease.LINEAR];
      this.props = [];
      if(_isTween)
      {
         for(var _loc3_ in this.vars)
         {
            if(_loc3_ == "_x" || _loc3_ == "_y" || _loc3_ == "_alpha" || _loc3_ == "_xscale" || _loc3_ == "_yscale" || _loc3_ == "_width" || _loc3_ == "_height" || _loc3_ == "_rotation" || _loc3_ == "_xrotation" || _loc3_ == "_yrotation" || _loc3_ == "_zscale")
            {
               this.props.push([_loc3_,this.target[_loc3_],this.vars[_loc3_]]);
            }
         }
         if(this.vars.ease != undefined)
         {
            if(typeof this.vars.ease == "number")
            {
               this.ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[this.vars.ease];
            }
            else
            {
               trace("Invalid type for ease. It has to be a number now!");
            }
         }
      }
      this.updateMC = MovieClip(this.target).createEmptyMovieClip("TSLContainerMC",com.rockstargames.ui.tweenStar.TweenStarLite.tweenMCDepth);
      this.updateMC.tweenStarUpdateRef = this;
      this.updateMC.onEnterFrame = function()
      {
         this.tweenStarUpdateRef.updateAll();
      };
      this.target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef] = new com.rockstargames.ui.tweenStar.TweenStarLiteRef(this.updateMC,this.props,this.vars);
   }
   function updateAll()
   {
      var _loc4_ = getTimer() - this.startTime;
      var _loc2_ = _loc4_ / this.duration;
      _loc2_ = Math.min(_loc2_,1);
      for(var _loc3_ in this.props)
      {
         if(_loc2_ > 0)
         {
            this.target[this.props[_loc3_][0]] = this.ease(_loc2_,this.props[_loc3_][1],this.props[_loc3_][2] - this.props[_loc3_][1],1);
         }
      }
      if(_loc2_ == 1)
      {
         for(_loc3_ in this.props)
         {
            this.target[this.props[_loc3_][0]] = this.props[_loc3_][2];
         }
         delete this.updateMC.onEnterFrame;
         this.updateMC.removeMovieClip();
         if(this.vars.onComplete)
         {
            this.vars.onComplete.apply(this.vars.onCompleteScope,this.vars.onCompleteArgs);
         }
         false;
      }
   }
   static function to(target, duration, vars)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
      var _loc1_ = new com.rockstargames.ui.tweenStar.TweenStarLite(target,duration,vars,true);
      return _loc1_;
   }
   static function delayCall(target, duration, vars)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
      var _loc1_ = new com.rockstargames.ui.tweenStar.TweenStarLite(target,duration,vars,false);
      return _loc1_;
   }
   static function setDelay(target, _duration)
   {
      var _loc1_ = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
      _loc1_.updateMC.tweenStarUpdateRef.startTime = 0;
      _loc1_.updateMC.tweenStarUpdateRef.duration = _duration * com.rockstargames.ui.tweenStar.TweenStarLite.frameRate;
   }
   static function removeAllTweens()
   {
   }
   static function removeTweenOf(target)
   {
      var _loc1_ = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
      if(_loc1_.updateMC != undefined)
      {
         delete _loc1_.updateMC.onEnterFrame;
         _loc1_.updateMC.removeMovieClip();
      }
   }
   static function endTweenOf(target, forceComplete)
   {
      var _loc1_ = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
      if(_loc1_ != undefined)
      {
         for(var _loc3_ in _loc1_.props)
         {
            target[_loc1_.props[_loc3_][0]] = _loc1_.props[_loc3_][2];
         }
         if(_loc1_.vars.onComplete && forceComplete)
         {
            _loc1_.vars.onComplete.apply(_loc1_.vars.onCompleteScope,_loc1_.vars.onCompleteArgs);
         }
         delete _loc1_.updateMC.onEnterFrame;
         _loc1_.updateMC.removeMovieClip();
      }
   }
   static function endAllTweens(forceComplete)
   {
   }
   static function linearEase(t, b, c, d)
   {
      return c * t / d + b;
   }
}
