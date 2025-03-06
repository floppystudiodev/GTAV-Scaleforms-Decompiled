class com.rockstargames.ui.components.GUIModel
{
   var _scrollBar;
   var dataList = new Array();
   var viewList = new Array();
   var viewIndex = 0;
   function GUIModel()
   {
      this.dataList = [];
      this.viewList = [];
   }
   function getCurrentView(forceTarget)
   {
      var _loc2_ = forceTarget == undefined ? this.viewList[this.viewIndex] : this.viewList[forceTarget];
      return _loc2_;
   }
   function getCurrentSelection(forceTarget)
   {
      var _loc2_ = this.getCurrentView(forceTarget);
      return _loc2_.index;
   }
   function set scrollBar(s)
   {
      this._scrollBar = s;
   }
   function get scrollBar()
   {
      return this._scrollBar;
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.ui.components.GUIView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function addDataToView(_viewIndex, _itemIndex, _dataArray)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.addItem(_itemIndex,_dataArray);
   }
   function updateSlot(_viewIndex, _itemIndex, _dataArray)
   {
      this.addDataToView(_viewIndex,_itemIndex,_dataArray);
      var _loc2_ = this.getCurrentView(_viewIndex);
      var _loc3_ = _itemIndex - _loc2_.index + _loc2_.highlightedItem;
      _loc2_.itemList[_loc3_].data = _dataArray;
   }
   function addSlot(_viewIndex, _itemIndex, _dataArray)
   {
      this.addDataToView(_viewIndex,_itemIndex,_dataArray);
      var _loc2_ = this.getCurrentView(_viewIndex);
      _loc2_.addDisplayItemOnce(_itemIndex,_dataArray);
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.destroy();
      this.viewIndex = 0;
      this.getCurrentView(_viewIndex).index = 0;
   }
   function displayView(_viewIndex, _itemIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.viewIndex = _viewIndex;
      _loc2_.displayView();
   }
   function focusView(_viewIndex, clearOtherViews)
   {
      if(clearOtherViews)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.viewList.length)
         {
            var _loc3_ = this.viewList[_loc2_];
            _loc3_.highlighted = _loc2_ == _viewIndex;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.viewList[_viewIndex].highlighted = true;
      }
      this.viewIndex = _viewIndex;
   }
   function nextView()
   {
      var _loc2_ = this.viewIndex + 1;
      if(_loc2_ > this.viewList.length - 1)
      {
         _loc2_ = 0;
      }
      this.setView(_loc2_);
   }
   function prevView()
   {
      var _loc2_ = this.viewIndex - 1;
      if(_loc2_ < 0)
      {
         _loc2_ = this.viewList.length - 1;
      }
      this.setView(_loc2_);
   }
   function setView(_viewIndex)
   {
      this.viewIndex = _viewIndex;
      this.focusView(this.viewIndex,1);
   }
   function nextItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.index + 1;
      if(_loc3_ > _loc2_.maxitems - 1)
      {
         _loc3_ = 0;
      }
      this.setItem(_loc2_,_loc3_);
   }
   function prevItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.index - 1;
      if(_loc3_ < 0)
      {
         _loc3_ = _loc2_.maxitems - 1;
      }
      this.setItem(_loc2_,_loc3_);
   }
   function setItem(_currentView, _itemIndex)
   {
      _currentView.index = _itemIndex;
      if(this.scrollBar != undefined)
      {
         if(_itemIndex < _currentView.maxitems - _currentView.visibleItems + 1)
         {
            this.scrollBar.scrollpercent = 100 * (_itemIndex / _currentView.maxitems);
         }
         else
         {
            this.scrollBar.scrollpercent = 100 * ((_currentView.maxitems - _currentView.visibleItems) / _currentView.maxitems);
         }
      }
   }
}
