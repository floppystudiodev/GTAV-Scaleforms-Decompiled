class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardModel extends com.rockstargames.ui.components.GUIModel
{
   var getCurrentView;
   var viewIndex;
   var viewList;
   function PauseMenuCrewsCardModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.destroy();
      this.viewIndex = 0;
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardView(this.getCurrentView());
   }
}
