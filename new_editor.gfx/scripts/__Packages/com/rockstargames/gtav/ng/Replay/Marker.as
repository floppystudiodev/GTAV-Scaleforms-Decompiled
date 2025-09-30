class com.rockstargames.gtav.ng.Replay.Marker extends com.rockstargames.gtav.ng.Replay.PlaybackPanelButton
{
   var MOUSE_EVT;
   var _name;
   var _xmouse;
   var filterIndicator;
   var myBtnType;
   function Marker()
   {
      super();
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_MARKER;
      this.SET_FILTER_INDICATOR_VISIBILITY(false);
   }
   function SET_FILTER_INDICATOR_VISIBILITY(isVisible)
   {
      if(this.filterIndicator)
      {
         this.filterIndicator._visible = isVisible;
      }
   }
   function sendMouseEvent(evt)
   {
      var _loc2_ = {x:this._xmouse,y:0};
      this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._name,_loc2_.x]);
   }
}
