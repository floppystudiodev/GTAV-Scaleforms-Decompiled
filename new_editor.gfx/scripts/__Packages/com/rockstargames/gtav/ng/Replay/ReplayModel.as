class com.rockstargames.gtav.ng.Replay.ReplayModel extends com.rockstargames.ui.components.GUIModel
{
   var columnMovieClips;
   function ReplayModel()
   {
      super();
      this.columnMovieClips = [];
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.ng.Replay.ReplayView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function getCurrentViewIndex()
   {
      return this.viewIndex;
   }
   function setView(_viewIndex)
   {
      this.viewIndex = _viewIndex;
   }
   function focusView(_viewIndex, clearOtherViews)
   {
      var _loc3_ = undefined;
      if(clearOtherViews)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.viewList.length)
         {
            _loc3_ = this.viewList[_loc2_];
            _loc3_.highlighted = _loc2_ == _viewIndex;
            this.viewIndex = _viewIndex;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc3_ = this.viewList[_viewIndex];
         _loc3_.highlighted = true;
         var _loc5_ = this.getCurrentSelection(this.viewIndex);
         var _loc6_ = _loc3_.itemList[_loc5_];
         _loc6_.highlighted = true;
      }
   }
   function updateSlot(_viewIndex, _itemIndex, _dataArray)
   {
      this.addDataToView(_viewIndex,_itemIndex,_dataArray);
      var _loc2_ = this.getCurrentView(_viewIndex);
      var _loc3_ = _itemIndex - _loc2_.index + _loc2_.highlightedItem;
      _loc2_.itemList[_loc3_].data = _dataArray;
   }
   function updateSlotElement(_viewIndex, _itemIndex, _elementIndex, _elementData)
   {
      var _loc2_ = this.getCurrentView(_viewIndex);
      var _loc3_ = _itemIndex - _loc2_.index + _loc2_.highlightedItem;
      var _loc5_ = _loc2_.itemList[_loc3_];
      var _loc4_ = _loc5_.data;
      _loc4_[_elementIndex] = _elementData;
      _loc2_.itemList[_loc3_].data = _loc4_;
   }
   function nextItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.index + 1;
      if(_loc3_ > _loc2_.maxitems - 1)
      {
         _loc3_ = 0;
      }
      var _loc4_ = _loc2_.itemList[_loc3_];
      if(_loc4_._isSelectable)
      {
         this.setItem(_loc2_,_loc3_);
      }
      else
      {
         _loc2_ = this.getCurrentView();
         _loc3_ = _loc2_.index + 2;
         if(_loc3_ > _loc2_.maxitems - 1)
         {
            _loc3_ = 0;
         }
         this.setItem(_loc2_,_loc3_);
      }
   }
   function prevItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.index - 1;
      if(_loc3_ < 0)
      {
         _loc3_ = _loc2_.maxitems - 1;
      }
      var _loc4_ = _loc2_.itemList[_loc3_];
      if(_loc4_._isSelectable)
      {
         this.setItem(_loc2_,_loc3_);
      }
      else
      {
         _loc2_ = this.getCurrentView();
         _loc3_ = _loc2_.index - 2;
         if(_loc3_ < 0)
         {
            _loc3_ = _loc2_.maxitems - 1;
         }
         _loc4_ = _loc2_.itemList[_loc3_];
         this.setItem(_loc2_,_loc3_);
      }
   }
   function getCurrentView(forceTarget)
   {
      var _loc2_ = forceTarget == undefined ? this.viewList[this.viewIndex] : this.viewList[forceTarget];
      return _loc2_;
   }
}
