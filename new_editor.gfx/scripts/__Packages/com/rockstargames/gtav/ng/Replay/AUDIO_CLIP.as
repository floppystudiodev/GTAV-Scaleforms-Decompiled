class com.rockstargames.gtav.ng.Replay.AUDIO_CLIP extends MovieClip
{
   var myBtnType;
   var MOUSE_EVT;
   var TEXT_FADE_OUT;
   var TEXT_LABEL;
   var BACKGROUND;
   var ICON;
   var _isMouseEnabled = true;
   var SF_BASE_CLASS_MOUSE = 10;
   function AUDIO_CLIP()
   {
      super();
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_AUDIO_CLIP;
      this._isMouseEnabled = true;
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_VIDEO_EDITOR;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.TEXT_FADE_OUT._visible = false;
   }
   function SET_TEXT_WITH_WIDTH(str, bgWidth, showFadeOut)
   {
      var _loc2_ = 30;
      if(bgWidth <= _loc2_)
      {
         this.TEXT_LABEL.text = "";
         this.TEXT_LABEL._width = 0;
         this.TEXT_LABEL._x = 0;
         this.TEXT_FADE_OUT._visible = false;
      }
      else
      {
         this.TEXT_LABEL.text = str;
         this.TEXT_LABEL._width = bgWidth - _loc2_;
         this.TEXT_FADE_OUT._visible = showFadeOut;
         this.TEXT_LABEL._x = 25;
      }
      this.TEXT_FADE_OUT._x = this.BACKGROUND._width;
      if(this.TEXT_LABEL.textWidth + 2 < this.TEXT_FADE_OUT._x - this.TEXT_FADE_OUT._width)
      {
         this.TEXT_FADE_OUT._visible = false;
      }
   }
   function SET_ANIMATED_ICON_VISIBLE(isVisible)
   {
      if(isVisible)
      {
         this.ICON.gotoAndStop(2);
         this.ICON.animatedAudioIcon.play();
      }
      else
      {
         this.ICON.animatedAudioIcon.gotoAndStop(1);
         this.ICON.gotoAndStop(1);
      }
   }
   function onPress()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
   }
   function onRollOver()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
   }
   function onRollOut()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
   }
   function onRelease()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
   }
   function onReleaseOutside()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
   }
   function sendMouseEvent(evt)
   {
      if(this._isMouseEnabled)
      {
         this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._name]);
      }
   }
}
