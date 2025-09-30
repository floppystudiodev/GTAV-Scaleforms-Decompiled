class com.rockstargames.gtav.ng.Replay.PLAYBACK_PANEL extends MovieClip
{
   var BUTTONS;
   var PLAYBACK_BACKGROUND;
   var PLAYBACK_BAR;
   var PLAYBACK_BAR_BG;
   var PLAYBACK_BAR_LIGHT;
   var PLAYBACK_BAR_SPEEDEDIT;
   var TIMECODE;
   var TIMECODE_BG;
   var TIMECODE_NEW;
   var _isWideScreen;
   var _safeBottom;
   var _safeLeft;
   var _safeRight;
   var _safeTop;
   var _screenHeightPixels;
   var _screenWidthPixels;
   var config;
   var MINIMAL_PLAYBACK_BUTTONS_WIDTH = 155;
   var FULL_PLAYBACK_BUTTONS_WIDTH = 250;
   var MARKER_BUTTONS_OFFSET = 100;
   var _mcID = "PLAYBACK_PANEL";
   function PLAYBACK_PANEL()
   {
      super();
      this.config = _root.TIMELINE.registerMovie(this);
      this.TIMECODE_NEW = this.attachMovie("TIMECODE_NEW","TIMECODE_NEW",this.getNextHighestDepth());
      if(this.TIMECODE_BG != undefined)
      {
         this.TIMECODE_NEW._x = this.TIMECODE_BG._x;
         this.TIMECODE_NEW._y = this.TIMECODE_BG._y;
      }
      this.TIMECODE_NEW._visible = false;
   }
   function SET_DISPLAY_CONFIG(screenWidthPixels, screenHeightPixels, safeTopPercent, safeBottomPercent, safeLeftPercent, safeRightPercent, isWideScreen, isHiDef, isAsian)
   {
      this._isWideScreen = isWideScreen;
      if(isWideScreen)
      {
         this._screenWidthPixels = 1280;
         this._screenHeightPixels = 720;
      }
      else
      {
         this._screenWidthPixels = 960;
         this._screenHeightPixels = 720;
      }
      this._safeLeft = Math.round(screenWidthPixels * safeLeftPercent);
      this._safeRight = Math.round(screenWidthPixels * safeRightPercent);
      this._safeTop = Math.round(screenHeightPixels * safeTopPercent);
      this._safeBottom = Math.round(screenHeightPixels * safeBottomPercent);
      if(!isWideScreen)
      {
         Stage.scaleMode = "noBorder";
      }
      this.initLayout();
   }
   function initLayout()
   {
      var _loc4_ = 10;
      this.TIMECODE_BG._x = this._safeRight - this.TIMECODE_BG._width;
      this.TIMECODE._x = this.TIMECODE_BG._x + 3;
      this.TIMECODE_BG._y = this._safeTop;
      this.TIMECODE._y = this.TIMECODE_BG._y + 4;
      this.TIMECODE_NEW._x = this._safeRight - this.TIMECODE_NEW._width;
      this.TIMECODE_NEW._y = this._safeTop;
      var _loc5_ = this._safeRight - this._safeLeft;
      this.PLAYBACK_BACKGROUND._width = _loc5_;
      this.PLAYBACK_BACKGROUND._x = this._safeLeft;
      this.PLAYBACK_BACKGROUND._y = this._safeBottom - this.PLAYBACK_BACKGROUND._height * 2 - 1;
      var _loc3_ = _loc5_ - _loc4_ * 2;
      var _loc2_ = this.PLAYBACK_BACKGROUND._x + _loc4_;
      this.PLAYBACK_BAR._width = _loc3_;
      this.PLAYBACK_BAR._x = _loc2_;
      this.PLAYBACK_BAR._y = this.PLAYBACK_BACKGROUND._y + 8;
      this.PLAYBACK_BAR_LIGHT._width = _loc3_;
      this.PLAYBACK_BAR_LIGHT._x = _loc2_;
      this.PLAYBACK_BAR_LIGHT._y = this.PLAYBACK_BAR._y;
      this.PLAYBACK_BAR_BG._width = _loc3_;
      this.PLAYBACK_BAR_BG._x = _loc2_;
      this.PLAYBACK_BAR_BG._y = this.PLAYBACK_BAR._y;
      this.PLAYBACK_BAR_SPEEDEDIT._width = _loc3_;
      this.PLAYBACK_BAR_SPEEDEDIT._x = _loc2_;
      this.PLAYBACK_BAR_SPEEDEDIT._y = this.PLAYBACK_BAR._y;
   }
   function SET_PLAYBACK_BUTTONS_MODE(isFullyVisible)
   {
      this.BUTTONS.PREV_MARKER_BUTTON._visible = isFullyVisible;
      this.BUTTONS.MARKER_BUTTON._visible = isFullyVisible;
      this.BUTTONS.NEXT_MARKER_BUTTON._visible = isFullyVisible;
      this.BUTTONS.SETTINGS_BUTTON._visible = false;
      this.updateButtonsPosition();
   }
   function SET_TIMECODE(timecode)
   {
      this.TIMECODE.textAutoSize = "shrink";
      this.TIMECODE.htmlText = timecode;
      this.TIMECODE_BG._width = this.TIMECODE.textWidth + 11;
      this.updateTimecodePosition();
   }
   function updateTimecodePosition()
   {
      this.TIMECODE_BG._x = this._safeRight - this.TIMECODE_BG._width;
      this.TIMECODE._x = this.TIMECODE_BG._x + 3;
      this.TIMECODE_BG._y = this._safeTop;
      this.TIMECODE._y = this.TIMECODE_BG._y + 4;
      this.updateButtonsPosition();
   }
   function updateButtonsPosition()
   {
      this.repositionButton(this.BUTTONS.PREV_MARKER_BUTTON);
      this.repositionButton(this.BUTTONS.MARKER_BUTTON);
      this.repositionButton(this.BUTTONS.NEXT_MARKER_BUTTON);
      this.BUTTONS._width = this.TIMECODE_BG._width;
      this.BUTTONS._yscale = this.BUTTONS._xscale;
      this.BUTTONS._x = this.TIMECODE_BG._x;
      this.BUTTONS._y = this.TIMECODE_BG._y + this.TIMECODE_BG._height + 2;
   }
   function repositionButton(button)
   {
      var _loc2_;
      _loc2_ = !button._visible ? - this.MARKER_BUTTONS_OFFSET : 0;
      button._x = button.initialPosX + _loc2_;
   }
}
