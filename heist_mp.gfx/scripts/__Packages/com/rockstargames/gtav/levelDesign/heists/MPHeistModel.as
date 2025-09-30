class com.rockstargames.gtav.levelDesign.heists.MPHeistModel extends com.rockstargames.ui.components.GUIModel
{
   function MPHeistModel()
   {
      super();
   }
   function setItem(_currentView, _itemIndex, _subItemIndex, leftArrow, rightArrow)
   {
      _currentView.index = _itemIndex;
      if(_currentView.itemList[_itemIndex] != undefined)
      {
         _currentView.itemList[_itemIndex].subHighlight(_subItemIndex,leftArrow,rightArrow);
      }
      if(_itemIndex >= 0 && _itemIndex < 8)
      {
         _currentView.itemList[12].showPlayerCard(_itemIndex);
      }
   }
   function setLabel()
   {
      var _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < this.viewList.length)
      {
         _loc4_ = this.viewList[_loc3_];
         _loc4_.params.labels = arguments;
         _loc3_ = _loc3_ + 1;
      }
   }
   function swapViewDepths(hv)
   {
      hv.viewContainer.swapDepths(this.viewList.length + 1);
   }
   function repositionPlanningSlots(_currentView, numPlanningSlots)
   {
      var _loc5_ = 0;
      var _loc1_ = 14;
      while(_loc1_ < 14 + numPlanningSlots)
      {
         if(_currentView.itemList[_loc1_]._visible)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      var _loc4_ = 0;
      _currentView.index = 1;
      _loc1_ = 14;
      while(_loc1_ < 14 + numPlanningSlots)
      {
         _currentView.itemList[_loc1_].reposition(numPlanningSlots,_loc4_,_loc5_);
         if(!_currentView.itemList[_loc1_]._visible)
         {
            _loc4_ = _loc4_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function updatePlanningSlotLeft(_currentView, planningSlot, stringArray)
   {
      _currentView.index = 1;
      _currentView.itemList[planningSlot + 14].updatePlanningSlotLeft(stringArray);
   }
   function updatePlanningSlotRight(_currentView, planningSlot, stringArray)
   {
      _currentView.index = 1;
      _currentView.itemList[planningSlot + 14].updatePlanningSlotRight(stringArray);
   }
   function updatePlanningSlotRightMedal(_currentView, planningSlot, stringArray)
   {
      _currentView.index = 1;
      _currentView.itemList[planningSlot + 14].updatePlanningSlotRightMedal(stringArray);
   }
   function repositionStrandSlots(_currentView, numPlanningSlots)
   {
      var _loc5_ = 0;
      var _loc1_ = 20;
      while(_loc1_ < 20 + numPlanningSlots)
      {
         if(_currentView.itemList[_loc1_]._visible)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      var _loc4_ = 0;
      _currentView.index = 1;
      _loc1_ = 20;
      while(_loc1_ < 20 + numPlanningSlots)
      {
         _currentView.itemList[_loc1_].reposition(numPlanningSlots,_loc4_,_loc5_);
         if(!_currentView.itemList[_loc1_]._visible)
         {
            _loc4_ = _loc4_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function updateStrandSlotLeft(_currentView, planningSlot, stringArray)
   {
      _currentView.index = 1;
      _currentView.itemList[planningSlot + 20].updatePlanningSlotLeft(stringArray);
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.heists.MPHeistView();
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
}
