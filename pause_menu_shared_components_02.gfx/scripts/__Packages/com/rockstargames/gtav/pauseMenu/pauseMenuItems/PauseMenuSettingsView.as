class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var bgList;
   var dataList;
   var highlightedItem;
   var itemList;
   var itemY;
   var rowSpacing;
   var topEdge;
   var viewContainer;
   var viewLinkageList;
   var visibleItems;
   var initialValueIndex = 4;
   var _startPos = 0;
   var bgArray = new Array();
   function PauseMenuSettingsView()
   {
      super();
   }
   function set params(_p)
   {
      super.params = _p;
      var _loc3_;
      if(this.bgList == undefined)
      {
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         this.bgList = this.viewContainer.createEmptyMovieClip("bgList",-1);
         com.rockstargames.ui.utils.Colour.Colourise(this.bgList,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
   }
   function displayView()
   {
      super.displayView();
      this.arrangeBG();
   }
   function arrangeBG()
   {
      this.hideDuplicateBGs();
      var _loc4_ = true;
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ <= this.itemList.length)
      {
         if(!_loc4_ && (_loc2_ == this.itemList.length || this.itemList[_loc2_].isEmptySpace))
         {
            _loc3_ = this.bgList["settingsBg" + _loc5_];
            if(_loc3_ == undefined)
            {
               _loc3_ = this.bgList.attachMovie("settingsBg","settingsBg" + _loc5_,_loc5_);
               this.bgArray.push(_loc3_);
            }
            _loc5_ = _loc5_ + 1;
            _loc3_._visible = true;
            _loc3_._y = this.itemList[_loc6_]._y;
            _loc3_._height = (_loc2_ != this.itemList.length ? this.itemList[_loc2_]._y : this.itemY) - _loc3_._y;
            _loc4_ = true;
         }
         else if(_loc4_ && !this.itemList[_loc2_].isEmptySpace)
         {
            _loc6_ = _loc2_;
            _loc4_ = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function hideDuplicateBGs()
   {
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ < this.bgArray.length)
      {
         _loc3_ = this.bgArray[_loc2_];
         _loc3_._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem(_loc3_);
      _loc2_.initStoreMethod(this.storeDataChange,this);
      _loc2_.isLastItem = i + 1 == this.visibleItems;
      _loc2_.data = _dataArray;
      this.itemList[i] = _loc2_;
      this.itemY += _loc3_.bgMC._height + this.rowSpacing;
   }
   function storeDataChange(dataIndex, value)
   {
      this.dataList[dataIndex][this.initialValueIndex] = value;
   }
   function scrollHighlightStyle(targetIndex)
   {
      targetIndex = Math.max(0,Math.min(targetIndex,this.dataList.length - 1));
      var _loc5_ = 0;
      var _loc3_ = 0;
      var _loc4_ = false;
      this.storeActiveStatesFromItemList();
      if(targetIndex > this.topEdge + this.visibleItems - 1)
      {
         _loc3_ += targetIndex - (this.visibleItems - 1);
         this.topEdge = _loc3_;
         targetIndex = this.visibleItems - 1;
         _loc4_ = true;
      }
      else if(targetIndex < this.topEdge)
      {
         _loc3_ = targetIndex;
         this.topEdge = _loc3_;
         targetIndex = 0;
         _loc4_ = true;
      }
      else
      {
         _loc3_ = this.topEdge;
         targetIndex -= this.topEdge;
      }
      this.highlightedItem = targetIndex;
      this.applyStoredToItemList(_loc3_);
      if(_loc4_)
      {
         this.arrangeBG();
      }
   }
   function setActiveStateToDataList(dataIndex, isChanged)
   {
      if(this.dataList[dataIndex][5] > 0)
      {
         this.dataList[dataIndex][5] = !isChanged ? 1 : 2;
      }
   }
   function storeActiveStatesFromItemList()
   {
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.dataList[this._startPos + _loc2_][5] = !this.itemList[_loc2_].isChanged ? (!this.itemList[_loc2_].isSelectable ? 0 : 1) : 2;
         _loc2_ = _loc2_ + 1;
      }
   }
   function applyStoredToItemList(newStartPos)
   {
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].data = this.dataList[newStartPos + _loc2_];
         this.itemList[_loc2_].highlighted = this.highlightedItem == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this._startPos = newStartPos;
   }
   function refreshStoredToItemList()
   {
      this.applyStoredToItemList(this._startPos);
   }
}
