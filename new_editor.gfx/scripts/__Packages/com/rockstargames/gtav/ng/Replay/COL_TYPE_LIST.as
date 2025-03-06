class com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST extends com.rockstargames.gtav.ng.Replay.ReplayBaseItem
{
   var myBtnType;
   var MOUSE_EVT;
   var myHeight;
   var labelMC;
   var ICONS;
   var helpTop;
   var hoverBg;
   var colourBg;
   var _colourState;
   var _isSelected;
   var _hasItemBeenSetUpGrey;
   var _isBackgroundHidden;
   var _blackHudColour;
   var hudColourBlack;
   var _whiteHudColour;
   var hudColourWhite;
   var _uncolouredColour;
   var _redColour;
   var _blueColour;
   var APP_DATA;
   var bgMC;
   var _itemIsHighlighted;
   var _labelColour;
   var _bgMcColour;
   var _colourColour;
   var HUD_COLOUR_WHITE = 1;
   var HUD_COLOUR_BLACK = 2;
   var HUD_COLOUR_GREY = 3;
   var HUD_COLOUR_RED = 6;
   var HUD_COLOUR_ORANGE = 16;
   var HUD_COLOUR_GREEN = 18;
   var hasOptions = false;
   var TEXT_WIDTH = 268;
   var SF_BASE_CLASS_MOUSE = 10;
   var MAX_CHARS_ITEM = 50;
   var MAX_CHARS_ITEM_WITH_OPTION = 30;
   var MAX_CHARS_OPTIONS = 14;
   function COL_TYPE_LIST()
   {
      super();
      this.myBtnType = com.rockstargames.gtav.ng.Replay.VIDEO_BUTTON_TYPES.BUTTON_TYPE_MENU;
      this._isMouseEnabled = true;
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_VIDEO_EDITOR;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.myHeight = 25;
      this.labelMC.left_arrow._visible = false;
      this.labelMC.right_arrow._visible = false;
      this.ICONS = this.ICONS;
      this.ICONS._visible = false;
      this.helpTop._visible = false;
      this.hoverBg._alpha = 0;
      this.colourBg._alpha = 0;
      this._colourState = 0;
      this._isSelected = false;
      this._hasItemBeenSetUpGrey = false;
   }
   function initColours(receivedColours)
   {
      this._isBackgroundHidden = false;
      this._blackHudColour = this.hudColourBlack;
      this._blackHudColour.a = 70;
      this._whiteHudColour = this.hudColourWhite;
      this._uncolouredColour = new com.rockstargames.ui.utils.HudColourLite();
      this._uncolouredColour.r = 0;
      this._uncolouredColour.g = 0;
      this._uncolouredColour.b = 0;
      this._uncolouredColour.a = 0;
      this._redColour = new com.rockstargames.ui.utils.HudColourLite();
      this._redColour.r = receivedColours[4][0];
      this._redColour.g = receivedColours[4][1];
      this._redColour.b = receivedColours[4][2];
      this._redColour.a = receivedColours[4][3];
      this._blueColour = new com.rockstargames.ui.utils.HudColourLite();
      this._blueColour.r = receivedColours[5][0];
      this._blueColour.g = receivedColours[5][1];
      this._blueColour.b = receivedColours[5][2];
      this._blueColour.a = receivedColours[5][3];
      this.SetAsSelected(false);
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      this.labelMC.titleTF._y = 1;
      this.labelMC.optionTF._y = 1;
      if(_d[2] != undefined)
      {
         if(this.APP_DATA.hasIcon)
         {
            this.labelMC.titleTF._width = 260;
            this.ICONS.gotoAndStop(_d[2]);
            if(_d[2] == 8)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.ICONS,this.HUD_COLOUR_RED);
            }
            else if(_d[2] == 9)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.ICONS,this.HUD_COLOUR_ORANGE);
            }
            else if(_d[2] == 10)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.ICONS,this.HUD_COLOUR_GREEN);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.ICONS,this.HUD_COLOUR_WHITE);
            }
            this.ICONS._visible = true;
         }
         else
         {
            var _loc4_ = this.labelMC.optionTF;
            this.shortenAndSetStr(_d[2],_loc4_,this.MAX_CHARS_OPTIONS,false);
            if(this.APP_DATA.hasOptions)
            {
               this.labelMC.left_arrow._visible = true;
               this.labelMC.right_arrow._visible = true;
               this.labelMC.left_arrow._x = this.labelMC.right_arrow._x - (this.labelMC.left_arrow._width + (_loc4_.textWidth + 3));
               this.labelMC.optionTF._x = -16;
            }
         }
         this.shortenAndSetStr(_d[1],this.labelMC.titleTF,this.MAX_CHARS_ITEM_WITH_OPTION,true);
      }
      else
      {
         this.labelMC.titleTF._width = 278;
         this.shortenAndSetStr(_d[1],this.labelMC.titleTF,this.MAX_CHARS_ITEM,true);
      }
      if(_d[3] != undefined)
      {
         this.SetColourState(_d[3]);
      }
   }
   function set highlighted(_h)
   {
      if(this._isSelectable)
      {
         if(!this._hasItemBeenSetUpGrey)
         {
            this.labelMC.titleTF._alpha = 100;
            this.labelMC.optionTF._alpha = 100;
         }
         if(_h)
         {
            this.hoverBg._alpha = 20;
         }
         else
         {
            this.hoverBg._alpha = 0;
         }
      }
      if(this.APP_DATA.isHeader)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,this.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,this.HUD_COLOUR_WHITE);
      }
      if(!_h && this._hasItemBeenSetUpGrey)
      {
         this.setGreyedOut();
      }
      this._itemIsHighlighted = _h;
   }
   function SetAsSelected(isSelected, onlyOneOption)
   {
      if(!this._isSelectable)
      {
         return undefined;
      }
      this._isSelected = isSelected;
      if(this._isSelected)
      {
         if(this.APP_DATA.hasOptions == true)
         {
            this.labelMC.left_arrow._visible = true;
            this.labelMC.right_arrow._visible = true;
            this.labelMC.optionTF._x = -16;
         }
      }
      else
      {
         this.labelMC.left_arrow._visible = false;
         this.labelMC.right_arrow._visible = false;
         if(this.APP_DATA.hasOptions == true)
         {
            this.labelMC.optionTF._x = -6;
         }
      }
      this.labelMC.left_arrow._alpha = !onlyOneOption ? 100 : 30;
      this.labelMC.right_arrow._alpha = !onlyOneOption ? 100 : 30;
      this.switchColour();
   }
   function SetColourState(stateId)
   {
      this._colourState = stateId;
      this.switchColour();
   }
   function setGreyedOut()
   {
      this._hasItemBeenSetUpGrey = true;
      if(this.APP_DATA.hasIcon)
      {
         this.ICONS._alpha = 30;
         if(this.data[2] == 4)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.ICONS,this.HUD_COLOUR_WHITE);
         }
      }
      this.labelMC.left_arrow._visible = false;
      this.labelMC.right_arrow._visible = false;
      if(this.APP_DATA.hasOptions == true)
      {
         this.labelMC.optionTF._x = -4;
      }
      if(this._isSelected)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,this.HUD_COLOUR_GREY);
         this.labelMC.titleTF._alpha = 100;
         this.labelMC.optionTF._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,this.HUD_COLOUR_GREY);
         this.labelMC.titleTF._alpha = 50;
         this.labelMC.optionTF._alpha = 50;
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,!this._isBackgroundHidden ? this.BLACK_ALPHA : 0);
      }
   }
   function removeGreyOut()
   {
      this._hasItemBeenSetUpGrey = false;
   }
   function HideBackground()
   {
      this._isBackgroundHidden = true;
      this.bgMC._alpha = 0;
   }
   function setIconVisible(value)
   {
      this.ICONS._visible = value;
   }
   function switchColour()
   {
      switch(this._colourState)
      {
         case 0:
            this.colourThisToBlack();
            break;
         case 1:
            this.colourThisToRed();
            break;
         case 2:
            this.colourThisToBlue();
      }
   }
   function shortenAndSetStr(str, tf, maxChars, isItemTitle)
   {
      if(str == undefined)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      if(isItemTitle)
      {
         if(str.length > maxChars)
         {
            _loc3_ = str;
            _loc3_ += "...";
         }
         else
         {
            _loc3_ = str;
         }
      }
      else if(this.labelMC.left_arrow._visible == false && this.APP_DATA.hasOptions == false && str.length > maxChars)
      {
         _loc3_ = str.substring(0,maxChars) + "...";
      }
      else
      {
         _loc3_ = str;
      }
      tf.textAutoSize = "shrink";
      tf.htmlText = _loc3_;
   }
   function colourThisToBlack()
   {
      if(this._isSelected)
      {
         this._labelColour = this.HUD_COLOUR_BLACK;
         this._bgMcColour = this._whiteHudColour;
      }
      else
      {
         this._labelColour = this.HUD_COLOUR_WHITE;
         this._bgMcColour = !this._isBackgroundHidden ? this._blackHudColour : this._uncolouredColour;
      }
      this._colourColour = this._uncolouredColour;
      this.updateColours();
   }
   function colourThisToBlue()
   {
      this._labelColour = this.HUD_COLOUR_WHITE;
      this._bgMcColour = this._blackHudColour;
      this._colourColour = this._blueColour;
      this._colourColour.a = !this._isSelected ? 30 : 100;
      this.updateColours();
   }
   function colourThisToRed()
   {
      this._labelColour = this.HUD_COLOUR_WHITE;
      this._bgMcColour = this._blackHudColour;
      this._colourColour = this._redColour;
      this._colourColour.a = !this._isSelected ? 30 : 100;
      this.updateColours();
   }
   function updateColours()
   {
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,this._labelColour);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this._bgMcColour.r,this._bgMcColour.g,this._bgMcColour.b,this._bgMcColour.a);
      if(this.colourBg)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.colourBg,this._colourColour.r,this._colourColour.g,this._colourColour.b,this._colourColour.a);
      }
   }
   function onPress()
   {
      var _loc2_ = -1;
      if(this._isSelected && this.APP_DATA.hasOptions == true)
      {
         var _loc3_ = this._xmouse;
         var _loc7_ = this._ymouse;
         var _loc4_ = 20;
         var _loc5_ = this.bgMC._width - _loc4_;
         var _loc6_ = this.bgMC._width - _loc4_;
         if(_loc3_ > _loc6_)
         {
            _loc2_ = 1;
         }
         if(_loc3_ < _loc5_)
         {
            _loc2_ = 0;
         }
      }
      if(this._isMouseEnabled)
      {
         this.MOUSE_EVT.triggerEvent([this.myBtnType,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS,this._name,this.APP_DATA.columnID,this.APP_DATA.itemID,_loc2_]);
      }
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
         this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._name,this.APP_DATA.columnID,this.APP_DATA.itemID,-1]);
      }
   }
}
