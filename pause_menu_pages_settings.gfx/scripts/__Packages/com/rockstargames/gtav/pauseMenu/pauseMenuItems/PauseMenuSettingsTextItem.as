class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__columnID;
   var __get__data;
   var __get__highlighted;
   var _data;
   var _highlighted;
   var _xmouse;
   var _ymouse;
   var attachMovie;
   var bar;
   var barMC;
   var bgMC;
   var defaultLabelColourEnum;
   var fbMC;
   var getNextHighestDepth;
   var highlightMC;
   var index;
   var initialIndex;
   var isAdjustable;
   var isSelectable;
   var itemTextLeft;
   var itemTextRight;
   var labelMC;
   var maskMC;
   var menuID;
   var menuPrefOffset;
   var selectedIndex;
   var selectedValue;
   var setPref;
   var storeFunc;
   var storeScope;
   var type;
   var uniqueID;
   var multiListIndex = 0;
   var multiListItems = new Array();
   var barIndex = 0;
   var barValsList = new Array();
   var _lastInList = false;
   function PauseMenuSettingsTextItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
      this.isAdjustable = true;
      this.defaultLabelColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      _global.gfxExtensions = true;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this._data[0] != undefined)
      {
         this.itemTextLeft.autoSize = "none";
         this.itemTextLeft._width = 390;
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
      }
      if(this.fbMC != undefined)
      {
         this.fbMC.removeMovieClip();
      }
      this.itemTextLeft._x = 5;
      var _loc8_ = -1155176764;
      if(this.menuID == _loc8_ + this.menuPrefOffset)
      {
         this.type = 3;
      }
      this.maskMC._visible = false;
      this.barMC.setMask(null);
      var _loc0_;
      var _loc4_;
      var _loc3_;
      var _loc7_;
      switch(this.type)
      {
         case 0:
            this.barMC._visible = false;
            if(this.data[1] != undefined && this.data[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[1]);
            }
            else
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
            }
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            break;
         case 1:
            this.multiListItems = this.data.slice(1);
            this.barMC._visible = false;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            this.textIndex = this.initialIndex;
            break;
         case 4:
            this.maskMC._visible = true;
            this.barMC.setMask(this.maskMC);
         case 2:
            _loc4_ = this.data[1];
            if(_loc4_ == "" || _loc4_ == undefined)
            {
               _loc4_ = 1;
            }
            this.barValsList = [];
            _loc3_ = 0;
            while(_loc3_ < _loc4_ + 1)
            {
               this.barValsList.push(100 / _loc4_ * _loc3_);
               _loc3_ = _loc3_ + 1;
            }
            _loc7_ = this.data[2];
            if(_loc7_ == undefined)
            {
               _loc7_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN;
            }
            this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.barMC);
            this.bar.init(_loc7_);
            this.barMC._visible = true;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
            this.barscale = this.initialIndex;
            break;
         case 3:
            this.fbMC = this.attachMovie("itemfblogo","fblogoMC",this.getNextHighestDepth(),{_x:7,_y:4});
            this.itemTextLeft._x = this.fbMC._x + this.fbMC._width + 4;
         default:
            this.barMC._visible = false;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
      }
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc6_);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc6_.r,_loc6_.g,_loc6_.b,_loc6_.a);
      var _loc5_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc5_);
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      if(this.isLastItem)
      {
         this.bgMC._height = _loc0_ = 25;
         this.highlightMC._height = _loc0_;
      }
      else
      {
         this.bgMC._height = 27;
         this.highlightMC._height = this.bgMC._height - 2;
      }
      this.bgMC._visible = false;
      this.highlighted = this._highlighted;
   }
   function set isLastItem(l)
   {
      this._lastInList = l;
   }
   function get isLastItem()
   {
      return this._lastInList;
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function set barscale(bi)
   {
      this.barIndex = bi;
      this.selectedIndex = this.barIndex;
      this.selectedValue = this.barValsList[this.barIndex];
      this.bar.percent(this.selectedValue);
   }
   function set textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.selectedValue);
      this.itemTextRight.autoSize = true;
      this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
      this.labelMC.lMC._x = this.itemTextRight._x - 2;
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
   }
   function stepVal(dir)
   {
      switch(this.type)
      {
         case 1:
            this.multiListIndex += dir;
            if(this.multiListIndex < 0)
            {
               this.multiListIndex = this.multiListItems.length - 1;
            }
            if(this.multiListIndex > this.multiListItems.length - 1)
            {
               this.multiListIndex = 0;
            }
            this.textIndex = this.multiListIndex;
            this.storeFunc.apply(this.storeScope,[this.index,this.multiListIndex]);
            this.setPref(this.multiListIndex);
            break;
         case 2:
         case 4:
            this.barIndex += dir;
            if(this.barIndex < 0)
            {
               this.barIndex = 0;
            }
            if(this.barIndex > this.barValsList.length - 1)
            {
               this.barIndex = this.barValsList.length - 1;
            }
            this.barscale = this.barIndex;
            this.storeFunc.apply(this.storeScope,[this.index,this.barIndex]);
            this.setPref(this.barIndex);
      }
      this.highlighted = this._highlighted;
   }
   function setPrefMouse(val)
   {
      if(this.uniqueID >= 0 && this.uniqueID < this.menuPrefOffset)
      {
         com.rockstargames.ui.game.GameInterface.call("HANDLE_MOUSE_LEFT_RIGHT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.uniqueID,val);
      }
   }
   function set highlighted(_h)
   {
      this.highlightMC._visible = _h;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = 100;
      var _loc5_ = false;
      if(this.isSelectable <= 0 || this.isSelectable == 2)
      {
         _loc5_ = true;
         _loc4_ = !_h ? 30 : 60;
      }
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         if(this.type == 1 && _loc5_ == false)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
            this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
            this.labelMC.lMC._x = this.itemTextRight._x - 2;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(this.defaultLabelColourEnum,_loc2_);
         if(this.type == 1)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
         }
         this.itemTextRight._x = this.highlightMC._width - this.itemTextRight._width - 6;
      }
      if(this.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc4_);
      }
      this._highlighted = _h;
   }
   function mPress()
   {
      var _loc3_ = this._xmouse;
      var _loc8_ = this._ymouse;
      var _loc5_ = false;
      var _loc4_ = false;
      var _loc2_ = 40;
      if(this.type == 2 || this.type == 4)
      {
         _loc2_ = 71;
      }
      var _loc6_ = this.bgMC._width - _loc2_;
      var _loc7_ = this.bgMC._width - _loc2_;
      if(_loc3_ > _loc7_)
      {
         _loc4_ = true;
      }
      if(_loc3_ < _loc6_)
      {
         _loc5_ = true;
      }
      if(!this.highlighted)
      {
         _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,false);
      }
      else if(_loc4_)
      {
         this.setPrefMouse(1);
      }
      else if(_loc5_)
      {
         this.setPrefMouse(-1);
      }
   }
}
