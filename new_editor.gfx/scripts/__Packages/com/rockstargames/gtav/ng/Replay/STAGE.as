class com.rockstargames.gtav.ng.Replay.STAGE extends MovieClip
{
   var CLIP;
   var MOUSE_EVT;
   var MOVIE_TEXT_CENTER;
   var blipLayer;
   var myBtnType;
   var oldX;
   var _isMouseEnabled = true;
   var SF_BASE_CLASS_MOUSE = 10;
   function STAGE()
   {
      super();
      this.oldX = this.MOVIE_TEXT_CENTER._x;
      this.clearBlipLayer();
      this.blipLayer._x = this.oldX;
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_STAGE;
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_VIDEO_EDITOR;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
   }
   function SET_STAGE_TEXT(str)
   {
      this.clearBlipLayer();
      var _loc2_ = new com.rockstargames.ui.utils.Text();
      _loc2_.setTextWithIcons(str,this.blipLayer,this.MOVIE_TEXT_CENTER,0,14,2.65,false);
      this.MOVIE_TEXT_CENTER.autoSize = true;
      this.MOVIE_TEXT_CENTER._x = this.CLIP._x + (this.CLIP._width - this.MOVIE_TEXT_CENTER.textWidth) / 2;
      this.blipLayer._x += this.MOVIE_TEXT_CENTER._x - this.oldX;
      this.oldX = this.MOVIE_TEXT_CENTER._x;
   }
   function clearBlipLayer()
   {
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.createEmptyMovieClip("blipLayer",1000);
   }
   function onPress()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
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
