class com.rockstargames.gtav.FrontendGen9.components.TabItem extends com.rockstargames.gtav.FrontendGen9.components.Text
{
   var MOUSE_EVT;
   var _visible;
   var background;
   var hitArea;
   var textTF;
   var _xPadding = 15;
   var myBtnType = 0;
   var SF_BASE_CLASS_MOUSE = 10;
   var _isSelected = false;
   var _isHover = false;
   var _isEnabled = true;
   var _index = -1;
   function TabItem()
   {
      super();
      this.background._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = 5;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.hitArea = this.background;
   }
   function SET_TITLE(str)
   {
      this.textTF.text = str;
      this.textTF.autoSize = "left";
      this.textTF._x = this._xPadding - 3;
      this.background._width = this.textTF.textWidth + this._xPadding * 2;
   }
   function SET_STATE(state, enabled)
   {
      if(state == 0)
      {
         this._isSelected = false;
      }
      else if(state == 1)
      {
         this._isSelected = true;
      }
      if(this._isSelected)
      {
         this.setHighlight(true);
         this.background._alpha = 100;
      }
      else if(this._isHover)
      {
         this.SET_HOVER_STATE(1);
      }
      else
      {
         this.setHighlight(false);
      }
   }
   function SET_ENABLED(isEnabled)
   {
      var _loc3_ = this._isEnabled != isEnabled;
      this._isEnabled = isEnabled;
      this._visible = isEnabled;
      return _loc3_;
   }
   function SET_HOVER_STATE(state)
   {
      if(state == 0)
      {
         this._isHover = false;
      }
      else if(state == 1 && this._isEnabled)
      {
         this._isHover = true;
      }
      if(!this._isSelected)
      {
         if(this._isHover)
         {
            this.setHighlight(true);
            this.background._alpha = 50;
         }
         else
         {
            this.setHighlight(false);
         }
      }
   }
   function setHighlight(isLit)
   {
      this.background._visible = isLit;
      if(isLit)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
   }
   function onPress()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
   }
   function onRollOver()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
      this.SET_HOVER_STATE(1);
   }
   function onRollOut()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
      this.SET_HOVER_STATE(0);
   }
   function onRelease()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
   }
   function onReleaseOutside()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
      this.SET_HOVER_STATE(0);
   }
   function sendMouseEvent(evt)
   {
      if(this._isEnabled)
      {
         this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._index]);
      }
   }
}
