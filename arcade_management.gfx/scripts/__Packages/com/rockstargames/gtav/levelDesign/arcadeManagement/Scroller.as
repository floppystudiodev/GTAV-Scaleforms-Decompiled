class com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller
{
   var content;
   var mask;
   var handle;
   var track;
   var momentumListener;
   var restoreIndex;
   var contentMax;
   var handleMin;
   var momentumArgs;
   var contentMin;
   var handleMax;
   static var SCROLL_SPEED = 20;
   static var MOUSEWHEEL_SPEED_MULTIPLIER = 2;
   static var MOUSEWHEEL_MOMENTUM_DAMPING = 0.85;
   static var MIN_MOUSEWHEEL_MOMENTUM = 0.01;
   static var HANDLE_FADE_DURATION = 2;
   static var FRAME_DURATION = 0.03333333333333333;
   static var STORED_CONTENT_POSITIONS = [];
   static var STORED_HANDLE_POSITIONS = [];
   function Scroller(content, mask, handle, track, momentumListener, restoreIndex)
   {
      this.content = content;
      this.mask = mask;
      this.handle = handle;
      this.track = track;
      this.momentumListener = momentumListener;
      this.restoreIndex = restoreIndex;
      this.contentMax = mask._y;
      this.handleMin = track._y;
      this.momentumArgs = {onCompleteScope:this,onComplete:this.applyMomentum,onCompleteArgs:[0]};
      if(restoreIndex >= 0 && restoreIndex < com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.STORED_CONTENT_POSITIONS.length)
      {
         content._y = com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.STORED_CONTENT_POSITIONS[restoreIndex];
         handle._y = com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.STORED_HANDLE_POSITIONS[restoreIndex];
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
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.handle,0.5 * com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.HANDLE_FADE_DURATION,{_alpha:0});
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
   }
   function reset()
   {
      this.content._y = this.contentMax;
      this.handle._y = this.handleMin;
   }
   function dispose()
   {
      if(this.restoreIndex >= 0)
      {
         com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.STORED_CONTENT_POSITIONS[this.restoreIndex] = this.content._y;
         com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.STORED_HANDLE_POSITIONS[this.restoreIndex] = this.handle._y;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.content);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.handle);
      this.momentumArgs = null;
      this.momentumListener = null;
      this.content = null;
      this.mask = null;
      this.handle = null;
      this.track = null;
   }
   function scrollBy(dy, isMouseWheel)
   {
      if(isMouseWheel)
      {
         if(dy == 127)
         {
            return undefined;
         }
         dy *= com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.MOUSEWHEEL_SPEED_MULTIPLIER;
      }
      dy = (128 - dy) / 128;
      this.applyScroll(dy);
      if(isMouseWheel)
      {
         this.momentumArgs.onCompleteArgs[0] = dy;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.content,com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.FRAME_DURATION,this.momentumArgs);
      }
      this.handle._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.handle,com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.HANDLE_FADE_DURATION,{_alpha:0});
   }
   function applyScroll(dy)
   {
      var _loc2_ = this.content._y + com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.SCROLL_SPEED * dy;
      _loc2_ = Math.max(this.contentMin,Math.min(this.contentMax,_loc2_));
      this.content._y = _loc2_;
      var _loc3_ = (this.contentMax - _loc2_) / (this.contentMax - this.contentMin);
      this.handle._y = _loc3_ * (this.handleMax - this.handleMin) + this.handleMin;
   }
   function applyMomentum(dy)
   {
      dy *= com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.MOUSEWHEEL_MOMENTUM_DAMPING;
      this.applyScroll(dy);
      if(this.momentumListener)
      {
         this.momentumListener();
      }
      if(Math.abs(dy) > com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.MIN_MOUSEWHEEL_MOMENTUM)
      {
         this.momentumArgs.onCompleteArgs[0] = dy;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.content,com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller.FRAME_DURATION,this.momentumArgs);
      }
   }
}
