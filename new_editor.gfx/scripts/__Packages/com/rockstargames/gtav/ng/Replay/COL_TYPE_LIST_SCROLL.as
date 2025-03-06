class com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL extends MovieClip
{
   var myBtnType;
   var MOUSE_EVT;
   var _downMC;
   var upDownMC;
   var _upMC;
   var bgMC;
   var scrollPosTextfield;
   static var DIRECTION_UP = 1;
   static var DIRECTION_DOWN = 0;
   var SF_BASE_CLASS_MOUSE = 10;
   function COL_TYPE_LIST_SCROLL()
   {
      super();
      this.INIT_LIST_SCROLL_BUTTONS();
   }
   function INIT_LIST_SCROLL_BUTTONS()
   {
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_LIST_SCROLL_ARROWS;
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_VIDEO_EDITOR;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this._downMC = this.upDownMC.downMC;
      this._upMC = this.upDownMC.upMC;
      this._downMC.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this,this.onMouseRelease,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL.DIRECTION_DOWN);
      this._downMC.onReleaseOutside = com.rockstargames.ui.utils.DelegateStar.create(this,this.onMouseRelease,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL.DIRECTION_DOWN);
      this._upMC.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this,this.onMouseRelease,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL.DIRECTION_UP);
      this._upMC.onReleaseOutside = com.rockstargames.ui.utils.DelegateStar.create(this,this.onMouseRelease,com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL.DIRECTION_UP);
   }
   function dispose()
   {
      this._downMC.onRelease = null;
      this._downMC.onReleaseOutside = null;
      this._upMC.onRelease = null;
      this._upMC.onReleaseOutside = null;
   }
   function initColors(receivedColours)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
      com.rockstargames.ui.utils.Colour.Colourise(this.upDownMC,receivedColours[1][0],receivedColours[1][1],receivedColours[1][2],100);
   }
   function set label(string)
   {
      this.scrollPosTextfield.htmlText = string;
   }
   function onMouseRelease(dir)
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE,dir);
   }
   function sendMouseEvent(evt, dir)
   {
      this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._name,dir]);
   }
}
