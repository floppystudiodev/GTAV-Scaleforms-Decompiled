class com.rockstargames.gtav.levelDesign.heists.HeistModel extends com.rockstargames.ui.components.GUIModel
{
   static var viewCrewMember = 0;
   static var viewGameplay = 1;
   static var viewTodo = 2;
   function HeistModel()
   {
      super();
   }
   function setLabel(_weaponname, _jobcut, _accuracy)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.viewList.length)
      {
         var _loc4_ = this.viewList[_loc3_];
         _loc4_.params.labels = arguments;
         _loc3_ = _loc3_ + 1;
      }
   }
   function swapViewDepths(hv)
   {
      hv.viewContainer.swapDepths(this.viewList.length + 1);
   }
   function updateSlot(_viewIndex, _itemIndex, _dataArray)
   {
      this.addDataToView(_viewIndex,_itemIndex,_dataArray);
      var _loc2_ = this.getCurrentView(_viewIndex);
      var _loc5_ = _itemIndex - _loc2_.index + _loc2_.highlightedItem;
      var _loc3_ = [];
      switch(_loc2_.viewID)
      {
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            _loc3_ = com.rockstargames.gtav.constants.HeistGameplayLUT.lookUp(_dataArray[0]);
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
         default:
            _loc3_ = _dataArray;
      }
      _loc2_.itemList[_loc5_].data = _loc3_;
   }
   function focusView(_viewIndex, clearOtherViews)
   {
      var _loc3_ = undefined;
      if(clearOtherViews == -1)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.viewList.length)
         {
            _loc3_ = this.viewList[_loc2_];
            _loc3_.clearHighlights(true);
            _loc2_ = _loc2_ + 1;
         }
      }
      else if(clearOtherViews)
      {
         _loc2_ = 0;
         while(_loc2_ < this.viewList.length)
         {
            _loc3_ = this.viewList[_loc2_];
            if(_viewIndex == 99)
            {
               _loc3_.clearHighlights();
            }
            else
            {
               _loc3_.highlighted = _loc2_ == _viewIndex;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_viewIndex != 99)
         {
            this.swapViewDepths(this.viewList[_viewIndex]);
         }
      }
      else
      {
         this.viewList[_viewIndex].highlighted = true;
      }
      this.viewIndex = _viewIndex;
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.heists.HeistView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.destroy();
      this.dataList[_viewIndex] = null;
      this.viewList[_viewIndex] = null;
   }
   function nextItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.index + 1;
      if(_loc2_.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
      {
         if(_loc3_ > _loc2_.maxitems - 1)
         {
            _loc3_ = _loc2_.maxitems - 1;
         }
      }
      else if(_loc3_ > _loc2_.maxitems - 1)
      {
         _loc3_ = 0;
      }
      this.setItem(_loc2_,_loc3_);
   }
   function prevItem()
   {
      var _loc3_ = this.getCurrentView();
      var _loc2_ = _loc3_.index - 1;
      if(_loc3_.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
      {
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
      }
      else if(_loc2_ < 0)
      {
         _loc2_ = _loc3_.maxitems - 1;
      }
      this.setItem(_loc3_,_loc2_);
   }
}
