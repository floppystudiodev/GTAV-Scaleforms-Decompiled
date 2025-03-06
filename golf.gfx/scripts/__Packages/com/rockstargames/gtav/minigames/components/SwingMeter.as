class com.rockstargames.gtav.minigames.components.SwingMeter extends MovieClip
{
   var parentClass;
   var mc_hBar;
   var mc_vBar;
   var mc_bg;
   var mc_apexHBar;
   var mc_apexVBar;
   var mc_target;
   var mc_fill;
   var _hBarPosition = 0;
   var _vBarPosition = 0;
   var _apexhBarPosition = 0;
   var _apexvBarPosition = 0;
   var _targetSpan = 0.2;
   var _targetPosition = 0.8;
   var _fillSpan = com.rockstargames.gtav.minigames.components.SwingMeter.prototype._hBarPosition;
   var _fillState = -1;
   var _fillFromTop = true;
   var _transitioning = false;
   var _markerVerticalPadding = 1;
   var _fillStateFrameOffset = 2;
   var screenWidth = 1280;
   var screenHeight = 720;
   function SwingMeter()
   {
      super();
      this._visible = false;
      this.parentClass = this._parent.ref;
      this.setMarker(true,this._hBarPosition,true,this._vBarPosition);
      this.setApexMarker(false,this._apexhBarPosition,false,this._apexvBarPosition);
      this.setTarget(this._targetSpan,this._targetPosition);
      this.setTargetColor(254,207,12,100);
      this.setFill(this._fillSpan,this._fillState,this._fillFromTop);
   }
   function setMarker(hVisible, hPosition, vVisible, vPosition)
   {
      this._hBarPosition = hPosition;
      this._vBarPosition = vPosition;
      this.mc_hBar._visible = hVisible;
      this.mc_vBar._visible = vVisible;
      this.mc_hBar._y = this.mc_vBar._y = (this.mc_bg._height - this._markerVerticalPadding * 2) * this._hBarPosition + this._markerVerticalPadding;
      this.mc_vBar._x = this.mc_hBar._x + this.mc_hBar._width * vPosition / 2;
      this._vMarkerCropping(this.mc_vBar);
   }
   function setApexMarker(hVisible, hPosition, vVisible, vPosition)
   {
      this._apexhBarPosition = hPosition;
      this._apexvBarPosition = vPosition;
      this.mc_apexHBar._visible = hVisible;
      this.mc_apexVBar._visible = vVisible;
      this.mc_apexHBar._y = this.mc_apexVBar._y = (this.mc_bg._height - this._markerVerticalPadding * 2) * this._apexhBarPosition + this._markerVerticalPadding;
      this.mc_apexVBar._x = this.mc_apexHBar._x + this.mc_apexHBar._width * vPosition / 2;
      this._vMarkerCropping(this.mc_apexVBar);
   }
   function _vMarkerCropping(target)
   {
      target._rotation = -90;
      var _loc3_ = 1;
      if(target._y < 14 - this._markerVerticalPadding)
      {
         _loc3_ = 30 - 30 * target._y / 14;
      }
      else if(target._y > this.mc_bg._height - 14 - this._markerVerticalPadding)
      {
         _loc3_ = 30 - 30 * (this.mc_bg._height - target._y) / 14;
         target._rotation = 90;
      }
      _loc3_ = Math.round(_loc3_) + 1 + this._markerVerticalPadding * 2;
      target.gotoAndStop(Math.round(_loc3_));
   }
   function setTarget(span, hPosition)
   {
      this._targetSpan = span;
      this._targetPosition = hPosition;
      this.mc_target._height = this.mc_bg._height * this._targetSpan;
      this.mc_target._y = this.mc_bg._height * hPosition;
   }
   function setTargetColor(r, g, b, a)
   {
      if(a == undefined)
      {
         a = 100;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.mc_target,r,g,b,a);
   }
   function setFill(span, state, fromTop)
   {
      this._fillSpan = span;
      this._fillState = state;
      this._fillFromTop = fromTop == undefined ? true : fromTop;
      this.mc_fill._height = this.mc_bg._height * this._fillSpan;
      if(this._fillFromTop)
      {
         this.mc_fill._y = 0;
      }
      else
      {
         this.mc_fill._y = this.mc_bg._height - this.mc_fill._height;
      }
      if(state >= 0)
      {
         this.mc_fill.gotoAndStop(Math.round((this.mc_fill._totalframes - this._fillStateFrameOffset) * this._fillState + this._fillStateFrameOffset));
      }
      else
      {
         this.mc_fill.gotoAndStop(1);
      }
   }
   function setPosition(x, y, center)
   {
      var _loc3_ = !center ? 0 : (this.mc_bg._width + this.mc_bg._x) / 2;
      var _loc2_ = !center ? 0 : (this.mc_bg._height + this.mc_bg._y) / 2;
      this.screenWidth = !this.parentClass.isWideScreen ? 960 : 1280;
      this._x = this.screenWidth * x - _loc3_;
      if(!this.parentClass.isWideScreen)
      {
         this._x += 160;
      }
      x = this._x - 10;
      this._x = x;
      this._y = this.screenHeight * y - _loc2_;
   }
   function setScale(w, h)
   {
      this._xscale = w * 100;
      if(h == undefined)
      {
         h = w;
      }
      this._yscale = h * 100;
   }
   function isTransitioing()
   {
      return this._transitioning;
   }
   function transitionIn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this,true);
      this._transitioning = true;
      this._visible = true;
      this._alpha = 100;
      this._transitioning = false;
   }
   function transitionOut(duration)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
      this._transitioning = true;
      if(duration == 0 || duration == undefined)
      {
         this._alpha = 0;
         this._handleTransitionOutComplete();
         return undefined;
      }
      if(duration == undefined)
      {
         duration = 1000;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,duration / 1000,{_alpha:0,onComplete:this._handleTransitionOutComplete,onCompleteScope:this});
   }
   function _handleTransitionOutComplete()
   {
      this._visible = false;
      this._transitioning = false;
   }
}
