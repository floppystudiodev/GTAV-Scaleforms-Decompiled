class com.rockstargames.gtav.levelDesign.SPLASH_TEXT extends com.rockstargames.ui.core.ScreenLayoutUI
{
   var CONTENT;
   var _delayDuration;
   var _managedTween;
   var _splashDuration;
   var screenManager;
   var txt_label;
   var _startingScale = 90;
   var _defaultTransitionDuration = 300;
   function SPLASH_TEXT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.SET_SAFE(com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]);
      this.SET_RATIO(com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE);
      this.txt_label = this.CONTENT.txt_label;
      this.SPLASH_TEXT_COLOR();
      this.SPLASH_TEXT_TRANSITION_OUT(0);
      this.screenManager.positionToScreen(this.CONTENT,"xCC",true);
   }
   function SET_SPLASH_TEXT(txt, duration, r, g, b, a)
   {
      this.SPLASH_TEXT_LABEL(txt,r,g,b,a);
      this._managedTween = true;
      this._splashDuration = duration;
      this._delayDuration = this._splashDuration - this._defaultTransitionDuration * 2;
      this.SPLASH_TEXT_TRANSITION_IN(duration,true);
   }
   function SPLASH_TEXT_LABEL(txt, r, g, b, a)
   {
      this.txt_label.text = txt;
      this.SPLASH_TEXT_COLOR(r,g,b,a);
   }
   function SPLASH_TEXT_COLOR(r, g, b, a)
   {
      if(r != undefined && g != undefined && b != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,r,g,b,a);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,253,214,83);
      }
      if(a != undefined)
      {
         this.CONTENT._alpha = a / 255 * 100;
      }
      else
      {
         this.CONTENT._alpha = 100;
      }
   }
   function SPLASH_TEXT_TRANSITION_IN(duration, managed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.CONTENT._visible = true;
      if(duration == undefined)
      {
         duration = this._defaultTransitionDuration;
      }
      else if(duration == 0)
      {
         this.CONTENT._xscale = this.CONTENT._yscale = 100;
         this.CONTENT._alpha = 100;
         return undefined;
      }
      this.CONTENT._xscale = this.CONTENT._yscale = this._startingScale;
      this.CONTENT._alpha = 0;
      if(managed)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this._defaultTransitionDuration / 1000,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onComplete:this._handleTransitionInComplete,onCompleteScope:this},false);
      }
      else
      {
         this._delayDuration = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,duration / 1000,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT},false);
      }
   }
   function _handleTransitionInComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.SPLASH_TEXT_TRANSITION_OUT(this._defaultTransitionDuration,true);
   }
   function SPLASH_TEXT_TRANSITION_OUT(duration, managed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      if(duration == undefined)
      {
         duration == this._defaultTransitionDuration;
      }
      else if(duration == 0)
      {
         this._handleTransitionOutComplete();
         return undefined;
      }
      if(managed)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,duration / 1000,{_alpha:0,_xScale:80,_yScale:80,delay:this._delayDuration / 1000,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this._handleTransitionOutComplete,onCompleteScope:this});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,duration / 1000,{_alpha:0,_xScale:80,_yScale:80,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this._handleTransitionOutComplete,onCompleteScope:this});
      }
   }
   function _handleTransitionOutComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.CONTENT._visible = false;
   }
   function IS_SPLASH_TEXT_VISIBLE()
   {
      return this.CONTENT._visible;
   }
}
