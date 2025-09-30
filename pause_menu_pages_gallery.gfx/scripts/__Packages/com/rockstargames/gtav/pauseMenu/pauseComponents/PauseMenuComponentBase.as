class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase extends com.rockstargames.ui.components.GUIController
{
   var CONTENT;
   var model;
   var scrollBase;
   var titleHeight = 27;
   var preloadTxds = false;
   var columnID = -1;
   var columnIsFocused = false;
   var dbgID = "";
   var dbgOn = false;
   var canJump = true;
   var canWheelScroll = false;
   function PauseMenuComponentBase()
   {
      super();
   }
   function dbg(dbgStr)
   {
      if(this.dbgOn)
      {
         com.rockstargames.ui.utils.Debug.log("*** SCALEFORM | " + this.dbgID + " : " + dbgStr);
      }
   }
   function debug()
   {
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addDataToView(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().topEdge = 0;
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function ADD_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addSlot(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      this.model.updateSlot(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function CLEAR_HIGHLIGHT()
   {
      this.model.getCurrentView().highlightedItem = 0;
      this.model.getCurrentView().topEdge = 0;
      this.model.getCurrentView().index = 0;
   }
   function SHOW_COLUMN(bool)
   {
      this.CONTENT._visible = bool;
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function SET_COLUMN_CAN_JUMP(b)
   {
      this.canJump = b;
   }
   function ON_FOCUS_PAGE_CONTENT(bFocused)
   {
   }
   function SET_TITLE(str)
   {
   }
   function SET_DESCRIPTION()
   {
   }
   function SET_HIGHLIGHT(i)
   {
   }
   function SET_STATE(i)
   {
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      com.rockstargames.ui.utils.Debug.log("COLUMN SET FOCUS columnID: " + this.columnID + " = SET isFocused to: " + isFocused);
      this.SEND_COLUMN_PARAMS();
      var _loc4_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = _loc4_[_loc2_];
         _loc3_.highlighted = !isFocused ? false : this.model.getCurrentView().highlightedItem == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function SEND_COLUMN_PARAMS()
   {
      var _loc4_ = this.model.getCurrentView().itemList;
      com.rockstargames.ui.utils.Debug.log(" ====== SEND_COLUMN_PARAMS: items: " + _loc4_.length);
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = _loc4_[_loc2_];
         _loc3_.columnID = this.columnID;
         com.rockstargames.ui.utils.Debug.log(_loc2_ + "  " + _loc3_ + " = SET COLUMNID to: " + _loc3_.columnID);
         _loc2_ = _loc2_ + 1;
      }
   }
   function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
   {
      if(this.scrollBase == undefined)
      {
         this.scrollBase = com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase(this.CONTENT.attachMovie("PM_ScrollBase","scrollBase",this.CONTENT.getNextHighestDepth()));
      }
      if(!override)
      {
         this.scrollBase.setComponent(this);
      }
      this.scrollBase.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,xColOffset);
   }
   function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
   {
      if(this.scrollBase != undefined)
      {
         this.scrollBase.SET_SCROLL_BAR.apply(this.scrollBase,arguments);
      }
   }
   function getTxdData()
   {
      var _loc1_;
      return _loc1_;
   }
   function SET_INPUT_EVENT(direction)
   {
      super.SET_INPUT_EVENT(direction);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function ON_DESTROY()
   {
   }
   function onDisplayUpdate()
   {
   }
}
