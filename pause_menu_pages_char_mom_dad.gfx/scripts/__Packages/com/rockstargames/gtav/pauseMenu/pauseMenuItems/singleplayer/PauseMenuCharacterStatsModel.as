class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsModel extends com.rockstargames.ui.components.GUIModel
{
   var viewList;
   var viewIndex;
   var getCurrentView;
   var setItem;
   var menuItemStateIndex = 5;
   function PauseMenuCharacterStatsModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.destroy();
      _loc2_.topEdge = 0;
      this.viewIndex = 0;
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.getCurrentView());
   }
   function nextItem()
   {
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.getCurrentView());
      var _loc7_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < _loc3_.dataList.length)
      {
         var _loc2_ = _loc3_.index + 1 + _loc4_;
         if(_loc2_ > _loc3_.dataList.length - 1)
         {
            _loc2_ -= _loc3_.dataList.length;
         }
         var _loc6_ = _loc3_.dataList[_loc2_];
         var _loc5_ = _loc6_[this.menuItemStateIndex];
         if(_loc5_ != 0)
         {
            _loc7_ = _loc2_;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.setItem(_loc3_,_loc7_);
   }
   function prevItem()
   {
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.getCurrentView());
      var _loc7_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.dataList.length)
      {
         var _loc2_ = _loc4_.index - 1 - _loc3_;
         if(_loc2_ < 0)
         {
            _loc2_ = _loc4_.dataList.length + _loc2_;
         }
         var _loc6_ = _loc4_.dataList[_loc2_];
         var _loc5_ = _loc6_[this.menuItemStateIndex];
         if(_loc5_ != 0)
         {
            _loc7_ = _loc2_;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.setItem(_loc4_,_loc7_);
   }
}
