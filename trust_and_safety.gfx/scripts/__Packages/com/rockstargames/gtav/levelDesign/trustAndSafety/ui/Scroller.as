class com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller
{
   var bottomFade;
   var bottomFadeTweenDirection;
   var content;
   var contentMax;
   var contentMin;
   var handle;
   var handleMax;
   var handleMin;
   var mask;
   var momentumArgs;
   var momentumListener;
   var restoreIndex;
   var topFade;
   var topFadeTweenDirection;
   var track;
   static var SCROLL_SPEED = 10;
   static var MOUSEWHEEL_SPEED_MULTIPLIER = 2;
   static var MOUSEWHEEL_MOMENTUM_DAMPING = 0.85;
   static var MIN_MOUSEWHEEL_MOMENTUM = 0.01;
   static var HANDLE_FADE_DURATION = 2;
   static var FADE_FADE_DURATION = 0.25;
   static var FRAME_DURATION = 0.03333333333333333;
   static var STORED_CONTENT_POSITIONS = [];
   static var STORED_HANDLE_POSITIONS = [];
   function Scroller(content, mask, handle, track, topFade, bottomFade, momentumListener, restoreIndex)
   {
      this.content = content;
      this.mask = mask;
      this.handle = handle;
      this.track = track;
      this.topFade = topFade;
      this.bottomFade = bottomFade;
      this.momentumListener = momentumListener;
      this.restoreIndex = restoreIndex;
      this.contentMax = mask._y;
      this.handleMin = track._y;
      this.topFadeTweenDirection = 0;
      this.bottomFadeTweenDirection = 0;
      this.momentumArgs = {onCompleteScope:this,onComplete:this.applyMomentum,onCompleteArgs:[0]};
      if(restoreIndex >= 0 && restoreIndex < com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.STORED_CONTENT_POSITIONS.length)
      {
         content._y = com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.STORED_CONTENT_POSITIONS[restoreIndex];
         handle._y = com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.STORED_HANDLE_POSITIONS[restoreIndex];
         if(momentumListener)
         {
            momentumListener();
         }
      }
      this.update();
   }
   function update()
   {
      if(this.content._height > this.mask._height)
      {
         this.handle._height = this.track._height * this.mask._height / this.content._height;
         this.contentMin = this.mask._y + this.mask._height - this.content._height;
         this.handleMax = this.track._y + this.track._height - this.handle._height;
         this.handle._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.handle,0.5 * com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.HANDLE_FADE_DURATION,{_alpha:0});
      }
      else
      {
         this.handle._height = this.track._height;
         this.handle._alpha = 0;
         this.contentMin = this.contentMax;
         this.handleMax = this.handleMin;
         this.reset();
      }
      this.content.setMask(this.mask);
      this.updateFades(false);
   }
   function itemIsVisible(item)
   {
      var _loc2_;
      var _loc3_;
      if(item._parent == this.content)
      {
         _loc2_ = item._y + this.content._y;
         _loc3_ = _loc2_ + item._height;
         return _loc2_ < this.mask._y + this.mask._height && _loc3_ > this.mask._y;
      }
      return false;
   }
   function itemIsAtTop(item)
   {
      if(item._parent == this.content)
      {
         return item._y + this.content._y == this.mask._y;
      }
      return false;
   }
   function itemIsAtBottom(item)
   {
      if(item._parent == this.content)
      {
         return item._y + item._height + this.content._y == this.mask._y + this.mask._height;
      }
      return false;
   }
   function updateFades(useTween)
   {
      var _loc3_ = this.content._y < this.mask._y;
      var _loc2_ = this.content._y + this.content._height > this.mask._y + this.mask._height + 4;
      this.topFadeTweenDirection = this.updateFade(this.topFade,_loc3_,useTween,this.topFadeTweenDirection);
      this.bottomFadeTweenDirection = this.updateFade(this.bottomFade,_loc2_,useTween,this.bottomFadeTweenDirection);
   }
   function updateFade(fadeView, showFade, useTween, currentTweenDirection)
   {
      if(showFade)
      {
         if(currentTweenDirection != 1)
         {
            if(useTween)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(fadeView,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.FADE_FADE_DURATION,{_alpha:100});
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(fadeView);
               fadeView._alpha = 100;
            }
         }
         currentTweenDirection = 1;
      }
      else
      {
         if(currentTweenDirection != -1)
         {
            if(useTween)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(fadeView,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.FADE_FADE_DURATION,{_alpha:0});
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(fadeView);
               fadeView._alpha = 0;
            }
         }
         currentTweenDirection = -1;
      }
      return currentTweenDirection;
   }
   function reset()
   {
      this.content._y = this.contentMax;
      this.handle._y = this.handleMin;
      this.updateFades(false);
   }
   function dispose()
   {
      if(this.restoreIndex >= 0)
      {
         com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.STORED_CONTENT_POSITIONS[this.restoreIndex] = this.content._y;
         com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.STORED_HANDLE_POSITIONS[this.restoreIndex] = this.handle._y;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.content);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.handle);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.topFade);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.bottomFade);
      this.momentumArgs = null;
      this.momentumListener = null;
      this.content = null;
      this.mask = null;
      this.handle = null;
      this.track = null;
      this.topFade = null;
      this.bottomFade = null;
   }
   function scrollBy(dy, isMouseWheel)
   {
      if(isMouseWheel)
      {
         if(dy == 127)
         {
            return undefined;
         }
         dy *= com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.MOUSEWHEEL_SPEED_MULTIPLIER;
      }
      dy = (128 - dy) / 128;
      this.applyScroll(dy);
      if(isMouseWheel)
      {
         this.momentumArgs.onCompleteArgs[0] = dy;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.content,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.FRAME_DURATION,this.momentumArgs);
      }
      this.handle._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.handle,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.HANDLE_FADE_DURATION,{_alpha:0});
   }
   function stepBy(dy)
   {
      var _loc2_ = this.content._y + dy;
      _loc2_ = Math.max(this.contentMin,Math.min(this.contentMax,_loc2_));
      this.content._y = _loc2_;
      var _loc3_ = (this.contentMax - _loc2_) / (this.contentMax - this.contentMin);
      this.handle._y = _loc3_ * (this.handleMax - this.handleMin) + this.handleMin;
      this.handle._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.handle,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.HANDLE_FADE_DURATION,{_alpha:0});
      this.updateFades(true);
   }
   function applyScroll(dy)
   {
      var _loc2_ = this.content._y + com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.SCROLL_SPEED * dy;
      _loc2_ = Math.max(this.contentMin,Math.min(this.contentMax,_loc2_));
      this.content._y = _loc2_;
      var _loc3_ = (this.contentMax - _loc2_) / (this.contentMax - this.contentMin);
      this.handle._y = _loc3_ * (this.handleMax - this.handleMin) + this.handleMin;
      this.updateFades(true);
   }
   function applyMomentum(dy)
   {
      dy *= com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.MOUSEWHEEL_MOMENTUM_DAMPING;
      this.applyScroll(dy);
      if(this.momentumListener)
      {
         this.momentumListener();
      }
      if(Math.abs(dy) > com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.MIN_MOUSEWHEEL_MOMENTUM)
      {
         this.momentumArgs.onCompleteArgs[0] = dy;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.content,com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller.FRAME_DURATION,this.momentumArgs);
      }
   }
}
