class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsModel extends com.rockstargames.ui.components.GUIModel
{
   var viewList;
   function PauseMPMenuWeaponsModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
}
