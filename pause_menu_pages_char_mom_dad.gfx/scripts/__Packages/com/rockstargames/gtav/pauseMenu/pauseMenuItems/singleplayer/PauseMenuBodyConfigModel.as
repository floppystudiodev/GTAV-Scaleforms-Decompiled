class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuBodyConfigModel extends com.rockstargames.ui.components.GUIModel
{
   var viewList;
   var viewIndex;
   var getCurrentView;
   function PauseMenuBodyConfigModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuBodyConfigView();
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
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuBodyConfigView(this.getCurrentView());
   }
}
